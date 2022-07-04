<?php

include_once "ModelDB.php";


class ModelTurno extends ModelDB
{


    function getTurnos()
    {
        $sentencia = $this->getDB()->prepare("SELECT * 
                                             FROM turno
                                             JOIN medico ON turno.id_medico = medico.id_medico");
        $sentencia->execute();
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function getTurnosPorFecha($diaTurno, $horaTurno)
    {
        $sentencia = $this->getDB()->prepare("SELECT fecha, medico.especialidad,medico.id_medico,medico.nombre_medico,disponible FROM turno 
                                                                         JOIN medico ON turno.id_medico = medico.id_medico
                                                                         WHERE dia=? AND hora=?");
        $sentencia->execute([$diaTurno, $horaTurno]);
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }


    function getTurnosFiltrados($especialidadTurno, $obraSocialTurno)
    {

        $sentencia = $this->getDB()->prepare("SELECT fecha, medico.id_medico, medico.nombre_medico, disponible , especialidad, nombre_largo
                                                FROM turno JOIN medico ON turno.id_medico = medico.id_medico 
                                                           JOIN trabaja_con ON medico.id_medico = trabaja_con.id_medico
                                                           WHERE  medico.especialidad = ? AND trabaja_con.nombre_largo =? ");

        $sentencia->execute([$especialidadTurno, $obraSocialTurno]);
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }


    function elegirTurno($yo, $id_turno)
    {
        $sentencia = $this->getDB()->prepare("UPDATE turno SET disponible=0 , dni_paciente=? WHERE id_turno=?");
        $sentencia->execute([$yo, $id_turno]);
        return $sentencia->fetch(PDO::PARAM_BOOL);
    }

    function cancelarTurno($id_turno)
    {
        $sentencia = $this->getDB()->prepare("UPDATE turno SET disponible=1,  dni_paciente=null, confirmado=0 WHERE id_turno=?");
        $sentencia->execute([$id_turno]);
        return $sentencia->fetch(PDO::PARAM_BOOL);
    }

    /**
     * Confirma el turno al paciente
     */
    function confirmarTurnoPaciente($id_turno)
    {
        $sentencia = $this->getDB()->prepare("UPDATE turno SET confirmado=1  WHERE id_turno=?");
        $sentencia->execute([$id_turno]);
        return $sentencia->fetch(PDO::PARAM_BOOL);
    }

    /**
     * carga turno al medico
     */
    function cargarTurnoMedico($id_turno, $id_medico)
    {
        $sentencia = $this->getDB()->prepare("INSERT INTO medico_turnos(id_medico, id_turno) VALUES (?,?)");
        $sentencia->execute([$id_medico, $id_turno]);
        return $sentencia->fetch(PDO::PARAM_BOOL);
    }

    /**
     * Retorna los turnos solicitados de los medicxs que tengan su id_secretaria = $id
     */
    function getTurnosSecretaria($id)
    {
        $sentencia = $this->getDB()->prepare("SELECT * 
                                             FROM turno t
                                             JOIN medico m ON t.id_medico = m.id_medico 
                                             WHERE m.id_secretaria=?");
        $sentencia->execute([$id]);
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function getTurnoPorId($id)
    {
        $sentencia = $this->getDb()->prepare("SELECT *
                                              FROM turno t
                                              LEFT JOIN medico m ON t.id_medico = m.id_medico
                                              LEFT JOIN paciente p ON t.dni_paciente = p.dni_paciente
                                              WHERE t.id_turno = ?");
        $sentencia->execute([$id]);
        return $sentencia->fetch(PDO::FETCH_OBJ);
    }

    function bloquearTurno($id_turno)
    {
        $query = $this->getDb()->prepare("
        UPDATE turno SET disponible = 0 WHERE id_turno = ?");
        $query->execute(([$id_turno]));
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function desbloquearTurno($id_turno)
    {
        $query = $this->getDb()->prepare("
        UPDATE turno SET disponible = 1 WHERE id_turno = ?");
        $query->execute(([$id_turno]));
        return $query->fetch(PDO::FETCH_OBJ);
    }
    function darDeBajaPaciente($id_turno)
    {
        $query = $this->getDb()->prepare("
        UPDATE turno SET dni_paciente = NULL WHERE id_turno = ?");
        $query->execute(([$id_turno]));
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function agregarTurnoNuevo($id_medico,$fecha){
        $query = $this->getDb()->prepare("INSERT INTO turno (id_medico, fecha) VALUES (?,?)");
        $query->execute([$id_medico,$fecha]);
        return $query->fetch(PDO::FETCH_OBJ);
    }
}
