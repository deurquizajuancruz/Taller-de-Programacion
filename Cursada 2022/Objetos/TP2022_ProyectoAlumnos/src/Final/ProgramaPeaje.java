/*
Un peaje necesita un sistema para registrar datos de su operación. El sistema debe registrar para cada una de las 8
ventanillas: la cantidad de vehículos que pasaron por ella, la cantidad de vehículos donde viajaba solo el conductor y
el monto recaudado total (entre todos los vehículos).
a) Genere las clases necesarias. Provea constructores para iniciar el sistema con los valores correspondientes a cada
ventanilla en 0. Provea un método que, dado un nro. de ventanilla, permita obtener la información de la misma.
b) Implemente métodos en las clases adecuadas para permitir:
i- Registrar en el sistema los datos de un vehículo (si viaja solo el conductor, monto abonado) que pasa por la
ventanilla número V. Asuma que V es válido.
ii- Obtener el número de ventanilla con menor recaudación promedio (teniendo en cuenta los vehículos que
pasaron).
c) Realice un programa que instancie el sistema y simule el registro del paso de 10 vehículos por distintas ventanillas.
Luego ejecute e imprima la información obtenida del método ii.
 */
package Final;
import PaqueteLectura.GeneradorAleatorio;
public class ProgramaPeaje {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        System.out.println("Sistema de ventanillas.");
        Peaje ventanillas =new Peaje();
        int cantP,nroV;
        double monto;
        for (int i=0;i<10;i++) {
            cantP=GeneradorAleatorio.generarInt(5)+1;
            nroV=GeneradorAleatorio.generarInt(8);
            monto=GeneradorAleatorio.generarDouble(500)+1;
            Vehiculo v = new Vehiculo(cantP,monto);
            ventanillas.VehiculoXV(nroV, v);
        }
        System.out.println("La ventanilla con menor recaudacion promedio fue "+ventanillas.menorRecaudacion());
    }
    
}
