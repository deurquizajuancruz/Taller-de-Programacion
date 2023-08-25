package Final;
public class Ventanilla {
    private int cantidadV;
    private int soloConductor;
    private double monto;
    
    //constructor
    
    public Ventanilla() {
        cantidadV=0;
        soloConductor=0;
        monto=0;
    }
    
    //metodos

    public int getCantidadV() {
        return cantidadV;
    }

    public void setCantidadV(int cantidadV) {
        this.cantidadV = cantidadV;
    }

    public int getSoloConductor() {
        return soloConductor;
    }

    public void setSoloConductor(int soloConductor) {
        this.soloConductor = soloConductor;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }
    
    public void agregarVehiculo(Vehiculo transporte) {
        cantidadV++;
        if (transporte.getCantidadViajeros()==1) {
            soloConductor++;
        }
        monto+=transporte.getMontoAbonado();
    }
    
    public double calcularPromedio() {
        if (cantidadV>0){
            return (monto/cantidadV);
        }
        else return 0;
    }
    
}
