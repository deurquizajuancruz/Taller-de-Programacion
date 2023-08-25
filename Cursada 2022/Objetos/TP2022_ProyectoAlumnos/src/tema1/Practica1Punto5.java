/*
El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto.
 */
package tema1;
import PaqueteLectura.Lector;
public class Practica1Punto5 {
    public static void main(String[] args) {
        int [][] rating = new int [5][4];
        int i,j;
        System.out.println("Clasifique los aspectos según su código del 1 al 10: 0) Atención al cliente. 1) Calidad de la comida. 2) Precio. 3) Ambiente.");
        for (i=0;i<5;i++) {
            System.out.println("Cliente numero " + (i+1));
            for (j=0;j<4;j++) {
                System.out.println("Clasifique el aspecto " + j);
                rating[i][j]=Lector.leerInt();
            }
        }
        double [] promedios = new double [4];
        double promedio=0;
        for (j=0;j<4;j++) {
            for (i=0;i<5;i++) {
                promedio+=rating[i][j];
            }
            promedio=(promedio/5);
            promedios[j]=promedio;promedio=0;
        }
        for (i=0;i<4;i++) {
            System.out.println("El promedio del aspecto " + i + " es: " + promedios[i]);
        }
    }
}
