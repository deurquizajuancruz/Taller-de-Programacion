/*
Escriba un programa que instancie un proyecto con un director y dos investigadores.
Asigne dos subsidios a cada investigador y otorgue los subsidios del primero de ellos,
luego imprima todos los datos del proyecto en pantalla.
 */
package Repaso;
public class RepasoPunto1 {
    public static void main(String[] args) {
        Investigador i1 = new Investigador("Umberto Unzales",6,"Biologia");
        Investigador i2 = new Investigador("Dionisio Doricelli",8,"Química Cuántica");
        Proyecto Project = new Proyecto("Viajes en el tiempo",2019);
        Project.setNyaDirector("Mario Benavidez");
        Subsidio s1 = new Subsidio (4000,"Experimento en plantas marinas.");
        Subsidio s2 = new Subsidio (5000,"Comportamiento de animales salvajes.");
        Subsidio s3 = new Subsidio (20000,"Oservacion átomos espaciales.");
        Subsidio s4 = new Subsidio (15000,"Gases nobles.");
        s4.setOtorgado(true);
        i1.agregarSubsidio(s1);i1.agregarSubsidio(s2);
        i2.agregarSubsidio(s3);i2.agregarSubsidio(s4);
        i1.otorgarTodos();
        Project.agregarInvestigador(i1);Project.agregarInvestigador(i2);
        System.out.println(Project.toString());
    }
    
}
