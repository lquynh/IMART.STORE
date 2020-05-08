<?php
require_once 'Controller.php';
class DetailController extends Controller
{

    public function getDetailPage()
    {
        $tenMien='http://172.20.10.3/api/shop/';
        $alias = $_GET['alias'];
        $id = $_GET['id'];
        $detailProduct = file_get_contents('http://172.20.10.3/api/shop/GetProByUrlIdPro?url=' . $alias . '&idpro=' . $id);
        $detailProductJson = json_decode($detailProduct);
        $product = json_decode($detailProductJson);
        $idRelated = $product->id;
        $id_type = file_get_contents($tenMien.'GetIdTypeByIdPro?idpro=' . $idRelated);
        $relatedProductsJson = json_decode(file_get_contents($tenMien.'selectProductByType?id_type=' . $id_type . '&id=' . $idRelated));
        $relatedProductsArray = json_decode($relatedProductsJson);
        if ($product == '') {
            header('location:error.php');
        }
        $data = [
            'product' => $product,
            'relatedProductsArray' => $relatedProductsArray,
        ];
        $this->loadView('detail', $data, $product->name);
    }
}
