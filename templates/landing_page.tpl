{include file="header.tpl"}
<div class="container-sm border border-border border-secondary mt-5 rounded d-flex justify-content-around align-items-center"
    style="width: 850px ; height: 450px;">

    <div class="w-45 p-5 h-55 border border-success mt-5 rounded text-center mb-5 ">
   
        <div class="img-ingreso">
            <img src="imagenes/holas.png" class="img-top" alt="...">
        </div>
    
        <form action="logear" method="POST">
    
    
            <input type="text" class="form-control " placeholder="Ingrese su dni" name="dniPaciente" value="">
    
    
            <input class="mt-3 p-2 btns btn btn-primary" type="submit" value="INGRESAR">
    
            <a>{$mensaje}</a>
        </form>
        <a href="loginpersonal" class="btn btn-secondary btn-sm mt-3" >Soy Secretaria/Medico</a>
    </div>
    
    </div>
    
    {include file="footer.tpl"}