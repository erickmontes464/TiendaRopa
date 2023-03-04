
package dao;

import beans.*;

import java.util.*;
import util.MySQLConexion;
import java.sql.*;

public class Negocio{
    public List<Subcategoria> lissubCat() {
     Connection cn=MySQLConexion.getConexion();
     List<Subcategoria> lis=new ArrayList();
     try{
     String sql="Select Idsubcateg,Descripcion,Imagen from subcategorias";
     PreparedStatement st=cn.prepareStatement(sql);
     ResultSet rs=st.executeQuery();
     while(rs.next()){
         Subcategoria p=new Subcategoria();
         p.setCodc(rs.getString(1));
         p.setNomc(rs.getString(2));
         p.setImagen(rs.getString(3));
         lis.add(p);
     }
     }catch(Exception ex){
      ex.printStackTrace();
     }finally{
         try{ cn.close();}catch(Exception ex2){}
     }
    return lis;
    }
    
    public List<Articulo> lisCatNov() {
    Connection cn=MySQLConexion.getConexion();
     List<Articulo> lis=new ArrayList();
     try{
     String sql="Select idArticulo,descripcion,PrecioUnidad,stock,imagen from articulos"
             + " where idcategoria=?";
     PreparedStatement st=cn.prepareStatement(sql);
     
     st.setString(1, "CAT04");
     ResultSet rs=st.executeQuery();
     while(rs.next()){
         Articulo p=new Articulo();
         p.setCoda(rs.getString(1));
         p.setNomart(rs.getString(2));
         p.setPrecio(rs.getDouble(3));
         p.setStk(rs.getInt(4));
         p.setImagen(rs.getString(5));
         lis.add(p);
     }
     }catch(Exception ex){
      ex.printStackTrace();
     }finally{
         try{ cn.close();}catch(Exception ex2){}
     }
    return lis;
    
    
    }
   
