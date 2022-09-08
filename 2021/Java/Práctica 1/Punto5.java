/*
 Un edificio de oficinas está conformado por 8 pisos y 4 oficinas por piso. Realice
un programa que permita informar la cantidad de personas que concurrieron a
cada oficina de cada piso. Para esto, simule la llegada de personas al edificio de la
siguiente manera: a cada persona se le pide el nro. de piso y nro. de oficina a la cual
quiere concurrir. La llegada de personas finaliza al indicar un nro. de piso 9. Al
finalizar la llegada de personas, informe lo pedido.
 */
package tema1;
import PaqueteLectura.Lector;
public class Punto5Practica1Parte1 {
    public static void main (String [] args ){
    int[][] edificio = new int [8][4];
    int piso,oficina,i,j;
    System.out.println("Ingrese el nro de piso: ");
    piso = Lector.leerInt();
    while (piso<9){
        System.out.println("Ingrese el nro de oficina: ");
        oficina = Lector.leerInt();
        edificio[piso-1][oficina-1]+=1;
        System.out.println("Ingrese el nro de piso: ");
        piso = Lector.leerInt();}
    for (i=0;i<8;i++) {
        for (j=0;j<4;j++) 
        System.out.println("La cantidad de personas que concurrieron al piso " + (i+1) + " oficina numero " + (j+1) + "es de: " + edificio[i][j]);}
    }
}
