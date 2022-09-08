package tema5;
public class Jugadores extends Empleado {
    private int partidosj,golesanotados;
    
    //constructores
    public Jugadores(int losPartidosJ,int losGolesAnotados,String unNombre, double unSueldo) {
        super(unNombre,unSueldo);setPartidosJugados(losPartidosJ);setGolesAnotados(losGolesAnotados);
    }
    //getters
    public int getPartidosJugados() {
        return partidosj;
    }
    public int getGolesAnotados() {
        return golesanotados;
    }
    //metodos
    public double calcularSueldoACobrar() {
        if ((golesanotados/partidosj)>0.5){
            return getSueldo()*2;
        }
        else return getSueldo();
    }
    public String toString() {
        String aux=super.toString();return aux;
    }
    //setters
    public void setPartidosJugados(int losPartidosJugados) {
        partidosj=losPartidosJugados;
    }
    public void setGolesAnotados(int losGolesAnotados) {
        golesanotados=losGolesAnotados;
    }
}
