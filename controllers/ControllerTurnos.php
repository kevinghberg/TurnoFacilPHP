<?php
include_once './models/ModelTurno.php';
include_once './views/View.php';
class ControllerTurnos
{
    private $modelTurno;
    private $view;

    public function __construct()
    {
        $this->view = new View();
        $this->modelTurno = new ModelTUrno();
    }
    function mostrarTurnosPorMedico()
    {
        if (isset($_GET['id_medico'])) {
            $id_medico = $_GET['id_medico'];
            $query = $this->modelTurno->obtenerTurnosPorMedico($id_medico);
            $this->view->renderCancelarTurnos($query);
        } else {
            $query = $this->modelTurno->obtenerListaMedicos();
            $this->view->renderListarMedicos($query);
        }
    }
    function administrarTurno($id_turno)
    {
        $query = $this->modelTurno->obtenerDetallesTurno($id_turno);
        $this->view->renderDetallesTurno($query);
    }
    function bloquearTurno()
    {
        $id_turno = $_POST["id_turno"];
        $this->modelTurno->bloquearTurno($id_turno);
        header("Location:" . BASE_URL . 'listarmedicos');
    }

    function desbloquearTurno()
    {
        $id_turno = $_POST["id_turno"];
        $this->modelTurno->desbloquearTurno($id_turno);
        header("Location:" . BASE_URL . 'listarmedicos');
    }
    function cancelarTurno()
    {
        $id_turno = $_POST["id_turno"];
        $this->modelTurno->cancelarTurno($id_turno);
        header("Location:" . BASE_URL . 'listarmedicos');
    }
}
