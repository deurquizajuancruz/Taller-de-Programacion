/*
- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:
 - Informe la cantidad de personas mayores de 65 años.
 - Muestre la representación de la persona con menor DNI.
 */
package tema2;
import PaqueteLectura.GeneradorAleatorio;
public class Practica2Punto2 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Persona [] vector = new Persona [15];
        int i=0,dni,edad=1;String nombre;
        while ((i<15) && (edad!=0)) {
            edad=GeneradorAleatorio.generarInt(80);
            if (edad!=0) {
                dni=GeneradorAleatorio.generarInt(100);
                nombre=GeneradorAleatorio.generarString(10);
                vector[i] = new Persona(nombre,dni,edad);
                i++;
        }
    }
        int j,minimo=150,cant=0;
        Persona menor= new Persona();
        for (j=0;j<i;j++) {
            if (vector[j].getEdad()>65) {
                cant++;
            }
            if (vector[j].getDNI()<minimo) {
                minimo=vector[j].getDNI();
                menor = vector[j];
            }
            System.out.println(vector[j].toString() + j);
        }
        System.out.println("La cantidad de personas mayores a 65 años es de: " + cant);
        System.out.println(menor.toString());
    }
}
