<%@page import="beans.*,java.util.*" %>
<%@page import = "dao.Negocio"%>

<%@page import="dao.Negocio" %>
<html>
    <head>
        <!-- CSS only -->
        <title>Fashion Shop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link href='https://css.gg/info.css' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    </head>
    <jsp:include page="includes/header.jsp">
        <jsp:param name="header" value="" />
    </jsp:include>
    <body>           
         <div class="contenedor">
            <section class="cartel">
                <div class="gallery__img"></div>
                <div class="gallery__img"></div>
                <div class="gallery__img"></div>
                <div class="gallery__img"></div>                  
            </section> 
            <div id="progress-bar">  
                <div id="fill"></div>
            </div>
         </div>                   
        <h1 class="text-center pt-3">Novedades</h1>
   
        <div class="container">
            <%
                Negocio obj = new Negocio();
                for (Articulo x : obj.lisCatNov()) {
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
            <%}%> 
        </div>
        
        <jsp:include page="includes/footer.jsp">
            <jsp:param name="header" value="" />
        </jsp:include>
        
        
    </body>
    <script src="js/app.js"></script>
</html>