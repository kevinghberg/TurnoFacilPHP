<?php

include_once "ModelDB.php";

Class ModelPaciente extends ModelDB{

function getTurnosByDNI($dni){
    $sentencia = $this->getDB()->prepare("SELECT * FROM paciente WHERE dni_paciente=? ");
    $sentencia->execute([$dni]);
    return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

function getPacienteByDNI($dni){
    $sentencia = $this->getDB()->prepare("SELECT id_medico,dia,hora FROM turno WHERE dni_paciente=? ");
    $sentencia->execute([$dni]);
    return $sentencia->fetchAll(PDO::FETCH_OBJ);
}


}