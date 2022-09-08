/*
Escriba un programa que simule el ingreso de personas a un banco. Cada
persona que ingresa indica la operación que desea realizar (0: “cobro de cheque” 1:
“depósito/ extracción en cuenta” 2: “pago de impuestos o servicios” 3: “cobro de
jubilación” 4: “cobro de planes”). La recepción de personas culmina cuando un
empleado ingresa la operación 5 (cierre del banco). Informar la cantidad de
personas atendidas por cada operación y la operación más solicitada.
 */
package tema1;
import PaqueteLectura.Lector;
public class Punto6Practica1Parte1 {
    public static void main (String [] args) { 
    int [] banco = new int [5];
    int solicitada,max,i,operacion;
    max=-1;
    System.out.println("Ingrese el numero de la operacion que desea realizar: ");
    System.out.println("0: Cobro de cheque. 1: Depósito/ extracción en cuenta.2: Pago de impuestos o servicios.3: Cobro de jubilación.4: Cobro de planes.");
    operacion = Lector.leerInt();
    while (operacion<5) {
        banco[operacion]+=1;
        System.out.println("Ingrese el numero de la operacion que desea realizar: ");
        System.out.println("0: Cobro de cheque.1: Depósito/ extracción en cuenta.2: Pago de impuestos o servicios.3: Cobro de jubilación.4: Cobro de planes.");
        operacion = Lector.leerInt();}
    solicitada=0;
    for (i=0;i<5;i++) {
        System.out.println("La cantidad de personas atentidas para la operacion " + i + " es de: " + banco[i]);
        if (banco[i]>max){
            max=banco[i];
            solicitada=i;}}
    System.out.println("La operacion mas solicitada fue la numero: "+ solicitada);
    }        
}
