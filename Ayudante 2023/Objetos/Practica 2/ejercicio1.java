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
public class ejercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona p = new Persona();
        System.out.println("Ingrese nombre: ");
        p.setNombre(Lector.leerString());
        System.out.println("Ingrese edad: ");
        p.setEdad(Lector.leerInt());
        System.out.println("Ingrese DNI: ");
        p.setDNI(Lector.leerInt());
        System.out.println(p.toString());
    }
    
}
