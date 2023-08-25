/*
Realice un programa que instancie el visor, guarde dos cuadrados y un rectángulo en el
visor y por último haga que el visor muestre sus figuras almacenadas.
 */
package tema5;
public class Practica5Punto5 {
    public static void main(String[] args) {
        VisorFiguras vF = new VisorFiguras();
        Cuadrado c1 = new Cuadrado(4,"Rosa","Azul");
        Cuadrado c2 = new Cuadrado(6,"Verde","Amarillo");
        Rectangulo r1 = new Rectangulo(6,9,"Carmesi","Negro");
        vF.guardar(c1);vF.guardar(c2);vF.guardar(r1);
        vF.mostrar();
    }
}
