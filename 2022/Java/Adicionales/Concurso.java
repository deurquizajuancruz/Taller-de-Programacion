package Final;
public class Concurso {
    private Parejas [] lasParejas;
    private int dimf,diml;

    //constructor

    public Concurso(int N) {
        dimf=N;diml=0;
        lasParejas=new Parejas [dimf];
    }

    //metodos

    public void agregarPareja(Parejas unaP) {
        lasParejas[diml]=unaP; //asumir que hay lugar
        diml++;
    }

    public Parejas mayorDiferencia() {
        int min=-1;
        Parejas mayorDif=null;
        for (int i=0;i<diml;i++) {
            if (lasParejas[i].obtenerDiferencia()>min) {
                min=lasParejas[i].obtenerDiferencia();
                mayorDif=lasParejas[i];
            }
        }
        return mayorDif;
    }
}

