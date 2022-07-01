<?php
include_once './views/View.php';
include_once('models/ModelPaciente.php');
include_once('views/PacienteView.php');

class ControllerPaciente extends Controller
{

    public function __construct()
    {
        $this->model = new ModelPaciente();
        $this->view = new PacienteView();
        $this->authhelper = new AuthHelper();
    }


    public function getForm()
    {
        $this->view->showIngreso(" ");
    }

    public function showPortalPaciente()
    {
        $this->view->showPortalPaciente();
    }

    public function getTurnosPaciente()
    {
        $turnosPaciente = $this->model->getTurnosByDNI($_SESSION['USERNAME']);

        $this->view->showTurnosPaciente($turnosPaciente);
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
            $this->model->registrarPaciente($dni, $nombre, $apellido, $password, $direccion, $numeroAfiliado, $telefono, $ObraSocial);

            header("Location: " . BASE_URL . 'portalpaciente');
        }
    }

    public function logear()
    {
        if (!empty($_POST['dniPaciente'])) {
            $dni = $_POST['dniPaciente'];
            $userDb = $this->model->checkearDni($dni);

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
        $this->view->showRegistro();
    }
}
