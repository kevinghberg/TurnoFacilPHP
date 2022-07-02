{include file="header.tpl"}

<div class="container-sm border border-5border border-secondary mt-5 rounded d-flex justify-content-around align-items-center"
    style="width: 850px ; height: 500px;">



    <div class="w-25 p-5 border border-secondary mt-5 rounded text-center mb-5 bg-success">

        <form action="logearsecretaria" method="POST">
            <a class="link-light">SECRETARIA</a>
            <input type="text" class="form-control" name="username" id="username">
            <input type="password" class="form-control" name="password" id="password">
            <button type="submit">Ingresar</button>
        </form>

    </div>

    <div class="w-25 p-5 border border-secondary mt-5 rounded text-center mb-5 bg-success">

        <form action="logearmedico" method="POST">
            <a class="link-light">MEDICO</a>
            <input type="text" class="form-control" name="username" id="username">
            <input type="password" class="form-control" name="password" id="password">
            <button type="submit">Ingresar</button>
        </form>

    </div>

</div>

{include file="footer.tpl"}