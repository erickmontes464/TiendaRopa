
package control;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.*;
import dao.Negocio;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.*;
import javax.servlet.http.HttpSession;
public class tienda extends HttpServlet {
    Negocio obj=new Negocio();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       int opc=Integer.parseInt(request.getParameter("opc"));
       if(opc==1)lisArt(request, response);
       if(opc==2)detArt(request, response);
       if(opc==3)carrito(request,response);
       if(opc==4)borraItem(request,response);  
       if(opc==5)login(request,response);
       if(opc==6)grabaFactura(request,response);
       if(opc==7)cerrarSesion(request,response);
       if(opc==8)addCliente(request,response);
       if(opc==9)addArticulo(request,response);
       if(opc==10)delArticulo(request,response);
       if(opc==11)busArticulo(request,response);
       if(opc==12)modArticulo(request,response);
       if(opc==13)lisArtSearch(request,response);
       
    }
    
    protected void grabaFactura(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses=request.getSession();
        String pag;
        if(ses.getAttribute("cliente")==null){
            pag="/Login.jsp";
        }else{
            Cliente cli=(Cliente)ses.getAttribute("cliente");
            List<Compra> lista=(ArrayList<Compra>)ses.getAttribute("canasta");
         
          
            String factura=obj.grabaFactura(cli.getCodc(), lista);
            double sm=0;
            for(Compra x:lista) sm+=x.total();
            request.setAttribute("factura", factura);
            request.setAttribute("cli", cli.getApe()+","+cli.getNom());
            request.setAttribute("total", sm);  
            request.setAttribute("carrito", lista);          
            ses.removeAttribute("canasta");         
            pag="/pagBoucher.jsp";
        }
            request.getRequestDispatcher(pag).forward(request, response);
            
    }
    protected void cerrarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses=request.getSession();
        ses.removeAttribute("canasta");
        ses.removeAttribute("cliente");
        String pag="/index.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    //////hasta aqui
    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usr=request.getParameter("user").trim();
        String clave=request.getParameter("clave").trim();
        Cliente cli=obj.busCliente(usr, clave);
        String pag="";
        if(usr.equals("admin") && clave.equals("admin")){
            pag="/menuAdmin.jsp";
        }else{
            if (cli==null) {
                request.setAttribute("dato", "Usuario o clave incorrecta");
                pag="/Login.jsp";
            }else{
                HttpSession ses=request.getSession();
                ses.setAttribute("cliente", cli);
                pag="/index.jsp";          
            }
        }
        request.getRequestDispatcher(pag).forward(request, response);
    }
     protected void borraItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         int fila=Integer.parseInt(request.getParameter("fila"));
         HttpSession ses=request.getSession();
        List<Compra> lista=(ArrayList<Compra>)ses.getAttribute("canasta");
        //agregar a la lista
        lista.remove(fila);
        ses.setAttribute("canasta", lista); //actualizar la canasta
        String pag="/pagCompra.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
        
    }
       
     protected void carrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses=request.getSession();
        String id=request.getParameter("codigo");//codigo de articulo
        int can=Integer.parseInt(request.getParameter("cantidad"));
        String talla=request.getParameter("talla");
        Compra cp=new Compra();
        Articulo ar=obj.busArt(id);  //el articulo encontrado lo pasamos a compra
        cp.setCoda(id);
        cp.setNomart(ar.getNomart());
        cp.setPrecio(ar.getPrecio());
        cp.setImagen(ar.getImagen());
        cp.setCantidad(can);
        cp.setTalla(talla);
        List<Compra> lista;
        
        if(ses.getAttribute("canasta")==null) //no hay ninguna articulo comprado
            lista=new ArrayList();
        else   //recupera la lista que esta en la sesion canasta
            lista=(ArrayList<Compra>)ses.getAttribute("canasta");
        //agregar a la lista
        boolean busca=false;
        for(Compra x:lista){
            if (x.getCoda().equals(id)) {
                busca=true;break;
            }
        }
        if (!busca)                   
        lista.add(cp);
        ses.setAttribute("canasta", lista); //actualizar la canasta
        String pag="/pagCompra.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
        
    }
    
    
    protected void lisArt(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id=request.getParameter("id");//codigo de categoria
        String list=request.getParameter("list");
        if(list.equals("c")){
            request.setAttribute("dato", obj.lisArticulo(id));
        }else{
            request.setAttribute("dato", obj.lisArticulosub(id));
        }
       
        String pag="pagArticulo.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
        
    }
    
    protected void lisArtSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String search=request.getParameter("search");
        request.setAttribute("dato", obj.lisArtSearch(search));
        String pag="pagArticulo.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
        
    }
    
    protected void detArt(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          String id=request.getParameter("id");//codigo de categoria
        request.setAttribute("dato", obj.busArt(id));
        String pag="pagDetalle.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
        
    }
    protected void addCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          Cliente c = new Cliente();  
          
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate fechaNac = LocalDate.parse(request.getParameter("fechnac"), fmt);      
        Period periodo = Period.between(fechaNac, LocalDate.now());
        c.setApe(request.getParameter("apellido"));       
        c.setNom(request.getParameter("name")); 
        c.setDni(request.getParameter("dni"));
        c.setEmail(request.getParameter("email"));       
        c.setEdad(periodo.getYears());   
        c.setClave(request.getParameter("clave"));  
        obj.addCliente(c);
        String pag = "/index.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
        
    }
    
    protected void addArticulo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          Articulo ar = new Articulo();  
              
        ar.setCoda(request.getParameter("coda"));      
        ar.setCodaCat(request.getParameter("id_cate"));
        ar.setCodasubCat(request.getParameter("id_subcate"));
        ar.setNomart(request.getParameter("desc"));
        ar.setPrecio(Integer.parseInt(request.getParameter("precio")));
        ar.setStk(Integer.parseInt(request.getParameter("stock")));
        ar.setImagen(request.getParameter("imagen"));
   
        obj.addArticulo(ar);
        String pag = "/menuAdmin.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
        
    }
    protected void delArticulo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nro = request.getParameter("cod");
        obj.delArticulo(nro);
        String pag = "/menuAdmin.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    protected void busArticulo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nro = request.getParameter("cod");
        Articulo ar = obj.busArticulo(nro);
        request.setAttribute("dato", ar);                            
        //Reenviar el dato encontrado(prestamo) a la pagina editar      
        String pag="/modArticulo.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    protected void modArticulo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Articulo ar = new Articulo();
        ar.setCoda(request.getParameter("coda"));
        ar.setCodaCat(request.getParameter("id_cate"));
        ar.setNomart(request.getParameter("desc"));
        ar.setPrecio(Double.parseDouble(request.getParameter("precio")));
        ar.setStk(Integer.parseInt(request.getParameter("stock")));
        ar.setImagen(request.getParameter("imagen"));
        obj.modArticulo(ar);
        //aqui se redireccion a otra pagina luego de completar el formulario
        String pag="menuAdmin.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
