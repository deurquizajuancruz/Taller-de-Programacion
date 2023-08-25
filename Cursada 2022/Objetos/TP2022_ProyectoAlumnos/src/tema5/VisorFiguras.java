package tema5;
public class VisorFiguras {
    private int guardadas;
    private final int capacidadMaxima =5;
    private Figura [] vector= new Figura [capacidadMaxima];
    
    public int getGuardadas() {
        return guardadas;
    }

    public void setGuardadas(int guardadas) {
        this.guardadas = guardadas;
    }
    
    public VisorFiguras() {
        guardadas=0;
        for (int i=0;i<capacidadMaxima;i++) {
            vector[i]=null;
        }
    }
    
    public void guardar(Figura f) {
        vector[guardadas]=f;
        guardadas++;
    }
    
    public boolean quedaEspacio() {
        return (guardadas<capacidadMaxima);
    }
    
    public void mostrar() {
        for (int i=0;i<guardadas;i++){
            System.out.println(vector[i].toString());
    }
    }
}
