<?php

include_once "ModelDB.php";

class ModelSecretaria extends ModelDB
{


    function comprobarUsername($username, $password)
    {
        $sentencia = $this->getDb()->prepare("SELECT 1 FROM secretaria WHERE username = ? AND password = ?");
        $sentencia->execute([$username, $password]);
        return $sentencia->fetch(PDO::PARAM_BOOL);
    }

    /**
     * Retorna el id_secretaria que coincida con el $username
     */
    function getId($username)
    {
        $sentencia = $this->getDb()->prepare("SELECT id_secretaria FROM secretaria WHERE username = ?");
        $sentencia->execute([$username]);
        return $sentencia->fetch(PDO::PARAM_BOOL);
    }
    public function modificarMedico($nombre, $especialidad, $secretaria, $id)
    {
        $sentencia = $this->getDB()->prepare("UPDATE medico SET nombre_medico=?,especialidad=?,id_secretaria=? WHERE id_medico=?");
        $sentencia->execute([$nombre, $especialidad, $secretaria, $id]);
        return $sentencia->fetch(PDO::FETCH_OBJ);
    }
}
