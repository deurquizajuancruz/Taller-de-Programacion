/*
 *Se dispone de una clase Persona (ya implementada en la carpeta tema2). Un objeto
persona puede crearse sin valores iniciales o enviando en el mensaje de creación el
nombre, DNI y edad (en ese orden). Un objeto persona responde a los siguientes mensajes:
getNombre() retorna el nombre (String) de la persona
getDNI() retorna el dni (int) de la persona
getEdad() retorna la edad (int) de la persona
setNombre(X) modifica el nombre de la persona al “String” pasado por parámetro (X)
setDNI(X) modifica el DNI de la persona al “int” pasado por parámetro (X)
setEdad(X) modifica la edad de la persona al “int” pasado por parámetro (X)
toString() retorna un String que representa al objeto. Ej: “Mi nombre es Mauro, mi DNI es
11203737 y tengo 70 años”
Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego
muestre en consola la representación de ese objeto en formato String.
Piense y responda: ¿Qué datos conforman el estado del objeto persona? ¿Cómo se
implementan dichos datos? ¿Qué ocurre cuando se le envía un mensaje al objeto?
 */
package tema2;
import PaqueteLectura.Lector;
public class Punto1Practica1Parte2 {
    public static void main (String [] args ) {
        Persona p=new Persona();
        System.out.print("Ingrese nombre: ");p.setNombre(Lector.leerString());
        System.out.print("Ingrese el dni: ");p.setDNI(Lector.leerInt());
        System.out.print("Ingrese la edad: ");p.setEdad(Lector.leerInt());
        System.out.println(p.toString());
    }
}
