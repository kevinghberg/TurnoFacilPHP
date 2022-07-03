{include file="header.tpl"}

<div class="container-sm border border-5border border-secondary mt-5 rounded d-flex justify-content-around align-items-center"
    style="width: 950px ; height: 500px;">



    <div class="w-30 p-4 border border-secondary mt-5 rounded text-center mb-5">
        <h5 class="card-title">Secretaria</h5>
        <div class="img-ingreso">
            <img src="imagenes/holas.png" class="img-top" alt="...">
        </div>

        <form action="logearsecretaria" method="POST">
            <div class="input-group mb-2">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">Usuario</span>
                </div>
                <input type="text" class="form-control" name="username" id="username">
            </div>
            <div class="input-group mb-2">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">Contraseña</span>
                </div>
                <input type="password" class="form-control" name="password" id="password">

            </div>
            <button type="submit" class="mt-2 btns btn btn-primary">Ingresar</button>
        </form>

    </div>

    <div class="w-30 p-4 border border-secondary mt-5 rounded text-center mb-5 ">
        <h5 class="card-title">Medico</h5>
        <div class="img-ingreso">
            <img src="imagenes/holas.png" class="img-top" alt="...">
        </div>
        <form action="logearmedico" method="POST">
            <div class="input-group mb-2">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">Usuario</span>
                </div>
                <input type="text" class="form-control" name="username" id="username">
            </div>
            <div class="input-group mb-2">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">Contraseña</span>
                    </div>
                    <input type="password" class="form-control" name="password" id="password">
            </div>
            <button type="submit" class="mt-2 btns btn btn-primary">Ingresar</button>
        </form>

    </div>

</div>

{include file="footer.tpl"}