<%@page import="beans.*,java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <link rel="stylesheet" href="css/estilos.css"/>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/d6591ff8db.js" crossorigin="anonymous"></script>   
        <link href='https://fonts.googleapis.com/css?family=Rubik' rel='stylesheet'>
        <link rel="stylesheet" href="css/headFoot.css"/>
        <title>JSP Page</title>
        
    </head>
    <body>
        <%
            HttpSession ses=request.getSession();         
            
           //recuperar la lista que el servlet envia
           Cliente cli=(Cliente)ses.getAttribute("cliente");                 
         %>   
        <header>                        
            <div class="nav-title">
                <a href="index.jsp">Inicio</a>
                <a href="pagCategoria.jsp">Categorias</a>
                <a href="url">Contacto</a>
                <a href="index.jsp"><img src="images/logo.PNG" height="60px"/></a>  
                <form action="tienda" style="margin-bottom: 0">
                    <input type="hidden" name="opc" value="13">                
                    <input name="search" type="text" id="search" placeholder="¿Qué quieres buscar?" />
                </form>                  
             
                <%
                    if (ses.getAttribute("cliente") == null) {
                %>    
                <a href="Login.jsp"><img src="icons/account.png" height="25"/></a>
                <%
                    }else{
                %>
                <a>
                    <div class="dropdown">
                        <a style="width: 40px" type="button" class="btn btn-login" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside" >
                            <img src="icons/account.png" height="25"/>
                        </a>                             
                        <form name="fr" class="text-center dropdown-menu p-3">
                            <input type="hidden" name="opc" value="7">
                            <p>Bienvenido</p>
                            <p><img src="icons/account.png" height="25"/>&nbsp;&nbsp;<%=cli.getNom()%></p>
                            <button type="button" class="btn btn-primary" onclick="SesionOFF()">Cerrar Sesion</button>
                        </form>
                    </div>
                </a>
                 <%}%>           
                            
                <a href="pagCompra.jsp"><img src="icons/shopping.png" height="25"/></a>
                
            </div>
           
           
            
        </header>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js">
            
        </script>
        <script>           
            function SesionOFF(){       
               fr.action="tienda";
               fr.submit();//
            }
        </script>   
            
    </body>
</html>
