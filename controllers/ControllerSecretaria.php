<?php

include_once './views/View.php';
include_once('models/ModelSecretaria.php');
include_once('views/SecretariaView.php');

class ControllerSecretaria extends Controller{

    public function __construct()
    {
        $this->model = new  ModelSecretaria();
        $this->view = new   SecretariaView();
    }


    public function showLogin()
    {
        $this->view->showLogin(" ");
    }

    public function verify()
    {
        if (!empty($_POST['usernameLogin']) && !empty($_POST['passwordLogin'])) {
            $user = $_POST['usernameLogin'];
            $pass = $_POST['passwordLogin'];
            $userDb = $this->model->getUserByUsername($user);
            if (!empty($userDb) && $pass === $userDb->contraseña) {
              $turnos = $this->model->getTurnos();
              $this->view->showTurnos($turnos);
            } else
                $this->view->showLogin("Login incorrecto, password o usuario incorrecto");
        }else {
            $this->view->showLogin("Login incompleto");
        }
   }

}