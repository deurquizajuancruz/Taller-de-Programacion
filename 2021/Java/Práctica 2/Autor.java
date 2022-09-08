
package tema4;
public class Autor {
    private String nombre;
    private String biografia;
public String getNombre() {
    return nombre;
}
public String getBio() {
    return biografia;
}
public void setNombre(String nombre) {
    this.nombre=nombre;
}
public void setBio (String biografia) {
    this.biografia=biografia;
}
public Autor(String nombre, String biografia){
    this.nombre=nombre;this.biografia=biografia;
}
public Autor() {
    
}
}
