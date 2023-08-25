package deurquiza;
public class CursoOnline extends Curso {
    private String plataforma;
    
    //constructor

    public CursoOnline(String plataforma, String nombre, double costo, int N) {
        super(nombre, costo, N);
        this.plataforma = plataforma;
    }
    
    //metodos

    public String getPlataforma() {
        return plataforma;
    }

    public void setPlataforma(String plataforma) {
        this.plataforma = plataforma;
    }
    
    @Override
    public void agregarLeccion(Lecciones unaLeccion) {
        if (super.getDiml()<super.getDimf()) {
            if (unaLeccion.getDuracionMinutos()<45) {
                super.agregarLeccion(unaLeccion);
            }
        }
    }
    @Override
    public double costoFinal() {
        double descuento;
        if (plataforma.equals("Zoom")) {
            descuento= ((super.costoFinal()/100)*10);
            return (super.costoFinal() - descuento);
        }
        return super.costoFinal();
    }
    @Override
    public String toString() {
        String aux="";
        aux+=super.toString() + "\nCosto final de inscripcion: " + costoFinal();
        return aux;
    }
}
