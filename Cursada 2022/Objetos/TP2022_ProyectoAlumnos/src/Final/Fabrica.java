package Final;
public class Fabrica {
    private final Sectores produccion;
    private final Sectores ensamblado;
    
    //constructotr
    
    public Fabrica(Sectores p,Sectores e){
        produccion=p;
        ensamblado=e;
    }
    
    //metodos
    
    public void TrabajadorSeccion(Trabajadores unT){
        if (unT.getAntiguedad()<10) {
            produccion.agregarTrabajador(unT);
        }
        else
            ensamblado.agregarTrabajador(unT);
    }
    
    @Override
    public String toString(){
        String aux="";
        aux+="Trabajadores del sector de produccion: "+"\n"+produccion.toString()+"\n";
        aux+="Trabajadores del sector de ensamblado: "+"\n"+ensamblado.toString();
        return aux;
    }
}
