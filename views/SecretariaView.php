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
        $this->getSmarty()->display("templates/confirmarturno.tpl");
    }

    public function showAdministrarTurnos($turnos, $medicos)
    {
        $this->getSmarty()->assign('turnos', $turnos);
        $this->getSmarty()->assign('medicos', $medicos);
        $this->getSmarty()->display("templates/administrarturnos.tpl");
    }

    public function showPanelTurno($turno)
    {
        $this->getSmarty()->assign('turno', $turno);
        $this->getSmarty()->display("templates/panelturno.tpl");
    }

    public function showMisMedicos($medicos)
    {
        $this->getSmarty()->assign('medicos', $medicos);
        $this->getSmarty()->display("templates/mismedicos.tpl");
    }

    public function showModificarMedico($medico)
    {
        $this->getSmarty()->assign('medico', $medico);
        $this->getSmarty()->display("templates/modificarmedico.tpl");
    }
}
