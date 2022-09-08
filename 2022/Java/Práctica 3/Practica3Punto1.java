/*
Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
El triángulo debe saber:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el área y devolverla (método calcularArea)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.
NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) , donde a, b y c son
los lados y s =
a+b+c
2
. La función raíz cuadrada es Math.sqrt(#)
 */
package tema3;
import PaqueteLectura.Lector;
public class Practica3Punto1 {
    public static void main(String[] args) {
        System.out.println("Instanciacion de un triangulo.");
        System.out.println("Ingrese la medida del lado 1: "); double lado1=Lector.leerDouble();
        System.out.println("Ingrese la medida del lado 2: ");double lado2=Lector.leerDouble();
        System.out.println("Ingrese la medida del lado 3: "); double lado3=Lector.leerDouble();
        System.out.println("Ingrese el color de relleno: ");String colorRelleno = Lector.leerString();
        System.out.println("Ingrese el color de linea: ");String colorLinea =Lector.leerString();
        Triangulo miTriangulo = new Triangulo(lado1,lado2,lado3,colorRelleno,colorLinea);
        System.out.println("Informacion del triangulo: " + miTriangulo.toString());
    }
    
}
