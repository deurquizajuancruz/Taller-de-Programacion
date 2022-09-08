/*
 Escriba un programa que defina una matriz de enteros de tamaño 10x10.
Inicialice la matriz con números aleatorios entre 0 y 200.
Luego realice las siguientes operaciones:
- Mostrar el contenido de la matriz en consola.
- Calcular e informar la suma de todos los elementos almacenados entre las
filas 2 y 9 y las columnas 0 y 3
- Generar un vector de 10 posiciones donde cada posición i contiene la suma
de los elementos de la columna i de la matriz.
- Lea un valor entero e indique si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario
imprima “No se encontró el elemento”.
NOTA: Dispone de un esqueleto para este programa en Ej04Matrices.java
 */
package tema1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Punto4Practica1Parte1 {
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        int [][] matriz = new int [10][10];
        int j,i,suma,columna,valor;suma=0;
        for (i=0;i<10;i++) {
            for (j=0;j<10;j++) {
                matriz[i][j] = GeneradorAleatorio.generarInt(200);}}
        System.out.println("Elementos de la matriz: ");
        for (i = 0; i < 10; i++) {
            for (j = 0; j < 10; j++) {
        System.out.print(matriz[i][j] + " ");}
        System.out.println();}
        for (i=2;i<10;i++) {
            for (j=0;j<4;j++) {
                suma+=matriz[i][j];}}
        System.out.println("La suma de todos los elemen\tos almacenados entre las filas 2 y 9 y las columnas 0 y 3 es igual a: " + suma);
        int [] vector = new int [10];
        for (i=0;i<10;i++) { 
            columna=0;
            for (j=0;j<10;j++) {
            columna+= matriz[i][j]; }
        vector[i]=columna;
        System.out.print(vector[i]+ "-");}
        System.out.println();
        System.out.println("Ingrese un numero para buscar en la matriz: ");
        valor = Lector.leerInt();
        int f,c; boolean estar;
        estar=false;f=0;c=0;
        for (i=0;i<10;i++) {
            for (j=0;j<10;j++) {
                if (matriz[i][j]== valor){
                        estar=true; f=i;c=j;}}}
        if (estar)
           System.out.println("El numero sí estaba en la matriz y su posicion era: Fila " + f + ". Columna " + c);
        else
          System.out.println("No se encontró el elemento");}}