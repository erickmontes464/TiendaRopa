
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
            Negocio obj=new Negocio();
            List<Articulo> lista=(ArrayList<Articulo>)request.getAttribute("dato");
            int cont=1;
            for(Articulo x:obj.lisArticulo()){
                cont++;
            }
        %>   
        <div class="container mt-5">
            <h1>Agregar Producto</h1>   
            <a class="btn btn-secondary  w-25" href="menuAdmin.jsp">Volver a lista de productos</a> <br>
            
            <form class="container row" action="tienda">
                <input type="hidden" name="opc" value="9">

                <input class="form-control " type="hidden" name="coda" value="ART<%=cont%>">

                <div class="col-4 ">
                    <h5 class="py-2">Categoria</h5>
                    <select id="cate" name="id_cate" class="form-select py-2" onchange="updatesubcate()">

                        <option value="CAT01">Hombre</option>
                        <option value="CAT02">Mujer</option>
                        <option value="CAT03">Niños</option>
                        <option value="CAT04">Novedades</option>
                    </select>                
                </div>
                <div class="col-4 ">
                    <h5 class="py-2">SubCategoria</h5>
                    <select id="subcate" name="id_subcate" class="form-select py-2">

                        <option value="SUBCAT01">Novedad</option>
                        <option value="SUBCAT02">Polo</option>
                        <option value="SUBCAT03">Pantalon</option>
                        <option value="SUBCAT04">Blusa</option>
                        <option value="SUBCAT05">Novedad</option>
                        <option value="SUBCAT06">Polo</option>
                        <option value="SUBCAT07">Pantalon</option>
                        <option value="SUBCAT08">Blusa</option>
                        <option value="SUBCAT09">Novedad</option>
                        <option value="SUBCAT10">Polo</option>
                        <option value="SUBCAT11">Pantalon</option>
                        <option value="SUBCAT12">Blusas</option>
                        <option value="SUBCAT13">Casaca</option>
                        <option value="SUBCAT14">Pantalon</option>
                        <option value="SUBCAT15">Zapatillas</option>
                    </select>                
                </div>
                <div class="col-4">
                    <h5 class="py-2">Descripción</h5>
                    <input class="form-control " type="text" name="desc" required>         
                </div>

                <div class="col-4">
                    <h5 class="py-2">Precio</h5>
                    <input class="form-control " type="number" name="precio" required>
                </div>

                <div class="col-4 ">
                    <h5 class="py-2">Stock</h5>
                    <input class="form-control" type="number" name="stock" required>             
                </div>

                <div class="col-4">
                    <h5 class="py-2">Imagen</h5>
                    <input class="form-control" type="text" name="imagen">             
                </div>

                <div class="row"><button type="submit" class="btn btn-primary mt-5 w-50" >Agregar produto</button></div>

                </form>
        </div>
    </body>
    <<script src="js/app.js"></script>
</html>
