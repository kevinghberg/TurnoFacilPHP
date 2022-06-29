<?php

include_once "ModelDB.php";

class ModelMedico extends ModelDB{

    function getMedicos(){
        $sentencia = $this->getDB()->prepare("SELECT nombre_medico FROM medico");
        $sentencia->execute();
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function getMedico($medico){
        $sentencia = $this->getDB()->prepare("SELECT nombre_medico FROM medico WHERE id_medico=?");
        $sentencia->execute([$medico]);
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function getTurnosMedico(){
        $sentencia = $this->getDB()->prepare("SELECT dia,hora FROM turno t JOIN medico m on t.id_medico = m.id_medico WHERE username=? ");
        $sentencia->execute([]);
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }


}