package Repaso;
public class Subsidio {
   private double montopedido;
   private String motivo;
   private boolean otorgado;
   //constructor
   public Subsidio(double elMonto,String elMotivo) {
       montopedido=elMonto;
       motivo=elMotivo;
       otorgado=false;
   }
   //metodos

    public double getMontopedido() {
        return montopedido;
    }

    public void setMontopedido(double montopedido) {
        this.montopedido = montopedido;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public boolean isOtorgado() {
        return otorgado;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
   
}
