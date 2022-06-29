<?php

require_once('libs/smarty/libs/Smarty.class.php');
require_once('helper/AuthHelper.php');

class View
{
    private $smarty;
    private $authhelper;
    

    public function __construct()
    {
        $this->smarty = new Smarty();
        $this->smarty->assign('base_url', BASE_URL);
        $this->authhelper = new AuthHelper();
        
        $username = $this->authhelper->getLoggedUserName();
        $this->smarty->assign('username', $username);

        //EJEMPLO PARA OBTENER UNA VARIABLE LLAMANDO UNA FUNCIÓN
        //$username = $this->authhelper->getLoggedUserName();
    }

    public function render404(){
        $this->getSmarty()->display('templates/404.tpl');
    }

    public function getSmarty()
    {
        return $this->smarty;
    }
    public function getUsername()
    {
        $username = $this->authHelper->getLoggedUserName();

        return $username;   
    }




}   