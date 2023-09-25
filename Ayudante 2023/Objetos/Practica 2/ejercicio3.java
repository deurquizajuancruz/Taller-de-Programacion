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
public class ejercicio3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona[][] p = new Persona[5][8];
        int anotados = 0;
        GeneradorAleatorio.iniciar();
        String nombre = GeneradorAleatorio.generarString(3);
        int dia = 0;
        int [] dimls = new int [5];
        Arrays.fill(dimls, 0);
        int ultimoDia = -1;
        while (anotados < 40 && !nombre.equals("ZZZ")) {
            int edad = GeneradorAleatorio.generarInt(60);
            int dni = GeneradorAleatorio.generarInt(600);
            p[dia][dimls[dia]] = new Persona(nombre, dni, edad);
            dimls[dia]++;
            ultimoDia = dia;
            if (dimls[dia] == 8)
                dia++;
            //nombre = Lector.leerString();
            nombre = GeneradorAleatorio.generarString(3);
            anotados++;
        }
        for (int i = 0; i <= ultimoDia; i++) {
            for (int j = 0; j < dimls[i]; j++) {
                System.out.println("Dia " + i + " entrevista " + j + " es de la persona: " + p[i][j].getNombre());
            }
        }
    }

}
