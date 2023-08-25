package Repaso;
public class MateriasAprobadas {
    private String nombre;
    private int nota;
    private int fecha;
    
    //constructores

    public MateriasAprobadas() {
    }

    public MateriasAprobadas(String nombre, int nota, int fecha) {
        this.nombre = nombre;
        this.nota = nota;
        this.fecha = fecha;
    }
    
    //metodos
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    public int getFecha() {
        return fecha;
    }

    public void setFecha(int fecha) {
        this.fecha = fecha;
    }
    
}
