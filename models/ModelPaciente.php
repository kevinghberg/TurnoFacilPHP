<?php

include_once "ModelDB.php";

class ModelPaciente extends ModelDB
{

    function getTurnosByDNI($dni)
    {
        $sentencia = $this->getDB()->prepare('SELECT dia,hora,id_medico,id_turno FROM turno WHERE dni_paciente=?');
        $sentencia->execute(array($dni));
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    public function checkearDni($dni)
    {
        $query = $this->getDb()->prepare('SELECT * FROM paciente WHERE dni_paciente = ?');
        $query->execute(array(($dni)));
        return $query->fetch(PDO::FETCH_OBJ);
    }
}
