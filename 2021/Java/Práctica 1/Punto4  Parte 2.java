/*
 4- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
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
public class Punto4Practica1Parte2 {
    public static void main (String [] args) {
        Persona [][] matriz = new Persona [5][8];
        int i,j,dimf,dimc,dni,edad;String nombre;
        dimf=0;dimc=0;
        System.out.print("Ingrese el nombre: ");nombre=Lector.leerString();
        while ((dimf<5) && (!nombre.equals("ZZZ"))) {
            dimc=0;
            while ((dimc<8)&& (!nombre.equals("ZZZ"))) {
                System.out.print("Ingrese edad: ");edad=Lector.leerInt();
                System.out.print("Ingrese DNI: ");dni=Lector.leerInt();
                matriz[dimf][dimc]=new Persona(nombre,dni,edad);
                System.out.println("Esos fueron los datos del participante anotado en el dia "+(dimf+1)+" y turno "+(dimc+1));
                dimc++;System.out.print("Ingrese el nombre: ");nombre=Lector.leerString();}
            dimf++;}
        for (i=0;i<dimf;i++) {
            for (j=0;j<dimc;j++) {
                System.out.println("El nombre de la persona participando en el dia "+(i+1)+" turno "+(j+1)+" es: "+ matriz[i][j].getNombre());}}}}