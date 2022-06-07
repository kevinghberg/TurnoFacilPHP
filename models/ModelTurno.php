<?php

require_once('ModelDB.php');

class ModelTurno extends DBModel
{
    function obtenerTurnosPorMedico($id_medico)
    {
        $query = $this->getDb()->prepare(" 
        SELECT turnos.fecha, paciente.nombre, paciente.apellido, turnos.disponible,id_turno
        FROM turnos
        LEFT JOIN paciente ON turnos.id_paciente = paciente.dni_paciente
        WHERE turnos.id_medico = ?");
        $query->execute([$id_medico]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function obtenerListaMedicos()
    {
        $query = $this->getDb()->prepare("
        SELECT id_medico,nombre_medico
        FROM medicos
        ");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function obtenerDetallesTurno($id_turno)
    {
        $query = $this->getDb()->prepare("
        SELECT * from turnos
        LEFT JOIN paciente ON turnos.id_paciente = paciente.dni_paciente
        JOIN medicos ON turnos.id_medico = medicos.id_medico
        WHERE id_turno = ?");
        $query->execute(([$id_turno]));
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function bloquearTurno($id_turno)
    {
        $query = $this->getDb()->prepare("
        UPDATE turnos SET disponible = 0 WHERE id_turno = ?");
        $query->execute(([$id_turno]));
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function desbloquearTurno($id_turno)
    {
        $query = $this->getDb()->prepare("
        UPDATE turnos SET disponible = 1 WHERE id_turno = ?");
        $query->execute(([$id_turno]));
        return $query->fetch(PDO::FETCH_OBJ);
    }
    function cancelarTurno($id_turno)
    {
        $query = $this->getDb()->prepare("
        UPDATE turnos SET id_paciente = NULL WHERE id_turno = ?");
        $query->execute(([$id_turno]));
        return $query->fetch(PDO::FETCH_OBJ);
    }
}
