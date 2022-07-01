<?php

require_once('View.php');

class MedicoView extends View
{


    public function __construct()
    {
        parent::__construct();
        $username = parent::getUsername();
        $this->getSmarty()->assign('username', $username);
    }

    public function showMedicos($medicos)
    {

        $this->getSmarty()->assign('medicos', $medicos);
        $this->getSmarty()->display('templates/medicos.tpl');
    }

    public function showPortalMedico()
    {
        $this->getSmarty()->display('templates/portalMedico.tpl');
    }

    public function showCronograma($turnos)
    {
        $this->getSmarty()->assign('turnos', $turnos);
        $this->getSmarty()->display('templates/cronograma.tpl');
    }
}
