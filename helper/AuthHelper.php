<?php

class AuthHelper

{
    public function __construct()
    {
    }

    static private function start()
    {
        if (session_status() != PHP_SESSION_ACTIVE)
            session_start();
    }

}