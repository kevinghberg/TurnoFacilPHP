<?php

include_once('views/SecretariaView.php');
include_once('controllers/ControllerSecretaria.php');
require_once "ModelDB.php";

class ModelSecretaria extends Model{
    private $model;
    private $view;



    public function     getUserByUsername($username) {
        $query = $this->getDb()->prepare('SELECT * FROM `medicos` WHERE usuario = ?');
        $query->execute(array(($username)));
        return $query->fetch(PDO::FETCH_OBJ);
    }
 
   

    public function getTurnos($turnos){
        $sentencia = $this->getDb()->prepare("SELECT * FROM turnos ");
        $sentencia->execute(array(($turnos)));
        return $sentencia->fetch(PDO::FETCH_OBJ);
    }



}