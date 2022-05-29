<?php

class TurnosView extends View{

    function ViewTurnos($turnos){
        $this->getSmarty()->assign('turnos', $turnos);
        $this->getSmarty()->display("templates/turnos.tpl");
    }
    
    function ViewTurnosFiltrados($turno, $medico){
        $this->getSmarty()->assign('turno', $turno);
        $this->getSmarty()->assign('medico', $medico);
        $this->getSmarty()->display("templates/turnos.tpl");
    }
}
