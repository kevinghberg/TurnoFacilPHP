<?php

include_once "ModelDB.php";

class ModelMedico extends ModelDB
{

    function getMedicos()
    {
        $sentencia = $this->getDB()->prepare("SELECT * FROM medico");
        $sentencia->execute();
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function getTurnosMedicoPorUsername($username)
    {
        $sentencia = $this->getDB()->prepare(
            "SELECT * FROM turno t
        LEFT JOIN medico m on t.id_medico = m.id_medico
        LEFT JOIN paciente p on t.dni_paciente = p.dni_paciente
        WHERE m.username = ? "
        );
        $sentencia->execute([$username]);
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function comprobarUsername($username, $password)
    {
        $sentencia = $this->getDb()->prepare("SELECT 1 FROM medico WHERE username = ? AND password = ?");
        $sentencia->execute([$username, $password]);
        return $sentencia->fetch(PDO::PARAM_BOOL);
    }

    function getMedicosFiltrados()
    {
        $sentencia = $this->getDB()->prepare("SELECT * FROM turnos t JOIN trabaja_con tc ON t.id_medico = tc.id_medico JOIN obra_social os ON tc.id_obra_social = os.id_obra_social");
        $sentencia->execute();
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function getMedicoPorUsername($medico)
    {
        $sentencia = $this->getDb()->prepare("SELECT * FROM medico WHERE id_medico = ?");
        $sentencia->execute([$medico]);
        return $sentencia->fetch(PDO::FETCH_OBJ);
    }

    /**
     * @return array
     * Retorna todos las especialidades almacenadas en la tabla de lxs medicxs
     */
    public function obtenerEspecialidad()
    {
        $query = $this->getDb()->prepare('SELECT especialidad FROM MEDICO GROUP BY especialidad ORDER BY especialidad DESC');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    /**
     * @return array
     * Retorna todos las obras sociales en la tabla de obra social
     */
    public function obtenerObraSocial()
    {
        $query = $this->getDb()->prepare('SELECT * FROM OBRA_SOCIAL ORDER BY nombre_largo DESC');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function obtenerMedicosPorEspecialidad($esp)
    {
        $query = $this->getDb()->prepare('SELECT * FROM MEDICO WHERE especialidad = ?');
        $query->execute([$esp]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    /**
     * @return array
     * Retorna lxs medicxs segun su obra social
     */
    public function obtenerMedicosPorObra($ob)
    {
        $query = $this->getDb()->prepare('SELECT * FROM MEDICO M
        JOIN TRABAJA_CON T ON M.id_medico = T.id_medico
        JOIN obra_social o ON t.id_obra_social = o.id_obra_social
        WHERE  T.id_obra_social = ?');
        $query->execute([$ob]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
}
