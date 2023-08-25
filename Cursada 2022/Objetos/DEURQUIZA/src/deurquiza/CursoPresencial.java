package deurquiza;
public class CursoPresencial extends Curso {
    private int aula;
    private boolean coffeeBreak;
    
    //constructor

    public CursoPresencial(int aula, boolean coffeeBreak, String nombre, double costo, int N) {
        super(nombre, costo, N);
        this.aula = aula;
        this.coffeeBreak = coffeeBreak;
    }
    
    //metodos

    public int getAula() {
        return aula;
    }

    public void setAula(int aula) {
        this.aula = aula;
    }

    public boolean isCoffeeBreak() {
        return coffeeBreak;
    }

    public void setCoffeeBreak(boolean coffeeBreak) {
        this.coffeeBreak = coffeeBreak;
    }
    
    @Override
    public double costoFinal() {
        double aumento;
        if (coffeeBreak) {
            aumento=((super.costoFinal()/100)*5);
            return (super.costoFinal() + aumento);
        }
        return super.costoFinal();
    }
    @Override
    public String toString() {
        String aux="";
        aux+=super.toString()+"\nAula: "+aula +"\nCosto final de inscripcion: " + costoFinal();
        return aux;
    }
}
