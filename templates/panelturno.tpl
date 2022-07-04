{include 'templates/header.tpl'}

{include 'templates/modal.tpl'}




<div class="container-sm border border-secondary mt-5 rounded" style="width: 1000px ; height: 600px;">

    <div class="text-center mt-5">
        <h1 class="mt-3">TURNO </h1>
    </div>

    <div class="d-flex justify-content-around align-items-center mt-5">





        <ul class="list-group">
            <li class="list-group-item fw-bold ">Medico: {$turno->nombre_medico}</li>
            <li class="list-group-item fw-bold">Especialidad: {$turno->especialidad}</li>
            {if isset($turno->nombre_paciente)}
                <li class="list-group-item fw-bold">Paciente: {$turno->nombre_paciente} {$turno->apellido}</li>
                <li class="list-group-item fw-bold">Telefono: {$turno->telefono}</li>
                <li class="list-group-item fw-bold"> DNI: {$turno->dni_paciente}</li>
            {else}
                <li class="list-group-item fw-bold">No tiene paciente</li>
            {/if}
            <li class="list-group-item fw-bold"> Fecha del turno: {$turno->fecha}</li>
        </ul>

    </div>

    <div class=" d-flex justify-content-center mt-5">

        {if isset($turno->nombre_paciente)}
            <button type="button" class="btn btn-success mx-3 " data-bs-toggle="modal" data-bs-target="#cancelarturno" class="btns">
                Dar de baja paciente
            </button>
        {/if}
        {if ($turno->disponible == 1)}
            <button type="button" class="btn btn-success mx-3 "  data-bs-toggle="modal" data-bs-target="#bloquearturno" >
                Bloquear Turno
            </button>
        {else}
            <button type="button" class="btn btn-success mx-3" data-bs-toggle="modal" data-bs-target="#desbloquearturno">
                Desbloquear Turno
            </button>
        {/if}

    </div>

</div>

<div>
    <a href="{$url}administrarturnos">Volvera la pagina anterior</a>

</div>

</div>

{include 'templates/footer.tpl'}