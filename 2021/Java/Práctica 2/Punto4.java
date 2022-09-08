/*
4-A- Generar una clase para representar círculos. Los círculos se caracterizan por su radio
(double), el color de relleno (String) y el color de línea (String). El círculo debe saber:
▪ Devolver/modificar el valor de cada uno de sus atributos (get# y set#)
▪ Calcular el área y devolverla. (método calcularArea)
▪ Calcular el perímetro y devolverlo. (método calcularPerimetro)
NOTA: la constante PI es Math.PI
 B- Realizar un programa principal que instancie un círculo, le cargue información leída
de teclado e informe en consola el perímetro y el área.
 */
package tema3;
import tema5.Circulo;
import PaqueteLectura.Lector;
public class Punto4Practica2 {
    public static void main (String[] args) {
        Circulo circ = new Circulo();
        double radio;String relleno,linea;
        radio=4.5;relleno="azul";linea="blanco";
        Circulo circ2= new Circulo(radio,relleno,linea);
        System.out.print("Ingrese el radio del circulo: ");circ.setRadio(Lector.leerDouble());
        System.out.print("Ingrese el color de relleno del circulo: ");circ.setColorRelleno(Lector.leerString());
        System.out.print("Ingrese el color de linea del circulo: ");circ.setColorLinea(Lector.leerString());
        System.out.println("El area del circulo es: "+circ.calcularArea());
        System.out.println("El perimetro del circulo es: "+circ.calcularPerimetro());
    }
}
