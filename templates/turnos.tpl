{include file="header.tpl"}


<div class="container-sm border border-secondary mt-5 rounded  " style="width: 1000px ; height: 600px;">

  <div class="text-center   ">
    <h1 class="mt-3">Turnos Disponibles</h1>
  </div>

  <div class=" d-flex justify-content-center">
    <table class="table text-center mt-5 " style="width: 700px;">
      <thead>
        <tr class="color">
          <th class="text-white" scope="col">FECHA</th>
          <th class="text-white" scope="col">MEDICO</th>
          <th class="text-white" scope="col">ELEGIR</th>
        </tr>
      </thead>
      <tbody>

        {foreach from=$turnos item=turno}
          {if $turno->disponible == 1}
            <tr>
              <td>{$turno->fecha}</td>
              <td>{$turno->nombre_medico}</td>

              <td>
                <a href="elegirturno/{$turno->id_turno}" class="btn btn-success color">Elegir</a>
              </td>

            </tr>
          {/if}
        {/foreach}

      </tbody>
    </table>
  </div>
</div>

</div>



{include file="footer.tpl"}