<?php
include_once 'controller/ContactUSController.php';
$c = new ContactUSController();
return $c->getContactUSPage();
?>