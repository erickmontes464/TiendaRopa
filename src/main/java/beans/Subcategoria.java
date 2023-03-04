
package beans;

public class Subcategoria {
    private String codc;
    private String nomc;
    private String imagen;

    public Subcategoria() {
    }

    public Subcategoria(String codc, String nomc, String imagen) {
        this.codc = codc;
        this.nomc = nomc;
        this.imagen = imagen;
    }

    public String getCodc() {
        return codc;
    }

    public void setCodc(String codc) {
        this.codc = codc;
    }

    public String getNomc() {
        return nomc;
    }

    public void setNomc(String nomc) {
        this.nomc = nomc;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
}
