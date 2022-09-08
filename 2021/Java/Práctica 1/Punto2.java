/*
Escriba un programa que imprima en consola el factorial de todos los números
entre 1 y 9. ¿Qué modificación debe hacer para imprimir el factorial de los
números impares solamente?
 */
package tema1;
public class Punto2Practica1 {
    public static void main (String[] args) {
        int numero,i; numero=1;
        for (i=numero;i<=9;i++) {
            numero=i*numero;
            System.out.println(numero); }
    }
}
