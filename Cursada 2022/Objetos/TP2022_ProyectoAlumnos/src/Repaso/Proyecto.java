package Repaso;
public class Proyecto {
    private String nombre;
    private int codigo;
    private String nyaDirector;
    private Investigador [] investigadores;
    private int diml;
    
    //constructor
    public Proyecto(String elNombre,int elCodigo) {
        nombre= elNombre;
        codigo = elCodigo;
        diml=0;
        investigadores = new Investigador [50];
    }
    //metodos

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNyaDirector() {
        return nyaDirector;
    }

    public void setNyaDirector(String nyaDirector) {
        this.nyaDirector = nyaDirector;
    }
    public void agregarInvestigador(Investigador unInvestigador) {
        investigadores[diml]=unInvestigador;
        diml++;
    }
    public double dineroTotalOtorgado() {
        double aux=0;
        for (int i=0;i<diml;i++) {
            aux += investigadores[i].dinero();
        }
        return aux;
    }
    public int cantidadDeSubsidios(String nombreYApellido) {
        int aux=0,i=0;
        while (i<diml) {
            if (investigadores[i].getNya().equals(nombreYApellido)) {
                aux = investigadores[i].getDiml();
            }
            else {
                i++;
            }
        }
        return (aux+1);
    }
    
    public void otorgarTodos(String nombreYApellido) {
        int i=0;
        while (i<diml) {
            if (investigadores[i].getNya().equals(nombreYApellido)) {
                investigadores[i].otorgarTodos();
            }
            else {
                i++;
            }
        }
    }
    @Override
    public String toString() {
        String aux;
        aux = "Nombre del proyecto: " + nombre + "\nCodigo del proyecto: " + codigo + "\nNombre y apellido del director: " + nyaDirector
              + "\nTotal de dinero otorgado " + dineroTotalOtorgado();
        for (int i=0;i<diml;i++) {
            aux+= "\nInformacion investigador " + (i+1) + ":\n" + investigadores[i].toString();
        }
        return aux;
    }
}
