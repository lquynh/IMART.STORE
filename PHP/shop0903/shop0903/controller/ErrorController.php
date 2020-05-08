<?php
require_once 'Controller.php';
class ErrorController extends Controller{
    function getErrorPage(){
         return $this->loadView('error');
    }
}
?>