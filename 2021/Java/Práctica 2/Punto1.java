/*
 1- A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
El triángulo debe saber:
▪ Devolver/modificar el valor de cada uno de sus atributos (métodos get# y set#)
▪ Calcular el área y devolverla (método calcularArea)
▪ Calcular el perímetro y devolverlo (método calcularPerimetro)
NOTA: Calcular el área con la fórmula Á𝑟𝑒𝑎 = √𝑠(𝑠 − 𝑎)(𝑠 − 𝑏)(𝑠 − 𝑐) , donde a,b y c son
los lados y 𝑠 =
𝑎+𝑏+𝑐
2
. La función raíz cuadrada es Math.sqrt(#)
B- Realizar un programa principal que instancie un triángulo, le cargue información leída
desde teclado e informe en consola el perímetro y el área.
 */
package tema3;
import tema5.Triangulo;
import PaqueteLectura.Lector;
public class Punto1Practica2 {
    public static void main(String[] args) {
        Triangulo triang=new Triangulo();
        double lado1,lado2,lado3;String relleno,linea;
        lado1=3;lado2=6;lado3=8;relleno="amarillo";linea="verde";
        //Triangulo tri2 = new Triangulo(lado1,lado2,lado3,relleno,linea);
        System.out.print("Ingrese el lado 1 del triangulo: ");triang.setLado1(Lector.leerDouble());
        System.out.print("Ingrese el lado 2 del triangulo: ");triang.setLado2(Lector.leerDouble());
        System.out.print("Ingrese el lado 3 del triangulo: ");triang.setLado3(Lector.leerDouble());
        System.out.print("Ingrese el color de relleno del triangulo: ");triang.setColorRelleno(Lector.leerString());
        System.out.print("Ingrese el color de linea del triangulo: ");triang.setColorLinea(Lector.leerString());
        System.out.print("\nEl area del triangulo es: "+ triang.calcularArea()+"\nEl perimetro del triangulo es: "+triang.calcularPerimetro());
    }
}
