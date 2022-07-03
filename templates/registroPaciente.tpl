{include file="header.tpl"}
<div class="container-sm border border-5border border-secondary mt-2 rounded d-flex justify-content-around align-items-center"
    style="width: 950px ; height: 550px;">
    <div class="w-30 p-4 border border-secondary mt-5 rounded text-center mb-5">
    <h5 class="card-title">Registrarse</h5>
    <form action="registrarPaciente" method="POST" class="mt-3">

        <div class="input-group mb-2">
            <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1">DNI</span>
            </div>
            <input type="text" class="form-control " name="dniPaciente">
        </div>
        <div class="input-group mb-2">
            <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1">Nombre</span>
            </div>
            <input type="text" class="form-control " name="nombrePaciente">
        </div>

        <div class="input-group mb-2">
            <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1">Apellido</span>
            </div>
            <input type="text" class="form-control " name="apellidoPaciente">
        </div>
        <div class="input-group mb-2">
            <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1">Contraseña</span>
            </div>
            <input type="text" class="form-control " name="passwordPaciente">
        </div>

        <div class="input-group mb-2">
            <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1">Direccion</span>
            </div>
            <input type="text" class="form-control " name="direccionPaciente">
        </div>
        <div class="input-group mb-2">
            <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1">N° Afiliado</span>
            </div>
            <input type="text" class="form-control " name="numeroAfiliadoPaciente">
        </div>

        <div class="input-group mb-2">
            <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1">Telefono</span>
            </div>
            <input type="text" class="form-control " name="telefonoPaciente">
        </div>
            <div class="form-floating">
            <select name="obraSocialPaciente" class="form-select" id="obra"
                aria-label="Floating label select example">
                {foreach from=$obras item=obra}
                    <option value="{$obra->id_obra_social}">{$obra->nombre_largo}</option>
                {/foreach}
            </select>
            <label for="obra">Obra social</label>
        </div>
            <input type="submit" value="REGISTRAR" class="btns btn btn-primary mt-2">

    </form>

    </div>
</div>

{include file="footer.tpl"}