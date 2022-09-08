{Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las
entradas vendidas. Se desea procesar la información de una semana.
Implementar un programa que:
a. Genere 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1
a 7), código de la obra, asiento y monto. La lectura finaliza con el código de obra igual a 0.
Las listas deben estar ordenadas por código de obra de forma ascendente.
b. Genere una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista
debe estar ordenada por código de obra de forma ascendente
}
program Punto13Practica1;
type
	semana=1..7;
	entrada=record
		dia:semana;
		codigo:integer;
		asiento:integer;
		monto:real;
	end;
	lista=^nodo;
	nodo=record
		elem:entrada;
		sig:lista;
	end;
	ventradas=array[semana] of lista;
procedure inicializarlistas(var v:ventradas);
var i:semana;
begin
	for i:=1 to 7 do
		v[i]:=nil;
end;
procedure leerentrada(var e:entrada);
begin
	writeln('Ingrese codigo de la obra: ');readln(e.codigo);
	if (e.codigo<>0) then begin
		writeln('Ingrese dia de la semana(del 1 al 7): ');readln(e.dia);
		writeln('Ingrese asiento: ');readln(e.asiento);
		writeln('Ingrese monto: ');readln(e.monto);
	end;
end;
procedure insertarordenado(var l:lista;e:entrada);
var ant,act,nue:lista;
begin
	new(nue);nue^.elem:=e;nue^.sig:=nil;
	if (l=nil) then l:=nue
	else begin act:=l;ant:=l;
	while (act<>nil) and (act^.elem.codigo<e.codigo) do begin ant:=act;act:=act^.sig;
		end;
	if (ant=act) then l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
	end;
end;
procedure agregaratras(var l:lista;e:entrada);
var nuevo,aux:lista;
begin
	new(nuevo);nuevo^.elem:=e;nuevo^.sig:=nil;
	if (l=nil) then l:=nuevo
	else begin
	aux:=l;
	while (aux^.sig<>nil) do begin
		aux:=aux^.sig;
		end;
	aux^.sig:=nuevo;
	end;
end;
procedure cargarvector(var v:ventradas);
var e:entrada;
begin
	leerentrada(e);
	while (e.codigo<>0) do begin
		insertarordenado(v[e.dia],e);leerentrada(e);
	end;
end;
procedure minimo(var v:ventradas;var min:entrada);
var indicemin:integer;i:semana;
begin
	min.codigo:=32000;indicemin:=-1;
	for i:=1 to 7 do
		if (v[i]<>nil) then
			if (v[i]^.elem.codigo<=min.codigo) then begin
			indicemin:=i;min.codigo:=v[i]^.elem.codigo;
			end;
	if (indicemin<>-1) then begin
	min:=v[indicemin]^.elem;v[indicemin]:=v[indicemin]^.sig;
	end;
end;
procedure merge (v:ventradas;var l:lista);
var min:entrada;canti,actual:integer;
begin
	l:=nil;minimo(v,min);
	while (min.codigo<>32000) do begin
	actual:=min.codigo;canti:=0;
	while (min.codigo<>32000) and (actual=min.codigo) do begin
		canti:=canti +1;minimo(v,min);
		end;
	writeln('La cantidad de entradas vendidas para la obra con codigo ', actual,' es de: ',canti);agregaratras(l,min);
	end;
end;
var vector:ventradas;nueva:lista;
begin
	inicializarlistas(vector);cargarvector(vector);merge(vector,nueva);
end.
