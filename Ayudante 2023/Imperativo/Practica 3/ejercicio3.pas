program ejercicio3;
type
    finales = record
        codigo: integer;
        nota: integer;
    end;

    lista = ^nodo;
    nodo = record
        elem: finales;
        sig:lista;
    end;

    alumno = record
        legajo: integer;
        dni: integer;
        anio: integer;
        materias: lista;
    end;

    arbol = ^nodoArbol;
    nodoArbol = record
        elem:alumno;
        hi:arbol;
        hd:arbol;
    end;

procedure agregarAtras(var l: lista; f:finales);
var
    nuevo,aux: lista;
begin
    new(nuevo);
    nuevo^.elem:=f;
    nuevo^.sig:=nil;
    if (l = nil) then
        l:=nuevo
    else begin
        aux:=l;
        while (aux^.sig<>nil) do 
            aux:=aux^.sig;
        aux^.sig:=nuevo;
    end;
end;

procedure leerFinales(var l:lista);
var
    f:finales;
begin
    writeln('Ingrese codigo materia: ');
    readln(f.codigo);
    while (f.codigo<>-1) do begin
        f.nota:=random(11);
        agregarAtras(l,f);
        writeln('Ingrese codigo materia: ');
        readln(f.codigo);
    end;
end;

function leerAlumno():alumno;
begin
    writeln('Ingrese legajo: ');
    readln(leerAlumno.legajo);
    if (leerAlumno.legajo<>0) then begin
        leerAlumno.dni:=random(100)+1;
        leerAlumno.anio:=random(20)+2000;
        leerAlumno.materias:=nil;
        leerFinales(leerAlumno.materias);
    end;
end;

procedure agregarNodo(var a:arbol; al:alumno);
begin
    if (a = nil) then begin
        new(a);
        a^.elem:=al;
        a^.hi:=nil;
        a^.hd:=nil;
    end
    else begin
        if (a^.elem.legajo <= al.legajo) then
            agregarNodo(a^.hd,al)
        else
            agregarNodo(a^.hi,al);
    end;
end;

procedure cargarArbol(var a:arbol);
var
    al:alumno;
begin
    al:=leerAlumno();
    while (al.legajo<>0) do begin
        agregarNodo(a,al);
        al:=leerAlumno();
    end;
end;

procedure recorrerNotas(l:lista);
begin
    while (l<>nil) do begin
        writeln('Codigo ',l^.elem.codigo,' Nota ',l^.elem.nota);
        l:=l^.sig;
    end;
end;

function calcularPromedio(l:lista):real;
var
    suma,cantidad:integer;
begin
    cantidad:=0;
    suma:=0;
    while (l<>nil) do begin
        suma+=l^.elem.nota;
        cantidad+=1;
        l:=l^.sig;
    end;
    calcularPromedio:= suma / cantidad;
end;

procedure imprimirArbol(a:arbol);
begin
    if (a<>nil) then begin
        writeln('Legajo ',a^.elem.legajo, ' Anio ',a^.elem.anio, ' DNI ',a^.elem.dni);
        recorrerNotas(a^.elem.materias);
        writeln('Promedio: ',calcularPromedio(a^.elem.materias):0:2);
        imprimirArbol(a^.hi);
        imprimirArbol(a^.hd);
    end;
end;

procedure legajoInferior(a:arbol; legajo: integer);
begin
    if (a<>nil) then begin
        if (a^.elem.legajo > legajo) then begin
            legajoInferior(a^.hi,legajo);
            writeln('DNI ',a^.elem.dni,' Anio: ',a^.elem.legajo);
            legajoInferior(a^.hd,legajo);
        end;
    end;
end;

procedure masGrande(a:arbol; var max:integer);
begin
    if (a<>nil) then begin
        max:=a^.elem.legajo;
        masGrande(a^.hd,max);
    end;
end;

procedure dniMasGrande(a:arbol; var dni:integer);
begin
    if (a<>nil) then begin
        dniMasGrande(a^.hi,dni);
        if (a^.elem.dni > dni) then
            dni := a^.elem.dni;
        dniMasGrande(a^.hd,dni);
    end;
end;

function legajoImpar(a:arbol): integer;
var
    aux:integer;
begin
    aux:=0;
    if (a<>nil) then begin
        aux:= legajoImpar(a^.hi);
        if (a^.elem.legajo mod 2 <> 0) then
            aux +=1;
        aux+= legajoImpar(a^.hd);
    end;
    legajoImpar:=aux;
end;

procedure mayorPromedio(a:arbol; var mejor:alumno; var prom:real);
var
    promedio: real;
begin
    if (a<>nil) then begin
        mayorPromedio(a^.hi,mejor,prom);
        promedio:=calcularPromedio(a^.elem.materias);
        if ( promedio > prom) then begin
            prom:=promedio;            
            mejor:= a^.elem;
        end;
        mayorPromedio(a^.hd,mejor,prom);
    end;
end;

procedure promedios(a:arbol; referencia:real);
var
    promedio: real;
begin
    if (a<>nil) then begin
        promedios(a^.hi,referencia);
        promedio:=calcularPromedio(a^.elem.materias);
        if (promedio>referencia) then
            writeln('El alumno ',a^.elem.legajo,' tiene un promedio de ',promedio:0:2);
        promedios(a^.hd,referencia);
    end;
end;

var
    a:arbol;
    dni,max:integer;
    prom:real;
    mejor:alumno;
begin
    randomize;
    a:=nil;
    cargarArbol(a);
    imprimirArbol(a);
    //legajoInferior(a,100);
    masGrande(a,max);
    writeln('El legajo mas grande es ',max);
    dni:=-1;
    dniMasGrande(a,dni);
    writeln('El dni mas grande es ',dni);
    writeln('La cantidad de legajos impares es ',legajoImpar(a));
    prom:=-1;
    mayorPromedio(a,mejor,prom);
    writeln('El mejor alumno es ',mejor.legajo,' con ',prom:0:2,' de promedio');
    promedios(a,5);
end.