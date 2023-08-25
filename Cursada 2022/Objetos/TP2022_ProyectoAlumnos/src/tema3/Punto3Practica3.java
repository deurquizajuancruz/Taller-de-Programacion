/*
Definir una clase para representar entrenadores de un club. Un entrenador se
caracteriza por su nombre, sueldo básico, antigüedad y cantidad de campeonatos ganados.
- Defina métodos para obtener/modificar el valor de cada atributo.
- Defina el método calcularEfectividad que devuelve la efectividad del entrenador, que
es el promedio de campeonatos ganados por año de antigüedad.
- Defina el método calcularSueldoACobrar que devuelve el sueldo a cobrar por el
entrenador. El sueldo a cobrar es el sueldo básico agregando un 10% del básico por
año de antigüedad, y además se adiciona un plus por campeonatos ganados (5000$ si
ha ganado entre 1 y 4 campeonatos; $30.000 si ha ganado entre 5 y 10 campeonatos;
50.000$ si ha ganado más de 10 campeonatos).
B- Realizar un programa que instancie un entrenador, cargándole datos leídos desde
teclado. Informe el sueldo a cobrar y la efectividad del entrenador.
 */
package tema3;
import PaqueteLectura.Lector;
public class Punto3Practica3 {
    public static void main(String[] args) {
        System.out.println("Ingrese el nombre del entrenador: ");String nombre=Lector.leerString();
        System.out.println("Ingrese el sueldo: ");double sueldo = Lector.leerDouble();
        System.out.println("Ingrese los años de antiguedad: ");int antiguedad=Lector.leerInt();
        System.out.println("Ingrese los campeonatos ganados: ");double ganados=Lector.leerInt();
        Entrenador e = new Entrenador(nombre,sueldo,antiguedad,ganados);
        System.out.println(e.toString());
    }
}
