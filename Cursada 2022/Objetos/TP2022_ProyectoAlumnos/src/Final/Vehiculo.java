package Final;
public class Vehiculo {
    private int cantidadViajeros;
    private double montoAbonado;
    
    //constructor
    
    public Vehiculo(int cantidad,double monto){
        cantidadViajeros=cantidad;
        montoAbonado=monto;
    }
    
    //metodos

    public int getCantidadViajeros() {
        return cantidadViajeros;
    }

    public void setCantidadViajeros(int cantidadViajeros) {
        this.cantidadViajeros = cantidadViajeros;
    }

    public double getMontoAbonado() {
        return montoAbonado;
    }

    public void setMontoAbonado(double montoAbonado) {
        this.montoAbonado = montoAbonado;
    }
    
}
