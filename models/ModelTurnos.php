<?php

include_once "ModelDB.php";


class ModelTurnos extends ModelDB {

    function getTurnos(){
        $sentencia = $this->getDB()->prepare("SELECT * FROM turnos"); 
        $sentencia->execute();
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function getTurnosFiltrados($diaTurno,$horaTurno){
        $sentencia = $this->getDB()->prepare("SELECT * FROM turnos WHERE dia=? , hora=?"); 
        $sentencia->execute($diaTurno,$horaTurno);
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }


    function elegirTurno(){
    $sentencia = $this->getDB()->prepare("UPDATE FROM turno WHERE disponible=false");
    $sentencia->execute();
    return $sentencia->fetch(PDO::PARAM_BOOL);
    }


}