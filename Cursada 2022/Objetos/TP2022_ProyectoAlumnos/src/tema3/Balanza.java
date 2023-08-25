package tema3;
public class Balanza {
    private int cantidad;
    private double monto;
    private String resumen;
    
    //getters y setters

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }
    //otros metodos
    public void iniciarCompra() {
        cantidad=0;
        monto=0;
        resumen="";
    }
    public void registrarProducto(Producto elProducto,double preciokg) {
        cantidad++;
        monto+= (elProducto.getPesoEnKg()*preciokg);
        resumen+= elProducto.getDescripcion()+" " + elProducto.getPesoEnKg()*preciokg +"\n";
    }
    public String getResumendeCompra() {
        return resumen + "Total a pagar $" + monto + " por la compra de " + cantidad+ " productos."; 
    }
}
