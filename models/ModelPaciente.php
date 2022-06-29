<?php

include_once('views/PacienteView.php');
include_once('controllers/ControllerPaciente.php');
require_once "ModelDB.php";

class ModelPaciente extends Model{
    private $model;
    private $view;


public function checkearDni($dni){
    $query = $this->getDb()->prepare('SELECT * FROM `paciente` WHERE dni_paciente = ?');
        $query->execute(array(($dni)));
        return $query->fetch(PDO::FETCH_OBJ);
}


public function registrarPaciente($dni,$nombre,$apellido,$password,$direccion,$numeroAfiliado,$telefono,$obraSocial){

        $query = $this->getDb()->prepare ('INSERT INTO `paciente`(`dni_paciente`, `nombre_paciente`, `apellido`, `password`, `direccion`, `id_afiliado`, `telefono`, `id_obra_social`) VALUES (?,?,?,?,?,?,?,?)');
        $query->execute([$dni,$nombre,$apellido,$password,$direccion,$numeroAfiliado,$telefono,$obraSocial]);
        return $query->fetch(PDO::FETCH_OBJ);
}


}