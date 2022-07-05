{include file="header.tpl"}

<div class="container-sm border border-5border border-secondary mt-5 rounded d-flex justify-content-around align-items-center"
    style="width: 850px ; height: 500px;">

        <ul class="list-group">
            <li class="list-group-item"><img src="imagenes\holas.png" class="img-fluid" alt="">
            </li>
            <li class="list-group-item">{$medico->nombre_medico}</li>
            <li class="list-group-item">{$medico->especialidad}</li>
            <li class="list-group-item">{$medico->nombre_secretaria}</li>

        </ul>
    
</div>
<div class="container-sm border border-5border border-secondary mt-5 rounded d-flex justify-content-around align-items-center"
    style="width: 850px ; height: 500px;">

   
    <form action="{$url}modificarmedico" method="POST">

    <input type="text" name="inputNombreMedico" class="shadow p-1  mx-1 my-1 bg-white rounded" value="{$medico->nombre_medico}">
    
    <input type="text" name="inputEspecialidadMedico" class="shadow p-1  mx-1 my-1 bg-white rounded" value="{$medico->especialidad}">

    <input type="text" name="inputSecretariaMedico" class="shadow p-1  mx-1 my-1 bg-white rounded" value="{$medico->id_secretaria}">

    <input type="hidden" name="inputIdMedico" value="{$medico->id_medico}">

    <button type="submit"> MODIFICAR </button>

</form>
</div>

{include file="footer.tpl"}