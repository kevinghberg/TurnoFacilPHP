<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>TurnoFacil</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
  <link rel="stylesheet" href="css/style.css">
  <link rel="icon" href="imagenes/t.jpg" />
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Anton|Montserrat&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light  ">
    <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
      <ul class="navbar-nav">
        {if isset($username) && $username}
          <li class="nav-item active">

            {if isset($secretariacheck)}
              <a class="nav-link" href="{$url}portalsecretaria">HOME<span class="sr-only"></span></a>


            {elseif isset($pacientecheck)}
              <a class="nav-link" href="{$url}portalpaciente">HOME<span class="sr-only"></span></a>


            {elseif isset($medicocheck)}
              <a class="nav-link" href="{$url}portalmedico">HOME<span class="sr-only"></span></a>
            {/if}
          </li>
          <li class="nav-item">
            <a class="nav-link fw-bold">{$username}</a>
          </li>
        {else}
          <li class="nav-item">
            <a class="nav-link" href="{$url}ingreso">INGRESAR</a>
          </li>
        {/if}
        {if isset($secretaria) && ($secretaria==true)}
          <li class="nav-item">
            <a class="nav-link" href="{$url}listarmedicos">MEDICOS</a>
          </li>
        {/if}
        {if isset($medico) && ($medico==true)}
          <li class="nav-item">
            <a class="nav-link" href="{$url}listarmedicos">MIS TURNOS</a>
          </li>
        {/if}
        {if isset($username) && $username}
          <li class="nav-item">
            <a class="nav-link" href="{$url}deslogear">LOGOUT</a>
          </li>
        {/if}
      </ul>
    </div>
  </nav>

  <div class="container d-flex justify-content-center">
    <img src="./imagenes/bea8c8bfd99232680106da7d20a8731c.png" class="img-fluid" alt="">
</div>