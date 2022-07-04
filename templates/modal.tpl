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
                                    <input type="text" name="name" class="form-control"
                                        value="{$turno->nombre} {$turno->apellido}" required>
                                </div>
                                <div class="col">
                                    <input type="email" name="email" class="form-control"
                                        value="maildelpaciente@ejemplo.com" placeholder="Email Address" required>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <textarea
                                placeholder="Se cancelará el turno de la fecha {$turno->fecha} con el doctor {$turno->nombre_medico}"
                                class="form-control" name="message" rows="10"
                                required>Se dará de baja al paciente {$turno->nombre} {$turno->apellido} de la fecha {$turno->fecha} con el doctor {$turno->nombre_medico}</textarea>
                        </div>
                        <button type="submit" class="btn btn-lg btn-dark btn-block">Avisar al paciente</button>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CERRAR</button>
                <form action="{$url}bajapaciente" method="POST">
                    <input type="hidden" id="id_turno" name="id_turno" value="{$turno->id_turno}">
                    <button type="submit" value="{$turno->id_turno}">CANCELAR</button>
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
                <form action="{$url}bloquearturno" method="POST">
                    <input type="hidden" id="id_turno" name="id_turno" value="{$turno->id_turno}">
                    <button type="submit" name="id_turno" value="{$turno->id_turno}">BLOQUEAR</button>
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
                <form action="{$url}desbloquearturno" method="POST">
                    <input type="hidden" id="id_turno" name="id_turno" value="{$turno->id_turno}">
                    <button type="submit" value="{$turno->id_turno}">DESBLOQUEAR</button>
                </form>
            </div>
        </div>
    </div>
</div>