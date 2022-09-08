/*
Se dispone de la clase Partido (ya implementada en la carpeta tema2). Un objeto
partido representa un encuentro entre dos equipos (local y visitante). Un objeto partido
puede crearse sin valores iniciales o enviando en el mensaje de creación el nombre del
equipo local, el nombre del visitante, la cantidad de goles del local y del visitante (en ese
orden). Un objeto partido sabe responder a los siguientes mensajes:
getLocal() retorna el nombre (String) del equipo local
getVisitante() retorna el nombre (String) del equipo visitante
getGolesLocal() retorna la cantidad de goles (int) del equipo local
getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
setLocal(X) modifica el nombre del equipo local al “String” pasado por parámetro (X)
setVisitante(X) modifica el nombre del equipo visitante al “String” pasado por parámetro (X)
setGolesLocal(X) modifica la cantidad de goles del equipo local “int” pasado por parámetro (X)
setGolesVisitante(X) modifica la cantidad de goles del equipo visitante “int” pasado por parámetro (X)
hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna un String
vacío).
hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate
Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en el
campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga informar:
- La cantidad de partidos que ganó River.
- El total de goles que realizó Boca jugando de local.
- El porcentaje de partidos finalizados con empate. 
 */
package tema2;
import PaqueteLectura.Lector;
public class Punto6Practica1Parte2 {
    public  static void main(String [] args ){
        Partido [] vector = new Partido[20];
        int i,dim,ganaRiver,golesBoca,empate;
        double porcentaje;
        dim=0;ganaRiver=0;golesBoca=0;empate=0;
        String local;
        System.out.print("Ingrese el nombre del equipo local: ");local=Lector.leerString();
        while ((dim<20) &&(!local.equals("ZZZ")) ){
            vector[dim]=new Partido(local,"",0,0);
            System.out.print("Ingrese el nombre del equipo visitante: ");vector[dim].setVisitante(Lector.leerString());
            System.out.print("Ingrese la cantidad de goles del equipo local: ");vector[dim].setGolesLocal(Lector.leerInt());
            System.out.print("Ingrese la cantidad de goles del equipo visitante: ");vector[dim].setGolesVisitante(Lector.leerInt());
            dim++;
            System.out.print("Ingrese el nombre del equipo local: ");local=Lector.leerString();
        }
        for(i=0;i<dim;i++){
            if (vector[i].getGanador().equals("River")) {
                ganaRiver++;}
            if (vector[i].getLocal().equals("Boca")) {
                golesBoca+=vector[i].getGolesLocal();}
            if (vector[i].hayEmpate()) {
                empate++;
            }
        }
        System.out.println("La cantidad de partidos que gano River es de: "+ganaRiver);
        System.out.println("El total de goles que realizó Boca jugando de local fue de: "+golesBoca);
        porcentaje=(((double)empate/dim)*100);
        System.out.println("El porcentaje de partidos finalizados con empate fue de: "+porcentaje+"%");
    }
}