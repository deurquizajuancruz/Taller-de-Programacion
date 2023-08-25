
package tema1;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class Ej02Jugadores {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int dimf=15;
        double [] VectorAlturas = new double [dimf];  
        int i;double promedio=0;
        for (i=0;i<dimf;i++) {
            System.out.print("Ingrese una altura: ");
            VectorAlturas[i]=(GeneradorAleatorio.generarDouble(3));
            System.out.println("La altura ingresada fue: " + VectorAlturas[i]);
            promedio+=VectorAlturas[i];
        }
        promedio=(promedio/dimf);
        System.out.println("El promedio de las alturas de los jugadores es de: " + promedio);
        int masprom=0;
        for (i=0;i<dimf;i++) {
            if (VectorAlturas[i]>promedio) {
                masprom++;
            }
        }
        System.out.println("La cantidad de jugadores que superan el promedio es de: " + masprom);
    }
}
