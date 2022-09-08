package Repaso;
public class Corista extends Persona {
    private int tono;
    //constructores

    public Corista(int tono, String nombre, int dni, int edad) {
        super(nombre, dni, edad);
        this.tono = tono;
    }

    public Corista() {
    }
    //meotodos

    public int getTono() {
        return tono;
    }

    public void setTono(int tono) {
        this.tono = tono;
    }
    @Override
    public String toString() {
        String aux;
        aux = super.toString() + "\nTono fundamental: " + tono;
        return aux;
    }
}