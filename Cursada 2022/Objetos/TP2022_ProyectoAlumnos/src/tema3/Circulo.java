package tema3;
public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;
    //constructor
    public Circulo(double radio, String colorRelleno, String colorLinea) {
        this.radio = radio;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }
    public Circulo() {
    }
    //getters y setters
    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    //otros metodos
    public double calcularArea() {
        return Math.PI*radio*radio;
    }
    public double calcularPerimetro() {
        return Math.PI*2*radio;
    }
    @Override
    public String toString() {
        return "Radio: " +radio+" Color relleno: "+colorRelleno+" Color linea: "+colorLinea+" Area: "+calcularArea()+" Perimetro: "+calcularPerimetro();
    }
}
