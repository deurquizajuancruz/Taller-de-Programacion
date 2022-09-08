package tema5;
public class Trabajador extends Personas {
    private String tarea;
    //constructor
    public Trabajador(String unNombre,int unDNI, int unaEdad,String tarea) {
        super(unNombre,unDNI,unaEdad);setTarea(tarea);
    }
            
    //getters
    public String getTarea() {
        return tarea;
    }
    //metodos
    public String toString() {
        String aux=super.toString() + ".Soy "+tarea;return aux;
    }
    //setters
    public void setTarea(String unaTarea) {
        tarea=unaTarea;
    }
}
