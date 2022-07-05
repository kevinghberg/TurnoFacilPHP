{include 'templates/header.tpl'}

{foreach from=$medicos item=medico}
    <a>{$medico->nombre_medico}</a>
    <a href="{$medico->$id_secretaria}">LINK</a>
{/foreach}

{include 'templates/footer.tpl'}