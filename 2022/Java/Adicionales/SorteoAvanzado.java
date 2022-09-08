package Repaso;
public class SorteoAvanzado extends Sorteo {
    
    //constructor
    
    public SorteoAvanzado(double premio) {
        super(premio);
    }
    
    //metodos
    
    @Override
    public Personas ejecutarSorteo() {
        Personas ganadora =null;
        double max =-1;
        for (int i=0;i<super.getDimf();i++) {
            if (super.getPersona(i)!=null) {
                if (super.getPersona(i).getColaboracion()>max) {
                   max=super.getPersona(i).getColaboracion();
                   ganadora = super.getPersona(i);
                }
            }
        }
        return ganadora;
    }
}
