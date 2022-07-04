{include 'templates/header.tpl'}

{include 'templates/modal.tpl'}


<div class="container-sm border border-secondary mt-3 rounded" style="width: 1000px ; height: 550px;">

    <div class="text-center">
        <h1 class="mt-2">Panel Turno</h1>
    </div>

    <div>
        <h3>Medico</h3>
        Nombre: {$turno->nombre_medico}
        Especialidad: {$turno->especialidad}

        {if isset($turno->nombre_paciente)}
            <h3>Paciente</h3>
            Nombre: {$turno->nombre_paciente}
            Apellido: {$turno->apellido}
            Telefono: {$turno->telefono}
            DNI: {$turno->dni_paciente}
        {else}
            <h3 class=text-success>No tiene paciente</h3>
        {/if}
        <h4>Fecha del turno: {$turno->fecha}</h4>
        {if isset($turno->nombre_paciente)}
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#cancelarturno">
                Dar de baja paciente
            </button>
        {/if}
        <br>
        {if ($turno->disponible == 1)}
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#bloquearturno">
                Bloquear Turno
            </button>
        {else}
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#desbloquearturno">
                Desbloquear Turno
            </button>
        {/if}
    </div>
    <div>
        <a href="{$url}administrarturnos">Volvera la pagina anterior</a>

    </div>
</div>
{include 'templates/footer.tpl'}