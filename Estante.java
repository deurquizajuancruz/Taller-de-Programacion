/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author alumnos
 */
public class Estante {
    Libro [] libros = new Libro [20];
    int diml;

    public Estante() {
        this.diml = 0;
    }

    public int getDiml() {
        return diml;
    }
    
    public boolean estaLleno() {
        return diml == 20;
    }
    
    public void agregarLibro(Libro l) {
        if (diml < 20) {
            this.libros[diml]=l;
            diml++;
        } else
            System.out.println("Estante lleno");
    }
    
    public Libro buscarTitulo(String titulo) {
        int recorrido = 0;
        while (recorrido < diml) {
            if (this.libros[recorrido].getTitulo().equals(titulo))
                return this.libros[recorrido];
            recorrido++;
        }
        return null;
    }
}
