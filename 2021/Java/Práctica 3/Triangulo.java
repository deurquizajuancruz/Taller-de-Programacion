/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;
public class Triangulo extends Figura {
    private double lado1,lado2,lado3;
    public Triangulo(String colorR, String colorL,double lado1, double lado2,double lado3) {
        super(colorR,colorL); setLado1(lado1);setLado2(lado2);setLado3(lado3);
    }
    //getters
    public double getlado1() {
        return lado1;
    }
    public double getLado2() {
        return lado2;
    }
    public double getLado3() {
        return lado3;
    }
    public Triangulo() {
        super("","");
    }
    public String toString() {
        String aux = super.toString() + " Perimetro: " + calcularPerimetro()+ " Lado 1: "+ getlado1()+ " Lado 2: "+ getLado2()+ " Lado 3: "+ getLado3();return aux;
    }
    public double calcularArea() {
        double s = ((lado1+lado2+lado3)/2);
        return Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
    }
    public double calcularPerimetro() {
        return (lado1+lado2+lado3);
    }
    //setters
    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
}
