<?php
require_once 'controller/CheckOutController.php';
$c = new CheckOutController;
return $c->acceptOrder();
?>