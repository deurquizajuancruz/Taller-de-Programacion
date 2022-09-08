/* Escriba un programa que imprima en consola el factorial de un número N
(ingresado por teclado, N > 0). Ejemplo: para N=5 debería imprimir 5! = 120
*/
package tema1;

import PaqueteLectura.Lector;

public class Punto1Practica1 {
    public static void main (String[] args) {
        System.out.println("Ingrese un numero: ");
        int numero =Lector.leerInt();
        int i;
        for (i=numero-1;i>1;i--)
            numero=i*numero;
        System.out.println("El resultado del factorial del numero ingrresado es: " + numero);
    }
}
