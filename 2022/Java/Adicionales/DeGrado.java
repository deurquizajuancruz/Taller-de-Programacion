package Repaso;
public class DeGrado extends Alumnos {
    private String carrera;
    
    //constructor

    public DeGrado(String carrera, int DNI, String nombre, int N) {
        super(DNI, nombre,N);
        this.carrera = carrera;
    }
    
    //metodos

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }
    
    @Override
    public boolean estaGraduado() {
        if (super.estaGraduado()) {
            int i=0;
            while ((i<super.getDiml()) && (!super.getMateria(i).getNombre().equals("Tesina"))) {
                    i++;
                }
            if (i<super.getDiml()) {
                if (super.getMateria(i).getNota()>5) {
                        return true; 
                    }
                }
            }
        return false;
        }
    @Override
    public String toString() {
        String aux=super.toString();
        aux+= "\nEsta graduado en " + carrera;
        return aux;
        }
    }
