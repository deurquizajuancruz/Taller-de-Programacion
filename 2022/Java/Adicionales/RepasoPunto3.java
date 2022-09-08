/*
Escriba un programa que instancie un coro de cada tipo. Se deberá leer o bien la
cantidad de coristas (en el caso del coro semicircular) o la cantidad de hileras e
integrantes por hilera (en el caso del coro por hileras). Luego se deberá crear la
cantidad de coristas necesarios, leyendo sus datos, y almacenándolos en el coro.
Finalmente imprima toda la información de los coros indicando si están bien formados
o no.
*/
package Repaso;
public class RepasoPunto3 {
    public static void main(String[] args) {
        System.out.println("Instanciacion de 3 coristas para el Semicirculo.");
        Director d= new Director(30,"Javier Juarez",16589214,60);
        SemiCirculo semi = new SemiCirculo(3,d,"El Semi");
        Corista c1= new Corista(5,"Umberto Uzales",11423651,19);
        semi.agregarCorista(c1);
        Corista c2= new Corista(7,"Dorisio Daemon",22463752,28);
        semi.agregarCorista(c2);
        Corista c3= new Corista(1,"Terry Trambol",35441659,36);
        semi.agregarCorista(c3);
        Corista c4= new Corista(5,"Carlos Caceres",41785214,41);
        semi.agregarCorista(c4);
        System.out.println(semi.toString());
        System.out.println("Un semicirculo está bien formado si está lleno y si de izquierda a derecha los coristas están ordenados de mayor a menor en cuanto a tono fundamental.");
        if (semi.bienFormado()) {
            System.out.println("El semicirculo está bien formado.");
            }
        else {
            System.out.println("El semicirculo NO esta bien formado.");
            }
        System.out.println("2 hileras y 3 integrantes por hilera.");
        Director dir2=new Director(20,"Pedro Polan",19842365,50);
        Hileras hile = new Hileras(2,3,dir2,"Las Hileras Cantantes");
        Corista uno = new Corista(5,"Ulises Urizo",14725836,18);
        hile.agregarCorista(uno);
        Corista dos = new Corista(5,"Dionisio Dante",21365874,24);
        hile.agregarCorista(dos);
        Corista tres = new Corista(5,"Teresa Torizo",369258147,35);
        hile.agregarCorista(tres);
        Corista cuatro = new Corista(5,"Carmen Cerezo",41598753,41);
        hile.agregarCorista(cuatro);
        Corista cinco = new Corista(5,"Cristobal Colon",54789632,57);
        hile.agregarCorista(cinco);
        Corista seis = new Corista(5,"Serinda Seimon",654987321,63);
        hile.agregarCorista(seis);
        Corista siete = new Corista(7,"Sofia Seruo",741852963,77);
        hile.agregarCorista(siete);
        System.out.println(hile.toString());
        System.out.println("Para que un coro por hileras este bien formado, debe estar lleno y desde adelante hacia atrás los coristas tienen que estar ordenados de mayor a menor en cuanto a tono fundamental y todos los miembros de una misma hilera deben tener el mismo tono fundamental.");
        if (hile.bienFormado()) {
            System.out.println("El coro por hileras está bien formado.");
        }
        else {
            System.out.println("El coro por hileras NO está bien formado.");
        }
        }
    }
