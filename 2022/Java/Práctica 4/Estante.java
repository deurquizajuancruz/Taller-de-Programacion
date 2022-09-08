package tema4;
public class Estante {
    private Libro [] libros = new Libro [20];
    private int cantidad;
    //constructores
    public Estante() {
        cantidad=0;
        for (int i=0;i<20;i++) {
            libros[i]=null;
        }
    }
    //metodos
    public int getCantidad() {
        return cantidad;
    }
    public boolean estanteLleno() {
        boolean lleno;
        lleno = cantidad==20;
        return lleno;
    }
    public void AgregarLibro(Libro unLibro) {
        libros[cantidad]=unLibro;
        cantidad++;
    }
    public Libro buscarLibro(String titulo) {
        Libro devolver = null;
        int i=0;
        boolean encontrar=false;
        while ((encontrar==false) && (i<cantidad)) {
            if (libros[i].getTitulo().equals(titulo)) {
                devolver=libros[i];
                encontrar=true;
            }
            i++;
        }
        return devolver;
    }
}
