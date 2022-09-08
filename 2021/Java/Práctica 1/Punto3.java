/*
 Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
básquet y las almacene en un vector. Luego informe:
- la altura promedio
- la cantidad de jugadores con altura por encima del promedio
 */
package tema1;
import PaqueteLectura.Lector;
public class Punto3Practica1Parte1 {
    public static void main (String [] args ) {
       double [] jugadores;
       jugadores = new double[15];
       int i,j,r,cantidad; 
       double promedio;
       for (i=0;i<15;i++) {
           System.out.println("Ingrese una edad: ");
           jugadores[i] = Lector.leerDouble();
       }
       promedio=0;cantidad=0;
       for (j=0;j<15;j++) {
           promedio = promedio + jugadores[j];  
       }
       promedio = promedio/15;
       System.out.println("La altura promedio de todos los jugadores es de: " + promedio);
       for (r=0;r<15;r++) {
           if (jugadores[r]>promedio)
               cantidad = cantidad +1;
       }
       System.out.println("La cantidad de jugadores con una altura mayor a la promedio es: " + cantidad);
    }
}
