<?php
include_once 'Controller.php';
session_start();
class CartController extends Controller{
    function loadShoppingCart(){
        $oldCart = isset($_SESSION['cart']) ? $_SESSION['cart'] : null;
        $cart = new Cart($oldCart);
        return $this->loadView('shop_cart',$cart,"Giỏ hàng của bạn");
    }
    function addToCart(){
        $tenMien = 'http://172.20.10.3/api/shop/';
        $id = $_POST['id'];
        $qty =  isset($_POST['qty']) ? (int)$_POST['qty'] : 1;
        $product = json_decode(file_get_contents($tenMien.'getProductForCart?id='.$id));
        $oldCart = isset($_SESSION['cart']) ? $_SESSION['cart'] : null;
        $cart = new Cart($oldCart);
        $cart->add($product,$qty);
        $_SESSION['cart'] = $cart;
        echo $cart->items[$id]['item']->name;
    }
    function deleteCart(){
        $id = $_POST['id'];
        $oldCart = isset($_SESSION['cart']) ? $_SESSION['cart'] : null;
        $cart = new Cart($oldCart);
        $cart->removeItem($id);
        $_SESSION['cart'] = $cart;
        echo json_encode([
            'totalPrice'=>number_format($cart->totalPrice),
            'promtPrice'=>number_format($cart->promtPrice)
        ]);
    }
    function updateCart(){
        $tenMien = 'http://172.20.10.3/api/shop/';
        $id = $_POST['id'];
        $qty = $_POST['qty'];
        $product = json_decode(file_get_contents($tenMien.'getProduct?id='.$id));
        $oldCart = isset($_SESSION['cart']) ? $_SESSION['cart'] : null;        
        $cart = new Cart($oldCart);
        $cart->update($product, $qty);
        $_SESSION['cart'] = $cart;
        
        echo json_encode([
            'discountPrice' => number_format($cart->items[$id]['discountPrice']),
            'totalPrice'=>number_format($cart->totalPrice),
            'promtPrice'=>number_format($cart->promtPrice)
        ]);
    }
}
?>