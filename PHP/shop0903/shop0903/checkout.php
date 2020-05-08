<?php
include_once "controller/CheckOutController.php";
$c = new CheckOutController;
return isset($_POST['btnCheckout']) ? $c->checkOut() : $c->loadCheckoutPage();
?>