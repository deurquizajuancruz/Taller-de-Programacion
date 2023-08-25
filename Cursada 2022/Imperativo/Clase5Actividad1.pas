{Invoque al módulo CrearVectorListas que genera un vector de 4 listas de libros ordenadas
ascendente, teniendo en cuenta que: cada libro se representa con un código ISBN (entero e/ 0 y 15)
y que para cada lista se ingresan libros hasta el 0. Reusar el módulo CrearListaOrdenada del
ProgramaListas.pas (clase 1).

b. Invoque al módulo ImprimirVectorListas que imprime en pantalla el contenido de cada lista del
vector. Reusar el módulo ImprimirLista del ProgramaListas.pas (clase 1).
c. Invoque al módulo Merge que recibe el vector generado en a) y devuelve una nueva lista ordenada
ascendente con los elementos de las 4 listas originales. Luego imprima la lista resultante.
Para implementar el merge utilice el pseudocódigo analizado en la clase.
Además este módulo requiere:
c.1. Implementar el módulo DeterminarMinimo que retorne el valor mínimo de un vector de listas
ordenadas de forma creciente. Dicho valor se debe quitar de la lista original. Para esto, utilice el
pseudocódigo analizado en clase.

procedure determinar_minimo( var v: vectorListas; var min: integer);

c.2. Implementar el módulo AgregarAtras en una lista de enteros. Reusar el módulo provisto en clase 1.

procedure AgregarAtras (var pri, ult: lista; elem: integer);}
program Clase5Actividad1;
type
	lista=^nodo;
	nodo=record
		elem:integer;
		sig:lista;
	end;
	vector=array[1..4] of lista;

procedure inicializarvector(var v:vector);
var i:integer;
begin
	for i:= 1 to 4 do begin
		v[i]:=nil;
	end;
end;

procedure InsertarOrdenado(var l:lista;num:integer);
var
	ant,nue,act:lista;
begin
	new(nue);nue^.elem:=num;
	ant:=l;act:=l;
	while (act<>nil) and (act^.elem<num) do begin
		ant:=act;act:=act^.sig;
	end;
	if (act=l) then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;


procedure crearvector(var v:vector);
var num,i:integer;
begin
	for i:= 1 to 4 do begin
		num:=random(16);
		while (num<>0) do begin
			InsertarOrdenado(v[i],num);
			num:=random(16);
		end;
	end;
end;

procedure imprimirLista(l:lista);
begin
	while (l<>nil) do begin
		writeln('ISBN: ',l^.elem);
		l:=l^.sig;
	end;
end;

procedure ImprimirVectorListas(v:vector);
var i:integer;
begin
	for i:=1 to 4 do begin
		writeln('Lista numero: ',i);
		ImprimirLista(v[i]);
	end;
end;

procedure buscarminimo(var min:integer;var v:vector);
var pos,i:integer;
begin
	min:=100;
	for i:= 1 to 4 do begin
		if (v[i]<>nil) then
			if (v[i]^.elem<min) then begin
				min:=v[i]^.elem;pos:=i;
			end;
	end;
	if (min<>100) then 
		v[pos]:=v[pos]^.sig;
end;

procedure AgregarAtras(var l,ult:lista;num:integer);
var nue:lista;
begin
	new(nue);
	nue^.elem:=num;
	nue^.sig:=nil;
	if (l<>nil) then
		ult^.sig:=nue
	else
		l:=nue;
	ult:=nue;
end;

procedure Merge(v:vector;var nueva:lista);
var
	ult:lista;
	min:integer;
begin
	ult:=nil;
	buscarminimo(min,v);
	while (min<>100) do begin
		agregaratras(nueva,ult,min);
		buscarminimo(min,v);
	end;
end;

var
	nueva:lista;
	v:vector;
begin
	Randomize;nueva:=nil;
	inicializarvector(v);
	crearvector(v);
	ImprimirVectorListas(v);
	Merge(v,nueva);
	writeln('Nueva lista: ');imprimirLista(nueva);
end.
