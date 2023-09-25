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
public class ejercicio5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Partido[] p = new Partido[20];
        int diml = 0;
        System.out.println("Visitante: ");
        String visitante = Lector.leerString();
        while (diml < 20 && !visitante.equals("ZZZ")) {
            System.out.println("Local: ");
            String local = Lector.leerString();
            int golesL = GeneradorAleatorio.generarInt(6);
            int golesV = GeneradorAleatorio.generarInt(6);
            p[diml] = new Partido(local, visitante, golesL, golesV);
            diml++;
            System.out.println("Visitante: ");
            visitante = Lector.leerString(); 
        }
        int ganadosRiver = 0;
        int golesBoca = 0;
        for (int i = 0; i < diml; i++) {
            System.out.println(p[i].getLocal() + " " + p[i].getGolesLocal() + " VS " + p[i].getVisitante() + " " + p[i].getGolesVisitante());
            if (p[i].getGanador().equals("River"))
                ganadosRiver++;
            if (p[i].getLocal().equals("Boca"))
                golesBoca+=p[i].getGolesLocal();
        }
        System.out.println("Partidos ganados por River: " + ganadosRiver);
        System.out.println("Goles de Boca de local: " + golesBoca);
    }

}
