package tema1;
import PaqueteLectura.*;
/**
 *
 * @author juanc
 */
public class Ejercicio4 {
    public static void main(String[] args) {
        int [][] edificio = new int [8][4];
        System.out.println("Ingrese numero de piso: ");
        int piso = Lector.leerInt();
        while (piso != 9 ) {
            System.out.println("Ingrese numero de oficina: ");
            int oficina = Lector.leerInt();
            edificio[piso-1][oficina-1]++;
            System.out.println("Ingrese numero de piso: ");
            piso = Lector.leerInt();
        }
        
        for (int i = 0;i < 8; i++) {
            for (int j = 0; j < 4; j ++) 
                System.out.println("A la oficina " + (j+1) + " del piso " + (i+1) + " subieron " + edificio[i][j]);
        }
    }
}
