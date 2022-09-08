package tema3;
public class Triangulo {
    private double lado1,lado2,lado3;
    private String colorRelleno;
    private String colorLinea;
    //constructores
    public Triangulo(double lado1, double lado2, double lado3, String colorRelleno, String colorLinea) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }
    public Triangulo() {
        
    }
    //getters y setters
    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
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
        double aux,s,raiz;
        s= (lado1 + lado2 + lado3) /2;
        raiz = s*(s-lado1)*(s-lado2)*(s-lado3);
        aux = Math.sqrt(raiz);
        return aux;
    }
    public double calcularPerimetro() {
        return lado1+lado2+lado3;
    }
    @Override
    public String toString() {
        String aux;
        aux = "Lado 1: " + lado1 + " Lado 2: " + lado2 + " Lado 3: " +lado3 + " Con perímetro " + calcularPerimetro() + " Con Área: " + calcularArea() +
                " Color de relleno: " + colorRelleno + " Color linea: " + colorLinea;
        return aux;
    }
}
