<?php


include_once './views/View.php';
include_once('views/MedicoView.php');


class ControllerMedico extends Controller
{

    public function __construct()
    {
        $this->model = new ModelMedico();
        $this->view = new MedicoView();
        $this->authhelper = new AuthHelper();
    }


    public function verMedicos()
    {

        $medicos = $this->model->getMedicosA();

        $this->view->showMedicos($medicos);
    }

    public function logearMedico(){

  

    }

    public function showPortalMedico(){

        $this->view->showPortalMedico();

    }
}
