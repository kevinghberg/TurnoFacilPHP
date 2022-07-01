<?php

include_once './views/View.php';



class Controller
{
    private $view;

    function __construct()
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
