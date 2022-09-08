package tema3;
public class Entrenador {
    private String nombre;
    private int campg,sueldo;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCampg() {
        return campg;
    }

    public void setCampg(int campg) {
        this.campg = campg;
    }

    public int getSueldo() {
        return sueldo;
    }

    public void setSueldo(int sueldo) {
        this.sueldo = sueldo;
    }
    public int calcularSueldoACobrar() {
        if (campg>0 && campg<5)
            return sueldo+=5000;
        if (campg>=5 && campg<=10)
            return sueldo+=30000;
        if (campg>10)
            return sueldo+=50000;
        return sueldo;
    }
    public Entrenador () {
        
    }
    public Entrenador (String nombre,int campg, int sueldo) {
        this.nombre=nombre;this.campg=campg;this.sueldo=sueldo;
    }
}
