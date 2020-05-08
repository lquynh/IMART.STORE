<?php
include_once "Controller.php";
include_once 'helper/Cart.php';
include_once 'helper/functions.php';
include_once 'helper/phpmailer/mailer.php';
session_start();

class CheckOutController extends Controller
{
     
    public function loadCheckoutPage()
    {
        return $this->loadView('checkout', [], "Đặt hàng");
    }
    public function checkOut()
    {
        $tenMien='http://172.20.10.3/api/shop/';
        $email = $_POST['email'];
        $name = $_POST['fullname'];
        $phone = $_POST['phone'];
        $address = $_POST['address'];
        $note = $_POST['note'];
        $data = array("name" => $name, "email" => $email, "address" => $address, "phone" => $phone);
        $dataJson = json_encode($data);
        $curl = curl_init($tenMien.'saveCustomer?Json=' . $dataJson);
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($curl, CURLOPT_POSTFIELDS, $dataJson);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
            'Content-Length: ' . strlen($dataJson))
        );
        $result = curl_exec($curl);
        curl_close($curl);

        $idCusJson = json_decode(file_get_contents($tenMien.'GetCusByMail?email='.$email));
        $idCus = json_decode($idCusJson);

        if ($idCus->id) {
            //save bill
            $cart = isset($_SESSION['cart']) ? $_SESSION['cart'] : null;
            if ($cart == null) {
                header('location:index.php');
                return;
            }
            
            $dateOrder = date('Y-m-d', time());
            $promtPrice = $cart->promtPrice;
            $total = $cart->totalPrice;
            $token = createToken();
            $tokenDate = strtotime(date('Y-m-d H:i:s', time()));
            $bill = array("id_customers" => $idCus->id, "date_order" => $dateOrder, "total" => $total, "note" => $note,"token"=>$token ,"token_date" => $tokenDate);
            $billJson = json_encode($bill);

            $cur = curl_init($tenMien.'saveBill?Json=' . $billJson);
            curl_setopt($cur, CURLOPT_CUSTOMREQUEST, "POST");
            curl_setopt($cur, CURLOPT_POSTFIELDS, $billJson);
            curl_setopt($cur, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($cur, CURLOPT_HTTPHEADER, array(
                'Content-Type: application/json',
                'Content-Length: ' . strlen($billJson))
            );
            $result = curl_exec($cur);
            curl_close($cur);
            
            $idBillJson = json_decode(file_get_contents($tenMien.'GetBillByToken?token=' . $token));
            $idBill = json_decode($idBillJson);
            if ($idBill->id) {
                //save bill detail
                foreach ($cart->items as $id => $sp) {
                    $idProduct = $id;
                    $qty = $sp['qty'];
                    $price = $sp['discountPrice'];
                    $billDetail = array("id_bill" => $idBill->id, "id_product" => $idProduct, "quanlity" => $qty, "price" => $price);
                    $billDetailJson = json_encode($billDetail);

                    $cu = curl_init($tenMien.'saveBillDetail?Json=' . $billDetailJson);
                    curl_setopt($cu, CURLOPT_CUSTOMREQUEST, "POST");
                    curl_setopt($cu, CURLOPT_POSTFIELDS, $billDetailJson);
                    curl_setopt($cu, CURLOPT_RETURNTRANSFER, true);
                    curl_setopt($cu, CURLOPT_HTTPHEADER, array(
                        'Content-Type: application/json',
                        'Content-Length: ' . strlen($billDetailJson))
                    );
                    $result = curl_exec($cu);
                    curl_close($cu);
                }
                //http://localhost/shop0903/asdfghfggewsrw2356334/12345678765
                $link = "http://localhost:8888/shop0903/$token/$tokenDate";
                $subject = "Xác nhận đơn hàng DH00$idBill->id";
                $content = "<div>Chào bạn, $name,</div>
                            <div>Cảm ơn bạn đã đặt hàng, tổng tiền thanh toán là: <b>" . number_format($promtPrice) . " vnđ</b>.
                            <br></div>
                            <div>Vui lòng chọn vào <a href='$link'>đây</a> để xác nhận đơn hàng.</div>";
                sendMail($email, $name, $subject, $content);
                $_SESSION['success'] = "Vui lòng kiểm tra hộp thư để xác nhận đơn hàng";
                unset($_SESSION['cart']);
                header('location:checkout.php');
                return;
            } else {
                $_SESSION['error'] = "Có lỗi xảy ra, vui lòng thử lại";
                header('location:checkout.php');
                return;
            }
        } else {
            $_SESSION['error'] = "Có lỗi xảy ra, vui lòng thử lại";
            header('location:checkout.php');
            return;
        }
    }
    public function acceptOrder()
    {
        $token = $_GET['token'];
        $oldTime = $_GET['t'];
        $nowTime = strtotime(date('Y-m-d H:i:s', time()));
        if ($nowTime - $oldTime <= 86400 * 3) {
            $model = new CheckoutModel();
            $bill = $model->findBillByToken($token);
            if ($bill) {
                $model->updateStatusBill($bill->id);
                $_SESSION['success'] = "Cảm ơn bạn đã xác nhận, chúng tôi sẽ liên lạc trong ít phút";
            } else {
                $_SESSION['error'] = "Liên kết bạn nhập vào không hợp lệ, vui lòng thử lại";
            }
        } else {
            $_SESSION['error'] = "Thời gian xác nhận đơn hàng đã hết hạn, Vui lòng đặt hàng lại";
        }
        header("location:http://localhost:8888/shop0903/checkout.php");

    }
}
