<?php

include_once('views/SecretariaView.php');
include_once('controllers/ControllerSecretaria.php');
require_once "ModelDB.php";

class ModelSecretaria extends Model{
    private $model;
    private $view;
    

    public function    getUserByUsername($username) {
        $query = $this->getDb()->prepare('SELECT * FROM `medico` WHERE usuario = ?');
        $query->execute(array(($username)));
        return $query->fetch(PDO::FETCH_OBJ);
    }
 
    public function getTurnos(){
        $query = $this->getDb()->prepare("SELECT * FROM turnos");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }



}