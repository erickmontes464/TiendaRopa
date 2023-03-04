<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>      
        <link rel="stylesheet" href="css/estilocarrito.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <jsp:include page="includes/header.jsp">
        <jsp:param name="header" value="" />
    </jsp:include>
    <body>
        
        <%
            HttpSession ses=request.getSession();         
           
           //recuperar la lista que el servlet envia
           Cliente cli=(Cliente)ses.getAttribute("cliente");
           
          List<Compra> lista=(ArrayList<Compra>)ses.getAttribute("canasta");
         %>   
         
         <div class="m-4">
             <h2>Carrito de compra:</h2>                    
                 <%
                   if (lista != null) {
                   %>
                   <div class="row mt-5">
                    <div class="col-8">
                   <%
                     
                        int indice = 0;
                        Double precFinal=0.0;
                        for (Compra x : lista) {
                        precFinal=x.total()+precFinal;
                %>
                     <div class="d-flex justify-content-around mb-4 border border-secondary rounded">
                         <img src="images/<%=x.getImagen()%>" width="120" height="height"/>
                         <div class="mt-3">
                             <h5><%=x.getNomart()%></h5>
                             <p>Talla:<%=x.getTalla()%></p>
                             <p>S/<%=x.getPrecio()%></p>
                             <p>Monto Total:&nbsp;&nbsp;<%=x.total()%></p>
                         </div>
                         <h5 class="my-auto"><%=x.getCantidad()%> Unidad</h5>
                      
                         <a class="btn btn-dark my-auto" href="tienda?opc=4&fila=<%=indice%>">Eliminar</a>
                         
                     </div>
                     <%}%>
                     
                    </div>
                    <div class="col-3">
                        <h4>Resumen</h4><hr>                      
                        <strong><p>Ingresa Cupon</p></strong><hr>
                        <div class="d-flex justify-content-lg-between">
                            <p>Subtotal</p>
                            <p>S/<%=precFinal%></p>
                        </div>
                        <div class="d-flex justify-content-lg-between">
                            <p>Envio</p>
                            <p>Gratis</p>
                        </div><hr>
                        <div class="d-flex justify-content-lg-between">
                            <strong><h5>TOTAL</h5></strong>
                            <strong><h5>S/<%=precFinal%></h5></strong>
                        </div>
                    </div>
                        
             </div>                                    
                <a class="btn btn-dark m-4" href="tienda?opc=6">Confirmar Compra</a>          
                <a class="btn btn-outline-danger" href="pagCategoria.jsp">Seguir comprando</a>
             <%}%>
         </div>
         
         
        
         
            
    </body>
    <jsp:include page="includes/footer.jsp">
        <jsp:param name="header" value="" />
    </jsp:include>  
</html>
