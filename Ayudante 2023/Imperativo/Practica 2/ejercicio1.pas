program ejercicio2;
type
    arrayChar = array [1..10] of char;
    lista=^nodo;
    nodo = record
        elem:char;
        sig:lista;
    end;

procedure cargarVector(var v:arrayChar; var diml: integer);
var
    c:char;
begin
    writeln('Ingrese un caracter: ');
    readln(c);
    if (diml<10) then
        v[diml]:=c;
    if (c<>'.') then begin
        diml+=1;
        cargarVector(v,diml);
    end;
end;

procedure imprimirVector(v:arrayChar; diml:integer);
var
    i:integer;
begin
    for i := 1 to diml do
        writeln(v[i]);
end;

procedure imprimirVectorRecursivo(v:arrayChar; diml,pos:integer);
begin
    if (pos<=diml) then begin
        writeln(v[pos]);
        imprimirVectorRecursivo(v,diml,pos+1);
    end;
end;

function contarCaracteres():integer;
var
    c:char;
begin
    writeln('Ingrese un caracter: ');
    readln(c);
    if (c = '.') then
        contarCaracteres:=1
    else 
        contarCaracteres:= contarCaracteres() + 1;
end;

procedure agregarAtras (var l:lista;c:char);
var
	nuevo,aux:lista;
begin
	new(nuevo);
	nuevo^.elem:=c;
	nuevo^.sig:=nil;
	if (l=nil) then 
		l:=nuevo
	else begin
		aux:=l;
		while (aux^.sig<>nil) do
			aux:=aux^.sig;
		aux^.sig:=nuevo;
	end;
end;

procedure cargarLista(var l:lista);
var
    c:char;
begin
    writeln('Ingrese un caracter: ');
    readln(c);
    agregarAtras(l,c);
    if (c<>'.') then
        cargarLista(l^.sig);
end;

procedure imprimirLista(l:lista);
begin
    if (l<>nil) then begin
        writeln(l^.elem);
        imprimirLista(l^.sig);
    end;
end;

procedure imprimirListaInversa(l:lista);
begin
    if (l<>nil) then begin
        imprimirListaInversa(l^.sig);
        writeln(l^.elem);
    end;
end;

var
    v:arrayChar;
    diml, numero:integer;
    l:lista;
begin
    l:=nil;
    diml:=1;
    cargarVector(v,diml);
    writeln('Vector impreso lineal: ');
    imprimirVector(v,diml);
    writeln('Vector impreso recursivo: ');
    imprimirVectorRecursivo(v,diml,1);
    numero := contarCaracteres();
    writeln('Se han contado: ', numero);
    cargarLista(l);
    imprimirLista(l);
    imprimirListaInversa(l);
end.