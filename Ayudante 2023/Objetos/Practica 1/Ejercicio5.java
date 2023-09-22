/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;
import PaqueteLectura.*;
/**
 *
 * @author juanc
 */
public class Ejercicio5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        double [][] c = new double [5][4];
        for (int i = 0; i < 5; i++) {
            System.out.println("Turno del cliente numero " + (i+1));
            for (int j = 0; j < 4; j++) {
                System.out.println("Ingrese calificacion del aspecto numero " + j);
                //c[i][j]=Lector.leerDouble();
                c[i][j]=GeneradorAleatorio.generarDouble(11);
                System.out.println(c[i][j]);
            }
        }
        for (int j = 0; j < 4; j++) {
            double s=0;
            for (int i = 0; i < 5; i ++)
                s+=c[i][j];
            System.out.println("El promedio de la calificacion del aspecto numero " + j + " es de " + s/5);
        }
    }
    
}
