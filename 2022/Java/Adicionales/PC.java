package Final;
public class PC {
    private boolean estado;
    private int consumo;
    
    //constructor
    
    public PC(int elConsumo) {
        estado=false;
        consumo=elConsumo;
    }
    
    //metodos

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public int getConsumo() {
        return consumo;
    }

    public void setConsumo(int consumo) {
        this.consumo = consumo;
    }
    
}
