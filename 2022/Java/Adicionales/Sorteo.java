package Repaso;
import PaqueteLectura.GeneradorAleatorio;
public class Sorteo {
    private double premio;
    private Personas [] bonos;
    private int dimf=100;
    //constructor

    public Sorteo(double premio) {
        this.premio = premio;
        bonos = new Personas[dimf];
    }
    
    //metodos

    public double getPremio() {
        return premio;
    }

    public void setPremio(double premio) {
        this.premio = premio;
    }

    public int getDimf() {
        return dimf;
    }
    
    public Personas getPersona(int i) {
        return bonos[i];
    }
    
    public int asignarBono(Personas unaPersona) {
        int aux=GeneradorAleatorio.generarInt(100);
        while (bonos[aux]!=null) {
            aux=GeneradorAleatorio.generarInt(100); //se generan nros aleatorios hasta que bonos en la posicion aux sea null --> se encuentre un bono disponible
        }
        bonos[aux]=unaPersona; //no se pone if (diml<dimf) ni if (bonos[aux]!=null) ya que se tiene que asumir q hay un bono disponible
        return aux;
    }
    
    public Personas obtenerPersona(int nroB) {
        return bonos[nroB];
    }
    
    public Personas ejecutarSorteo() {
        int aux=GeneradorAleatorio.generarInt(100);
        while (bonos[aux]==null) {
            aux=GeneradorAleatorio.generarInt(100); //se generan numeros aleatorios hasta que el vector en la posicion aux sea null --> se encuentra un ganador
        }
        return bonos[aux];
    }
    
    public void imprimirVector() {
        for (int i=0;i<dimf;i++) {
            if (bonos[i]!=null) {
                System.out.println("Info persona con el nro de bono " + i);
                System.out.println("Nombre: " + bonos[i].getNombre() + " DNI: " + bonos[i].getDni() + " Colaboracion: " + bonos[i].getColaboracion());
            }
        }
    }
}
