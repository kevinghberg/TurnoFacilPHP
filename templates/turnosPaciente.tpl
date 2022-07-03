{include file="header.tpl"}
<div class="container-sm border border-secondary mt-5 rounded " style="width: 1000px ; height: 500px;">
    <!-- Filtro turnos -->
    <div class="d-flex justify-content-center">
    </div>
    <!-- Filtro turnos -->
    <div class=" d-flex justify-content-center">
        <table class="table text-center mt-5 border-success" style="width: 700px;">
            <thead>
                <tr class="color">
                    <th class="text-white" scope="col">FECHA</th>
                    <th class=" text-white" scope="col">MEDICO</th>
                    <th class=" text-white" scope="col">ESPECIALIDAD</th>
                    <th class=" text-white" scope="col"></th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$turnosPaciente item=turnoP}
                    <tr>
                        <td> {$turnoP->fecha} </td>
                        <td> {$turnoP->nombre_medico} </td>
                        <td> {$turnoP->especialidad} </td>
                        <td>
                            <a class="btn btn-danger" href="{BASE_URL}cancelarturno/{$turnoP->id_turno}"> Cancelar </a>
                        </td>
                    </tr>
                {{/foreach}}
            </tbody>
        </table>
    </div>
</div>
</div>
{include file="footer.tpl"}