<?php
require_once('controllers/Controller.php');
require_once('controllers/ControllerTurnos.php');

define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

if (empty($_GET["action"])) {
	$_GET["action"] = "home";
}

$Controller = new Controller();
$ControllerTurnos = new ControllerTurnos();
$urlParts = explode('/', $_GET['action']);


switch ($urlParts[0]) {

	case 'infoTurnos':
		$Controller->infoTurnos();
		break;
	case 'listarmedicos':
		$ControllerTurnos->mostrarTurnosPorMedico();
		break;
	case 'administrarturnos':
		$ControllerTurnos->administrarTurno($urlParts[1]);
		break;
	case 'bloquearturno':
		$ControllerTurnos->bloquearTurno();
		break;
	case 'desbloquearturno':
		$ControllerTurnos->desbloquearTurno();
		break;
	case 'cancelarturno':
		$ControllerTurnos->cancelarTurno();
		break;
}
