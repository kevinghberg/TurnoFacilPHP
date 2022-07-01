<?php

require_once('View.php');

class TurnosView extends View
{

    public function __construct()
    {
        parent::__construct();
        $username = parent::getUsername();
        $this->getSmarty()->assign('username', $username);
    }

    function ViewTurnos($turnos, $medico)
    {
        $this->getSmarty()->assign('turnos', $turnos);
        $this->getSmarty()->assign('medico', $medico);
        $this->getSmarty()->display("templates/turnos.tpl");
    }

    function ViewTurnosFiltrados($turnos, $medico)
    {
        $this->getSmarty()->assign('turnos', $turnos);
        $this->getSmarty()->assign('medico', $medico);
        $this->getSmarty()->display("templates/turnos.tpl");
    }

    function showMisTurnos($turnosPaciente)
    {
        $this->getSmarty()->assign('turnosPaciente', $turnosPaciente);
        $this->getSmarty()->display("templates/misturnos.tpl");
    }
}
