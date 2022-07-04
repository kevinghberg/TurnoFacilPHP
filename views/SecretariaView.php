<?php

require_once('View.php');

class SecretariaView extends View
{

    public function __construct()
    {
        parent::__construct();
        $username = parent::getUsername();
        $this->getSmarty()->assign('username', $username);
    }

    public function showPortalSecretaria()
    {
        $this->getSmarty()->display("templates/portalSecretaria.tpl");
    }

    public function showCargarTurno($turnos)
    {
        $this->getSmarty()->assign('turnos', $turnos);
        $this->getSmarty()->display("templates/cargarTurno.tpl");
    }

    public function showAdministrarTurnos($turnos,$medicos)
    {
        $this->getSmarty()->assign('turnos',$turnos);
        $this->getSmarty()->assign('medicos',$medicos);
        $this->getSmarty()->display("templates/administrarturnos.tpl");
    }


    
}
