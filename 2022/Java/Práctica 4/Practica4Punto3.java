/*
3-A- Definir una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
(i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno
(iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.
B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
busque e informe el autor del libro “Mujercitas”.
C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
almacenen como máximo N libros? ¿Cómo instanciaría el estante?
 */
package tema4;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class Practica4Punto3 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Estante elEstante = new Estante();
        System.out.println("Ingrese la cantidad de libros a leer: ");int cant=Lector.leerInt();
        if (cant<20) {
            for (int i=0;i<cant;i++) {
                Libro unLibro = new Libro();
                System.out.println("Ingrese el nombre del libro: ");unLibro.setTitulo(Lector.leerString());
                //unLibro.setTitulo(GeneradorAleatorio.generarString(10));
                unLibro.setEditorial(GeneradorAleatorio.generarString(10));
                unLibro.setAñoEdicion(GeneradorAleatorio.generarInt(20));
                Autor unAutor = new Autor();
                unAutor.setNombre(GeneradorAleatorio.generarString(10));
                unAutor.setBiografia(GeneradorAleatorio.generarString(10));
                unAutor.setOrigen(GeneradorAleatorio.generarString(10));
                unLibro.setPrimerAutor(unAutor);
                unLibro.setISBN(GeneradorAleatorio.generarString(5));
                unLibro.setPrecio(GeneradorAleatorio.generarDouble(4));
                System.out.println("Informacion del libro: ");
                System.out.println(unLibro.toString());
                elEstante.AgregarLibro(unLibro);
        }
        if (elEstante.buscarLibro("Mujercitas")==null)
            System.out.println("No se encuentra un libro con el titulo Mujercitas");
        else
            System.out.println("Informacion del autor de Mujercitas: " + elEstante.buscarLibro("Mujercitas").getPrimerAutor().toString());
        }
        else
            System.out.println("El maximo de libros es de 20.");
    }
}
