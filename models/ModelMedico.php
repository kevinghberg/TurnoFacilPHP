<?php

include_once "ModelDB.php";

class ModelMedico extends ModelDB{


    private $model;
    private $view;

    public function __construct()
    {
        $this->model = new ModelTurnos();
        $this->modelMedico = new ModelMedico();
    }


    function getMedicos(){
        $sentencia = $this->getDB()->prepare("SELECT * FROM medico ");
        $sentencia->execute([]);
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function getMedicoFiltrado($medico){
        $sentencia = $this->getDB()->prepare("SELECT * FROM medico WHERE nombre=? AND apellido =? ");
        $sentencia->execute([$medico]);
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }
}