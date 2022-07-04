{include 'templates/header.tpl'}

<div class="container-sm border border-secondary mt-3 rounded" style="width: 1000px ; height: 550px;">

    <div class="text-center">
        <h1 class="mt-2">Cronograma</h1>
    </div>

    <div class=" d-flex justify-content-center">
        <table class="table text-center mt-5" style="width: 700px;" id="tablacronograma">
            <thead>
                <tr class="color">
                    <th class="text-white" scope="col">Fecha</th>
                    <th class="text-white" scope="col">Paciente</th>
                    <th class="text-white" scope="col">Administrar</th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$turnos item=turno}
                    <tr>
                        <td>{$turno->fecha}</td>
                        <td>
                            {if ($turno->nombre_paciente)}
                                {$turno->nombre_paciente} {$turno->apellido}
                            </td>
                        {else}
                            <p class="text-danger">No tiene paciente</p>
                            </td>
                        {/if}
                        <td>
                            <a class="btn btn-warning" href="#">ADMINISTRAR</a>
                        </td>
                    </tr>
                {/foreach}
            </tbody>
        </table>

    </div>
    <div class="d-flex justify-content-center col-12 mt-3">
        <a class="btn btn-success color p-2 m-1" href="portalmedico" role="button">Volver atrás</a>
        <input type="button" id="botonexportar" value="Descargar como PDF" onclick="Export()"/ class="btn btn-success color p-2 m-1">
    </div>
</div>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js">
</script>
<script type="text/javascript">
    function Export() {
        html2canvas(document.getElementById('tablacronograma'), {
            onrendered: function(canvas) {
                var data = canvas.toDataURL();
                var docDefinition = {
                    content: [{
                        image: data,
                        width: 500
                    }]
                };
                pdfMake.createPdf(docDefinition).download("Cronograma.pdf");
            }
        });
    }
</script>


{include file="footer.tpl"}