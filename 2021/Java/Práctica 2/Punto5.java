/*
5-A- Modifique el ejercicio 2-A. Ahora la balanza debe poder generar un resumen de
compra más completo. Para eso agregue a la balanza la característica resumen (String).
Modifique los métodos:
▪ iniciarCompra para que además inicie el resumen en el String vacío.
▪ registrarProducto para que reciba un objeto Producto (que se caracteriza por peso en
kg y descripción) y su precio por kg. La operación debe realizar las actualizaciones en
monto /cantidad de ítems y adicionar al resumen (string) la descripción y el monto
pagado por este producto.
▪ devolverResumenDeCompra() para que retorne un String del siguiente estilo:
“Naranja 100 pesos – Banana 40 pesos – Lechuga 50 pesos – Total a pagar 190 pesos
por la compra de 3 productos” . La sección subrayada es el contenido de resumen.
Realice las modificaciones necesarias en el programa principal solicitado en 2-B para
corroborar el funcionamiento de la balanza. 
 */
package tema3;
import PaqueteLectura.Lector;
public class Punto5Practica2 {
    public static void main (String [] args) {
        Balanza balan = new Balanza();
        double precio,peso;
        String descripcion;
        System.out.print("Ingrese el peso en kg: ");peso=Lector.leerDouble();
        balan.iniciarCompra();
        while (peso!=0) {
        System.out.print("Ingrese el precio por kg: ");precio=Lector.leerDouble();
        System.out.print("Ingrese la descripcion del producto: ");descripcion=Lector.leerString();
        balan.registrarProducto(peso, precio,descripcion);
        System.out.print("Ingrese el peso en kg: ");peso=Lector.leerDouble();
        }
        System.out.print(balan.devolverResumenDeCompra());}}