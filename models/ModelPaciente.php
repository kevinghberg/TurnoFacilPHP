<?php

include_once "ModelDB.php";

Class ModelPaciente extends ModelDB{

function getTurnosByDNI($dni){
    $sentencia = $this->getDB()->prepare("SELECT dia,hora,id_medico FROM turno WHERE dni_paciente=? ");
    $sentencia->execute([$dni]);
    return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

}