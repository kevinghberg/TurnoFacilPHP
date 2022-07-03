<?php

require_once('./views/View.php');

class Controller
{

 
    private $view;

    //En el constructor hago las conecciones a la bases de datos y
    //a la vista para poder usarlas dentro de esta clase.
    public function __construct()
    {
       
        $this->view = new View();
    }

    public function deslogear()
    {
        AuthHelper::logout();
        header("Location: " . BASE_URL . 'ingreso');
    }

    public function showLoginPersonal()
    {
        $this->view->showLoginPersonal();
    }

}
