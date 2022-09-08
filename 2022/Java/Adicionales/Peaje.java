package Final;
public class Peaje {
    private Ventanilla [] sistema;
    
    //constructor
    
    public Peaje() {
        sistema = new Ventanilla[8];
        for (int i=0;i<8;i++) {
            sistema[i]=new Ventanilla();
        }
    }
    
    //metodos
    
    public String infoVentanilla(int nro) {
        String aux="";
        if ((nro>-1) && (nro<8)) {
            aux+="Informacion de la ventanilla numero "+(nro+1)+"\n";
            aux+="Cantidad de vehiculos que pasaron: "+sistema[nro].getCantidadV()+"\n";
            aux+="Cantidad de vehiculos que pasaron con un solo conductor: "+sistema[nro].getSoloConductor()+"\n";
            aux+="Monto recaudado total de los vehiculos: "+sistema[nro].getMonto()+"\n";
        }
        else
            aux+="El numero de ventanilla no es valido.";
        return aux;
    }
    
    public void VehiculoXV(int V,Vehiculo transporte) {
        sistema[V].agregarVehiculo(transporte);
    }
    
    public int menorRecaudacion() {
        double minp=999;
        int menor=-1;
        for (int i=0;i<8;i++) {
            if (sistema[i].calcularPromedio()<minp){
                minp=sistema[i].calcularPromedio();
                menor=i;
            }
        }
        return menor+1;
    }
}
