package Repaso;
public class Doctorado extends Alumnos {
    private String titulo;
    private String UniOrigen;
    
    //constructor

    public Doctorado(String titulo, String UniOrigen, int DNI, String nombre, int N) {
        super(DNI, nombre, N);
        this.titulo = titulo;
        this.UniOrigen = UniOrigen;
    }
    //metodos

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getUniOrigen() {
        return UniOrigen;
    }

    public void setUniOrigen(String UniOrigen) {
        this.UniOrigen = UniOrigen;
    }
    @Override
    public boolean estaGraduado() {
        if (super.estaGraduado()) {
            int i=0;
            while ((i<super.getDiml()) && (!super.getMateria(i).getNombre().equals("Metodologías de la Investigación"))) {
                i++;
            }
            if (i<super.getDiml()) {
                return true;
            }
        }
        return false;
    }
    @Override
    public String toString() {
        String aux=super.toString();
        aux+="\nEsta graduado en " + titulo + " en la universidad: " + UniOrigen;
        return aux;
    }
}
