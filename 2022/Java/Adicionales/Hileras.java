package Repaso;
public class Hileras extends Coro {
    private Corista [][] HilerasCoristas;
    private int dimensionFilas;
    private int dimensionColumnas;
    private int dimlFilas;
    private int dimlColumnas;
    //constructor
    public Hileras(int dimF, int dimC, Director unDirector,String nombre) {
        super(unDirector,nombre);
        HilerasCoristas = new Corista [dimF] [dimC];
        dimlFilas=0;
        dimlColumnas=0;
        dimensionFilas=dimF;
        dimensionColumnas=dimC;
        for (int i=0;i<dimF;i++) {
            for (int j=0;j<dimC;j++) {
                HilerasCoristas[i][j]=null;
            }
        }
    }
    public Hileras() {
        
    }
    //metodos

    public int getDimlFilas() {
        return dimlFilas+1;
    }

    public int getDimlColumnas() {
        return dimlColumnas;
    }
    
    @Override
    public void agregarCorista(Corista unCorista) {
        if (!estaLleno()) {
                if (dimlColumnas<dimensionColumnas) { //si la fila NO esta llena,agregamos en esa fila)
                    HilerasCoristas[dimlFilas][dimlColumnas]=unCorista;
                    dimlColumnas++;
                }
                else { //si la fila esta llena, paso a la siguiente fila columna 0
                    dimlColumnas=0;
                    dimlFilas++;
                    if (dimlFilas<dimensionFilas) {
                        HilerasCoristas[dimlFilas][dimlColumnas]=unCorista;
                        dimlColumnas++;
                    }
                }
            }
        else {
                System.out.println("No hay mas espacio en el coro.");
        }
    }
    @Override
    public boolean estaLleno() {
        boolean aux=false;
        if (((dimlFilas+1)==dimensionFilas) && (dimlColumnas==dimensionColumnas)) {
            aux=true;
    }
        return aux;
    }
    @Override
    public boolean bienFormado() {
        boolean aux=true;
        int f=0,c=0;
        if (estaLleno()) {
            while ((aux) && (f<dimensionFilas)) {
                while ((aux) && ((c+1)<dimensionColumnas)){
                    if (HilerasCoristas[f][c].getTono()==HilerasCoristas[f][c+1].getTono()) {
                        aux=true;
                        c++;
                    }
                    else {
                        aux=false;
                    }
                }
                f++;c=0;
            }
            f=0;
            while ((aux) && (f+1)<dimensionFilas) {
                if (HilerasCoristas[f][0].getTono()>=HilerasCoristas[f+1][0].getTono()) {
                    aux=true;
                    f++;
                }
                else {
                    aux=false;
                }
            }
        }
        else {
            aux=false;
        }
        return aux;
    }
    @Override
    public String toString() {
        String aux;
        aux=super.toString();
        for (int i=0;i<(dimlFilas+1);i++) {
            for (int j=0;j<dimlColumnas;j++) {
                aux+="\nInformacion del corista en la fila " + (i+1) +" Columna " + (j+1) + HilerasCoristas[i][j].toString();
            }
        }
        return aux;
    }
}
