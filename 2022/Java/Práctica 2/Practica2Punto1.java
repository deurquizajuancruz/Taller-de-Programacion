/*
Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego
muestre en consola la representación de ese objeto en formato String. 
*/
package tema2;
import PaqueteLectura.Lector;
public class Practica2Punto1 {
    public static void main(String[] args) {
        int edad,dni;String nombre;
        System.out.println("Ingrese el DNI: ");dni=Lector.leerInt();
        System.out.println("Ingrese la edad: ");edad=Lector.leerInt();
        System.out.println("Ingrese el nombre: ");nombre=Lector.leerString();
        Persona lapersona = new Persona(nombre,dni,edad);
        System.out.println(lapersona.toString());
    } 
}
