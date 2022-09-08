/*
Una fábrica necesita un sistema para administrar sus sectores y trabajadores. 
La fábrica tiene dos sectores (producción y ensamblado). 
Los sectores conocen el nombre del jefe a cargo y la información de sus trabajadores (a lo sumo 20). 
De los trabajadores se registra nombre, dni y antigüedad en años.
Genere las clases necesarias. 
Provea constructores para iniciar: la fábrica a partir de sus dos sectores; los sectores sin trabajadores y a partir del jefe a cargo; los trabajadores a partir de toda su información. 
Implemente métodos en las clases adecuadas para permitir:
Agregar un trabajador a un sector. Asuma que hay espacio.
Agregar un trabajador a la fábrica. El trabajador se debe agregar en el sector producción si su antigüedad es menor a 10 años, y al sector ensamblado en caso contrario. Asuma que hay espacio en ambos sectores.
Obtener un string con los nombres de todos trabajadores de la fábrica (jefes + trabajadores).
Implemente un programa que instancie una fábrica con sus dos sectores. Cargue a la fábrica 4 trabajadores. A partir de la fábrica obtenga y muestre los nombres de todos los trabajadores.

*/
package Final;
import PaqueteLectura.GeneradorAleatorio;
public class ProgramaFabrica {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        System.out.println("Informacion de la fabrica y sus sectores.");
        int antiguedad,dni;
        String nombre,jefe;
        jefe=GeneradorAleatorio.generarString(6);
        Sectores produccion=new Sectores(jefe);
        jefe=GeneradorAleatorio.generarString(6);
        Sectores ensamblado=new Sectores(jefe);
        Fabrica F = new Fabrica(produccion,ensamblado);
        for (int i=0;i<10;i++){
            antiguedad=GeneradorAleatorio.generarInt(15)+1;
            dni=GeneradorAleatorio.generarInt(20)+1;
            nombre=GeneradorAleatorio.generarString(10);
            Trabajadores T = new Trabajadores(nombre,dni,antiguedad);
            F.TrabajadorSeccion(T);
        }
        String resultado=F.toString();
        System.out.println(resultado);
    }
    
}
