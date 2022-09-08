/*
Clase Libro a la cual se agregaron constructores. Tema 4.
 */
package tema4;
public class Libro {
   private String titulo;
   private Autor primerAutor; 
   private String editorial;
   private int añoEdicion;
   private String ISBN; 
   private double precio; 
     
/*constructores no nulos    
public Libro(  String unTitulo,  String unaEditorial, 
    int unAñoEdicion,  String unPrimerAutor, String unISBN, double unPrecio){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= unAñoEdicion;
         primerAutor = new Autor();
         ISBN =  unISBN;
         precio = unPrecio;
    }
    
    public Libro(  String unTitulo,  String unaEditorial, String unPrimerAutor, String unISBN){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= 2015;
         primerAutor = new Autor();
         ISBN =  unISBN;
         precio = 100;
    }
*/      
   //constructores
    public Libro (String unTitulo,String unaEditorial, int unAñoEdicion, String nombre,String biografia, String unISBN, double unPrecio) {
        titulo = unTitulo;
        editorial=unaEditorial;
        añoEdicion=unAñoEdicion;
        primerAutor= new Autor(nombre,biografia);
        ISBN=unISBN;
        precio=unPrecio;
    }
    public Libro() {
        
    }
    //getters
    public String getTitulo(){
        return titulo;
    }
  
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }
    
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
    public String getPrimerAutorNombre() {
        return this.primerAutor.getNombre();
    }
    public String getPrimerAutorBio() {
        return this.primerAutor.getBio();
    }
    //setters
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
   
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAñoEdicion(int unAño){
         añoEdicion = unAño;
    }
   
    public void setISBN(String unISBN){
         ISBN=unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio=unPrecio;
    }
    public void setPrimerAutor(Autor primerAutor) {
        this.primerAutor=primerAutor;
    }
    @Override
    public String toString(){
        String aux;
        aux= titulo + " por " + primerAutor.getNombre() +" biografiado como "+ primerAutor.getBio() + " - " + añoEdicion + " - " + " ISBN: " + ISBN;
       return (aux);
    }
        
}
