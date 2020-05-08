<?php
include_once 'controller/BlogController.php';
$c = new BlogController();
return $c->getBlogPage();
?>