<?php

include_once './controllers/Controller.php';
include_once './models/ModelTurnos.php';
include_once './models/ModelMedico.php';


class ControllerTurnos extends Controller
{
    private $model;
    private $view;

    public function __construct()
    {
        $this->model = new ModelTurnos();
        $this->modelMedico = new ModelMedico();
    }


    function getTurnos()
    {
        AuthHelper::checkLoggedIn();
        
        $turnos = $this->model->getTurnos();
        $this->view->ViewTurnos($turnos);
    }

    function elegirTurno()
    {

        AuthHelper::checkLoggedIn();
        $this->model->elegirTurno();
        header("Location: " . BASE_URL . 'turnos');
    }

    function filtrarTurno()
    {
        $diaTurno= $_POST['inputDia'];
        $horaTurno= $_POST['inputHorario'];
        $medicoTurno= $_POST['inputMedico'];
        
        $turno = $this->modelTurnos->getTurnos($diaTurno,$horaTurno);
        $medico = $this->modelMedico->getMedicos($medicoTurno);

        $this->view->ViewTurnosFiltrados($turno, $medico);
    }
}
