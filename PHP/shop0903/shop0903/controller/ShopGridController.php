<?php
include_once "Controller.php";
include_once 'helper/Pager.php';
class ShopGridController extends Controller
{
    public function loadPageType()
    {
        $tenMien = 'http://172.20.10.3/api/shop/';
        $alias = isset($_GET['type']) ? $_GET['type'] : '';
        $page = isset($_GET['page']) && $_GET['page'] > 0 && is_numeric($_GET['page']) ? $_GET['page'] : 1;
        $qty = 9;
        $pageShow = 5;
        $position = ($page - 1) * $qty;
        if ($alias == '') {
            header('Location:error.php'); // apsx xem .htaccess
            return;
        }
        $idUrlJson = json_decode(file_get_contents($tenMien.'selectUrlByUrl?url='.$alias));
        $cateJson = json_decode(file_get_contents($tenMien.'GetCateByUrl?id_url=' .$idUrlJson));
        $cate = json_decode($cateJson);
        $productJson = json_decode(file_get_contents($tenMien.'selectproductlevel1?cate_id='.$cate->id));
        $products = json_decode($productJson);
        
        $type = json_decode(file_get_contents($tenMien.'getNameType?url=' . $alias));

        $menuJson = json_decode(file_get_contents($tenMien.'GetAllCateGories'));
        $menuArray = json_decode($menuJson);
        $result = [
            'menuArray' => $menuArray,
            'products' => $products,
            'nametype' => $type->name,
        ];
        return $this->loadView('shop_grid', $result, $type->name);
    }
    public function AjaxCategories()
    {
        $tenMien = 'http://172.20.10.3/api/shop/';
        $alias = $_GET['alias'];
        $idUrl = json_decode(file_get_contents($tenMien.'selectUrlByUrl?url=' . $alias));
        $idCateJson = json_decode(file_get_contents($tenMien.'GetAllCateGories?id_url=' . $idUrl));
        $idCate = json_decode($idCateJson);
        foreach ($idCate as $c) {
            $productJson = json_decode(file_get_contents($tenMien.'getListProductByRelated?id_type=' . $c->id));
            $product = json_decode($productJson);
        }
        $data = [
            'product' => $product,
            'alias' => $alias,
            'idCate' => $idCate,
        ];
        return $this->loadViewAjax('category', $data);

    }
}
