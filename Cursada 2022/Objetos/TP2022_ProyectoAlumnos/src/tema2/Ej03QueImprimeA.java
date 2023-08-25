
package tema2;

/**
 *
 * @author vsanz
 */
public class Ej03QueImprimeA {
    public static void main(String[] args) {
        String saludo1=new String("hola");
        String saludo2=new String("hola");
        System.out.println(saludo1 == saludo2); // false
        System.out.println(saludo1 != saludo2); // true
        System.out.println(saludo1.equals(saludo2)); // true
    } 
}
