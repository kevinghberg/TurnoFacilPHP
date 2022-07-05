{include file="header.tpl"}

<div class="container-sm border border-5border border-secondary mt-5 rounded d-flex justify-content-around align-items-center"
    style="width: 850px ; height: 500px;">

   
    {foreach from=$medico item=m}

        <ul class="list-group">
            <li class="list-group-item"><img src="imagenes\lucas.png" class="img-fluid" alt="Responsive image">
            </li>
            <li class="list-group-item">{$nombre_medico}</li>
            <li class="list-group-item">{$id_medico}</li>
            <li class="list-group-item">{$especialidad}</li>
            <li class="list-group-item">{$id_secretaria}</li>

        </ul>
    {/foreach}
    
</div>
<div class="container-sm border border-5border border-secondary mt-5 rounded d-flex justify-content-around align-items-center"
    style="width: 850px ; height: 500px;">

   
    <form action="modificarmedico" method="POST">

    <input type="text" name="inputNombreMedico" class="shadow p-1  mx-1 my-1 bg-white rounded">
    
    <input type="text" name="inputEspecialidadMedico" class="shadow p-1  mx-1 my-1 bg-white rounded">

    <input type="text" name="inputSecretariaMedico" class="shadow p-1  mx-1 my-1 bg-white rounded">

   

    <button type="submit"> MODIFICAR </button>



</form>
    
</div>

{include file="footer.tpl"}