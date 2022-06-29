<?php
require_once('controllers/Controller.php');
require_once('controllers/ControllerSecretaria.php');
require_once('controllers/ControllerPaciente.php');

define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

if (empty($_GET["action"])) {
	$_GET["action"] = "home";
}

$urlParts = explode('/', $_GET['action']);


$Controller = new Controller();
$ControllerPaciente = new ControllerPaciente();
$ControllerSecretaria = new ControllerSecretaria();





switch ($urlParts[0]) {
   case 'login':
        $ControllerSecretaria->showLogin();
       break;
   case 'verifyUser':
         $ControllerSecretaria->verify();
         break;
    case 'ingreso':
        $ControllerPaciente->getForm();
        break;
    case 'verificarDNI':
        $ControllerPaciente->comprobar();
        break;
    case 'registrarPaciente':
        $ControllerPaciente->registrarPaciente();
        break;
}
