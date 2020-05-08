<?php
//require_once "model/BaseModel.php";
require_once "helper/Cart.php";
require_once "helper/Pager.php";


require_once "helper/functions.php";
 
class Controller{
    function __construct(){
        date_default_timezone_set('Asia/Ho_Chi_Minh');
    }
    function loadView($view, $data = [],$tittle='Home'){
        $tenMien='http://172.20.10.3/api/shop/';
        $menu=file_get_contents($tenMien.'GetAllCate');
        $menuJson=json_decode($menu);
        $menuArray=json_decode($menuJson);
        include_once 'view/layout.view.php';
    }   
    function loadViewAjax($view, $data=[]){
        include_once "view/ajax/$view.view.php";
    }
}
 //$c = new Controller;
 //return $c->loadView('home'); //load home page
 //return $c->loadView('detail'); //load detail page
?>