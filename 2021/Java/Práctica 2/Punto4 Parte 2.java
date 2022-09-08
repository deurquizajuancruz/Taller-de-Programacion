/*
B- Realice un programa que cree un micro con patente “ABC123”, destino “Mar del Plata” y
hora de salida 5:00. Cargue pasajeros al micro de la siguiente manera. Leer nros. de
asientos desde teclado que corresponden a pedidos de personas. La lectura finaliza cuando
se ingresa el nro. de asiento -1 o cuando se llenó el micro. Para cada nro. de asiento leído
debe: validar el nro; en caso que esté libre, ocuparlo e informar a la persona el éxito de la
operación; en caso que esté ocupado informar a la persona la situación y mostrar el nro.
del primer asiento libre. Al finalizar, informe la cantidad de asientos ocupados del micro
 */
package tema4;
import PaqueteLectura.Lector;
public class Punto4Practica2Parte2 {
    public static void main (String [] args) {
        Micro micro1 = new Micro("ABC123","Mar del Plata",5);
        int asiento=0;
        while (asiento!=-1 && !micro1.getLleno()) {
            System.out.print("\nIngrese su numero de asiento: ");asiento=Lector.leerInt();
            if (micro1.validar(asiento-1)) {
                if (micro1.estado(asiento-1)==false) {
                    micro1.ocupar(asiento-1);
                    System.out.print("Su asiento fue ocupado con éxito!");
                }
                else {
                    System.out.println("Lo sentimos, ese numero de asiento ya esta ocupado. Sin embargo, el proximo asiento libre es: " + micro1.primerLibre() + ".Si el numero es -1, entonces no hay mas asientos libres. ");
            }
        }
            else {
                System.out.println("El numero de asiento ingresado no es valido.");
            }
    }
    System.out.println("La cantidad de asientos ocupados en el micro es de: " + micro1.getAsientosocupados());
}
}
