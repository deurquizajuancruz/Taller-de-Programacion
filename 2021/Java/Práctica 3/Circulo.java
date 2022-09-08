package tema5;
public class Circulo extends Figura {
    private double radio;
    //constructores
    public Circulo (double radio,String colorRelleno,String colorLinea){
        super(colorRelleno,colorLinea);setRadio(radio);
    }
    public Circulo () {
        super("","");
    }
    //getters
    public double getRadio() {
        return radio;
    }
    public double calcularArea() {
        return (radio*radio*Math.PI);
    }
    public double calcularPerimetro() {
        return (2*Math.PI*radio);
    }
    public String toString() {
        String aux=super.toString()+ " Radio: " + getRadio();return aux;
    }
    //setters
    public void setRadio(double radio) {
        this.radio = radio;
    }
}
