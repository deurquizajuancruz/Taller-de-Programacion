/*
Un edificio de oficinas está conformado por 8 pisos y 4 oficinas por piso. Realice
un programa que permita informar la cantidad de personas que concurrieron a
cada oficina de cada piso. Para esto, simule la llegada de personas al edificio de la
siguiente manera: a cada persona se le pide el nro. de piso y nro. de oficina a la cual
quiere concurrir. La llegada de personas finaliza al indicar un nro. de piso 9. Al
finalizar la llegada de personas, informe lo pedido
*/
package tema1;
import PaqueteLectura.Lector;
public class Practica1Punto4 {
    public static void main(String[] args) {
        int [] [] oficina = new int [8][4];
        int i,j;
        for (i=0;i<8;i++) {
            for (j=0;j<4;j++) {
                oficina[i][j]=0;
            }
        }
        int piso,nrooficina;
        System.out.println("Ingrese el numero de piso (0 al 7): ");
        piso=Lector.leerInt();
        while (piso!=9) {
            System.out.println("Ingrese el numero de oficina(0 al 3): ");
            nrooficina=Lector.leerInt();
            oficina[piso][nrooficina]++;
            System.out.println("Ingrese el numero de piso(0 al 7): ");
            piso=Lector.leerInt();
        }
        for (i=0;i<8;i++) {
            for (j=0;j<4;j++) {
                System.out.println("El numero de personas que concurrieron al piso " + i + " oficina " + j + " fue de: " + oficina[i][j]);
            }
        }
    }
}
