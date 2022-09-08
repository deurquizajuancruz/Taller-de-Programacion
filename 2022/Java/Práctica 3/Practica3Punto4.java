/*
Definir una clase para representar círculos. Los círculos se caracterizan por su radio
(double), el color de relleno (String) y el color de línea (String). El círculo debe saber:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el área y devolverla (método calcularArea)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
B- Realizar un programa que instancie un círculo, le cargue información leída de teclado e
informe en consola el perímetro y el área.
NOTA: la constante PI es Math.PI
 */
package tema3;
import PaqueteLectura.Lector;
public class Practica3Punto4 {
    public static void main(String[] args) {
        System.out.println("Ingrese el radio del circulo: ");double r=Lector.leerDouble();
        System.out.println("Ingrese el color de relleno: ");String cr=Lector.leerString();
        System.out.println("Ingrese el color de linea: ");String cl=Lector.leerString();
        Circulo c=new Circulo(r,cr,cl);
        System.out.println("Info del circulo: \n"+c.toString());
    }
    
}
