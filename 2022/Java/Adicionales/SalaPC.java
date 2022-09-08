package Final;
public class SalaPC {
    private PC [] lasPCS;
    private int dimf;
    
    //constructor
    
    public SalaPC(int N) {
        dimf=N;
        lasPCS= new PC [dimf];
    }
    
    //metodos
    
    public void agregarPC(int nro,PC unaPC) {
        lasPCS[nro]=unaPC;
    }
    
    public void menorConsumo(){
        int min=9999;
        int posmin=0;
        for (int i=0;i<dimf;i++){
            if (lasPCS[i]!=null) {
                if (!lasPCS[i].isEstado()) {
                    if (lasPCS[i].getConsumo()<min){
                        min=lasPCS[i].getConsumo();
                        posmin=i;
                    }   
                }
            }
        }
        lasPCS[posmin].setEstado(true);
    }
    
    @Override
    public String toString() {
        String aux="";
        for (int i=0;i<dimf;i++) {
            if (lasPCS[i]!=null){
                if (lasPCS[i].isEstado()){
                    aux+="La PC con numero "+i+" esta ocupada y encendida\n";
                }
            }
        }
        return aux;
    }

    /*public String toString2() {
        String aux="";
        for (int i=0;i<dimf;i++) {
            if (lasPCS[i]!=null){
                aux+="El estado de la PC "+i+" es "+lasPCS[i].isEstado()+" con un consumo de: " +lasPCS[i].getConsumo()+"\n";
            }
        }
        return aux;
    }*/
}
