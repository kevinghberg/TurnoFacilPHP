{include file="header.tpl"}
<div class="container-sm border border-5border border-secondary mt-5 rounded d-flex  align-items-center p-5"
style="width: 850px ; height: 500px;">

    

        <ul class="list-group">

        <li class="list-group-item"><img src="..\imagenes\holas.png" class="img-fluid" alt="Responsive image">
        </li>
            <li class="list-group-item text-center">{$medico->nombre_medico}</li>
            <li class="list-group-item text-center">{$medico->especialidad}</li>
            <li class="list-group-item text-center">{$medico->nombre_secretaria}</li>

        </ul>

    
    <div class="d-flex justify-content-end align-items-center " style="width: 850px ; height: 500px;">


        <form action="{$url}modificarmedico" method="POST">

            <li class="list-group-item">
                <input type="text" name="inputNombreMedico" class="shadow p-1  mx-1 my-1 bg-white rounded"
                    value="">
            </li>
            <li class="list-group-item">
                <input type="text" name="inputEspecialidadMedico" class="shadow p-1  mx-1 my-1 bg-white rounded"
                    value="">
            </li>
            <li class="list-group-item">
                <input type="text" name="inputSecretariaMedico" class="shadow p-1  mx-1 my-1 bg-white rounded"
                    value=" ">
            </li>
            <li class="list-group-item">
                <input type="hidden" name="inputIdMedico" value="{$medico->id_medico}">
            </li>
            <li class="list-group-item d-flex justify-content-center">
                <button type="submit" class="btns"> MODIFICAR </button>
            </li>

        </form>

    </div>
</div>
{include file="footer.tpl"}