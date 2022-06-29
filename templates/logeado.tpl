
{include file="header.tpl"}

<section>
        <table>   
            <tbody  >
                  <table class="table text-center mt-5 " style="width: 700px;">
              <thead>
                <tr>
                  <th class="bg-success text-white" scope="col">Medico</th>
                  <th class="bg-success text-white" scope="col">fecha</th>
                  <th class="bg-success text-white" scope="col">paciente</th>
                
               
                </tr>
              </thead> 
                {foreach from=$turnos item=turno}           
                <tr>
                  <td>{$turno->usuario}</td>
                  <td>{$turno->fecha}</td>
                  <td>{$turno->id_paciente}</td>
                </tr>
                {/foreach}
            </tbody>
        </table>
    </section>


