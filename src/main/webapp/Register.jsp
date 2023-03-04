
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/estiloLogin.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrarse</title>
    </head>
    <body class="login register">
        <form name="fr" action="tienda">
            <input type="hidden" name="opc" value="8">  
            <p class="titlelogin">Registrarse</p>
            <p class="logintext">Nombre</p>
            <input type="text" name="name" required>
            <p class="logintext">Apellido</p>
            <input type="text" name="apellido" required>
            <p class="logintext">Fecha de Nacimiento</p>
            <input type="date" name="fechnac" required>  
            <p class="logintext">Correo Electronico</p>
            <input type="text" name="email" required>   
            <p class="logintext">DNI</p>
            <input type="text" name="dni" required>            
            <p class="logintext">Contraseña</p>
            <input type="pass" name="clave" required> 
            <button type="submit">REGISTRARSE</button><br></br>
            
            <hr>
            
            <div class="logintext2">            
                <a href="index.jsp">Home</a>
            </div>
        </form>
       
    </body>
</html>
