program ejercicio1;
type
    socio = record
        numero:integer;
        nombre:string;
        edad:integer;
    end;
    arbol = ^nodo;
    nodo = record
        elem:socio;
        hi:arbol;
        hd:arbol;
    end;

function randomString():string;
var
    i:integer;
begin
    setLength(randomString,3);
    for i := 1 to 3 do 
        randomString[i]:=chr(random(26)+97);        
end;

function leerSocio():socio;
begin
    writeln('Ingrese numero de socio: ');
    readln(leerSocio.numero);
    if (leerSocio.numero<>0) then begin
        leerSocio.nombre:=randomString();
        leerSocio.edad:=random(70)+1;
    end;
end;

procedure agregarNodo(var a:arbol; s:socio);
begin
    if (a = nil) then begin
        new(a);
        a^.elem:=s;
        a^.hi:=nil;
        a^.hd:=nil;
    end
    else begin
        if (a^.elem.numero <= s.numero) then
            agregarNodo(a^.hd,s)
        else
            agregarNodo(a^.hi,s);
    end;
end;

procedure cargarArbol(var a:arbol);
var
    s:socio;
begin
    s:=leerSocio();
    while (s.numero<>0) do begin
        agregarNodo(a,s);
        s:=leerSocio();
    end;
end;

procedure imprimirArbol(a:arbol);
begin
    if (a<>nil) then begin
        writeln('Nro ',a^.elem.numero, ' Edad ',a^.elem.edad, ' Nombre ',a^.elem.nombre);
        imprimirArbol(a^.hi);
        imprimirArbol(a^.hd);
    end;
end;

procedure masGrande(a:arbol; var max:integer);
begin
    if (a<>nil) then begin
        max:=a^.elem.numero;
        masGrande(a^.hd,max);
    end;
end;

procedure menorSocio(a: arbol; var menor:socio);
begin
    if (a<>nil) then begin
        menor:=a^.elem;
        menorSocio(a^.hi,menor);
    end;
end;

procedure mayorEdad(a:arbol; var edad:socio);
begin
    if (a<>nil) then begin
        mayorEdad(a^.hi,edad);
        if (a^.elem.edad>edad.edad) then
            edad:=a^.elem;
        mayorEdad(a^.hd,edad);
    end;
end;

procedure aumentarEdad(a:arbol);
begin
    if (a<>nil) then begin
        aumentarEdad(a^.hi);
        a^.elem.edad+=1;
        aumentarEdad(a^.hd);
    end;
end;

function buscarValor(a:arbol; numero:integer):boolean;
var
    aux:boolean;
begin
    aux:=false;
    if (a<>nil) then begin
        if (a^.elem.numero = numero) then
            aux:=true;
        if (not aux) then begin
            if (a^.elem.numero <= numero) then
                aux:=buscarValor(a^.hd,numero)
            else
                aux:=buscarValor(a^.hi,numero);
        end;
    end;
    buscarValor:=aux;
end;

function buscarNombre(a:arbol; nombre:string):boolean;
var
    aux:boolean;
begin
    aux:=false;
    if (a<>nil) then begin
        if (a^.elem.nombre = nombre) then
            aux:=true
        else begin
            aux:=buscarNombre(a^.hi,nombre);
            if (not aux) then
                aux:=buscarNombre(a^.hd,nombre);
        end;
    end;
    buscarNombre:=aux;
end;

function contarNodos(a:arbol):integer;
begin
    contarNodos:=0;
    if (a<>nil) then begin
        contarNodos:=1;
        contarNodos+=contarNodos(a^.hi);
        contarNodos+=contarNodos(a^.hd);
    end;
end;

function sumaEdades(a:arbol):integer;
begin
    sumaEdades:=0;
    if (a<>nil) then begin
        sumaEdades:=a^.elem.edad;
        sumaEdades+=sumaEdades(a^.hi);
        sumaEdades+=sumaEdades(a^.hd);
    end;
end;

function promedioEdades(a:arbol):real;
begin
    promedioEdades:=sumaEdades(a) / contarNodos(a);
end;

procedure ordenCreciente(a:arbol);
begin
    if (a<>nil) then begin
        ordenCreciente(a^.hi);
        writeln(a^.elem.numero);
        ordenCreciente(a^.hd);
    end;
end;

procedure ordenDecreciente(a:arbol);
begin
    if (a<>nil) then begin
        ordenDecreciente(a^.hd);
        writeln(a^.elem.numero);
        ordenDecreciente(a^.hi);
    end;
end;

var
    a:arbol;
    buscar,max:integer;
    edad,menor:socio;
    nombreBuscar:string;
begin
    randomize;
    a:=nil;
    cargarArbol(a);
    imprimirArbol(a);
    masGrande(a,max);
    writeln('El nro de socio mas grande es: ',max);
    menorSocio(a,menor);
    writeln('El socio con numero mas chico es el: ',menor.numero,' con nombre ',menor.nombre,' y edad ',menor.edad);
    edad.edad:=-1;
    mayorEdad(a,edad);
    writeln('El socio con mayor edad tiene ',edad.edad, 'anios');
    aumentarEdad(a);
    writeln('Todas las edades aumentadas en 1');
    imprimirArbol(a);
    writeln('Ingrese el nro de socio a buscar: ');
    readln(buscar);
    if (buscarValor(a,buscar)) then
        writeln('El nro de socio existe')
    else
        writeln('El nro de socio NO existe');
    writeln('Ingrese el nombre de socio a buscar: ');
    readln(nombreBuscar);
    writeln(buscarNombre(a,nombreBuscar));
    writeln('Hay ',contarNodos(a), ' socios');
    writeln('El promedio de las edades es: ',promedioEdades(a):0:2);
    writeln('Numeros de socios en orden creciente: ');
    ordenCreciente(a);
    writeln('Numeros de socios en orden decreciente: ');
    ordenDecreciente(a);
end.