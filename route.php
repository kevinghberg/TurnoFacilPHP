<?php
require_once('controllers/Controller.php');
require_once('controllers/ControllerTurnos.php');
require_once('controllers/ControllerPaciente.php');

define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

if (empty($_GET["action"])) {
  $_GET["action"] = "home";
}

$urlParts = explode('/', $_GET['action']);

$Controller = new Controller();
$ControllerTurnos = new ControllerTurnos();
$ControllerPaciente = new ControllerPaciente();


switch ($urlParts[0]) {

  case 'turnos':
    $ControllerTurnos->getTurnos();
    break;
  case 'elegirTurno':
    $ControllerTurnos->elegirTurno($urlParts[1]);
    break;
  case 'filtrarTurno':
    $ControllerTurnos->filtrarTurno();
    break;
  case 'misturnos':
    $ControllerTurnos->showMisTurnos();
    break;
  case 'turnosMedico':
    $ControllerTurnos->getTurnosMedico();
    break;
  case 'ingreso':
    $ControllerPaciente->getForm();
    break;
  case 'verificarDNI':
    $ControllerPaciente->comprobar();
    break;
  case 'cancelarTurno':
    $ControllerTurnos->cancelarTurno($urlParts[1]);
  break;
}
