<?php

require_once('view.php');

class PacienteView extends View
{

    public function __construct()
    {
        parent::__construct();
    }

    //muestra los medicos al paciente
    public function verMedicos($especialidad, $obra, $medico)
    {
        $this->getSmarty()->assign('title', 'Ver Medicos');
        $this->getSmarty()->assign('obras', $obra);
        $this->getSmarty()->assign('especialidades', $especialidad);
        $this->getSmarty()->assign('medicos', $medico);
        
        //llamo al template a mostrar al paciente.
        $this->getSmarty()->display('templates/paciente.filtrarMedicos.tpl');
    }
}
