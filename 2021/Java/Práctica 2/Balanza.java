package tema3;
public class Balanza {
    private double monto;
    private int cantidad;
    private String descripcion,resumen;

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public Balanza() {
    }

    public double devolverMontoAPagar() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    public void iniciarCompra() {
        monto=0;cantidad=0;resumen="";
    }
    public void registrarProducto (double pesoEnKg,double precioPorKg,String descripcion) {
        cantidad++;monto+=(pesoEnKg*precioPorKg);resumen+="\n"+descripcion + " " +(pesoEnKg*precioPorKg) +" pesos ";
    }
    public String devolverResumenDeCompra() {
        return resumen + " \nTotal a pagar " + monto + " por la compra de " + cantidad + " productos\n";
    }
}

