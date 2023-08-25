/*
Clase Libro a la cual se agregaron constructores. Tema 4.
 */
package tema4;
import java.util.Calendar;
public class Libro {
   private String titulo;
   private Autor primerAutor; 
   private String editorial;
   private int añoEdicion;
   private String ISBN; 
   private double precio; 
     
    /* Constructores */
    public Libro(  String unTitulo,  String unaEditorial, 
    int unAñoEdicion,  Autor unPrimerAutor, String unISBN, double unPrecio){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= unAñoEdicion;
         primerAutor = unPrimerAutor;
         ISBN =  unISBN;
         precio = unPrecio;
    }
    
    public Libro(  String unTitulo,  Autor unPrimerAutor, String unISBN, double unPrecio){
         titulo = unTitulo;
         editorial = "Kapelusz"; 
         añoEdicion= Calendar.getInstance().get(Calendar.YEAR);
         primerAutor = unPrimerAutor;
         ISBN =  unISBN;
         precio = unPrecio;
    }
    public Libro(){
    }
    /*Métodos*/   
    public String getTitulo(){
        return titulo;
    }
  
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }
  
    public Autor getPrimerAutor(){
        return primerAutor;
    } 
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
   
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
   
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAñoEdicion(int unAño){
         añoEdicion = unAño;
    }
   
    public void setPrimerAutor(Autor unPrimerAutor){
         primerAutor=unPrimerAutor;
    } 
    public void setISBN(String unISBN){
         ISBN=unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio=unPrecio;
    }
   
    public double getPrecioFinal(){
        return precio + (precio*0.21);
    }
   @Override
    public String toString(){
        String aux;
        aux= titulo + " por " + primerAutor.toString() + " - " + añoEdicion + " - " + " ISBN: " + ISBN +" Editorial: " + editorial + " Precio: " + precio;
       return ( aux);
    }    
    // toString que incluye el precio final
    /*
    public String toString(){
       String aux = titulo + " por " + 
                    primerAutor + " - " +
                    añoEdicion + " -  ISBN: " + 
                    ISBN +  " -  precio final: " +
	        this.getPrecioFinal();
       return aux;
    }
    */   
}
