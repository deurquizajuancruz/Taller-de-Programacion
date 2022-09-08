package tema3;
public class Entrenador {
    private String nombre;
    private double sueldo;
    private int antiguedad;
    private double campganados;
    //constructores
    public Entrenador(String nombre, double sueldo, int antiguedad, double campganados) {
        this.nombre = nombre;
        this.sueldo = sueldo;
        this.antiguedad = antiguedad;
        this.campganados = campganados;
    }
    public Entrenador() {
        
    }
    //getters y setters
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public double getCampganados() {
        return campganados;
    }

    public void setCampganados(int campganados) {
        this.campganados = campganados;
    }
    //otros metodos
    public double calcularEfectividad() { //como sacar el promedio
        return  campganados/antiguedad;
    }
    public double calcularSueldoACobrar() {
        double diez,aux;
        diez= (sueldo/100)*10;
        aux = sueldo + (diez*antiguedad);
        if (campganados<5)
            aux += 5000;
        else if (campganados<10)
            aux+=30000;
        else aux+=50000;
        return aux;
    }
    @Override
    public String toString() {
        String aux;
        aux = "Nombre del entrenador: "+nombre+" Sueldo: "+calcularSueldoACobrar()+" Efectividad: "+calcularEfectividad()+"% Antiguedad: "+antiguedad+" Campeonatos ganados: "+campganados;
        return aux;
    }
}
