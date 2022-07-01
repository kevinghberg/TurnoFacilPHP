<?php

require_once('View.php');

class SecretariaView extends View
{

    public function __construct()
    {
        parent::__construct();
        $username = parent::getUsername();
        $this->getSmarty()->assign('username', $username);
    }

    public function showPortalSecretaria()
    {
        $this->getSmarty()->display("templates/portalSecretaria.tpl");
    }
}
