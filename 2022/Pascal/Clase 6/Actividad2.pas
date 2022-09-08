
{Retomar el programa de la Actividad 2 de la clase anterior.
a. A partir del vector de listas de ventas de la perfumería, genere una nueva lista que totalice la cantidad
de ventas de cada producto de la perfumería. Esta nueva lista debe estar ordenada por código de
producto (ascendente).
b. Muestre la lista resultante.}
program Clase6Actividad2;
type
	venta=record
		codventa:integer;
		codproducto:integer;
		cantidadventas:integer;
	end;
	lista=^nodo;
	nodo=record
		elem:venta;
		sig:lista;
	end;
	venta2 = record
		codproducto:integer;
		canttotal:integer;
	end;
	lista2=^nodo2;
	nodo2=record
		elem:venta2;
		sig:lista2;
	end;
	vector=array[1..4] of lista;

procedure inicializarvector(var v:vector);
var i:integer;
begin
	for i:= 1 to 4 do begin
		v[i]:=nil;
	end;
end;

procedure InsertarOrdenado(var l:lista;v:venta);
var
	ant,nue,act:lista;
begin
	new(nue);nue^.elem:=v;
	ant:=l;act:=l;
	while (act<>nil) and (act^.elem.codproducto<v.codproducto) do begin
		ant:=act;act:=act^.sig;
	end;
	if (act=l) then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure leerventa(var v:venta);
begin
	v.codventa:=random(10);
	if (v.codventa<>0) then begin
		v.codproducto:=random(10)+1;
		v.cantidadventas:=random(10)+1;
	end;
end;

procedure crearvector(var v:vector);
var i:integer;
	ven:venta;
begin
	for i:= 1 to 4 do begin
		leerventa(ven);
		while (ven.codventa<>0) do begin
			InsertarOrdenado(v[i],ven);
			leerventa(ven);
		end;
	end;
end;

procedure imprimirLista(l:lista);
begin
	while (l<>nil) do begin
		writeln('Codigo de producto: ',l^.elem.codproducto,' Codigo de venta: ',l^.elem.codventa, ' Cantidad de ventas: ',l^.elem.cantidadventas);
		l:=l^.sig;
	end;
end;

procedure imprimirnuevaLista(l:lista2);
begin
	while (l<>nil) do begin
		writeln('Codigo de producto: ',l^.elem.codproducto,' tiene un total de: ',l^.elem.canttotal,' de ventas.');
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

procedure AgregarAtras(var l,ult:lista2;codigoproducto,total:integer);
var nue:lista2;
begin
	new(nue);
	nue^.elem.codproducto:=codigoproducto;
	nue^.elem.canttotal:=total;
	nue^.sig:=nil;
	if (l<>nil) then
		ult^.sig:=nue
	else
		l:=nue;
	ult:=nue;
end;

procedure buscarminimo(var min:venta;var v:vector);
var pos,i:integer;
begin
	min.codproducto:=100;
	for i:= 1 to 4 do begin
		if (v[i]<>nil) then
			if (v[i]^.elem.codproducto<min.codproducto) then begin
				min:=v[i]^.elem;pos:=i;
			end;
	end;
	if (min.codproducto<>100) then 
		v[pos]:=v[pos]^.sig;
end;

procedure MergeAcumulador(v:vector;var nueva:lista2);
var
	ult:lista2;
	actual,min:venta;
	total:integer;
begin
	ult:=nil;
	buscarminimo(min,v);
	while (min.codproducto<>100) do begin
		actual:=min;
		total:=0;
		while (min.codproducto=actual.codproducto) do begin
			total:= total + min.cantidadventas;
			buscarminimo(min,v);
		end;
		AgregarAtras(nueva,ult,actual.codproducto,total);
	end;
end;

var
	nueva:lista2;
	v:vector;
begin
	Randomize;nueva:=nil;
	inicializarvector(v);
	crearvector(v);
	ImprimirVectorListas(v);
	MergeAcumulador(v,nueva);
	writeln('Nueva Lista: ');imprimirnuevaLista(nueva);
end.
