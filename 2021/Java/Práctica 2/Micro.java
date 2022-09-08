package tema4;
public class Micro {
    private String patente;
    private String destino;
    private double hsalida;
    private int asientosocupados;
    private boolean [] lleno= new boolean[20];
public Micro (String patenterecibida,String destinorecibido,double hsalidarecibida) {
    patente=patenterecibida;destino=destinorecibido;hsalida=hsalidarecibida;
    int i;
    for (i=0;i<20;i++)
        lleno[i]=false;
    asientosocupados=0;
}
//getters
public String getPatente() {
    return patente;
}
public String getDestino() {
    return destino;
}
public double getHsalida() {
    return hsalida;
}
public int getAsientosocupados() {
    return asientosocupados;
}
public boolean getLleno() {
    return asientosocupados==20;
}
public boolean validar(int nroasiento) {
    return nroasiento>=0 && nroasiento<20;
}
public boolean estado (int asiento) {
    if (validar(asiento)==true) 
        return lleno[asiento];
    return true;
}
public int primerLibre() {
    int i;
    for (i=0;i<20;i++)
        if (lleno[i]==false)
            return (i+1);
    return -1;
}
//setters
public void setPatente(String unaPatente) {
    patente=unaPatente;
}
public void setDestino(String unDestino) {
    destino=unDestino;
}
public void setHsalida(double unaHsalida) {
    hsalida=unaHsalida;
}
public void ocupar(int asiento) {
    if (validar(asiento)) {
        lleno[asiento]=true;
        asientosocupados++;
    }
}
public void liberar(int asiento) {
    if (validar(asiento)) {
        if (lleno[asiento]==false)
            lleno[asiento]=true;
        asientosocupados--;
    }
}
}
