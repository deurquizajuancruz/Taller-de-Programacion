/*
Demo que crea objetos Libro invocando a los constructores definidos. Tema 4.
 */
package tema4;
import PaqueteLectura.Lector;
public class Demo01ConstructoresLibro {
    public static void main(String[] args) {
        Autor autor1 = new Autor();
        Libro libro1= new Libro();
        System.out.print("Ingrese el titulo del libro: ");
        libro1.setTitulo(Lector.leerString());
        System.out.print("Ingrese el autor del libro: ");
        autor1.setNombre(Lector.leerString());
        System.out.print("Ingrese la biografia del autor: ");
        autor1.setBio(Lector.leerString());
        libro1.setPrimerAutor(autor1);
        System.out.print("Ingrese la editorial del libro: ");
        libro1.setEditorial(Lector.leerString());
        System.out.print("Ingrese el año de edicion: ");
        libro1.setAñoEdicion(Lector.leerInt());
        System.out.print("Ingrese el ISBN: ");
        libro1.setISBN(Lector.leerString());
        System.out.print("Ingrese el precio: ");
        libro1.setPrecio(Lector.leerDouble());
        System.out.print(libro1.toString());
    }
    
}
