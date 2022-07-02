{include file="header.tpl"}
<form action="registrarPaciente" method="POST">

    DNI
    <input type="text" class="form-control " name="dniPaciente">
    Nombre
    <input type="text" class="form-control " name="nombrePaciente">
    Apellido
    <input type="text" class="form-control " name="apellidoPaciente">
    Password
    <input type="text" class="form-control " name="passwordPaciente">
    Direccion
    <input type="text" class="form-control " name="direccionPaciente">
    Numero de Afiliado
    <input type="text" class="form-control " name="numeroAfiliadoPaciente">
    Telefono
    <input type="text" class="form-control " name="telefonoPaciente">
    Obra Social
    <input type="text" class="form-control " name="obraSocialPaciente">


    <input type="submit" value="REGISTRAR">

</form>

{include file="footer.tpl"}