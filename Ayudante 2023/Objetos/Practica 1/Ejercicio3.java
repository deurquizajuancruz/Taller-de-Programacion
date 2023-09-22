/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.*;
public class Ej03Matrices {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
	int [] [] matriz = new int [5][5];     
	for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) 
                matriz[i][j]=GeneradorAleatorio.generarInt(30);
        }
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) 
                System.out.println("Posicion " + i + " " + j + " " + matriz[i][j]);
        }
        int suma = 0;
        for (int i = 0; i < 5; i++) {
            suma+=matriz[0][i];
        }
        System.out.println("Suma elementos fila 1: " + suma);
        int [] vector = new int[5];
        for (int j = 0; j < 5; j++) {
            int sumaC = 0;
            for (int i = 0; i < 5; i++) 
                sumaC+=matriz[i][j];
            vector[j]=sumaC;
        }
        for (int i = 0; i < 5; i++) {
            System.out.println("Suma de la columna " + i + " " + vector[i]);
        }
        System.out.println("Ingrese numero para ver si esta en la matriz");
        int num = Lector.leerInt();
        boolean ok = false;
        for (int i = 0; i < 5 && !ok; i++) {
            for (int j = 0; j < 5 && !ok; j++) {
                if (matriz[i][j]==num) {
                    System.out.println("Se encontro el numero en la fila " + i + " y columna " + j);
                    ok=true;
                }
            }
        }
        if (!ok)
            System.out.println("No se encontro el elemento");
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".

    }
}
