/*
 Utilizando la clase Persona (ya implementada). Realice un programa que almacene en
un vector 15 personas. La información de cada persona debe leerse de teclado. Luego de
almacenar la información:
 - Informe la cantidad de personas mayores de 65 años.
 - Muestre la representación de la persona con menor DNI
*/
package tema2;
import PaqueteLectura.Lector;
public class Punto2Practica1Parte2 {
    public static void main (String [] args ) {
        Persona min = new Persona();
        Persona [] vector = new Persona[3];
        int mayores,i;
        mayores=0;
        min.setDNI(999999);
        for (i=0;i<3;i++) {
            vector[i]=new Persona();
            System.out.print("Ingrese nombre: ");vector[i].setNombre(Lector.leerString());
            System.out.print("Ingrese el dni: ");vector[i].setDNI(Lector.leerInt());
            if (vector[i].getDNI()<min.getDNI())
                min=vector[i];
            System.out.print("Ingrese la edad: ");vector[i].setEdad(Lector.leerInt());
            if (vector[i].getEdad()>65)
                mayores+=1;
}
        System.out.println("La cantidad de personas mayores de 65 años es de: " + mayores);
        System.out.println(min.toString());
    }
}