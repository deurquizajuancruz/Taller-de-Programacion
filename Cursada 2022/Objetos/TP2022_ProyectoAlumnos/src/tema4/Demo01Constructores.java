/*
Demo que crea objetos Libro invocando a los constructores definidos. Tema 4.
 */
package tema4;
public class Demo01Constructores {
    public static void main(String[] args) {
        Autor autor1 = new Autor("Herbert Schildt","Nacido en junio","Alemania");
        Libro libro1= new  Libro( "Java: A Beginner's Guide","Mcgraw-Hill",2014,autor1,"978-0071809252", 21.72);
        Autor autor2 = new Autor("Asociación Maestros Argentinos", "Fundada en 1960","Argentina");
        Libro libro2= new Libro("Prácticas del Lenguaje",autor2,"978-9501314694",19.95);
        System.out.println("Información del autor de " + libro1.getTitulo() + libro1.getPrimerAutor().toString());
        System.out.println("Información del autor de " + libro2.getTitulo() + libro2.getPrimerAutor().toString());
    }
    
}
