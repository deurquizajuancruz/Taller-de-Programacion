package Repaso;
public class Director extends Persona {
    private int antiguedad;
    //constructores

    public Director(int antiguedad, String nombre, int dni, int edad) {
        super(nombre, dni, edad);
        this.antiguedad = antiguedad;
    }

    public Director() {
    }
    //metodos
    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    public String toString() {
        String aux;
        aux = super.toString() + "\nAntiguedad del director: " + antiguedad;
        return aux;
    }
}