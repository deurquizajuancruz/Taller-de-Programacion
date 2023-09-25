/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;
import PaqueteLectura.*;
/**
 *
 * @author juanc
 */
public class ejercicio2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona [] personas = new Persona[15];
        GeneradorAleatorio.iniciar();
        int edad = GeneradorAleatorio.generarInt(80);
        int diml = 0;
        while (edad != 0 && diml < 15) {
            String nombre = GeneradorAleatorio.generarString(5);
            int dni = GeneradorAleatorio.generarInt(50);
            personas[diml] = new Persona(nombre, dni, edad);
            System.out.println(personas[diml].toString());
            diml++;
            edad = GeneradorAleatorio.generarInt(80);
        }
        int contador = 0;
        int min = Integer.MAX_VALUE;
        Persona menor = null;
        for (int i = 0; i < diml; i++) {
            if (personas[i].getEdad()> 65)
                contador++;
            if (personas[i].getDNI()<min) {
                min = personas[i].getDNI();
                menor = personas[i];
            }
        }
        System.out.println("La cantidad de personas mayores a 65 es " + contador);
        System.out.println("La persona con menor DNI es: " + menor.toString());
    }
    
}
