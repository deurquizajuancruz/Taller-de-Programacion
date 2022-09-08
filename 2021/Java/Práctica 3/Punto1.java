/*
 C- Escriba un programa que instancie un triángulo, un círculo y un cuadrado, con
información leída desde teclado. Luego muestre en consola el área y perímetro de cada
uno y su representación en String.
 */
package tema5;
import PaqueteLectura.Lector;
public class Punto1Practica3 {
    public static void main (String[] args) {
        System.out.println("Instanciacion del triangulo. ");
        double lado1,lado2,lado3;String CRT,CLT;
        System.out.print("Ingrese la medida del lado 1: ");lado1=Lector.leerDouble();
        System.out.print("Ingrese la medida del lado 2: ");lado2=Lector.leerDouble();
        System.out.print("Ingrese la medida del lado 3: ");lado3=Lector.leerDouble();
        System.out.print("Ingrese el color de relleno: ");CRT=Lector.leerString();
        System.out.print("Ingrese el color de linea: ");CLT=Lector.leerString();
        Triangulo tri=new Triangulo(CRT,CLT,lado1,lado2,lado3);System.out.print("Informacion del triangulo: ");System.out.println(tri.toString());
        System.out.println("Instanciacion del cuadrado. ");double lado;String CRC,CLC;
        System.out.print("Ingrese la medida del lado: ");lado=Lector.leerDouble();
        System.out.print("Ingrese el color de relleno: ");CRC=Lector.leerString();
        System.out.print("Ingrese el color de linea: ");CLC=Lector.leerString();
        Cuadrado cua=new Cuadrado(lado,CRC,CLC);System.out.print("Informacion del cuadrado: ");System.out.println(cua.toString());
        System.out.println("Instanciacion del circulo. ");double radio;String CRCI,CLCI;
        System.out.print("Ingrese el radio: ");radio=Lector.leerDouble();
        System.out.print("Ingrese el color de relleno: ");CRCI=Lector.leerString();
        System.out.print("Ingrese el color de linea: ");CLCI=Lector.leerString();
        Circulo cir=new Circulo(radio,CRCI,CLCI);System.out.print("Informacion del circulo: ");System.out.print(cir.toString());
    } 
}
