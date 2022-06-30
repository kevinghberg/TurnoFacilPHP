<?php
require_once('controllers/Controller.php');
require_once('models/ModelMedico.php');

class PacienteController extends Controller
{
    //funcion para mostrar lxs medicxs al paciente
    public function mostrarMedicos()
    {
        $especialidad = $this->getModelMedico()->obtenerEspecialidad();
        $obra = $this->getModelMedico()->obtenerObraSocial();
        $medico = $this->getModelMedico()->obtenerMedicos();

        $this->getViewPaciente()->verMedicos($especialidad, $obra, $medico);
    }

    //funcion para mostrar lxs medicxs segun su especialidad
    public function mostrarMedicosPorEspecialidad()
    {
        $especialidad = $this->getModelMedico()->obtenerEspecialidad();
        $obra = $this->getModelMedico()->obtenerObraSocial();

        $esp = $_POST["especialidad"];

        if ($esp == 'todas') {
            $medico = $this->getModelMedico()->obtenerMedicos();
        } else {
            $medico = $this->getModelMedico()->obtenerMedicosPorEspecialidad($esp);
        }

        $this->getViewPaciente()->verMedicos($especialidad, $obra, $medico);
    }

    //funcion para mostrar lxs medicxs segun su obra social
    public function mostrarMedicosPorObra()
    {
        $especialidad = $this->getModelMedico()->obtenerEspecialidad();
        $obra = $this->getModelMedico()->obtenerObraSocial();

        $ob = $_POST["obra"];

        if ($ob == 'todas') {
            $medico = $this->getModelMedico()->obtenerMedicos();
        } else {
            $medico = $this->getModelMedico()->obtenerMedicosPorObra($ob);
        }

        $this->getViewPaciente()->verMedicos($especialidad, $obra, $medico);
    }
}
