package beans;

public class Cliente {
    private String codc;
    private String ape;
    private String nom;
    private String dni; 
    private String email;
    private int edad;
    private String clave;

    public Cliente( String ape, String nom, String dni,String email,int edad,String clave) {
        
        this.ape = ape;
        this.nom = nom;
        this.clave = clave;
        this.dni=dni;
        this.edad = edad;       
        this.email = email;
    }
    
    
    public Cliente() {
    }

   
    public String getCodc() {
        return codc;
    }

    /**
     * @param codc the codc to set
     */
    public void setCodc(String codc) {
        this.codc = codc;
    }

    /**
     * @return the ape
     */
    public String getApe() {
        return ape;
    }

    /**
     * @param ape the ape to set
     */
    public void setApe(String ape) {
        this.ape = ape;
    }

    /**
     * @return the nom
     */
    public String getNom() {
        return nom;
    }

    /**
     * @param nom the nom to set
     */
    public void setNom(String nom) {
        this.nom = nom;
    }

    /**
     * @return the clave
     */
    public String getClave() {
        return clave;
    }

    /**
     * @param clave the clave to set
     */
    public void setClave(String clave) {
        this.clave = clave;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }
   
   
   
   
}
