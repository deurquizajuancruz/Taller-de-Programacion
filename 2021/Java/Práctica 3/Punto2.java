package tema5;
import PaqueteLectura.Lector;
public class Punto2Practica3 {
    public static void main (String[] args) {
        System.out.println("Instanciacion del jugador.");
        int partidosjugados,golesanotados;String nombre;double sueldobasico;
        System.out.print("Ingrese el nombre del jugador: ");nombre=Lector.leerString();
        System.out.print("Ingrese el sueldo basico del jugador: ");sueldobasico=Lector.leerDouble();
        System.out.print("Ingrese la cantidad de partidos jugados del jugador: ");partidosjugados=Lector.leerInt();
        System.out.print("Ingrese la cantidad de goles anotados del jugador: ");golesanotados=Lector.leerInt();
        Jugadores jug=new Jugadores(partidosjugados,golesanotados,nombre,sueldobasico);
        System.out.print("Informacion del jugador " + jug.toString());
        System.out.println("\nInstanciacion del entrenador.");
        String nombreEntrenador;double sueldoBEntrenador;int campeonatosg;
        System.out.print("Ingrese el nombre del entrenador: ");nombreEntrenador=Lector.leerString();
        System.out.print("Ingrese el sueldo basico del entrenador: ");sueldoBEntrenador=Lector.leerDouble();
        System.out.print("Ingrese la cantidad de campeonatos ganados del entrenador: ");campeonatosg=Lector.leerInt();
        Entrenadores ent=new Entrenadores(campeonatosg,nombreEntrenador,sueldoBEntrenador);
        System.out.print("Informacion del entrenador: "+ ent.toString());
    }
}
