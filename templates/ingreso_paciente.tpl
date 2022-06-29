{include file="header.tpl"}




<form action="verificarDNI" method="POST">
                DNI
                <input type="text" class="form-control " name="dniPaciente">


                <input type="submit" value="INGRESAR">
             
                 <a>{$mensaje}</a>
            </form>


<form action="login" method="POST">
<button type="submit" value="login"> Soy Secretaria o medico </button> 
 </form>