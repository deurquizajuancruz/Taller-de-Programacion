package Repaso;
public abstract class Coro {
    private Director unDirector;
    private String nombre;
    
    //constructores

    public Coro(Director unDirector, String nombre) {
        this.unDirector = unDirector;
        this.nombre = nombre;
    }
    public Coro() {
        
    }
    //metodos
    public Director getUnDirector() {
        return unDirector;
    }

    public void setUnDirector(Director unDirector) {
        this.unDirector = unDirector;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public abstract void agregarCorista(Corista unCorista);
    public abstract boolean estaLleno();
    public abstract boolean bienFormado();
    @Override
    public String toString() {
        String aux;
        aux = "Nombre del coro: " + nombre + "\nDatos del director: " + unDirector.toString();
        return aux;
    }
}
