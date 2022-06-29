<?php
require_once('views/paciente.view.php');
require_once('models/ModelMedico.php');

class PacienteController
{

    private $modelmedico;
    private $viewpaciente;

    //En el constructor hago las conecciones a la bases de datos y
    //a la vista para poder usarlas dentro de esta clase.
    public function __construct()
    {
        $this->viewpaciente = new PacienteView();
        $this->modelmedico = new ModelMedico();
    }

    //funcion para mostrar lxs medicxs al paciente
    public function mostrarMedicos()
    {
        $especialidad = $this->modelmedico->obtenerEspecialidad();
        $obra = $this->modelmedico->obtenerObraSocial();
        $medico = $this->modelmedico->obtenerMedicos();

        $this->viewpaciente->verMedicos($especialidad, $obra, $medico);
    }

    //funcion para mostrar lxs medicxs segun su especialidad
    public function mostrarMedicosPorEspecialidad()
    {
        $especialidad = $this->modelmedico->obtenerEspecialidad();
        $obra = $this->modelmedico->obtenerObraSocial();

        $esp = $_POST["especialidad"];

        if ($esp == 'todas') {
            $medico = $this->modelmedico->obtenerMedicos();
        } else {
            $medico = $this->modelmedico->obtenerMedicosPorEspecialidad($esp);
        }

        $this->viewpaciente->verMedicos($especialidad, $obra, $medico);
    }

    //funcion para mostrar lxs medicxs segun su obra social
    public function mostrarMedicosPorObra()
    {
        $especialidad = $this->modelmedico->obtenerEspecialidad();
        $obra = $this->modelmedico->obtenerObraSocial();

        $ob = $_POST["obra"];

        if ($ob == 'todas') {
            $medico = $this->modelmedico->obtenerMedicos();
        } else {
            $medico = $this->modelmedico->obtenerMedicosPorObra($ob);
        }

        $this->viewpaciente->verMedicos($especialidad, $obra, $medico);
    }
}
