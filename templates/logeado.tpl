
{include file="header.tpl"}

<section>
        <table>
            
            <tbody  >
                {foreach from=$turnos item=turno}
                    
                <tr>
                 
                
                  <td>{$turno->usuario}</td>
                  <td>{$turno->fecha}</td>

                  
             
                </tr>


                {/foreach}
            </tbody>
        </table>
    </section>


