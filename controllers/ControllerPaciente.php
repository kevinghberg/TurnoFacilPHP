<?php
include_once './views/View.php';
include_once('models/ModelPaciente.php');
include_once('views/PacienteView.php');

class ControllerPaciente extends Controller{

    public function __construct()
    {
        $this->model = new ModelPaciente();
        $this->view = new PacienteView();
        $this->authhelper = new AuthHelper();

    }


    public function getForm(){
        $this->view->showIngreso(" ");
    }

    public function comprobar(){
        if (!empty($_POST['dniPaciente'])) {
            $dni = $_POST['dniPaciente'];
            $userDb = $this->model->checkearDni($dni);
            
            if (!empty($userDb) && $dni === $userDb->dni_paciente) {

             AuthHelper::login($dni);

             $logged=AuthHelper::getLoggedUserName();

             $turnosPaciente = $this->model->getTurnosByDNI($logged);

             $this->view->showPortalPaciente($turnosPaciente,$logged);

            }else
              $this->view->showRegistro(" ");
    }

    


}


}