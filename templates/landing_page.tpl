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

{include file="footer.tpl"}