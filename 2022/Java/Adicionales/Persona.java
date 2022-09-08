package Repaso;
public abstract class Persona {
    private String nombre;
    private int dni;
    private int edad;
    
    //constructores
    
    public Persona(String nombre, int dni, int edad) {
        this.nombre = nombre;
        this.dni = dni;
        this.edad = edad;
    }
    
    public Persona() {
        
    }
    //metodos

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    @Override
    public String toString() {
        String aux;
        aux = "\nNombre: " + nombre + "\nDNI: " + dni + "\nEdad: " + edad;
        return aux;
    }
}