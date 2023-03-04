
<%@page import="java.util.*"%>
<%@page import="beans.*,dao.Negocio" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    </head>
    <body>
       <%
          Articulo ar = (Articulo)request.getAttribute("dato");
        %>
        <div class="container mt-5">
            <h1>Editar Producto</h1>   
            <a class="btn btn-secondary  w-25" href="menuAdmin.jsp">Volver a lista de productos</a> <br>
            
            <form class="container row" action="tienda">
                <input type="hidden" name="opc" value="12">
                <input type="hidden" name="coda" value="<%=ar.getCoda()%>">
                <div class="col-4 ">
                    <h5 class="py-2">Categoria</h5>
                    <select name="id_cate" class="form-select py-2">
                     
                        <option value="CAT01" <%if(ar.getCodaCat().equals("CAT01")){out.print("selected");}%> >Hombre</option>
                        <option value="CAT02" <%if(ar.getCodaCat().equals("CAT02")){out.print("selected");}%> >Mujer</option>
                        <option value="CAT03" <%if(ar.getCodaCat().equals("CAT03")){out.print("selected");}%> >Niños</option>
                        <option value="CAT04" <%if(ar.getCodaCat().equals("CAT04")){out.print("selected");}%> >Novedades</option>
                    </select>                
                </div>

                <div class="col-4">
                    <h5 class="py-2">Descripción</h5>
                    <input class="form-control " type="text" name="desc" value="<%=ar.getNomart()%>" required>         
                </div>

                <div class="col-4">
                    <h5 class="py-2">Precio</h5>
                    <input class="form-control " type="number" name="precio" value="<%=ar.getPrecio()%>" required>
                </div>

                <div class="col-4 ">
                    <h5 class="py-2">Stock</h5>
                    <input class="form-control" type="number" name="stock" value="<%=ar.getStk()%>" required>             
                </div>

                <div class="col-4">
                    <h5 class="py-2">Imagen</h5>
                    <input class="form-control" type="text" name="imagen" value="<%=ar.getImagen()%>">             
                </div>

                <div class="row"><button type="submit" class="btn btn-primary mt-5 w-50" >Actualzar producto</button></div>

                </form>
        </div>
    </body>
</html>
