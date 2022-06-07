{include 'templates/header.tpl'}

<div class="container d-flex justify-content-center mt-5">
  <a href=""> <img src="imagenes\bea8c8bfd99232680106da7d20a8731c.png" class="img-fluid" alt="Responsive image"> </a>
</div>

<div class="container-sm border border-secondary mt-5 rounded" style="width: 1000px ; height: 350px;">

  <div class="text-center">
    <h1 class="mt-3">Turnos Disponibles para for </h1>
  </div>

  <div class=" d-flex justify-content-center">
    <table class="table text-center mt-5" style="width: 700px;">
      <thead>
        <tr>
          <th class="bg-success text-white" scope="col">Fecha</th>
          <th class="bg-success text-white" scope="col">Paciente</th>
          <th class="bg-success text-white" scope="col">Administrar</th>
        </tr>
      </thead>
      <tbody>
        {foreach from=$turnos item=turno}
          <tr>
            <td>{$turno->fecha}</td>
            <td>
              {if ($turno->nombre)}
                {$turno->nombre} {$turno->apellido}

              </td>
            {else}
              <p class="text-success">No tiene paciente</p>
              </td>
            {/if}
            <td>
              <a href="{$base_url}administrarturnos/{$turno->id_turno}">ADMINISTRAR</a>
            </td>
          </tr>
        {/foreach}
      </tbody>
    </table>
  </div>

  <a href="{$base_url}listarmedicos"> Volver a la lista de medicos</a>
</div>