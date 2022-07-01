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
        if (!empty($_SESSION['PACIENTE']))
            $this->smarty->assign('pacientecheck', true);
        if (!empty($_SESSION['MEDICO']))
            $this->smarty->assign('medicocheck', true);
        if (!empty($_SESSION['SECRETARIA']))
            $this->smarty->assign('secretariacheck', true);
    }

    public function render404()
    {
        $this->getSmarty()->display('templates/404.tpl');
    }

    public function getSmarty()
    {
        return $this->smarty;
    }
    public function getUsername()
    {
        $username = $this->authhelper->getLoggedUserName();
        return $username;
    }

    public function showLoginPersonal()
    {
        $this->smarty->display('templates/ingresopersonal.tpl');
    }
}
