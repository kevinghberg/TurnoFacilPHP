<?php

include_once('views/SecretariaView.php');
include_once('models/ModelSecretaria.php');

class ControllerSecretaria extends Controller
{

    public function __construct()
    {
        $this->view = new SecretariaView();
        $this->authhelper = new AuthHelper();
        $this->model = new ModelSecretaria();
    }


    public function showLoginSecretaria()
    {
        $this->view->showLoginSecretaria();
    }

    public function logearSecretaria()
    {
        if (!empty($_POST['username']) && !empty($_POST['password'])) {
            $checkUsername = $this->model->comprobarUsername($_POST['username'], $_POST['password']);
            if ($checkUsername == 1) {
                $username = $_POST['username'];
                AuthHelper::loginMedico($username);
                header("Location:" . BASE_URL . 'portalsecretaria');
            } else {
                header("Location:" . BASE_URL . 'loginpersonal');
            }
        } else
            header("Location:" . BASE_URL . 'loginpersonal');
    }

    public function showPortalSecretaria()
    {
        $this->view->showPortalSecretaria();
    }
}
