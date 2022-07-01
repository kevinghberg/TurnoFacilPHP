{include file="header.tpl"}


<div class="container-sm border border-secondary mt-5 rounded  " style="width: 1000px ; height: 600px;">

  <div class="text-center   ">
    <h1 class="mt-3">Turnos Disponibles</h1>
  </div>

  <div class=" d-flex justify-content-center">
    <table class="table text-center mt-5 " style="width: 700px;">
      <thead>
        <tr>
          <th class="bg-success text-white" scope="col">FECHA</th>
          <th class="bg-success text-white" scope="col">MEDICO</th>
          <th class="bg-success text-white" scope="col">ELEGIR</th>
        </tr>
      </thead>
      <tbody>

        {foreach from=$turnos item=turno}
          <tr>
            <td>{$turno->fecha}</td>
            <td>{$turno->nombre_medico}</td>

            {if $turno->disponible == 1}
              <td>
                <button> <a href="elegirturno/{$turno->id_turno}">Elegir</a> </button>
              </td>
            {/if}

            {if $turno->disponible == 0}
              <td>
                <button type="button">No Disponible</button>
              </td>
            {/if}

            </td>

          </tr>
        {/foreach}

      </tbody>
    </table>
  </div>
</div>

</div>



<footer class="bg-success text-center text-white position-absolute bottom-0" style="width:100%;">
  <P>ACA EL FOOTER CON LOS ICONOS DE SOCIALMEDIA</P>
</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>

</html>