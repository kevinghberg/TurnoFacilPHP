<?php

include_once './views/View.php';

class Controller
{
    private $view;

    function __construct()
    {
        $this->view = new View();
        
    }

}
