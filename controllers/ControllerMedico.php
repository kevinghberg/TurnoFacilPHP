<?php

include_once('./models/ModelMedico.php');
include_once('views/MedicoView.php');


class ControllerMedico extends Controller
{

    public function __construct()
    {
        $this->model = new ModelMedico();
        $this->view = new MedicoView();
        $this->authhelper = new AuthHelper();
    }

    public function logearMedico()
    {
        if (!empty($_POST['username']) && !empty($_POST['password'])) {
            $checkUsername = $this->model->comprobarUsername($_POST['username'], $_POST['password']);
            if ($checkUsername == 1) {
                $username = $_POST['username'];
                AuthHelper::loginMedico($username);
                header("Location:" . BASE_URL . 'portalmedico');
            } else {
                header("Location:" . BASE_URL . 'loginpersonal');
            }
        } else
            header("Location:" . BASE_URL . 'loginpersonal');
    }

    public function showPortalMedico()
    {
        $this->view->showPortalMedico();
    }

    public function mostrarCronograma()
    {
        $turnos = $this->model->getTurnosMedico($_SESSION['USERNAME']);
        $this->view->showCronograma($turnos);
    }

    public function modificarMedico(){

       

        $nombre = $_POST['inputNombreMedico'];
        $especialidad = $_POST['inputEspecialidadMedico'];
        $secretaria = $_POST['inputSecretariaMedico'];
        //$id = ($urlParts[1]);

        $this->model->modificarMedico($nombre,$especialidad,$secretaria);//agregar id

    }

    public function showModificarMedico($id){
        $medico = $this->model->getMedicoPorId($id);
        $this->view->showModificarMedico($medico);
    }
}
