<?php

class SecretariaView extends View {


    public function showLogin($error) {
        $this->getSmarty()->assign('title', "Login");
        $this->getSmarty()->assign('mensaje', $error);  
        //$this->getSmarty()->assign('logged', $logged);    
        $this->getSmarty()->assign('index', BASE_URL.'login');
        $this->getSmarty()->display('templates/login_secretaria_medico.tpl');
    }


    public function showTurnos($turnos){
        $this->getSmarty()->assign('turnos', $turnos);  
        $this->getSmarty()->display('templates/logeado.tpl');    
    }



}
