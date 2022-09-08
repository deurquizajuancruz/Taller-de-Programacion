/*
 5-A- Definir una clase para representar flotas de micros. Una flota se caracteriza por
conocer a los micros que la componen (a lo sumo 15). Defina un constructor para crear
una flota vacía (sin micros).
Implemente métodos para:
i. devolver si la flota está completa (es decir, si tiene 15 micros o no).
ii. agregar a la flota un micro recibido como parámetro.
iii. eliminar de la flota el micro con patente igual a una recibida como parámetro, y
retornar si la operación fue exitosa.
iv. buscar en la flota un micro con patente igual a una recibida como parámetro y
retornarlo (en caso de no existir dicho micro, retornar null).
v. buscar en la flota un micro con destino igual a uno recibido como parámetro y
retornarlo (en caso de no existir dicho micro, retornar null). 
 */
package tema4;
public class Flota {
    private Micro [] micros=new Micro [15];
    private int cantidadmicros;
public Flota() {
    cantidadmicros=0;
}
//getters
public boolean completa() {
    if (cantidadmicros==15)
        return true;
    else
        return false;
}
public String eliminar(String patentebuscada) {
    int j,i;
    for (i=0;i<cantidadmicros;i++)
        if (micros[i].getPatente().equals(patentebuscada)) {
            cantidadmicros--;
            for (j=i;j<(cantidadmicros);j++){
                micros[j]=micros[j+1];}
            return "La operacion fue exitosa.";
        }
    return "La operacion no fue exitosa, no se encontró un micro con esa patente.";
}
public Micro buscarPatente (String unaPatente) {
    int i;
    for (i=0;i<cantidadmicros;i++)
        if (micros[i].getPatente().equals(unaPatente)) {
            return micros[i];
        }
    return null;
}
public String eliminada (String unaPatente) {
    int i;
    for (i=0;i<cantidadmicros;i++)
        if (micros[i].getPatente().equals(unaPatente)) {
            return "No se elimino correctamente.";
        }
    return "La patente no se encontraba o se elimino correctamente.";
}
public Micro buscarDestino(String unDestino) {
    int i;
    for (i=0;i<cantidadmicros;i++)
        if (micros[i].getDestino().equals(unDestino)) {
            return micros[i];
        }
    return null;
}
//setters
public void agregar(Micro unMicro) {
    micros[cantidadmicros]=unMicro;
    cantidadmicros++;
}
}
