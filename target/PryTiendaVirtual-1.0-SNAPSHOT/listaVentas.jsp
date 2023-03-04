<%@page import="beans.*,dao.Negocio" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <title>JSP Page</title>
    </head>
    <body class="bg-dark text-white">
        <%Negocio obj=new Negocio();%>   
        <div class="container text-center pt-5">          
            <h1>Gestor de Ventas</h1>                                
            <a class="btn btn-light m-3" href="index.jsp">Home</a> 
            <div class="bg-light p-5 ">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Codigo</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Apellidos</th> <!-- DNI DE CLIENTE -->
                            <th scope="col">Dirección</th>
                            <th scope="col">Productos</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Talla</th>
                            <th scope="col">Monto total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int cont=1;
                        for(Compra c:obj.lisCompra()){
                        %> 
                            <tr>
                                <th scope="row"><%=cont%></th>
                                <td><%=c.getNrofactura()%></td>
                                <td><%=c.getNombre()%></td>
                                <td><%=c.getApellidos()%></td>
                                <td><%=c.getDireccion()%></td>
                                <td><%=c.getProductos()%></td>
                                <td><%=c.getCantidad()%></td>
                                <td><%=c.getTalla()%></td>
                                <td><%=c.getMontototal()%></td>
                               
                            </tr>
                        <%cont++;}%>
                        
                    </tbody>
                </table>
           </div>
        </div>
    </body>
</html>

