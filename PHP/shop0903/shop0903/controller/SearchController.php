<?php
include_once 'Controller.php';
class SearchController extends Controller
{
    public function getViewSearch()
    {   $tenMien='http://172.20.10.3/api/shop/';
        if (!isset($_GET['keyword']) || $_GET['keyword'] == '') {
            header('Location:index.php');
        } else if (isset($_GET['keyword'])) {
            $productsJson = json_decode(file_get_contents($tenMien.'getListProductBySearch?keyword=' . $_GET['keyword']));
            $products = json_decode($productsJson);

            $menu = file_get_contents($tenMien.'GetAllCateGories');
            $menuJson = json_decode($menu);
            $menuArray = json_decode($menuJson);
            $data = [
                'products' => $products,
                'menuArray' =>$menuArray,
            ];
            return $this->loadView('search', $data, 'Search');
        }

    }
}
