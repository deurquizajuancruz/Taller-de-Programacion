package deurquiza;
public class Lecciones {
    private String tema;
    private int fecha;
    private int duracionMinutos;
    
    //constructor

    public Lecciones(String tema, int fecha, int duracionMinutos) {
        this.tema = tema;
        this.fecha = fecha;
        this.duracionMinutos = duracionMinutos;
    }
    
    //metodos

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public int getFecha() {
        return fecha;
    }

    public void setFecha(int fecha) {
        this.fecha = fecha;
    }

    public int getDuracionMinutos() {
        return duracionMinutos;
    }

    public void setDuracionMinutos(int duracionMinutos) {
        this.duracionMinutos = duracionMinutos;
    }
    
}
