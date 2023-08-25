package deurquiza;
public abstract class Curso {
    private String nombre;
    private double costo;
    private final Lecciones lasLecciones[];
    private int diml;
    private final int dimf;
    
    //constructor

    public Curso(String nombre, double costo, int N) {
        this.nombre = nombre;
        this.costo = costo;
        dimf=N;
        diml=0;
        lasLecciones = new Lecciones [dimf];
    }
    
    //metodos

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public int getDiml() {
        return diml;
    }

    public int getDimf() {
        return dimf;
    }
    
    public void agregarLeccion(Lecciones unaLeccion){
        if (diml<dimf) {
            lasLecciones[diml]=unaLeccion;
            diml++;
        }
    }
    public double costoFinal() {
        return diml*costo;
    }
    @Override
    public String toString() {
        String aux;
        aux= "Nombre del curso: "+nombre;
        for (int i=0;i<diml;i++) {
            aux+= "\nLeccion numero " + (i+1) + " Tema: "+lasLecciones[i].getTema() + " Dia de la fecha:" + lasLecciones[i].getFecha() + " Duracion en minutos: " + lasLecciones[i].getDuracionMinutos();
        }
        return aux;
    }
}
