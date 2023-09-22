
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        double [] alturas = new double[15];
        double suma = 0;
        for (int i = 0; i < 15; i++) {
            System.out.println("Ingrese la edad numero "+i);
            alturas[i]=Lector.leerDouble();
            suma+=alturas[i];
        }
        double promedio = suma / 15;
        System.out.println("El promedio de altura es: " + promedio);
        int cant = 0;
        for (int i = 0; i < 15; i++) {
            if (alturas[i]>promedio)
                cant++;
        }
        System.out.println("La cantidad que supera el promedio es: "+cant);
    }
    
}