    public List<Categoria> lisCat() {
     Connection cn=MySQLConexion.getConexion();
     List<Categoria> lis=new ArrayList();
     try{
     String sql="Select idcategoria,descripcion,imagen from categorias";
     PreparedStatement st=cn.prepareStatement(sql);
     ResultSet rs=st.executeQuery();
     while(rs.next()){
         Categoria p=new Categoria();
         p.setCodc(rs.getString(1));
         p.setNomc(rs.getString(2));
         p.setImagen(rs.getString(3));
         lis.add(p);
     }
     }catch(Exception ex){
      ex.printStackTrace();
     }finally{
         try{ cn.close();}catch(Exception ex2){}
     }
    return lis;
    }

   
    public List<Articulo> lisArticulo(String id) {
    Connection cn=MySQLConexion.getConexion();
     List<Articulo> lis=new ArrayList();
     try{
     String sql="Select idArticulo,descripcion,PrecioUnidad,stock,imagen from articulos"
             + " where idcategoria=?";
     PreparedStatement st=cn.prepareStatement(sql);
     st.setString(1, id);
     ResultSet rs=st.executeQuery();
     while(rs.next()){
         Articulo p=new Articulo();
         p.setCoda(rs.getString(1));
         p.setNomart(rs.getString(2));
         p.setPrecio(rs.getDouble(3));
         p.setStk(rs.getInt(4));
         p.setImagen(rs.getString(5));
         lis.add(p);
     }
     }catch(Exception ex){
      ex.printStackTrace();
     }finally{
         try{ cn.close();}catch(Exception ex2){}
     }
    return lis;    
    }
    public List<Articulo> lisArticulosub(String id) {
    Connection cn=MySQLConexion.getConexion();
     List<Articulo> lis=new ArrayList();
     try{
     String sql="Select idArticulo,descripcion,PrecioUnidad,stock,imagen from articulos"
             + " where Idsubcateg=?";
     PreparedStatement st=cn.prepareStatement(sql);
     st.setString(1, id);
     ResultSet rs=st.executeQuery();
     while(rs.next()){
         Articulo p=new Articulo();
         p.setCoda(rs.getString(1));
         p.setNomart(rs.getString(2));
         p.setPrecio(rs.getDouble(3));
         p.setStk(rs.getInt(4));
         p.setImagen(rs.getString(5));
         lis.add(p);
     }
     }catch(Exception ex){
      ex.printStackTrace();
     }finally{
         try{ cn.close();}catch(Exception ex2){}
     }
    return lis;    
    }
    public Articulo busArticulo(String nro) {
        Articulo ar = null;
        Connection cn = MySQLConexion.getConexion();
        try {
            String slq = "select IdArticulo, IdCategoria, Descripcion , PrecioUnidad, Stock,Imagen from articulos where IdArticulo = ?";
            PreparedStatement st = cn.prepareStatement(slq);
            st.setString(1, nro);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {//leer cada fila de la tabla
                ar = new Articulo();
                ar.setCoda(rs.getString(1));
                ar.setCodaCat(rs.getString(2));
                ar.setNomart(rs.getString(3));
                ar.setPrecio(rs.getDouble(4));
                ar.setStk(rs.getInt(5));
                ar.setImagen(rs.getString(6));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ar;
    }
    public void delArticulo(String nro) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "delete from articulos where IdArticulo=?";
            //prepara una instruccion sql que sera ejecutada mediante la conexion
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, nro);
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public void modArticulo(Articulo ar) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "update articulos set IdCategoria=?,Descripcion=?, PrecioUnidad=?, Stock=?, Imagen=? where IdArticulo=?";
            //prepara una instruccion sql que sera ejecutada mediante la conexion
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, ar.getCodaCat());
            st.setString(2, ar.getNomart());
            st.setDouble(3, ar.getPrecio());
            st.setInt(4, ar.getStk());
            st.setString(5, ar.getImagen());
            st.setString(6, ar.getCoda());
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public List<Articulo> lisArticulo() {
    Connection cn=MySQLConexion.getConexion();
     List<Articulo> lis=new ArrayList();
     try{
     String sql="Select idArticulo,idCategoria, descripcion,PrecioUnidad,stock,imagen from articulos";
     PreparedStatement st=cn.prepareStatement(sql);
     ResultSet rs=st.executeQuery();
     while(rs.next()){
         Articulo p=new Articulo();
         p.setCoda(rs.getString(1));
         p.setCodaCat(rs.getString(2));
         p.setNomart(rs.getString(3));
         p.setPrecio(rs.getDouble(4));
         p.setStk(rs.getInt(5));
         p.setImagen(rs.getString(6));
         
         lis.add(p);
     }
     }catch(Exception ex){
      ex.printStackTrace();
     }finally{
         try{ cn.close();}catch(Exception ex2){}
     }
    return lis;
    }
    

    public Articulo busArt(String id) {
     Connection cn=MySQLConexion.getConexion();
     Articulo p=null;
     try{
     String sql="Select idArticulo,descripcion,PrecioUnidad,stock,imagen from articulos"
             + " where idArticulo=?";
     PreparedStatement st=cn.prepareStatement(sql);
     st.setString(1, id);
     ResultSet rs=st.executeQuery();
     if(rs.next()){
         p=new Articulo();
         p.setCoda(rs.getString(1));
         p.setNomart(rs.getString(2));
         p.setPrecio(rs.getDouble(3));
         p.setStk(rs.getInt(4));
         p.setImagen(rs.getString(5));
       }
     }catch(Exception ex){
      ex.printStackTrace();
     }finally{
         try{ cn.close();}catch(Exception ex2){}
     }
     return p;
    }

    public Cliente busCliente(String usr, String pwd) {
   Connection cn=MySQLConexion.getConexion();
     Cliente p=null;
     try{
     String sql="Select Apellidos, nombres from clientes where email=? and Password=?";
     PreparedStatement st=cn.prepareStatement(sql);
     st.setString(1, usr);
     st.setString(2, pwd);
     ResultSet rs=st.executeQuery();
     if(rs.next()){
         p=new Cliente();
         p.setEmail(usr);
         p.setApe(rs.getString(1));
         p.setNom(rs.getString(2));
       }
     }catch(Exception ex){
      ex.printStackTrace();
     }finally{
         try{ cn.close();}catch(Exception ex2){}
     }
     return p;
    }

