package Repaso;
public class Personas {
    private String nombre;
    private int dni;
    private double colaboracion;
    
    //constructor

    public Personas(String nombre, int dni, double colaboracion) {
        this.nombre = nombre;
        this.dni = dni;
        this.colaboracion = colaboracion;
    }
    
    //metodos

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public double getColaboracion() {
        return colaboracion;
    }

    public void setColaboracion(double colaboracion) {
        this.colaboracion = colaboracion;
    }
    
}
