{include file="header.tpl"}


<div class="container-sm border border-secondary mt-5 rounded  " style="width: 1000px ; height: 600px;">

    <!-- Filtro turnos -->

    <div class="d-flex justify-content-center">



    </div>


    <!-- Filtro turnos -->
    <div class=" d-flex justify-content-center">
        <table class="table text-center mt-5 " style="width: 700px;">
            <thead>

                <tr>
                    <th class="bg-success text-white" scope="col">FECHA</th>
                    <th class="bg-success text-white" scope="col">MEDICO</th>
                    <th class="bg-success text-white" scope="col">ESPECIALIDAD</th>
                    <th class="bg-success text-white" scope="col"></th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$turnosPaciente item=turnoP}

                    <tr>

                        <td> {$turnoP->fecha} </td>
                        <td> {$turnoP->nombre_medico} </td>
                        <td> {$turnoP->especialidad} </td>
                        <td>

                            <button>
                                <a href="{BASE_URL}cancelarturno/{$turnoP->id_turno}"> Cancelar </a>
                            </button>

                        </td>


                    </tr>
                {{/foreach}}
            </tbody>
        </table>
    </div>
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