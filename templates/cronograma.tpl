{include 'templates/header.tpl'}

<div class="container-sm border border-secondary mt-5 rounded" style="width: 1000px ; height: 350px;">

    <div class="text-center">
        <h1 class="mt-3">Cronograma</h1>
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
                            {if ($turno->nombre_paciente)}
                                {$turno->nombre_paciente} {$turno->apellido}
                            </td>
                        {else}
                            <p class="text-success">No tiene paciente</p>
                            </td>
                        {/if}
                        <td>
                            <a href="#">ADMINISTRAR - PROXIMA RELEASE</a>
                        </td>
                    </tr>
                {/foreach}
            </tbody>
        </table>

    </div>
    <div class="d-flex justify-content-center col-2">
        <a href="#">DESCARGAR COMO PDF </a>
        <a href="portalmedico">Volver atrás</a>
    </div>
</div>

{include file="footer.tpl"}