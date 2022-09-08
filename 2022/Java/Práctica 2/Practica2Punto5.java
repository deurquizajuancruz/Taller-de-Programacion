/*
Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona y pensar en la estructura de datos a utilizar. 
 */
package tema2;
import PaqueteLectura.Lector;
public class Practica2Punto5 {
    public static void main(String[] args) {
        Persona [][] matriz = new Persona [2][1];
        String nombre;
        int dni,edad;
        System.out.println("Ingrese su nombre: ");nombre=Lector.leerString();
        boolean lleno=false;
        while ((!nombre.equals("ZZZ")) && (lleno==false)) {
            System.out.println("Ingrese su dni: ");dni=Lector.leerInt();
            System.out.println("Ingrese su edad: ");edad=Lector.leerInt();
            lleno=false;
            int i=0,j=0,diabuscado=0,turnobuscado=0;
            while ((lleno==false) && (i<2)) {
                while ((lleno==false) && (j<1)) {
                    if (matriz[i][j]==null) {
                        lleno=true;
                        diabuscado=i;
                        turnobuscado=j;
                    }
                j++;
                }
                j=0;i++;
            }
            if (lleno) {
                matriz[diabuscado][turnobuscado] = new Persona(nombre,dni,edad);
                System.out.println(matriz[diabuscado][turnobuscado].toString() + " El dia asignado fue el numero " +(diabuscado+1) + " en el turno " + (turnobuscado+1));
                System.out.println("Ingrese su nombre: ");nombre=Lector.leerString();
                lleno=false;
            }
            else {
                System.out.println("No hay mas turnos disponibles");
                lleno=true;
            } 
        }  
    }
}
