<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap demo</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light  ">
<div class="collapse navbar-collapse justify-content-center" id="navbarNav">
  <ul class="navbar-nav">
    {if isset($username) && $username}
      <li class="nav-item active">
        <a class="nav-link" href="portalpaciente">HOME <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="deslogear">LOGOUT</a>
      </li>
      <li class="nav-item">
        <a class="nav-link fw-bold">{$username}</a>
      </li>
    {else}
      <li class="nav-item">
        <a class="nav-link" href="ingreso">INGRESAR</a>
      </li>
    {/if}
    {if isset($secretaria) && ($secretaria==true)}
      <li class="nav-item">
        <a class="nav-link" href="listarmedicos">MEDICOS</a>
      </li>
    {/if}
    {if isset($medico) && ($medico==true)}
      <li class="nav-item">
        <a class="nav-link" href="listarmedicos">MIS TURNOS</a>
      </li>
    {/if}
  </ul>
</div>
</nav>