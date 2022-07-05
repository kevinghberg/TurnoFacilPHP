{include 'templates/header.tpl'}

<div class="container-sm border border-secondary mt-5 rounded  " style="width: 1000px ; height: 600px;">

    <div class="text-center   ">
        <h1 class="mt-3">MIS MEDICOS</h1>
    </div>

    <div class=" d-flex justify-content-center">
        <table class="table text-center mt-5 " style="width: 700px;">
            <thead>
                <tr class="color">
                    <th class="text-white" scope="col">NOMBRE</th>
                    <th class="text-white" scope="col">ESPECIALIDAD</th>
                    <th class="text-white" scope="col">A CARGO DE</th>
                    <th class="text-white" scope="col"></th>
                </tr>
            </thead>
            <tbody>

                {foreach from=$medicos item=medico}

                    <tr>
                        <td>{$medico->nombre_medico}</td>
                        <td>{$medico->especialidad}</td>
                        <td>{$medico->id_secretaria}</td>

                        <td>
                        <a href="showmodificarmedico/{$medico->id_medico}" class="link-dark colorb btn btn-secondary">MODIFICAR</a>
                        </td>

                    </tr>

                {/foreach}

            </tbody>
        </table>
    </div>
</div>

</div>


{include 'templates/footer.tpl'}