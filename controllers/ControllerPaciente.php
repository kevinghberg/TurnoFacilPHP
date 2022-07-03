<?php
include_once './views/View.php';
include_once('models/ModelPaciente.php');
include_once('views/PacienteView.php');
include_once('models/ModelMedico.php');

class ControllerPaciente extends Controller
{

    private $modelPaciente;
    private $modelMedico;
    private $view;
    private $viewPaciente;

    public function __construct()
    {
        $this->modelPaciente = new ModelPaciente();
        $this->view = new View();
        $this->authhelper = new AuthHelper();
        $this->viewPaciente = new PacienteView();
        $this->modelMedico = new ModelMedico();
    }


    public function getForm()
    {
        $this->viewPaciente->showIngreso(" ");
    }

    public function showPortalPaciente()
    {
        $this->viewPaciente->showPortalPaciente();
    }

    public function mostrarMedicos()
    {
        $especialidad = $this->modelMedico->obtenerEspecialidad();
        $obra = $this->modelMedico->obtenerObraSocial();
        $medico = $this->modelMedico->getMedicos();

        $this->viewPaciente->verMedicos($especialidad, $obra, $medico);
    }

    //funcion para mostrar lxs medicxs segun su especialidad
    public function mostrarMedicosPorEspecialidad()
    {
        $especialidad = $this->modelMedico->obtenerEspecialidad();
        $obra = $this->modelMedico->obtenerObraSocial();

        $esp = $_POST["especialidad"];

        if ($esp == 'todas') {
            $medico = $this->modelMedico->getMedicos();
        } else {
            $medico = $this->modelMedico->obtenerMedicosPorEspecialidad($esp);
        }

        $this->viewPaciente->verMedicos($especialidad, $obra, $medico);
    }

    //funcion para mostrar lxs medicxs segun su obra social
    public function mostrarMedicosPorObra()
    {
        $especialidad = $this->modelMedico->obtenerEspecialidad();
        $obra = $this->modelMedico->obtenerObraSocial();
        $ob = $_POST["obra"];

        if ($ob == 'todas') {
            $medico = $this->modelMedico->getMedicos();
        } else {
            $medico = $this->modelMedico->obtenerMedicosPorObra($ob);
        }

        $this->viewPaciente->verMedicos($especialidad, $obra, $medico);
    }


    public function registrarPaciente()
    {
        $dni = $_POST['dniPaciente'];
        $nombre = $_POST['nombrePaciente'];
        $apellido = $_POST['apellidoPaciente'];
        $password = $_POST['passwordPaciente'];
        $direccion = $_POST['direccionPaciente'];
        $numeroAfiliado = $_POST['numeroAfiliadoPaciente'];
        $telefono = $_POST['telefonoPaciente'];
        $ObraSocial = $_POST['obraSocialPaciente'];

        if (!empty($nombre) && !empty($apellido) && !empty($direccion) && !empty($telefono)) {
            $this->modelPaciente->registrarPaciente($dni, $nombre, $apellido, $password, $direccion, $numeroAfiliado, $telefono, $ObraSocial);

            header("Location: " . BASE_URL . 'ingreso');
        }
    }

    public function logear()
    {
        if (!empty($_POST['dniPaciente'])) {
            $dni = $_POST['dniPaciente'];
            $userDb = $this->modelPaciente->checkearDni($dni);

            if (!empty($userDb) && $dni === $userDb->dni_paciente) {

                AuthHelper::login($dni);
                header("Location: " . BASE_URL . 'portalpaciente');
            } else
                header("Location: " . BASE_URL . 'registro');
        } else
            header("Location: " . BASE_URL . 'ingreso');
    }


    public function showRegistro()
    {
        $obra = $this->modelMedico->obtenerObraSocial();

        $this->viewPaciente->showRegistro($obra);
    }
}
