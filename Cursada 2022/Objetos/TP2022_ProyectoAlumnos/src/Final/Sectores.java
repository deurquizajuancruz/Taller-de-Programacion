package Final;
public class Sectores {
    private String jefe;
    private final Trabajadores [] proletariado;
    private int diml;
    
    //constructor
    
    public Sectores(String elJ){
        jefe=elJ;
        diml=0;
        proletariado=new Trabajadores[20];
    }
    
    //metodos

    public String getJefe() {
        return jefe;
    }

    public void setJefe(String jefe) {
        this.jefe = jefe;
    }
    
    public void agregarTrabajador(Trabajadores unT){
        proletariado[diml]=unT;
        diml++;
    }
    
    @Override
    public String toString(){
        String aux="Jefe del sector:"+jefe+"\n";
        for (int i=0;i<diml;i++){
            aux+="Nombre del trabajador: "+proletariado[i].getNombre()+"\n";
        }
        return aux;
        
    }
}
