package Repaso;
import PaqueteLectura.GeneradorAleatorio;
public class ParcialViejo {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        DeGrado grado = new DeGrado("Ingenieria",123456,"Pablo",3);
        String nombre;int nota;int fecha;
        for (int i=0;i<2;i++) {
            nombre=GeneradorAleatorio.generarString(5);
            nota=GeneradorAleatorio.generarInt(10);
            fecha=GeneradorAleatorio.generarInt(31);
            MateriasAprobadas unaMateria = new MateriasAprobadas(nombre,nota,fecha);
            grado.agregarMateria(unaMateria);
        }
        MateriasAprobadas mat = new MateriasAprobadas("Tesina",8,23);
        grado.agregarMateria(mat);
        Doctorado doc = new Doctorado("Bioquimica","UNLP",123586,"Carlos",5);
        for (int i=0;i<4;i++) {
            nombre=GeneradorAleatorio.generarString(5);
            nota=GeneradorAleatorio.generarInt(10);
            fecha=GeneradorAleatorio.generarInt(31);
            MateriasAprobadas unaMateria = new MateriasAprobadas(nombre,nota,fecha);
            doc.agregarMateria(unaMateria);
        }
        MateriasAprobadas mat1 = new MateriasAprobadas("Metodologías de la Investigación",8,23);
        doc.agregarMateria(mat1);
        System.out.println("Alumno de grado: \n"+grado.toString());
        if (grado.estaGraduado()){
            System.out.println("El alumno de grado esta graduado");
        }
        else System.out.println("El alumno de grado no esta graduado");
        System.out.println("Alumno de doctorado: \n"+doc.toString());
        if (doc.estaGraduado()) {
            System.out.println("El alumno de doctorado esta graduado");
        }
        else System.out.println("El alumno de doctorado no esta graduado");
    }
    
}
