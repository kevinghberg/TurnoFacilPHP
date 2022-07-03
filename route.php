<?php
require_once('controllers/Controller.php');
require_once('controllers/ControllerTurnos.php');
require_once('controllers/ControllerPaciente.php');
require_once('controllers/ControllerMedico.php');
require_once('controllers/ControllerSecretaria.php');

// base url
define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

if (empty($_GET["action"])) {
  $_GET["action"] = "ingreso";
}

$urlParts = explode('/', $_GET['action']);

$Controller = new Controller();
$ControllerTurnos = new ControllerTurnos();
$ControllerPaciente = new ControllerPaciente();
$ControllerMedico = new ControllerMedico();
$ControllerSecretaria = new ControllerSecretaria();



switch ($urlParts[0]) {

  case 'sacarturno':
    $ControllerTurnos->getTurnos();
    break;

  case 'elegirturno':
    $ControllerTurnos->elegirTurno($urlParts[1]);
    break;

  case 'filtrarTurno':
    $ControllerTurnos->filtrarTurno();
    break;

  case 'turnosMedico':
    $ControllerTurnos->getTurnosMedico();
    break;

  case 'ingreso':
    $ControllerPaciente->getForm();
    break;

  case 'turnospaciente':
    $ControllerTurnos->showMisTurnos();
    break;

  case 'cancelarturno':
    $ControllerTurnos->cancelarTurno($urlParts[1]);
    break;

  case 'registrarPaciente':
    $ControllerPaciente->registrarPaciente();
    break;

  case 'portalpaciente':
    $ControllerPaciente->showPortalPaciente();
    break;

  case 'portalmedico':
    $ControllerMedico->showPortalMedico();
    break;

  case 'portalsecretaria':
    $ControllerSecretaria->showPortalSecretaria();
    break;

  case 'cargarturno':
    $ControllerSecretaria->cargarTurno($urlParts[1], $urlParts[2]);
    break;

  case 'turnosolicitados':
    $ControllerSecretaria->showCargarTurno();
    break;

  case 'logear':
    $ControllerPaciente->logear();
    break;

  case 'logearmedico':
    $ControllerMedico->logearMedico();
    break;

  case 'logearsecretaria':
    $ControllerSecretaria->logearSecretaria();
    break;

  case 'deslogear':
    $Controller->deslogear();
    break;

  case 'cronograma':
    $ControllerMedico->mostrarCronograma();
    break;

  case 'medicos':
    $ControllerPaciente->mostrarMedicos();
    break;

  case 'registro':
    $ControllerPaciente->showRegistro();
    break;

  case 'loginpersonal':
    $Controller->showLoginPersonal();
    break;

  case 'filtrarEspecialidad':
    $ControllerPaciente->mostrarMedicosPorEspecialidad();
    break;

  case 'filtrarObraSocial':
    $ControllerPaciente->mostrarMedicosPorObra();
    break;
}
