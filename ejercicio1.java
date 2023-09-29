/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.*;
/**
 *
 * @author alumnos
 */
public class ejercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Triangulo t = new Triangulo(Lector.leerDouble(), Lector.leerDouble(), Lector.leerDouble(), Lector.leerString(), Lector.leerString());
        System.out.println("Perimetro " + t.calcularPerimetro());
        System.out.println("Area: " + t.calcularArea());
    }
    
}
