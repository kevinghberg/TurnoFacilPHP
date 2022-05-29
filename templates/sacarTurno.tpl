{include file="header.tpl"}

<div class="row justify-content-center caja_portal">
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
                                    <select name="pais" class="form-select" id="floatingSelect"
                                        aria-label="Floating label select example">
                                        <option value="todos" selected>Todxs</option>
                                        {foreach from=$obrasocial item=obra}
                                            <option value="{$obra->nombre}">{$obra->nombre}</option>
                                        {/foreach}
                                    </select>
                                    <label for="floatingSelect">Filtrar por obra social</label>
                                </div>
                            </div>
                            <div class="col-2 boton">
                                <button type="submit" class="btn btn-primary "><i
                                        class="fas fa-search"></i></button>
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
                                    <select name="pais" class="form-select" id="floatingSelect"
                                        aria-label="Floating label select example">
                                        <option value="todos" selected>Todxs</option>
                                        {foreach from=$especialidades item=especialidad}
                                            <option value="{$especialidad->nombre}">{$especialidad->nombre}</option>
                                        {/foreach}
                                    </select>
                                    <label for="floatingSelect">Filtrar por Especialidad</label>
                                </div>
                            </div>
                            <div class="col-2 boton">
                                <button type="submit" class="btn btn-primary"><i
                                        class="fas fa-search"></i></button>
                            </div>
                        </div>
                    </form>

                </div>

                <div>


                </div>
            </div>
            <div class="row mt-5">
            <div class="col-sm-6">
              <div class="card">
                <div class="card-body">
                <div class="img-caja">
                <img src="imagenes/holas.png" class="img-top" alt="...">
                </div>
                  <h5 class="card-title">Nombre medicx</h5>
                 <a href="#" class="btn btn-primary">Ver turnos disponibles</a>
                </div>
              </div>
            </div>
            <div class="col-sm-6">
            <div class="card">
              <div class="card-body">
              <div class="img-caja">
              <img src="imagenes/holas.png" class="img-top" alt="...">
              </div>
                <h5 class="card-title">NOmbre medicx</h5>
               <a href="#" class="btn btn-primary">Ver turnos disponibles</a>
              </div>
            </div>
          </div>
       

        </div>
    </div>
</div>
</div>
{include file="footer.tpl"}