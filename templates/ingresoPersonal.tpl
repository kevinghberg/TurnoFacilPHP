{include file="header.tpl"}


<div class="container d-flex justify-content-center">
    <a href=""> <img src="imagenes\bea8c8bfd99232680106da7d20a8731c.png" class="img-fluid" alt="Responsive image">
    </a>
</div>

<div class="container-sm border border-5border border-secondary mt-5 rounded d-flex justify-content-around align-items-center"
    style="width: 850px ; height: 500px;">



    <div class="w-25 p-5 border border-secondary mt-5 rounded text-center mb-5 bg-success">

        <form action="logearSecretaria" method="POST">
        <a class="link-light">SECRETARIA</a>

            <input type="text" class="form-control" name="dniMedico" value="Usuario">
            <input type="text" class="form-control" name="dniMedico" value="Contraseña">

            <input type="submit" value="INGRESAR">

        </form>

    </div>

    <div class="w-25 p-5 border border-secondary mt-5 rounded text-center mb-5 bg-success">

        <form action="logearMedico" method="POST">
        <a class="link-light">MEDICO</a>
            <input type="text" class="form-control" name="dniMedico" value="Usuario">
            <input type="text" class="form-control" name="dniMedico" value="Contraseña">

            <input type="submit" value="INGRESAR">

        </form>

    </div>




</div>