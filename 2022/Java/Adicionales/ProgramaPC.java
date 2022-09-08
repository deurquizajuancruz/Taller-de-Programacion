/*
Representar Salas de PCs. Una Sala de PC tiene espacios (numerados de 1 a N) para N PCs. De las PCs se conoce: estado (que indica si está encendida o apagada) y su consumo por hora.
a) Genere las clases necesarias. Provea constructores para iniciar: las PCs en apagado y a partir de un consumo por hora; la sala con espacio para N PCs  (N se recibe; inicialmente los espacios están vacíos).
b) Implemente los métodos necesarios, en las clases adecuadas, para permitir:
i- Dado un nro. de espacio válido y una PC, incluir la PC en ese espacio de la sala.
ii- Encender la PC apagada con menor consumo por hora.
iii- Obtener un string con los números de espacio que ocupan las PCs encendidas
c) Realice un programa que instancie una sala de PC con espacio para 5 PCs. 
Incluya 3 PCs a la sala, en distintos espacios. 
Encienda las 2 PCs de la sala que menos consumen por hora.
Imprimir el valor obtenido del inciso iii).
*/
package Final;
public class ProgramaPC {
    public static void main(String[] args) {
        System.out.println("Instanciando la sala de PCs");
        SalaPC sala = new SalaPC(5);
        PC pc1=new PC(20);
        PC pc2=new PC(500);
        PC pc3=new PC(140);
        sala.agregarPC(1, pc1);
        sala.agregarPC(2, pc2);
        sala.agregarPC(3, pc3);
        sala.menorConsumo();
        sala.menorConsumo();
        /*String aux2 =sala.toString2();
        System.out.println(aux2);*/
        String aux =sala.toString();
        System.out.println(aux);
    }
    
}
