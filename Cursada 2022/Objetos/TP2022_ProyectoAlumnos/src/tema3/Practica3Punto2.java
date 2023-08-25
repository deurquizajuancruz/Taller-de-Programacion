/*
Definir una clase para representar balanzas comerciales (para ser utilizadas en
verdulerías, carnicerías, etc). Una balanza comercial sólo mantiene el monto y la cantidad
de items correspondientes a la compra actual (es decir, no almacena los ítems de la
compra). La balanza debe responder a los siguientes mensajes:
- iniciarCompra(): inicia el monto y la cantidad de ítems para la compra actual.
- registrarProducto(pesoEnKg, precioPorKg): recibe el “peso en kilos” del ítem comprado
y su “precio por kilo”, y actualiza el estado de la balanza.
- getMonto(): retorna el monto a pagar por la compra actual.
- getResumenDeCompra(): retorna un String del siguiente estilo “Total a pagar X por la
compra de Y productos” , donde X es el monto e Y es la cantidad de ítems de la compra.
B- Realizar un programa que instancie una balanza e inicie una compra. Lea desde teclado
información de los ítems comprados (peso en kg y precio por kg) hasta ingresar peso 0.
Registre cada producto en la balanza. Al finalizar, informe el resumen de la compra.
 */
package tema3;
import PaqueteLectura.Lector;
public class Practica3Punto2 {
    public static void main(String[] args) {
        Balanza laBalanza = new Balanza();
        laBalanza.iniciarCompra();
        double peso,precio;
        String descripcion;
        System.out.println("Ingrese el peso del producto en kg: ");peso=Lector.leerDouble();
        while (peso!=0) {
            System.out.println("Ingrese el precio por kg del producto:");precio=Lector.leerDouble();
            System.out.println("Ingrese la descripcion del producto: ");descripcion=Lector.leerString();
            Producto p=new Producto(peso,descripcion);
            laBalanza.registrarProducto(p, precio);
            System.out.println("Ingrese el peso del producto en kg: ");peso=Lector.leerDouble();
        }
        System.out.println("Resumen de la compra: " + laBalanza.getResumendeCompra());
    }
}
