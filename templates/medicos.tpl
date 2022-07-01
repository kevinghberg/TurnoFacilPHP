{include file="header.tpl"}
<div class="container d-flex justify-content-center">
    <a href=""> <img src="imagenes\bea8c8bfd99232680106da7d20a8731c.png" class="img-fluid" alt="Responsive image">
    </a>
</div>

<div class="row justify-content-center  caja_portal">
    <div class="card text-center col-6 caja">

        <div class="card-body">
            <div class="row justify-content-center">
                <h5 class="titulo_sacar_turno">Sacar Turno</h5>
            </div>

            <div class="row">
                <div class="col-6">
                    <!-- Filtro para medicxs por obra social -->
                    <form method="POST" action="filtrarObraSocial" class="me-3">
                        <div class="row">
                            <div class="col-10">
                                <div class="form-floating">
                                    <select name="obra" class="form-select" id="floatingSelect"
                                        aria-label="Floating label select example">
                                        <option value="todas" selected>Todas</option>
                                        {foreach from=$obras item=obra}
                                            <option value="{$obra->id_obra_social}">{$obra->nombre_largo}</option>
                                        {/foreach}
                                    </select>
                                    <label for="floatingSelect">Filtrar por obra social</label>
                                </div>
                            </div>
                            <div class="col-2 boton">
                                <button type="submit" class="btn btn-success "><i class="fas fa-search"></i></button>
                            </div>
                        </div>
                    </form>

                </div>

                <div class="col-6">
                    <!-- Filtro para medicxs por especialidad -->
                    <form method="POST" action="filtrarEspecialidad" class="ms-3">
                        <div class="row">
                            <div class="col-10">
                                <div class="form-floating">
                                    <select name="especialidad" class="form-select" id="floatingSelect"
                                        aria-label="Floating label select example">
                                        <option value="todas" selected>Todas</option>
                                        {foreach from=$especialidades item=especialidad}
                                            <option value="{$especialidad->especialidad}">{$especialidad->especialidad}
                                            </option>
                                        {/foreach}
                                    </select>
                                    <label for="floatingSelect">Filtrar por Especialidad</label>
                                </div>
                            </div>
                            <div class="col-2 boton">
                                <button type="submit" class="btn btn-primary "><i class="fas fa-search"></i></button>
                            </div>
                        </div>
                    </form>

                </div>

                <div>


                </div>
            </div>

            <!-- Lista de medicxs -->
            <div class="row">
                {foreach from=$medicos item=medico}

                    <div class="col-4 mt-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="img-caja">
                                    <img src="imagenes/holas.png" class="img-top" alt="...">
                                </div>
                                <h5 class="card-title">{$medico->nombre_medico}</h5>
                                <a href="mostrarTurnos/{$medico->id}_medico" class="btn btn-primary">Ver turnos
                                    disponibles</a>
                            </div>
                        </div>

                    </div>
                {/foreach}

            </div>
        </div>
    </div>
</div>
{include file="footer.tpl"}