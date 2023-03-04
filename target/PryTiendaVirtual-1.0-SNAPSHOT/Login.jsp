<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/estiloLogin.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body class="login">      
        <%
          
          String mensaje="";
          if (request.getAttribute("dato")!=null) {
                  mensaje=(String) request.getAttribute("dato");
              }
         %>   
                  
         <form name="fr" method="post" action="tienda">
            <input type="hidden" name="opc" value="5">
            <p class="titlelogin">Iniciar Sesion</p>
            <p class="logintext">Correo Electronico</p>
            <input type="text" name="user" required>
            <p class="logintext">Contraseña</p>
            <input type="password" name="clave" required>    
            <button type="submit" name="action" value="Ingresar">INGRESAR</button><br></br>
            <div class="logintext2"><%=mensaje%></div>
            
            <hr>
           
            <div class="logintext2">
                <p>
                    No tienes cuenta?&nbsp;
                    <a style="color: black" href="Register.jsp">Registrate</a>
                </p>                                                 
                <a href="index.jsp">Home</a>
            </div>
        </form>
                    
    
    </body>
</html>
