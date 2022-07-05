{include 'templates/header.tpl'}

{foreach from=$medicos item=medico}

    <a>{$medico->nombre_medico}</a>
    <a href="infomedico//{$medico->$id_medico}"
{/foreach}

{include 'templates/footer.tpl'}