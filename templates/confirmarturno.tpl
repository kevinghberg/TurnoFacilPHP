{include file="header.tpl"}
<div class="container-sm border border-secondary mt-5 rounded  " style="width: 1000px ; height: 600px;">
    <div class="text-center   ">
        <h1 class="mt-3">Turnos Solicitados</h1>
    </div>

    <div class=" d-flex justify-content-center">
        <table class="table text-center mt-5 " style="width: 700px;">
            <thead>
                <tr class="color">
                    <th class="text-white" scope="col">PACIENTE</th>
                    <th class="text-white" scope="col">FECHA</th>
                    <th class="text-white" scope="col">MEDICO</th>
                    <th class="text-white" scope="col"></th>
                </tr>
            </thead>
            <tbody>

                {foreach from=$turnos item=turno}
                    {if $turno->disponible == 0 && $turno->confirmado == 0}
                        <tr>
                            <td>{$turno->dni_paciente}</td>
                            <td>{$turno->fecha}</td>
                            <td>{$turno->nombre_medico}</td>
                            <td>
                                <a href="cargarturno/{$turno->id_turno}/{$turno->id_medico}"
                                    class="btn btn-success color">Confirmar turno</a>
                            </td>


                            </td>

                        </tr>
                    {/if}
                {/foreach}

            </tbody>
        </table>
    </div>
</div>

{include file="footer.tpl"}