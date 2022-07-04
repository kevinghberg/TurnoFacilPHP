{include file="header.tpl"}



<div class="d-flex justify-content-center">

    <form action="agregarturno" method="POST">

        <input type="datetime-local" name="inputFecha" 
            class="shadow p-1  mx-1 my-1 bg-white rounded">

        <select name="medicoInput">
            {foreach from=$medicos item=m}
                <option value={$m->nombre_medico}></option>
            {/foreach}
        </select>

        <button type="submit"> AGREGAR </button>



    </form>

</div>

<div class=" d-flex justify-content-center">
    <table class="table text-center mt-5 " style="width: 700px;">
      <thead>
        <tr class="color">
          <th class="text-white" scope="col">FECHA</th>
          <th class="text-white" scope="col">MEDICO</th>
          <th class="text-white" scope="col"></th>
        </tr>
      </thead>
      <tbody>

        {foreach from=$turnos item=turno}
          {if $turno->disponible == 1}
            <tr>
              <td>{$turno->fecha}</td>
              <td>{$turno->nombre_medico}</td>

              <td>
                <a href="cancelarturno/{$turno->id_turno}" class="btn btn-success color">Borrar</a>
              </td>

            </tr>
          {/if}
        {/foreach}

      </tbody>
    </table>
  </div>





{include file="footer.tpl"}