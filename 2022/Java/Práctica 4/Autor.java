package tema4;
public class Autor {
    private String nombre;
    private String biografia;
    private String origen;
    //constructores
    public Autor(String nombre, String biografia, String origen) {
        this.nombre = nombre;
        this.biografia = biografia;
        this.origen = origen;
    }
    public Autor() {
    }
    //getters y setters
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getBiografia() {
        return biografia;
    }
    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }
    public String getOrigen() {
        return origen;
    }
    public void setOrigen(String origen) {
        this.origen = origen;
    }
    //metodos
    @Override
    public String toString() {
        return "\nNombre: " + nombre + " Biografía: " + biografia + " Origen: " + origen;
    }
}
