<?php

class PacienteView extends View
{


    public function showIngreso($error)
    {
        $this->getSmarty()->assign('title', "ingreso");
        $this->getSmarty()->assign('mensaje', $error);
        //$this->getSmarty()->assign('logged', $logged);
        // $this->getSmarty()->assign('index', BASE_URL.'ingreso');
        $this->getSmarty()->display('templates/ingreso_paciente.tpl');
    }
    public function showRegistro($error)
    {
        $this->getSmarty()->assign('title', "registro");
        $this->getSmarty()->assign('mensaje', $error);
        //$this->getSmarty()->assign('logged', $logged);
        $this->getSmarty()->assign('index', BASE_URL . 'registro');
        $this->getSmarty()->display('templates/registroPaciente.tpl');
    }


    public function showPortalPaciente($turnosPaciente,$logged)
    {
        $this->getSmarty()->assign('logged', $logged);
        $this->getSmarty()->assign('turnosPaciente', $turnosPaciente);
        $this->getSmarty()->display('templates/portalPaciente.tpl');
    }
    
}