    public String grabaFactura(String codc, List<Compra> lista) {
     String nfac="";
     Connection cn=MySQLConexion.getConexion();
     double sm=0;
     for(Compra x:lista) sm=sm+x.total();
      try{
        String sql="{call spfactura(?,?)}";
        CallableStatement st=cn.prepareCall(sql);
        st.setString(1, codc);
        st.setDouble(2, sm);
        ResultSet rs=st.executeQuery();
        rs.next(); //lee el valor devuelto
        nfac=rs.getString(1);
        //grabacion del detalle
         sql="{call spdetalle(?,?,?,?)}";
         CallableStatement st2=cn.prepareCall(sql);
         for(Compra c:lista){
            st2.setString(1, nfac);
            st2.setString(2, c.getCoda());
            st2.setInt(3, c.getCantidad());
            st2.setString(4, c.getTalla());
            st2.executeUpdate();
         }
     }catch(Exception ex){
         ex.printStackTrace();
     }
     return nfac;
     }
    
    public List<Compra> lisCompra() {
    Connection cn=MySQLConexion.getConexion();
     List<Compra> lis=new ArrayList();
     try{
     String sql="SELECT fc.NroFactura, c.Nombres, c.Apellidos, c.Direccion, a.Descripcion, fd.Cantidad, fd.talla, fc.MontoTotal "
             + "FROM clientes AS c, faccab as fc, facdet AS fd, articulos AS a "
             + "WHERE c.IdCliente=fc.IdCliente AND fc.NroFactura=fd.NroFactura AND a.IdArticulo=fd.IdArticulo";
     PreparedStatement st=cn.prepareStatement(sql);
     ResultSet rs=st.executeQuery();
     while(rs.next()){
         Compra c=new Compra();
         c.setNrofactura(rs.getString(1));
         c.setNombre(rs.getString(2));
         c.setApellidos(rs.getString(3));
         c.setDireccion(rs.getString(4));
         c.setProductos(rs.getString(5));
         c.setCantidad(rs.getInt(6));
         c.setTalla(rs.getString(7));
         c.setMontototal(rs.getString(8));
         
         
         lis.add(c);
     }
     }catch(Exception ex){
      ex.printStackTrace();
     }finally{
         try{ cn.close();}catch(Exception ex2){}
     }
    return lis;
    }
    
    
    
    public void addCliente(Cliente c) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call spAddcliente(?,?,?,?,?,?)}";
            CallableStatement st = cn.prepareCall(sql);                    
            st.setString(1, c.getApe());
            st.setString(2, c.getNom());
            st.setString(3, c.getDni());
            st.setString(4, c.getEmail());
            st.setInt(5, c.getEdad());
            st.setString(6, c.getClave());
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public void addArticulo(Articulo ar) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call spAddArticulo(?,?,?,?,?,?,?)}";                      
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, ar.getCoda());
            st.setString(2, ar.getCodaCat());
            st.setString(3, ar.getNomart());
            st.setDouble(4, ar.getPrecio());
            st.setInt(5, ar.getStk());
            st.setString(6, ar.getImagen());
            st.setString(7, ar.getCodasubCat());
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public List<Articulo> lisArtSearch(String search) {
    Connection cn=MySQLConexion.getConexion();
     List<Articulo> lis=new ArrayList();
     try{
     String sql="Select idArticulo,descripcion,PrecioUnidad,stock,imagen from articulos"
             + " where descripcion LIKE ?";
     PreparedStatement st=cn.prepareStatement(sql);
     st.setString(1, "%"+search+"%");
     ResultSet rs=st.executeQuery();
     while(rs.next()){
         Articulo p=new Articulo();
         p.setCoda(rs.getString(1));
         p.setNomart(rs.getString(2));
         p.setPrecio(rs.getDouble(3));
         p.setStk(rs.getInt(4));
         p.setImagen(rs.getString(5));
         lis.add(p);
     }
     }catch(Exception ex){
      ex.printStackTrace();
     }finally{
         try{ cn.close();}catch(Exception ex){}
     }
    return lis;    
    }
}
