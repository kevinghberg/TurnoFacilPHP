<?php
include_once './views/View.php';
include_once('models/ModelPaciente.php');
include_once('views/PacienteView.php');
include_once('views/SecretariaView.php');

class ControllerPaciente extends Controller{
    
    public function __construct()
    {
        $this->model = new ModelPaciente();
        $this->view = new PacienteView();
    }


    public function getForm(){
        $this->view->showIngreso(" ");
    }




    public function comprobar(){
        if (!empty($_POST['dniPaciente'])) {
            $dni = $_POST['dniPaciente'];
            $userDb = $this->model->checkearDni($dni);
            if (!empty($userDb) && $dni === $userDb->dni_paciente) {
                $this->view->showPortalPaciente(" ");   
            }else
              $this->view->showRegistro(" ");
    }
}

public function registrarPaciente(){
    $dni = $_POST['dniPaciente'];
    $nombre = $_POST['nombrePaciente'];
    $apellido = $_POST['apellidoPaciente'];
    $password = $_POST['passwordPaciente'];
    $direccion = $_POST['direccionPaciente'];
    $numeroAfiliado = $_POST['numeroAfiliadoPaciente'];
    $telefono = $_POST['telefonoPaciente'];
    $ObraSocial = $_POST['obraSocialPaciente'];

    if (!empty($nombre) && !empty($apellido)&&!empty($direccion)&&!empty($telefono)) {
        $this->model->registrarPaciente($dni,$nombre,$apellido,$password,$direccion,$numeroAfiliado,$telefono,$ObraSocial);
    
    header("Location: " . BASE_URL . 'PortalPaciente');
}

}

}