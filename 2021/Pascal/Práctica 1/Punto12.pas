{Implementar un programa que procese la información de las ventas de productos de una
librería que tiene 4 sucursales. De cada venta se lee fecha de venta, código del producto
vendido, código de sucursal y cantidad vendida. El ingreso de las ventas finaliza cuando se
lee el código de sucursal 0.
Implementar un programa que:
a. Almacene las ventas ordenadas por código de producto y agrupados por sucursal,
en una estructura de datos adecuada.
b. Contenga un módulo que reciba la estructura generada en el punto a y retorne
una estructura donde esté acumulada la cantidad total vendida para cada código de
producto.
}
program Punto12Practica1;
type
	subrango=1..4;
	date=record
	dia:integer;
	mes:integer;
	anio:integer;
	end;
	venta=record
	fecha:date;
	codigo:integer;
	sucursal:integer;
	cantidad:integer;
	end;
	lista=^nodo;
	nodo=record
	elem:venta;
	sig:lista;
	end;
	producto=record
	cantidad:integer;
	codigo:integer;
	end;
	lista2=^nodo2;
	nodo2=record
	elem:producto;
	sig:lista2;
	end;
	vsucursales=array[subrango]of lista;
procedure inicializarlistas(var v:vsucursales);
var i:subrango;
begin
	for i:=1 to 4 do 
		v[i]:=nil;
end;
procedure pedirinfo(var v:venta);
begin
	writeln('Ingrese el codigo de sucursal de la venta(del 1 al 4): ');readln(v.sucursal);
	if (v.sucursal<>0) then begin
	writeln('Ingrese el dia de la venta: ');readln(v.fecha.dia);
	writeln('Ingrese el mes de la venta: ');readln(v.fecha.mes);
	writeln('Ingrese el anio de la venta: ');readln(v.fecha.anio);
	writeln('Ingrese el codigo del producto de la venta: ');readln(v.codigo);
	writeln('Ingrese la cantidad de la venta: ');readln(v.cantidad);
	end;
end;
procedure insertarordenado(var l:lista;ve:venta);
var ant,act,nue:lista;
begin
	new(nue);nue^.elem:=ve;nue^.sig:=nil;
	if (l=nil) then l:=nue
	else begin act:=l;ant:=l;
	while (act<>nil) and (act^.elem.codigo<ve.codigo) do begin ant:=act;act:=act^.sig;
		end;
	if (ant=act) then l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
	end;
end;
procedure agregaratras(var l:lista2;codigo,cantidad:integer);
var nuevo,aux:lista2;
begin
	new(nuevo);nuevo^.elem.codigo:=codigo;nuevo^.elem.cantidad:=cantidad;nuevo^.sig:=nil;
	if (l=nil) then l:=nuevo
	else begin
	aux:=l;
	while (aux^.sig<>nil) do begin
		aux:=aux^.sig;
		end;
	aux^.sig:=nuevo;
	end;
end;
procedure cargarvector(var v:vsucursales);
var ve:venta;
begin
	pedirinfo(ve);
	while (ve.sucursal<>0) do begin
		insertarordenado(v[ve.sucursal],ve);pedirinfo(ve);
	end;
end;
procedure minimo (var v:vsucursales;var canti:integer;var min:venta);
var indicemin:integer;i:subrango;
begin
	min.codigo:=32000;indicemin:=-1;
	for i:=1 to 4 do
		if (v[i]<>nil) then
			if (v[i]^.elem.codigo<=min.codigo) then begin
			indicemin:=i;min.codigo:=v[i]^.elem.codigo;
			end;
	if (indicemin<>-1) then begin
	min:=v[indicemin]^.elem;canti:=v[indicemin]^.elem.cantidad;v[indicemin]:=v[indicemin]^.sig;
	end;
end;
procedure merge(v:vsucursales;var nueva:lista2);
var canttotal,canti,actual:integer;min:venta;
begin
	nueva:=nil;minimo(v,canti,min);
	while (min.codigo<>32000) do begin
	actual:=min.codigo;canttotal:=0;
	while (min.codigo<>32000) and (min.codigo=actual) do begin
	canttotal:=canttotal + canti;minimo(v,canti,min);
	end;
	writeln('La cantidad total vendida para el codigo ',actual,' es: ',canttotal);
	agregaratras(nueva,actual,canttotal);
	end;
end;
var
	vector:vsucursales;nueva:lista2;
begin
	inicializarlistas(vector);
	cargarvector(vector);
	merge(vector,nueva);
end.
