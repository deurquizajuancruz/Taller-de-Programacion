package Final;
public class Participante {
    private int dni;
    private String nombre;
    private int edad;

    //constructor

    public Participante(int unDNI,String unNombre,int unaEdad){
        dni=unDNI;
        nombre=unNombre;
        edad=unaEdad;
    }
    
    //metodos

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String unNombre) {
        nombre=unNombre;
    }

    public int getDNI() {
        return dni;
    }

    public void setDNI(int unDNI) {
        dni=unDNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int unaEdad) {
        edad=unaEdad;
    }
}
