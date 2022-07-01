<?php

require_once('View.php');

class PacienteView extends View
{

    public function __construct()
    {
        parent::__construct();
        $username = parent::getUsername();
        $this->getSmarty()->assign('username', $username);
    }


    public function showIngreso($error)
    {
        $this->getSmarty()->assign('title', "ingreso");
        $this->getSmarty()->assign('mensaje', $error);
        //$this->getSmarty()->assign('logged', $logged);
        // $this->getSmarty()->assign('index', BASE_URL.'ingreso');
        $this->getSmarty()->display('templates/ingreso_paciente.tpl');
    }




    public function showTurnosPaciente($turnosPaciente)
    {
        $this->getSmarty()->assign('turnosPaciente', $turnosPaciente);
        $this->getSmarty()->display('templates/turnosPaciente.tpl');
    }

    public function showPortalPaciente()
    {
        $this->getSmarty()->display('templates/portalpaciente.tpl');
    }

    public function showRegistro()
    {
        $this->getSmarty()->display('templates/registroPaciente.tpl');
    }
}
