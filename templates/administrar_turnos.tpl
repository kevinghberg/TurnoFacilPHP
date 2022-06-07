{include 'templates/header.tpl'}

<div class="container d-flex justify-content-center mt-5">
    <a href=""> <img src="imagenes\bea8c8bfd99232680106da7d20a8731c.png" class="img-fluid" alt="Responsive image"> </a>
</div>

<div class="container-sm border border-secondary mt-5 rounded" style="width: 1000px ; height: 350px;">


    <div class="text-center">
        <h1 class="mt-3">Administrar turno</h1>
    </div>

    <div>
        <h3>Medico</h3>
        Nombre: {$turno->nombre_medico}
        Especialidad: {$turno->especialidad}

        {if isset($turno->nombre)}
            <h3>Paciente</h3>
            Nombre: {$turno->nombre}
            Apellido: {$turno->apellido}
            Telefono: {$turno->telefono}
            DNI: {$turno->dni_paciente}
        {else}
            <h3 class=text-success>No tiene paciente</h3>
        {/if}
        <h4>Fecha del turno: {$turno->fecha}</h4>
        {if isset($turno->nombre)}
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#cancelarturno">
                Cancelar Turno
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
        <a href="{$base_url}/listarmedicos?id_medico={$turno->id_medico}">Volvera la pagina anterior</a>

        <!-- Modal -->
        <div class="modal fade" id="cancelarturno" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">CANCELANDO TURNO</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <h1>Enviar Mail</h1>
                            <form target="_blank" action="https://formsubmit.co/gustavodavid04@gmail.com" method="POST">
                                <div class="form-group">
                                    <div class="form-row">
                                        <div class="col">
                                            <input type="text" name="name" class="form-control" value="{$turno->nombre} {$turno->apellido}"
                                                required>
                                        </div>
                                        <div class="col">
                                            <input type="email" name="email" class="form-control"
                                                value="maildelpaciente@ejemplo.com" placeholder="Email Address" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <textarea placeholder="Se cancelará el turno de la fecha {$turno->fecha} con el doctor {$turno->nombre_medico}" class="form-control" name="message" rows="10"
                                        required>Se cancelará el turno de la fecha {$turno->fecha} con el doctor {$turno->nombre_medico}</textarea>
                                </div>
                                <button type="submit" class="btn btn-lg btn-dark btn-block">Avisar al paciente</button>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CERRAR</button>
                        <form action="cancelarturno" method="POST">
                            <input type="hidden" id="id_turno" name="id_turno" value="{$turno->id_turno}">
                            <button type="submit" value="{$turno->id_turno}">CANCELAR{$turno->id_turno}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="bloquearturno" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">BLOQUEANDO TURNO</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        ¿Está seguro?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CERRAR</button>
                        <form action="bloquearturno" method="POST">
                            <input type="hidden" id="id_turno" name="id_turno" value="{$turno->id_turno}">
                            <button type="submit" name="id_turno"
                                value="{$turno->id_turno}">BLOQUEAR{$turno->id_turno}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="desbloquearturno" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">DESBLOQUEANDO TURNO</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        ¿Está seguro?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CERRAR</button>
                        <form action="desbloquearturno" method="POST">
                            <input type="hidden" id="id_turno" name="id_turno" value="{$turno->id_turno}">
                            <button type="submit" value="{$turno->id_turno}">DESBLOQUEAR{$turno->id_turno}</button>
                        </form>
                    </div>
                </div>
            </div>
</div>