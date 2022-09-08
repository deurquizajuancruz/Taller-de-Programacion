package Repaso;
public class Investigador {
    private String nya;
    private int categoria;
    private String especialidad;
    private int diml;
    private Subsidio [] subsidios; 
    //constructor
    public Investigador(String nombreApellido,int laCate, String espe) {
        nya=nombreApellido;
        categoria=laCate;
        especialidad=espe;
        diml=0;
        subsidios = new Subsidio [5];
    }
    //metodos

    public String getNya() {
        return nya;
    }

    public int getDiml() {
        return diml;
    }

    public void setNya(String nya) {
        this.nya = nya;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    public void agregarSubsidio(Subsidio unSubsidio) {
        subsidios[diml]=unSubsidio;
        diml++;
    }
    
    public double dinero() {
        double aux=0;
        for (int i=0;i<diml;i++) {
            if (subsidios[i].isOtorgado()) {
                aux += subsidios[i].getMontopedido();
            }
        }
        return aux;
    }
    
    public void otorgarTodos() {
        for (int i=0;i<diml;i++) {
            if (!subsidios[i].isOtorgado()) {
                subsidios[i].setOtorgado(true);
            }
        }
    }
    @Override
    public String toString() {
        String aux;
        aux = "Nombre y apellido del Investigador: "+ nya + " Categoria: " + categoria + " Dinero de los subsidios: " + dinero();
        return aux;
    }
}
