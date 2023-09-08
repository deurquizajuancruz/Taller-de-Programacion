program ejercicio3;
type
    materia = record
        codigoMateria: integer;
        nota: integer;
    end;

    lista = ^nodoLista;
    nodoLista = record
        elem:materia;
        sig:lista;
    end;

    infoArbol = record
        codigoAlumno: integer;
        materias: lista;
    end;

    arbol=^nodo;
    nodo = record
        elem:infoArbol;
        hi:arbol;
        hd:arbol;
    end;

    final = record
        alumno:integer;
        nota:integer;
    end;

    listaFinales=^nodoF;
    nodoF = record
        elem:final;
        sig:listaFinales;
    end;

    vectorMaterias = array [1..30] of listaFinales;

procedure agregarAtras(var l: lista; m:materia);
var
    nuevo,aux: lista;
begin
    new(nuevo);
    nuevo^.elem:=m;
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

procedure agregarNodo(var a:arbol; cod:integer; m:materia);
begin
    if (a = nil) then begin
        new(a);
        a^.elem.codigoAlumno:=cod;
        a^.elem.materias:=nil;
        if (m.nota>3) then
            agregarAtras(a^.elem.materias,m);
        a^.hi:=nil;
        a^.hd:=nil;
    end
    else begin
        if (a^.elem.codigoAlumno = cod) and (m.nota>3) then
            agregarAtras(a^.elem.materias,m)
        else if (a^.elem.codigoAlumno < cod) then
            agregarNodo(a^.hd,cod,m)
        else
            agregarNodo(a^.hi,cod,m);
    end;
end;

procedure cargarArbol(var a:arbol);
var
    i:infoArbol;
    m:materia;
begin
    i.codigoAlumno:=random(10)+1;
    m.codigoMateria:=random(12)+1;
    writeln('Ingrese nota del final: ');
    readln(m.nota);
    while(m.nota<>-1) do begin
        agregarNodo(a,i.codigoAlumno,m);
        i.codigoAlumno:=random(10)+1;
        m.codigoMateria:=random(12)+1;
        writeln('Ingrese nota del final: ');
        readln(m.nota);
    end;
end;

procedure agregarFinal(var l: listaFinales; f:final);
var
    nuevo,aux: listaFinales;
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

procedure cargarMaterias(var v:vectorMaterias);
var
    f:final;
    cod:integer;
begin
    cod:=random(30)+1;
    f.alumno:=random(20)+1;
    writeln('Ingrese nota del final: ');
    readln(f.nota);
    while (f.nota<>-1) do begin
        agregarFinal(v[cod],f);
        cod:=random(30)+1;
        f.alumno:=random(20)+1;
        writeln('Ingrese nota del final: ');
        readln(f.nota);
    end;
end;

function cantidadFinales(l:lista):integer;
begin
    cantidadFinales:=0;
    while (l<>nil) do begin
        cantidadFinales+=1;
        l:=l^.sig;
    end;
end;

function calcularPromedio(l:lista):real;
var
    suma,cantidad:integer;
begin
    calcularPromedio:=0;
    suma:=0;
    cantidad:=cantidadFinales(l);
    while (l<>nil) do begin
        suma+=l^.elem.nota;
        l:=l^.sig;
    end;
    calcularPromedio := suma / cantidad;
end;

procedure promedios(a:arbol; cod:integer);
begin
    if (a<>nil) then begin
        if (a^.elem.codigoAlumno > cod) then begin
            writeln('El alumno con codigo ',a^.elem.codigoAlumno, ' tiene de promedio: ',calcularPromedio(a^.elem.materias):0:2);
            promedios(a^.hi,cod);            
            promedios(a^.hd,cod);            
        end
        else if (a^.elem.codigoAlumno < cod) or (a^.elem.codigoAlumno = cod) then
            promedios(a^.hd,cod);
    end;
end;

procedure finalesAprobados(a:arbol; uno,dos,cantidad:integer; var cant:integer);
begin
    if (a<>nil) then begin
        if (a^.elem.codigoAlumno >= uno) and (a^.elem.codigoAlumno <= dos) and (cantidadFinales(a^.elem.materias)=cantidad) then begin
            cant+=1;
            finalesAprobados(a^.hi,uno,dos,cantidad,cant);
            finalesAprobados(a^.hd,uno,dos,cantidad,cant);
        end
        else if (a^.elem.codigoAlumno > dos) then
            finalesAprobados(a^.hi,uno,dos,cantidad,cant)
        else 
            finalesAprobados(a^.hd,uno,dos,cantidad,cant)
    end;
end;

function finales(a:arbol; uno,dos,cantidad:integer):integer;
begin
    if (a = nil) then
        finales:=0
    else begin
        if (a^.elem.codigoAlumno >= uno) and (a^.elem.codigoAlumno <= dos) and (cantidadFinales(a^.elem.materias)=cantidad) then
            finales:=finales(a^.hi,uno,dos,cantidad) + finales(a^.hd,uno,dos,cantidad) + 1
        else if (a^.elem.codigoAlumno > dos) then
            finales:=finales(a^.hi,uno,dos,cantidad)
        else
            finales:=finales(a^.hd,uno,dos,cantidad);
    end;
end;

begin
    randomize;
    // sin testear
end.