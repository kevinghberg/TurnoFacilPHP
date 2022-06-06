<?php
require_once('controllers/Controller.php');
require_once('controllers/ControllerSecretaria.php');

define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

if (empty($_GET["action"])) {
	$_GET["action"] = "home";
}

$urlParts = explode('/', $_GET['action']);


$Controller = new Controller();
$ControllerSecretaria = new ControllerSecretaria();




switch ($urlParts[0]) {
   case 'login':
        $ControllerSecretaria->showLogin();
       break;
   case 'verifyUser':
         $ControllerSecretaria->verify();
         break;
}
