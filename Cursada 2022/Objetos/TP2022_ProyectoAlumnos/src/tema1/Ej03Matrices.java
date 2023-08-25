package tema1;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class Ej03Matrices {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar(); 
	int dim =10;
        int [][] matriz = new int [dim][dim];
        int i,j;
        for (i=0;i<dim;i++) {
            for (j=0;j<dim;j++) {
                matriz[i][j]=GeneradorAleatorio.generarInt(200);
            }
        }
        for (i=0;i<dim;i++) {
            for (j=0;j<dim;j++) {
                System.out.println("El contenido de la matriz en la fila " + i + " columna " + j +" es: " + matriz[i][j]);
            }
        }
        int suma=0;
        for (i=2;i<dim;i++) {
            for (j=0;j<4;j++) {
                suma+=matriz[i][j];
            }
        }
        System.out.println("La suma de todos los elementos de la matriz almacenados entre las filas 2 y 9 y las columnas 0 y 3 es de: " + suma);
        int [] Vector = new int [dim];
        int sumacolumna=0;
        for (i=0;i<dim;i++) {
            for (j=0;j<dim;j++) {
                sumacolumna+=matriz[j][i];
            }
            Vector[i]=sumacolumna;
            System.out.println("La suma de los elementos de la columna " + i + " es de: " + sumacolumna);
            sumacolumna=0;
        }
        System.out.println("Ingrese un valor para buscar en el vector: ");
        int buscar=Lector.leerInt();
        int fbuscada=0,cbuscada=0;
        for (i=0;i<dim;i++) {
            for (j=0;j<dim;j++) {
                if (matriz[i][j]==buscar) {
                    fbuscada=i;cbuscada=j;
                }
            }
        }
        if ((fbuscada!=0) && (cbuscada!=0)) {
           System.out.println("El elemento se encontraba en la fila " + fbuscada + " y la columna " + cbuscada); 
        }
        else
            System.out.println("No se encontró el elemento");
    }
}
