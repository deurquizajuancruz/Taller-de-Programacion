package Final;
public class Parejas {
    private String estilo;
    private Participante [] losp;
    private int diml;
    //constructor

    public Parejas(String unE) {
        estilo=unE;diml=0;
        losp= new Participante [2];
    }

    //metodos

    public void setEstilo(String unE) {
        estilo=unE;
    }

    public String getEstilo() {
        return estilo;
    }

    public void cargarParticipante(Participante unP) {
        if (diml<2) {
            losp[diml]=unP;
            diml++;
        }
    }

    public int obtenerDiferencia() {
        int aux;
        if (losp[0].getEdad()>=losp[1].getEdad()) {
            aux=losp[0].getEdad() - losp[1].getEdad();
        }
        else
            aux=losp[1].getEdad()-losp[0].getEdad();
        return aux;
    }
    
    @Override
    public String toString() {
        String aux="";
        aux+=losp[0].getNombre() +"\n" + losp[1].getNombre();
        return aux;
    }
}

