package tema5;
public class Entrenadores extends Empleado {
    private int campganados;
    
    //constructores
    public Entrenadores(int losCampGanados,String unNombre,double unSueldo){
        super(unNombre,unSueldo);setCampg(losCampGanados);
    }
    //getters
    public int getCampg() {
        return campganados;
    }
    //metodos
    public double calcularSueldoACobrar() {
        if (campganados>=1 && campganados<=4) {
            return (getSueldo() + 5000);
        }
        if (campganados>=5 && campganados<=10) {
            return (getSueldo()+ 30000);
        }
        if (campganados>10) {
            return (getSueldo() + 50000);
        }
        return getSueldo();
    }
    public String toString() {
        String aux=super.toString();return aux;
    }
    //setters
    public void setCampg(int losCampGanados) {
        campganados=losCampGanados;
    }
}
