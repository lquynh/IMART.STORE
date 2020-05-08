<?php 
require_once('controller/SortPriceController.php');
$c = new SortPriceCOntroller();
return $c->sortPrice();
?>