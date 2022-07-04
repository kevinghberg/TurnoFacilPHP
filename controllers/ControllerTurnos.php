<?php

include_once './controllers/Controller.php';
include_once './models/ModelTurno.php';
include_once './models/ModelMedico.php';
include_once './models/ModelPaciente.php';
include_once './views/TurnosView.php';

class ControllerTurnos extends Controller
{
    private $modelTurno;
    private $view;
    private $modelPaciente;
    private $modelMedico;
    private $viewPaciente;

    public function __construct()
    {
        $this->modelTurno = new ModelTurno();
        $this->modelMedico = new ModelMedico();
        $this->view = new TurnosView();
        $this->modelPaciente = new ModelPaciente();
        $this->viewPaciente = new PacienteView();
    }


    function getTurnos()
    {

        $turnos = $this->modelTurno->getTurnos();
        $medico = $this->modelMedico->getMedicos();

        $this->view->ViewTurnos($turnos, $medico);
    }

    function elegirTurno($id_turno)
    {

        $yo = $_SESSION['USERNAME'];
        $this->modelTurno->elegirTurno($yo, $id_turno);
        header("Location: " . BASE_URL . 'sacarturno');
    }

    function filtrarTurno()
    {
        $diaTurno = $_POST['inputDia'];
        $horaTurno = $_POST['inputHorario'];
        $medicoTurno = $_POST['inputMedico'];

        $turno = $this->modelTurno->getTurnosPorFecha($diaTurno, $horaTurno);

        $mTurno = $this->modelMedico->getMedicoPorUsername($medicoTurno);

        $this->view->ViewTurnosFiltrados($turno, $mTurno);
    }


    function cancelarTurno($id_turno)
    {
        $this->modelTurno->cancelarTurno($id_turno);

        header("Location: " . BASE_URL . 'turnospaciente');
    }

    function showMisTurnos()
    {
        $dni = AuthHelper::getLoggedUserName();
        $turnosPaciente = $this->modelPaciente->getTurnosByDNI($dni);
        $this->viewPaciente->showTurnosPaciente($turnosPaciente);
    }

    function bloquearTurno()
    {
        $id_turno = $_POST["id_turno"];
        $this->modelTurno->bloquearTurno($id_turno);
        header("Location:" . BASE_URL . 'panelturno/' . $id_turno);
    }

    function desbloquearTurno()
    {
        $id_turno = $_POST["id_turno"];
        $this->modelTurno->desbloquearTurno($id_turno);
        header("Location:" . BASE_URL . 'panelturno/' . $id_turno);
    }
    function darDeBajaPaciente()
    {
        $id_turno = $_POST["id_turno"];
        $this->modelTurno->darDeBajaPaciente($id_turno);
        header("Location:" . BASE_URL . 'panelturno/' . $id_turno);
    }

    function agregarTurnoNuevo(){
        $fecha = $_POST['inputFecha'];
        $id_medico = $_POST['medicoInput'];
        $this->modelTurno->agregarTurnoNuevo($id_medico,$fecha);
        header("Location:" . BASE_URL . 'administrarturnos');

    }
}
