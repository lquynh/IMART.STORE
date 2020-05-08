
<?php
include_once 'Controller.php';

class HomeController extends Controller
{
    
    public function getHomePage()
    {

        $tenMien='http://172.20.10.3/api/shop/';
        $featuredProducts = file_get_contents($tenMien.'selectFeaturedProduct');
        $featuredJsonProducts = json_decode($featuredProducts, true);
        $featuredArrayProducts = json_decode($featuredJsonProducts);

        $slide = file_get_contents($tenMien.'getSelectSlide');
        $slideJson = json_decode($slide);
        $slideArray = json_decode($slideJson);

        $bestSellerProducts = file_get_contents($tenMien.'selectBestSellerProduct');
        $bestSellerProductsJson = json_decode($bestSellerProducts);
        $bestSellerProductsArray = json_decode($bestSellerProductsJson);

        $newProducts = file_get_contents($tenMien.'getListProductByNew');
        $newProductsJson = json_decode($newProducts);
        $newProductsArray = json_decode($newProductsJson);
        $data = [
            'featuredArrayProducts' => $featuredArrayProducts,
            'slideArray' => $slideArray,
            'bestSellerProductsArray' => $bestSellerProductsArray,
            'newProductsArray' => $newProductsArray,
        ];
        return $this->loadView('home', $data);
    }
}
?>