<?php

include_once './controllers/Controller.php';
include_once './models/ModelTurnos.php';
include_once './models/ModelMedico.php';
include_once './models/ModelPaciente.php';
include_once './views/TurnosView.php';

class ControllerTurnos extends Controller
{
    private $model;
    private $view;

    public function __construct()
    {
        $this->model = new ModelTurnos();
        $this->modelMedico = new ModelMedico();
        $this->view = new TurnosView();
        $this->modelPaciente = new ModelPaciente();
    }


    function getTurnos()
    {

        $turnos = $this->model->getTurnos();
        $medico = $this->modelMedico->getMedicos();

        $this->view->ViewTurnos($turnos, $medico);
    }

    function elegirTurno($id_turno)
    {

        $this->model->elegirTurno($id_turno);
        header("Location: " . BASE_URL . 'turnos');
    }

    function filtrarTurno()
    {
        $diaTurno = $_POST['inputDia'];
        $horaTurno = $_POST['inputHorario'];
        $medicoTurno = $_POST['inputMedico'];

        $turno = $this->model->getTurnosPorFecha($diaTurno, $horaTurno);

        $mTurno = $this->modelMedico->getMedico($medicoTurno);

        $this->view->ViewTurnosFiltrados($turno, $mTurno);
    }

    function showMisTurnos()
    {
        if (isset($_SESSION['USERNAME'])) {
            $turnosPaciente = $this->modelPaciente->getTurnosByDNI($_SESSION["USERNAME"]);
            $this->view->showMisTurnos($turnosPaciente);
        }
        header('Location: ' . BASE_URL . "loggin_secretaria_medico");
        die;
    }
}
