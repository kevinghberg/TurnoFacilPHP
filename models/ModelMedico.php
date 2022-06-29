<?php
require_once('model.php');

//Las clases siempre empiezan con mayusculas
class ModelMedico extends Model
{

    /**
     * @return array
     * Retorna todxs lxs medicxs
     */
    public function obtenerMedicos()
    {
        $query = $this->getDb()->prepare('SELECT * FROM MEDICO');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

     /**
     * @return array
     * Retorna lxs medicxs segun su especialidad
     */
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
        $query = $this->getDb()->prepare('SELECT * FROM MEDICO M JOIN TRABAJA_CON T ON M.id_medico = T.id_medico
        WHERE  T.id_obra_social = ?');
        $query->execute([$ob]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    /**
     * @return array
     * Retorna todos las especialidades almacenadas en la tabla de lxs medicxs
     */
    public function obtenerEspecialidad()
    {
        $query = $this->getDb()->prepare('SELECT especialidad FROM MEDICO ORDER BY especialidad DESC');
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
    

}
