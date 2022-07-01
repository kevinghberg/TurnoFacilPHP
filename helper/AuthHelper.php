<?php

Class AuthHelper

{
    public function __construct()
    {
        
    }

    static private function start() {
        if (session_status() != PHP_SESSION_ACTIVE)
            session_start();
    }

    static public function login($dni) {
        self::start();
        $_SESSION['USERNAME'] = $dni;
        $_SESSION['PACIENTE'] = true;
    }

    public static function logout() {
        self::start();
        session_destroy();
    }

    public static function checkLoggedIn() {
        self::start();
        if (!isset($_SESSION['ID_USER'])){
            header('Location: ' . BASE_URL . "index");
            die;
        }
        else{
            return true;
        }
    }

    public static function loginMedico($username){
        self::start();
        $_SESSION['USERNAME'] = $username;
        $_SESSION['MEDICO'] = true;
    }

    public static function loginSecretaria($username){
        self::start();
        $_SESSION['USERNAME'] = $username;
        $_SESSION['SECRETARIA'] = true;
    }

    public static function getLoggedUserName() {
        self::start();
        if (isset($_SESSION['USERNAME'])) {
            return $_SESSION['USERNAME'];
        } else {
            return false;
        }
    }

}