/*
B- Genere un programa que cree una flota vacía. Cargue micros (sin pasajeros) a la flota
con información leída desde teclado (hasta que se ingresa la patente “ZZZ000” o hasta
completar la flota). Luego lea una patente y elimine de la flota el micro con esa patente;
busque el micro con dicha patente para comprobar que ya no está en la flota. Para
finalizar, lea un destino e informe la patente del micro que va a dicho destino.
 */
package tema4;
import PaqueteLectura.Lector;
public class Punto5Practica2Parte2 {
    public static void main (String [] args) {
        String patente,destino;double hsalida;
        Flota flotamicros=new Flota();
        System.out.print("A continuacion se pedira info de 15 micros o hasta que se ingrese la patente ZZZ000");
        System.out.print("Ingrese la patente: ");patente=Lector.leerString();
        System.out.print("Ingrese el destino: ");destino=Lector.leerString();
        System.out.print("Ingrese la hora de salida: ");hsalida=Lector.leerDouble();
        while ((flotamicros.completa()==false) && (!patente.equals("ZZZ000"))){
            Micro nuevomicro=new Micro(patente,destino,hsalida);
            flotamicros.agregar(nuevomicro);
            System.out.print("Ingrese la patente: ");patente=Lector.leerString();
            if (!patente.equals("ZZZ000")) {
                System.out.print("Ingrese el destino: ");destino=Lector.leerString();
                System.out.print("Ingrese la hora de salida: ");hsalida=Lector.leerDouble();
        }}
        String patenteeliminar,destinobuscado;
        System.out.print("Ingrese la patente del micro a eliminar: ");patenteeliminar=Lector.leerString();
        System.out.print(flotamicros.eliminar(patenteeliminar)+ "\n");
        System.out.print(flotamicros.eliminada(patenteeliminar)+ "\n");
        System.out.println("Ingrese un destino previamente ingresado para informar la patente del micro que va allí: ");destinobuscado=Lector.leerString();
        System.out.print("La patente del micro que se dirige alli es: "+flotamicros.buscarDestino(destinobuscado).getPatente());}
}
