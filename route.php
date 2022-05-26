<?php
require_once('controllers/Controller.php');

define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

if (empty($_GET["action"])) {
	$_GET["action"] = "home";
}

$Controller = new Controller();
$urlParts = explode('/', $_GET['action']);

switch($urlParts[0]){

	case 'infoturnos':
		$Controller->infoTurnos();
		break;
}

