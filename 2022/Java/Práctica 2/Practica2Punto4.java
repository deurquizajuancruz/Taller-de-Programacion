/*
 Realice un programa que cargue un vector con 10 Strings leídos desde teclado. El vector
generado tiene un mensaje escondido que se forma a partir de la primera letra de cada
string. Genere un nuevo string con el mensaje escondido y muéstrelo en consola.
NOTA: La primer letra de un String se obtiene enviando el mensaje charAt(0) al objeto.
Ingrese: humo oso lejos ala menos usado nene de ocho ! Debería imprimir: holamundo!
 */
package tema2;
import PaqueteLectura.Lector;
public class Practica2Punto4 {
    public static void main(String[] args) {
       String [] vector = new String [10];
       for (int i=0;i<10;i++) {
           System.out.println("Ingrese un String: ");
           vector[i]=Lector.leerString();
       }
       System.out.println("El mensaje escondido es: ");
       for (int i=0;i<10;i++) {
           System.out.print(vector[i].charAt(0));
       } 
    }
}
