package deurquiza;
import PaqueteLectura.GeneradorAleatorio;
public class DEURQUIZA {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int N=GeneradorAleatorio.generarInt(4);
        CursoOnline online = new CursoOnline("Zoom","Curso de Matematicas",150,4);
        String tema;int fecha;int duracion;
        for (int i=0;i<4;i++) {
            tema=GeneradorAleatorio.generarString(5);
            fecha=GeneradorAleatorio.generarInt(31)+1;
            duracion = GeneradorAleatorio.generarInt(60);
            Lecciones unaLeccion = new Lecciones(tema,fecha,duracion);
            online.agregarLeccion(unaLeccion);
        }
        System.out.println("Informacion del curso online. Solo habra lecciones las cuales sus duraciones sean menores a 45 minutos: ");
        System.out.println(online.toString());
        N=GeneradorAleatorio.generarInt(10);
        CursoPresencial presencial = new CursoPresencial(6,true,"Curso de salvavidas",200,8);
        for (int i=0;i<10;i++) {
            tema=GeneradorAleatorio.generarString(5);
            fecha=GeneradorAleatorio.generarInt(31)+1;
            duracion = GeneradorAleatorio.generarInt(60);
            Lecciones unaLeccion = new Lecciones(tema,fecha,duracion);
            presencial.agregarLeccion(unaLeccion);
        }
        System.out.println("Informacion del curso presencial: ");
        System.out.println(presencial.toString());
    }
    
}
