package Final;
public class Trabajadores {
    private String nombre;
    private int dni;
    private int antiguedad;
    
    //constructor

    public Trabajadores(String nombre, int dni, int antiguedad) {
        this.nombre = nombre;
        this.dni = dni;
        this.antiguedad = antiguedad;
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

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    } 
}
