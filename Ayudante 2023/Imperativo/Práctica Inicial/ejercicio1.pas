program ejercicio1;
type
    rangoMaterias = 1..36;
    notaSinAplazos = 4..10;
    arrayNotas = array [rangoMaterias] of notaSinAplazos;
    alumno = record
        apellido: string;
        numero: integer;
        anio: integer;
        materias: rangoMaterias;
        notas: arrayNotas;
    end;

    lista = ^nodo;
    nodo = record
        elem: alumno;
        sig: lista;
    end;

function randomString():string;
var
    i:integer;
begin
    setLength(randomString,3);
    for i := 1 to 3 do 
        randomString[i]:=chr(random(26)+97);        
end;

function leerAlumnos(): alumno;
var
    i:integer;
begin
    leerAlumnos.apellido:=randomString();
    readln(leerAlumnos.numero);
    //leerAlumnos.numero:=random(40)+1;
    leerAlumnos.anio:=random(20)+2000;
    leerAlumnos.materias:=random(36)+1;
    for i := 1 to leerAlumnos.materias do
        leerAlumnos.notas[i]:=random(7)+4;
end;

procedure agregarAtras(var l: lista; a: alumno);
var
    nuevo,aux: lista;
begin
    new(nuevo);
    nuevo^.elem:=a;
    nuevo^.sig:=nil;
    if (l = nil) then
        l:=nuevo
    else begin
        aux:=l;
        while (aux^.sig<>nil) do begin
            aux:=aux^.sig;
        end;
        aux^.sig:=nuevo;
    end;
end;

procedure cargarLista(var l:lista);
var
    a:alumno;
begin
    repeat
        a:=leerAlumnos();
        agregarAtras(l,a);
    until (a.numero=11111);
end;

function promedio(cantidadMaterias:integer; notas:arrayNotas):real;
var
    suma,i:integer;
begin
    suma:=0;
    for i := 1 to cantidadMaterias do
        suma+=notas[i];
    promedio:=suma / cantidadMaterias;
end;

procedure imprimirLista(l:lista);
var
    i:integer;
begin
    while (l<>nil) do begin
        writeln('Apellido: ',l^.elem.apellido);
        writeln('Numero: ',l^.elem.numero);
        writeln('Anio: ',l^.elem.anio);
        writeln('Materias aprobadas: ',l^.elem.materias);
        for i := 1 to l^.elem.materias do
            writeln('Nota de la materia ',i,': ',l^.elem.notas[i]);
        writeln('Tiene un promedio de: ',promedio(l^.elem.materias, l^.elem.notas):0:2);
        l:=l^.sig;
    end;
end;

var
    l:lista;
begin
    randomize;
    l:=nil;
    cargarLista(l);
    imprimirLista(l);
end.