package Repaso;
public class SemiCirculo extends Coro {
    private Corista [] semiCirculo;
    private int diml;
    private int dimension;
    //constructor
    public SemiCirculo(int dimF, Director unDirector, String nombre) {
        super(unDirector,nombre);
        diml=0;
        dimension=dimF;
        semiCirculo = new Corista [dimF];
        for (int i=0;i<dimF;i++) {
            semiCirculo[i]=null;
        }
    }
    public SemiCirculo() {
        
    }
    //metodos

    public int getDiml() {
        return diml;
    }
    
    @Override
    public void agregarCorista(Corista unCorista) {
        if (!estaLleno()) {
            semiCirculo[diml]=unCorista;
            diml++;
        }
        else {
            System.out.println("No hay mas espacio en el coro.");
        }
    }
    @Override
    public boolean estaLleno() {
        return (diml==dimension);
    }
    @Override
    public boolean bienFormado() {
        boolean aux=true;
        int indice=0;
        if (estaLleno()) {
            while ((aux) && ((indice+1)<dimension)){
                if (semiCirculo[indice].getTono()>=semiCirculo[indice+1].getTono()) {
                    aux=true;
                    indice++;
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
        aux= super.toString();
        for (int i=0;i<diml;i++) {
            aux+= "\nInformacion del corista número " +(i+1)+semiCirculo[i].toString();
        }
        return aux;
    }
}