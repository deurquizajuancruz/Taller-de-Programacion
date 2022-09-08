{Una perfumería tiene 4 sucursales. Cada sucursal dispone en papel de la información de sus ventas
(código de venta, código de producto, cantidad vendida). Implementar un programa que :
a. Genere el vector de 4 listas de ventas, ordenadas por código de producto (ascendente). Para ello,
para cada sucursal lea la información de las ventas, hasta ingresar código de venta 0.

b. Imprima en pantalla el contenido de cada lista del vector.

c. Genere una nueva lista con las ventas de las 4 sucursales, ordenadas por código de producto
(ascendente). Mostrar la lista resultante.}
program Clase5Actividad2Floreria;
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
	v.codventa:=random(20);
	if (v.codventa<>0) then begin
		v.codproducto:=random(40)+1;
		v.cantidadventas:=random(30)+1;
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

procedure ImprimirVectorListas(v:vector);
var i:integer;
begin
	for i:=1 to 4 do begin
		writeln('Lista numero: ',i);
		ImprimirLista(v[i]);
	end;
end;

procedure AgregarAtras(var l,ult:lista;v:venta);
var nue:lista;
begin
	new(nue);
	nue^.elem:=v;
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

procedure Merge(v:vector;var nueva:lista);
var
	ult:lista;
	min:venta;
begin
	ult:=nil;
	buscarminimo(min,v);
	while (min.codproducto<>100) do begin
		agregaratras(nueva,ult,min);
		buscarminimo(min,v);
	end;
end;


var
	nueva:lista;
	v:vector;
begin
	Randomize;
	inicializarvector(v);
	crearvector(v);
	ImprimirVectorListas(v);
	Merge(v,nueva);
	writeln('Nueva Lista: ');imprimirLista(nueva);
end.
