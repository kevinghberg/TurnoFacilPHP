<?php

include_once "ModelDB.php";

class ModelPaciente extends ModelDB
{

    function getTurnosByDNI($dni)
    {
        $sentencia = $this->getDB()->prepare('SELECT dia,hora,nombre_medico,id_turno FROM turno t 
                                                                                     LEFT JOIN medico m ON t.id_medico = m.id_medico WHERE dni_paciente=?');
        $sentencia->execute(array($dni));
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    public function checkearDni($dni)
    {
        $query = $this->getDb()->prepare('SELECT * FROM paciente WHERE dni_paciente = ?');
        $query->execute(array(($dni)));
        return $query->fetch(PDO::FETCH_OBJ);
    }

    public function registrarPaciente($dni, $nombre, $apellido, $password, $direccion, $numeroAfiliado, $telefono, $obraSocial)
    {

        $query = $this->getDb()->prepare('INSERT INTO paciente(dni_paciente, nombre_paciente, apellido, password, direccion, id_afiliado, telefono, id_obra_social) VALUES (?,?,?,?,?,?,?,?)');
        $query->execute([$dni, $nombre, $apellido, $password, $direccion, $numeroAfiliado, $telefono, $obraSocial]);
        return $query->fetch(PDO::FETCH_OBJ);
    }
}
