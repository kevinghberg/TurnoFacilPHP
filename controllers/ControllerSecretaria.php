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
        //$logged = $this->CheckLoggedIn();
        $this->view->showLogin();
    }


    public function verify()
    {
        if (!empty($_POST['usernameLogin']) && !empty($_POST['passwordLogin'])) {
            $user = $_POST['usernameLogin'];
            $pass = $_POST['passwordLogin'];
            $userDb = $this->model->getUserByUsername($user);

            if (!empty($userDb) && $pass === $userDb->contraseña) {
               // AuthHelper::login($userDb);
                //_SESSION["admin"] = $userDb->admin;
                //header('Location: ' . BASE_URL . "index");
            } else
                $this->view->showLogin("Login incorrecto, password o usuario incorrecto");
        }else {
            $this->view->showLogin("Login incompleto");
        }
   }


    public function logout()
    {
        AuthHelper::logout();
        header("Location: " . BASE_URL . 'login');
    }




}