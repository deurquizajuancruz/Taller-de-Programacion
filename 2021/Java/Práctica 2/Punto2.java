/*
 2- A – Definir una clase para representar balanzas comerciales (para ser utilizadas en
verdulerías, carnicerías, etc). Una balanza comercial sólo mantiene el monto y la cantidad
de items correspondientes a la compra actual (es decir, no almacena los ítems de la
compra). La balanza debe responder a los siguientes mensajes:
▪ iniciarCompra(): inicializa el monto y cantidad de ítems de la compra actual.
▪ registrarProducto(pesoEnKg, precioPorKg): recibe el peso en kg del ítem comprado y
su precio por kg, debiendo realizar las actualizaciones en el estado de la balanza.
▪ devolverMontoAPagar(): retorna el monto de la compra actual.
▪ devolverResumenDeCompra(): retorna un String del siguiente estilo “Total a pagar X
por la compra de Y productos” , donde X es el monto e Y es la cantidad de ítems de la
compra.
B - Genere un programa principal que cree una balanza e inicie una compra. Lea
información desde teclado correspondiente a los ítems comprados (peso en kg y precio
por kg) hasta que se ingresa uno con peso 0. Registre cada producto en la balanza. Al
finalizar, informe el resumen de la compra. 
 */
package tema3;
import PaqueteLectura.Lector;
public class Punto2Practica2 {
    public static void main(String[] args) {
        Balanza balan = new Balanza();
        double precio,peso;
        balan.iniciarCompra();
        System.out.print("Ingrese el peso por kg: ");peso=Lector.leerDouble();
        while (peso!=0) {
        System.out.print("Ingrese el precio por kg: ");precio=Lector.leerDouble();
        //balan.registrarProducto(peso, precio);
        System.out.print("Ingrese el peso por kg: ");peso=Lector.leerDouble();
        }
        System.out.print(balan.devolverResumenDeCompra());
    }
}
