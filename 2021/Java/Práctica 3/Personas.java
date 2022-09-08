package tema5;
public class Personas {
    private String nombre; private int DNI,edad;
    //constructor
    public Personas(String unNombre,int unDNI, int unaEdad) {
        setNombre(unNombre);setDNI(unDNI);setEdad(unaEdad);
    }
    
    //getters
    public String getNombre() {
        return nombre;
    }
    public int getDNI() {
        return DNI;
    }
    public int getEdad() {
        return edad;
    }
    //metodos
    public String toString() {
        String aux="Mi nombre es " + nombre + ",mi DNI es "+DNI+ " y tengo "+edad+" años";
        return aux;
    }
    //setters
    public void setNombre(String unNombre) {
        nombre=unNombre;
    }
    public void setDNI(int unDNI) {
        DNI=unDNI;
    }
    public void setEdad(int unaEdad) {
        edad=unaEdad;
    }
}
