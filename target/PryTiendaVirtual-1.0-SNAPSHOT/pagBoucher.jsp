<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="includes/header.jsp">
            <jsp:param name="header" value="" />
        </jsp:include>
        <%
            String fac=(String) request.getAttribute("factura");
            String cliente=(String) request.getAttribute("cli");
         
            Double tot=(double) request.getAttribute("total");
            List<Compra> lista=(ArrayList<Compra>) request.getAttribute("carrito");
            LocalDate date = LocalDate.now();
            DateTimeFormatter formatters = DateTimeFormatter.ofPattern("d/MM/uuuu");
            String fecha = date.format(formatters);
                      
         %>
         <div class="m-4">
             <div class="d-flex justify-content-between">
                 <h4>FASHION SHOP</h4>
                 <h4 style="margin-right: 250px">FACTURA</h4>          
             </div>
             <p>Lima-Lima-Perú</p>
             <div class="row mt-4">
                 <div class="col-4">
                     <Strong>Facturar a:</Strong>
                     <p><%=cliente%></p>
                 </div>
                 <div class="col-4">
                     <Strong>Enviar a:</Strong>
                     <p>Lima</p>
                 </div>
                 <div class="col-3">
                     <div class="d-flex justify-content-between">
                         <Strong>N° de factura:</Strong>
                         <p><%=fac%></p>
                     </div>
                     <div class="d-flex justify-content-between">
                         <Strong>Fecha:</Strong>
                         <p><%=fecha%></p>
                     </div>      
                 </div>
                 
             </div>
                
             <div style="margin:auto ;width: 80%">
                 <table class="table table-bordered mt-5 text-center">
                     <thead class="table table-active">
                         <tr>
                             <th scope="col">#</th>
                             <th scope="col">Cantidad</th>
                             <th scope="col">Descripción</th>
                             <th scope="col">Talla</th>
                             <th scope="col">Precio Unitario</th>
                             <th scope="col">Importe</th>
                         </tr>
                     </thead>
                     <tbody>
                       <%
                        int con=1;
                        for(Compra x:lista){
                       %>    
                         <tr>
                             
                             <th scope="row"><%=con%></th>
                             <td><%=x.getCantidad()%></td>
                             <td><%=x.getNomart()%></td>
                             <td><%=x.getTalla()%></td>
                             <td><%=x.getPrecio()%></td>
                             <td><%=x.total()%></td>
                         </tr>
                        <%con++;}%>
                         
                         <tr>                          
                             <td style="text-align: right" colspan="5"><h4>Total</h4></td>
                             <td><%=tot%></td>
                         </tr>
                        
                     </tbody>
                 </table>

            </div>
            <h2 class="text-center">Gracias por su Compra</h2>
            <a class="btn btn-secondary m-5" href="index.jsp">Ir a la pagina principal</a>  
         </div>
                      
            
        <jsp:include page="includes/footer.jsp">
            <jsp:param name="header" value="" />
        </jsp:include>      
    </body>
</html>
