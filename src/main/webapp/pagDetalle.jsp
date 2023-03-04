<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="includes/header.jsp">
            <jsp:param name="header" value="" />
        </jsp:include>
         <%
          HttpSession ses = request.getSession();              
           //recuperar la lista que el servlet envia        
          Articulo ar=(Articulo)request.getAttribute("dato");
         %>   
         
         <form name="fr" class="row" action="tienda">
             <input type="hidden" name="opc" value="3">
             <input type="hidden" name="codigo" value="<%=ar.getCoda()%>">
             <div class="col-6"><center><img src="images/<%=ar.getImagen()%>" height="500px"></center></div>
             <div class="col-6">
                 <p class="detalle-title pt-4"><%=ar.getNomart()%></p>
                 <P class="detalle-precio">S/.<%=ar.getPrecio()%></P>
                 <strong><p>Tallas:</p></strong>
                 
                 
              
                <div class="boxtalla">

                    <input type="radio" name="talla" value="S" id="tallas" checked>
                    <label class="labeltalla activo" for="tallas">S</label>

                    <input type="radio" name="talla" value="M" id="tallam">
                    <label class="labeltalla" for="tallam">M</label>

                    <input type="radio" name="talla" value="L" id="tallal">
                    <label class="labeltalla" for="tallal">L</label>   

                    <input type="radio" name="talla" value="XL" id="tallaxl">
                    <label class="labeltalla" for="tallaxl">XL</label>   
                </div>
                  
                 
                 
                 <br>
                 <p>Cantidad:&nbsp;&nbsp;&nbsp; <input type="number"name="cantidad" min="1" value="1"></p>
                 <button type="submit" class="btn btn-secondary my-3">                   
                     Añadir al carrito&nbsp;&nbsp;&nbsp;<span class="material-symbols-outlined">shopping_cart</span>
                 </button>
                 <p>Caracteristicas:</p>
                 <p>Polo manga larga color negro para hombre.</p>
             </div>
         </form>
       
       
       
         <jsp:include page="includes/footer.jsp">
            <jsp:param name="header" value="" />
        </jsp:include>
        
    </body>
</html>
