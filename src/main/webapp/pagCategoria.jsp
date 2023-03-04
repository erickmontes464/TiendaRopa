<%@page import="beans.*,dao.Negocio" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>                     
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
        <title>Categorias</title>
    </head>
    <body>
        <jsp:include page="includes/header.jsp">
            <jsp:param name="header" value=""/>
        </jsp:include>      
        <h1 class="mb-0 text-center">Categorías</h1>
        <p class="text-center mb-1">La sonrisa te queda con tu outfit y siempre está de moda.</p>  
        <div class="mw-100 row justify-content-center">
            
            <%
                Negocio obj=new Negocio();
                for(Categoria x:obj.lisCat()){
            %>            
            <div class="col-2 new-products p-0 m-3" >
                <a href="tienda?opc=1&list=c&id=<%=x.getCodc()%>"><img class="size-img" src="images/Categoria/<%=x.getImagen()%>"></a>
                <h4 class="text-center p-1"><%=x.getNomc()%></h4>  	
            </div>            
            <%};%>  			
            		
	</div>
        
        <hr class="mx-5">
        
        
        <div class="contenedor-sub">
                                      
            <div class="text-center my-auto">
                <h2>Subcategorías<br>más buscadas</h2>                       
                <button class="btn btn-outline-dark" id="verMas">Ver Todas</button>
            </div>
                               
            <div class="right">
                <%for(Subcategoria x:obj.lissubCat()){%> 
                    <div class="d-flex col box-sub">
                        <a href="tienda?opc=1&list=s&id=<%=x.getCodc()%>"><img src="images/subCateg/<%=x.getImagen()%>" width="150" height="150"/></a>
                        <p class="m-auto"><%=x.getNomc()%></p>
                    </div>
                <%};%>    
            </div>
  
        </div>    
       <jsp:include page="includes/footer.jsp">
            <jsp:param name="footer" value="" />
        </jsp:include>
            <script>
                const verMasBtn = document.getElementById('verMas');
                const boxSubs = document.querySelectorAll('.box-sub:nth-child(n+7)');

                verMasBtn.addEventListener('click', function() {
                    if(boxSubs[1].style.height === '0'){
                        console.log("100");
                    }
                    for (const elemento of boxSubs) {
                       
                            elemento.style.height = '100%';
                            elemento.style.overflow = 'visible';                    
                    }
                });
            </script>
    </body>
</html>
