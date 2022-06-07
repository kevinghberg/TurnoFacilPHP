<?php

include_once "ModelDB.php";

class ModelMedico extends ModelDB{

    function getMedicos(){
        $sentencia = $this->getDB()->prepare("SELECT nombre,apellido FROM medico");
        $sentencia->execute();
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function getMedico($medico){
        $sentencia = $this->getDB()->prepare("SELECT nombre,apellido FROM medico WHERE id_medico=?");
        $sentencia->execute([$medico]);
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }
}