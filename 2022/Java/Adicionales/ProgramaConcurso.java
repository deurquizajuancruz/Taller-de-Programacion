package Final;
import PaqueteLectura.Lector;
public class ProgramaConcurso {
    public static void main(String[] args) {
        System.out.println("Vamos a realizar un concurso.");
        System.out.println("Ingrese la cantidad de parejas que participaran: ");
        int N=Lector.leerInt();
        String nombre,estilo;int dni,edad;
        Concurso elConcurso=new Concurso(N);
        for (int i=0;i<N;i++) {
            System.out.println("Ingrese el estilo de baile de la pareja: "+(i+1));
            estilo=Lector.leerString();
            System.out.println("Informacion del participante 1 de la pareja " + (i+1));
            System.out.println("Ingrese nombre: ");nombre=Lector.leerString();
            System.out.println("Ingrese DNI: ");dni=Lector.leerInt();
            System.out.println("Ingrese edad: ");edad=Lector.leerInt();
            Participante p1= new Participante(dni,nombre,edad);
            System.out.println("Informacion del participante 2 de la pareja " + (i+1));
            System.out.println("Ingrese nombre: ");nombre=Lector.leerString();
            System.out.println("Ingrese DNI: ");dni=Lector.leerInt();
            System.out.println("Ingrese edad: ");edad=Lector.leerInt();
            Participante p2= new Participante(dni,nombre,edad);
            Parejas unaP=new Parejas(estilo);
            unaP.cargarParticipante(p1);unaP.cargarParticipante(p2);
            elConcurso.agregarPareja(unaP);
        }
        Parejas md=elConcurso.mayorDiferencia();
        System.out.println("Nombres de la pareja con mayor diferencia de edad: "+md.toString());
    }
}

