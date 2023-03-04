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
            <h1>Gestor de productos</h1>                
            <a class="btn btn-light m-3" href="addArticulo.jsp">Agregar producto</a>    
            <a class="btn btn-light m-3" href="listaVentas.jsp">Lista de Ventas</a>         
            <a class="btn btn-light m-3" href="index.jsp">Home</a> 
            <div class="bg-light p-5 ">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Codigo</th>
                            <th scope="col">Categoria</th>
                            <th scope="col">Descripción</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Stock</th>
                            <th scope="col">URL</th>
                            <th scope="col">Eliminar</th>
                            <th scope="col">Editar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int cont=1;
                        for(Articulo x:obj.lisArticulo()){
                        %> 
                            <tr>
                                <th scope="row"><%=cont%></th>
                                <td><%=x.getCoda()%></td>
                                <td><%=x.getCodaCat()%></td>
                                <td><%=x.getNomart()%></td>
                                <td><%=x.getPrecio()%></td>
                                <td><%=x.getStk()%></td>
                                <td><%=x.getImagen()%></td>
                                <td><a class="btn btn-outline-danger" href="tienda?opc=10&cod=<%=x.getCoda()%>">
                                        <span class="material-symbols-outlined">delete</span>
                                    </a></td>
                                <td><a class="btn btn-outline-secondary" href="tienda?opc=11&cod=<%=x.getCoda()%>">
                                        <span class="material-symbols-outlined">edit</span>
                                    </a></td>
                            </tr>
                        <%cont++;}%>
                        
                    </tbody>
                </table>
           </div>
        </div>
    </body>
</html>
