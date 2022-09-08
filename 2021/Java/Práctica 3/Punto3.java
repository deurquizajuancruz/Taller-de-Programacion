/*
3- A- Modele e implemente las clases para el siguiente problema. Una garita de seguridad
quiere identificar los distintos tipos de personas que entran a un barrio cerrado. Al barrio
pueden entrar personas, que se caracterizan por su nombre, DNI y edad. Además pueden
entrar trabajadores, estos son personas que se caracterizan además por la tarea que
realizan en el predio.
Implemente constructores, getters y setters para las clases. Además tanto las personas
como los trabajadores deben responder al mensaje toString(). A continuación se
ejemplifica la representación a retornar por cada uno:
- Personas: “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años”
- Trabajadores: “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años. Soy Corta
césped.”
B- Genere un programa que instancie una persona y un trabajador con datos leídos de
teclado y muestre la representación de cada uno en consola.
 */
package tema5;
import PaqueteLectura.Lector;
public class Punto3Practica3 {
    public static void main (String[] args) {
        System.out.println("Instanciacion de la persona.");
        String nombre;int DNI,edad;
        System.out.print("Ingrese el nombre de la persona: ");nombre=Lector.leerString();
        System.out.print("Ingres el DNI de la persona: ");DNI=Lector.leerInt();
        System.out.print("Ingrese la edad de la persona: ");edad=Lector.leerInt();
        Personas per=new Personas(nombre,DNI,edad);
        System.out.print("Informacion de la persona: "+ per.toString());
        System.out.println("\nInstanciacion del trabajador.");
        String nombreT,tarea;int DNIT,edadT;
        System.out.print("Ingrese el nombre del trabajador: ");nombreT=Lector.leerString();
        System.out.print("Ingrese el DNI del trabajador: ");DNIT=Lector.leerInt();
        System.out.print("Ingrese la edad del trabajador: ");edadT=Lector.leerInt();
        System.out.print("Ingrese la tarea del trabajador: ");tarea=Lector.leerString();
        Trabajador tra=new Trabajador(nombreT,DNIT,edadT,tarea);
        System.out.print("Informacion del trabajador: "+tra.toString());
    }
}
