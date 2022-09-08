package Repaso;
public abstract class Alumnos {
    private int DNI;
    private String nombre;
    private MateriasAprobadas [] lasMaterias;
    private int diml;
    private int dimf;
    
    //constructores

    public Alumnos() {
    }

    public Alumnos(int DNI, String nombre, int N) {
        this.DNI = DNI;
        this.nombre = nombre;
        dimf=N;
        lasMaterias = new MateriasAprobadas[dimf];
        diml=0;
    }
    
    //metodos

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public int getDiml() {
        return diml;
    }

    public void setDiml(int diml) {
        this.diml = diml;
    }

    public MateriasAprobadas getMateria(int i) {
        return lasMaterias[i];
    }
    
    
    public void agregarMateria(MateriasAprobadas unaMateria) {
        if (diml<dimf) {
            lasMaterias[diml]=unaMateria;
            diml++;
        }
    }
    public boolean estaGraduado() {
        return (diml==dimf);
    }
    @Override
    public String toString() {
        String aux = "DNI: " + DNI + " Nombre: " + nombre + " Materias aprobadas:";
        for (int i=0;i<diml;i++) {
            aux+= "\nInformacion de la materia numero " + (i+1) + "\nNombre: " + lasMaterias[i].getNombre() + " Nota: " + lasMaterias[i].getNota() + " Fecha: " + lasMaterias[i].getFecha();
        }
        return aux;
    }
}
