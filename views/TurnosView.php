<?php

class TurnosView extends View{

    function ViewTurnos($turnos,$medico){
        $this->getSmarty()->assign('turnos',$turnos);
        $this->getSmarty()->assign('medico',$medico);
        $this->getSmarty()->display("templates/turnos.tpl");
    }

    function ViewTurnosFiltrados($turnos,$medico){
        $this->getSmarty()->assign('turnos', $turnos);
        $this->getSmarty()->assign('medico', $medico);
        $this->getSmarty()->display("templates/turnos.tpl");
    }
    
    function showMisTurnos($turnosPaciente){
        $this->getSmarty()->assign('turnosPaciente', $turnosPaciente);
        $this->getSmarty()->display("templates/misturnos.tpl");
    }
}
