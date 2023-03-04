
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.gstatic.com">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina Articulo</title>
    </head>
    <body>
        <jsp:include page="includes/header.jsp">
            <jsp:param name="header" value=""/>
        </jsp:include>
        
        <%
           //recuperar la lista que el servlet envia
           List<Articulo> lista=(ArrayList<Articulo>)request.getAttribute("dato");
         %>   
         
           <div class="container">
                <% 
                    for(Articulo x:lista){  
                    String m=x.getCodaCat();
                %>
                <div class="new-products" >
                    <img class="size-img" src="images/<%=x.getImagen()%>">             
                    <div class="material-icons">
                        <a><span class="material-symbols-outlined">search</span></a>
                        <a href="tienda?opc=2&id=<%=x.getCoda()%>"><span class="material-symbols-outlined">local_mall</span></a>
                        <a><span class="material-symbols-outlined">favorite</span></a>
                    </div>
                    <div class="text-center">                   
                        <p><%=x.getNomart()%><br>S/<%=x.getPrecio()%></p>                  
                    </div> 
                       
                </div>                         
            <%
               }
            %> 
           </div>
         <jsp:include page="includes/footer.jsp">
            <jsp:param name="footer" value="" />
        </jsp:include>
    </body>
</html>
