<?php

include_once "ModelDB.php";


class ModelTurnos extends ModelDB {

    

    function getTurnos(){
        $sentencia = $this->getDB()->prepare("SELECT * 
                                             FROM turno
                                             JOIN medico ON turno.id_medico = medico.id_medico"); 
        $sentencia->execute();
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function getTurnosPorFecha($diaTurno,$horaTurno){
        $sentencia = $this->getDB()->prepare( "SELECT dia,hora,medico.id_medico,medico.nombre_medico,disponible FROM turno 
                                                                         JOIN medico ON turno.id_medico = medico.id_medico
                                                                         WHERE dia=? AND hora=?"); 
        $sentencia->execute([$diaTurno,$horaTurno]);
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }


    function elegirTurno($id_turno){
    $sentencia = $this->getDB()->prepare("UPDATE turno SET disponible=0 WHERE id_turno=?");
    $sentencia->execute([$id_turno]);
    return $sentencia->fetch(PDO::PARAM_BOOL);
    }

    function cancelarTurno($id_turno){
        $sentencia = $this->getDB()->prepare("UPDATE turno SET disponible=1 WHERE id_turno=?");
        $sentencia->execute([$id_turno]);
        return $sentencia->fetch(PDO::PARAM_BOOL);

    }


}





