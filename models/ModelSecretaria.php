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

    
}
