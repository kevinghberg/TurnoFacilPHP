{include file="header.tpl"}


<div class="container-sm border border-secondary mt-5 rounded  " style="width: 1000px ; height: 600px;">

    <!-- Filtro turnos -->

    <div class="d-flex justify-content-center">



    </div>


    <!-- Filtro turnos -->
    <div class=" d-flex justify-content-center">
        <table class="table text-center mt-5 " style="width: 700px;">
            <thead>

                <tr>
                    <th class="bg-success text-white" scope="col">FECHA</th>
                    <th class="bg-success text-white" scope="col">MEDICO</th>
                    <th class="bg-success text-white" scope="col">ESPECIALIDAD</th>
                    <th class="bg-success text-white" scope="col"></th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$turnosPaciente item=turnoP}

                    <tr>

                        <td> {$turnoP->fecha} </td>
                        <td> {$turnoP->nombre_medico} </td>
                        <td> {$turnoP->especialidad} </td>
                        <td>

                            <button>
                                <a href="{BASE_URL}cancelarturno/{$turnoP->id_turno}"> Cancelar </a>
                            </button>

                        </td>


                    </tr>
                {{/foreach}}
            </tbody>
        </table>
    </div>
</div>

</div>



{include file="footer.tpl"}