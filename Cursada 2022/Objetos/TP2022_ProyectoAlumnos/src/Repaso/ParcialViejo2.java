package Repaso;
import PaqueteLectura.GeneradorAleatorio;
public class ParcialViejo2 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Sorteo comun = new Sorteo(52325);
        SorteoAvanzado avanzado = new SorteoAvanzado(50000);
        String nombre; int dni; double colab;
        for (int i=0;i<50;i++) {
            nombre=GeneradorAleatorio.generarString(5);
            dni=GeneradorAleatorio.generarInt(500);
            colab=GeneradorAleatorio.generarDouble(100);
            Personas unaP = new Personas(nombre,dni,colab);
            comun.asignarBono(unaP);
        }
        System.out.println("Sorteo comun: ");comun.imprimirVector();
        Personas obtener = comun.obtenerPersona(3);
        if (obtener!=null) {
            System.out.println("La persona con el nro de bono 3 es: "+obtener.getNombre());
        }
        for (int i=0;i<30;i++) {
            nombre=GeneradorAleatorio.generarString(5);
            dni=GeneradorAleatorio.generarInt(500);
            colab=GeneradorAleatorio.generarDouble(100);
            Personas unaP = new Personas(nombre,dni,colab);
            avanzado.asignarBono(unaP);
        }
        System.out.println("Sorteo avanzado: ");avanzado.imprimirVector();
        Personas obtener2 = avanzado.obtenerPersona(3);
        if (obtener2!=null) {
            System.out.println("La persona con el nro de bono 3 es: " + obtener2.getNombre());
        }
        System.out.println("La persona ganadora del sorteo comun es: " + comun.ejecutarSorteo().getNombre() + " Ganó " + comun.getPremio());
        Personas ganadoraAvanzado = avanzado.ejecutarSorteo();
        System.out.println("La persona ganadora del sorteo avanzado es: " + ganadoraAvanzado.getNombre() + " ya que hizo una colaboracion de: " + ganadoraAvanzado.getColaboracion() + " ganando " + avanzado.getPremio());
    }
    
}
