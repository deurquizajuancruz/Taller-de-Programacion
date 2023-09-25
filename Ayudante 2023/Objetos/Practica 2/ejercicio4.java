/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.*;
import java.util.Arrays;

/**
 *
 * @author juanc
 */
public class ejercicio4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona[][] p = new Persona[5][8];
        int anotados = 0;
        GeneradorAleatorio.iniciar();
        String nombre = GeneradorAleatorio.generarString(3);
        int [] dimls = new int [5];
        Arrays.fill(dimls, 0);
        while (anotados < 10 && !nombre.equals("ZZZ")) {
            int edad = GeneradorAleatorio.generarInt(60);
            int dni = GeneradorAleatorio.generarInt(600);
            System.out.println("Ingrese dia para anotarse: ");
            int dia = Lector.leerInt();
            if (dimls[dia] < 8) {
                p[dia][dimls[dia]] = new Persona(nombre, dni, edad);
                dimls[dia]++;
                anotados++;
            } else
                System.out.println("No hay mas turnos disponibles en el dia ingresado");
            //nombre = Lector.leerString();
            nombre = GeneradorAleatorio.generarString(3);
        }
        for (int i = 0; i < 5; i ++) {
            for (int j = 0; j < dimls[i]; j++) {
                System.out.println("Dia " + i + " entrevista " + j + " es de la persona: " + p[i][j].getNombre());
            }
            System.out.println("En el dia " + i + " hubo " + dimls[i] + " anotados");
        }
    }
    
}
