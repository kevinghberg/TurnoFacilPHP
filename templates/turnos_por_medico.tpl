{include 'templates/header.tpl'}

<div class="container d-flex justify-content-center mt-5">
<a href=""> <img src="imagenes\bea8c8bfd99232680106da7d20a8731c.png" class="img-fluid" alt="Responsive image"> </a>
</div>

<div class="container-sm border border-secondary mt-5 rounded" style="width: 1000px ; height: 350px;">

    <div class="text-center">
        <h1 class="mt-3">Turnos Disponibles</h1>
    </div>

    <form action="listarmedicos" method="GET">
        <label for="id_medico">ID del medico</label>
        <input type="text" name="id_medico" id="medico">
        <button type="submit">Buscar</button>
    </form>

    <form action="listarmedicos" method="GET">
        <label for="cars">Seleccione el medico</label>
        <select name="id_medico" id="id_medico">
            {foreach from=$listamedicos item=medico}
                <option value="{$medico->id_medico}">{$medico->nombre_medico}</option>
            {/foreach}
        </select>
        <button type="submit">Buscar</button>
</form>