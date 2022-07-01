<?php

include_once "ModelDB.php";

class ModelMedico extends ModelDB
{

    function getMedicos()
    {
        $sentencia = $this->getDB()->prepare("SELECT nombre_medico FROM medico");
        $sentencia->execute();
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function getMedico($medico)
    {
        $sentencia = $this->getDB()->prepare("SELECT nombre_medico FROM medico WHERE id_medico=?");
        $sentencia->execute([$medico]);
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function getTurnosMedico()
    {
        $sentencia = $this->getDB()->prepare("SELECT dia,hora FROM turno t JOIN medico m on t.id_medico = m.id_medico WHERE username=? ");
        $sentencia->execute([]);
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function getMedicosA()
    {
        $sentencia = $this->getDB()->prepare("SELECT * FROM medico");
        $sentencia->execute();
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function getMedicosFiltrados()
    {
        $sentencia = $this->getDB()->prepare("SELECT * FROM turnos t JOIN trabaja_con tc ON t.id_medico = tc.id_medico JOIN obra_social os ON tc.id_obra_social = os.id_obra_social");
        $sentencia->execute();
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }
}
