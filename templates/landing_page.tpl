{include file="header.tpl"}

<div class="container-sm border border-5border border-secondary mt-5 rounded d-flex justify-content-around align-items-center"
    style="width: 850px ; height: 500px;">


    <div class="w-25 p-5 h-35 border border-secondary mt-5 rounded text-center mb-5 bg-success">

        <form action="logear" method="POST">


            <input type="text" class="form-control" name="dniPaciente" value="">


            <input type="submit" value="INGRESAR">

            <a>{$mensaje}</a>
        </form>

    </div>


    <div class="w-25 p-5 h-35 border border-secondary mt-5 rounded text-center  mb-5 bg-success">

        <form action="loginpersonal">

            <button type="submit" value="logear">Soy Secretaria Medico </button>

        </form>

    </div>

</div>

<footer class="bg-success text-center text-white position-absolute bottom-0" style="width:100%;">
    <P>ACA EL FOOTER CON LOS ICONOS DE SOCIALMEDIA</P>
</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous">
</script>
</body>

</html>