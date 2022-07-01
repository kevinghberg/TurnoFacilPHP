<?php

include_once('views/SecretariaView.php');

class ControllerSecretaria extends Controller
{

    public function __construct()
    {
        $this->view = new SecretariaView();
        $this->authhelper = new AuthHelper();
    }


  

    public function showPortalSecretaria(){
        
        $this->view->showPortalSecretaria();
    }
}
