/*
3- A- Definir una clase para representar entrenadores de un club de fútbol. Un entrenador
se caracteriza por su nombre, sueldo básico y la cantidad de campeonatos ganados.
▪ Defina métodos para obtener/modificar el valor de cada atributo.
▪ Defina el método calcularSueldoACobrar que calcula y devuelve el sueldo a cobrar por
el entrenador. El sueldo se compone del sueldo básico, al cual se le adiciona un plus por
campeonatos ganados (5000$ si ha ganado entre 1 y 4 campeonatos; $30.000 si ha
ganado entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10 campeonatos).
B- Realizar un programa principal que instancie un entrenador, cargándole datos leídos
desde teclado. Pruebe el correcto funcionamiento de cada método implementado
 */
package tema3;
import PaqueteLectura.Lector;
public class Punto3Practica2 {
    public static void main(String[] args) {
        Entrenador entren = new Entrenador();
        int sueldo=30000,campg=3;String nombre="Jose";
        Entrenador entren2 = new Entrenador (nombre,campg,sueldo);
        System.out.print("Ingrese el nombre del entrenador: ");entren.setNombre(Lector.leerString());
        System.out.print("Ingrese el sueldo basico del entrenador: ");entren.setSueldo(Lector.leerInt());
        System.out.print("Ingrese la cantidad de campeonatos ganados: ");entren.setCampg(Lector.leerInt());
        entren.calcularSueldoACobrar();
        System.out.println("El sueldo total del entrenador fue: "+entren.getSueldo());
    }
}
