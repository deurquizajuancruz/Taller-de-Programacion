{
La cadena de supermercados necesita un sistema para procesar mensualmente su facturación. 
Por cada venta se conoce el dia,nro de factura, CUIT del cliente y monto.
Se dispone de una estructura que almacena las ventas de Noviembre agrupadas por número de sucursal (de 1 a 20).
Para cada sucursal,las ventas se encuentran ordenadas por día del mes. 
Implemente un programa con:
a) Un modulo que reciba la estructura con las ventas y, usando la técnica del merge, genere un vector que almcena para cada día del mes el CUIT, nro de factura y monto de la venta con mayor monto 
b) Implementar un módulo que ordene de mayor a menor,por monto, los elementos del vector generado en el inciso a. Luego imprimir el CUIT de la venta con mayor monto y el CUIT de la venta con menor monto 
NOTA En cada sucursal se pueden haber realizado más de una venta en el mismo dia. Hay ventas para todos los dias del mes.
}
program ParcialViejo4;
type
	mes=1..31;
	sucursales=1..20;
	venta=record
		nrosucursal:integer;
		dia:integer;
		nrofactura:integer;
		CUIT:integer;
		monto:real;
	end;
	lista=^nodo;
	nodo=record
		elem:venta;
		sig:lista;
	end;
	vventas=array[sucursales] of lista;
	vmayores=array[mes] of venta;
	
procedure inicializarvector(var v:vventas);
var i:sucursales;
begin
	for i:=1 to 20 do begin
		v[i]:=nil;
	end;
end;

procedure leerVenta(var v:venta);
begin
	v.nrofactura:=Random(500);
	if (v.nrofactura<>0) then begin
		v.dia:=Random(31)+1;
		v.cuit:=Random(100);
		v.monto:=Random * 500;
		v.nrosucursal:=Random(20)+1;
	end;
end;

procedure insertarenlista(var l:lista;v:venta);
var ant,nue,act:lista;
begin
	new(nue);
	nue^.elem:=v;
	act:=l;
	ant:=l;
	while (act<>nil) and (act^.elem.dia<v.dia)do begin
		ant:=act;
		act:=act^.sig;
	end;
	if (act=l) then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure cargarVector(var ve:vventas);
var v:venta;
begin
	leerVenta(v);
	while (v.nrofactura<>0) do begin
		insertarenlista(ve[v.nrosucursal],v);
		leerVenta(v);
	end;
end;

procedure imprimirLista(l:lista);
begin
	while (l<>nil) do begin
		writeln('Dia de la venta: ',l^.elem.dia, ' Nro de factura: ',l^.elem.nrofactura, ' CUIT: ',l^.elem.cuit, ' Monto: ',l^.elem.monto:0:2);
		l:=l^.sig;
	end;
end;

procedure imprimirVector(v:vventas);
var i:sucursales;
begin
	for i:=1 to 20 do begin
		writeln('Informacion de la sucursal numero ',i,':');
		imprimirLista(v[i]);
	end;
end;

procedure buscarminimo(var min:venta;var v:vventas);
var
	i,pos:sucursales;
begin
	min.dia:=999;
	for i:=1 to 20 do begin
		if (v[i]<>nil) then begin
			if (v[i]^.elem.dia<min.dia) then begin
				min:=v[i]^.elem;
				pos:=i;
			end;
		end;
	end;
	if (min.dia<>999) then
		v[pos]:=v[pos]^.sig;
end;

procedure merge(v:vventas;var nuevo:vmayores);
var
	min,actual:venta;
begin
	buscarminimo(min,v);
	while (min.dia<>999) do begin
		actual:=min;
		while (min.dia=actual.dia) do begin
			if (min.monto>actual.monto) then
				actual:=min;
			buscarminimo(min,v);
		end;
		nuevo[actual.dia]:=actual;
	end;
end;

procedure imprimirnuevo(v:vmayores;llamado:integer);
var
	i:mes;
begin
	for i:=1 to 31 do begin
		if (llamado<>2) then
			writeln('Informacion de las venta mayor del dia ',i,': ');
		writeln('Monto: ',v[i].monto:0:2, ' CUIT: ',v[i].cuit,' Nro de factura: ',v[i].nrofactura);
	end;
end;

procedure OrdenacionPorInsercion(var v:vmayores);
var 
	i,j:mes;
	actual:venta;
begin
	for i:=1 to 31 do begin
		actual:=v[i];j:=i-1;
		while ((j>0) and (v[j].monto>actual.monto)) do begin
			v[j+1]:=v[j];j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;

var
	v:vventas;
	nuevo:vmayores;
BEGIN
	Randomize;
	inicializarvector(v);
	cargarVector(v);
	writeln('VECTOR ORDENADO POR DIA DEL MES: ');
	imprimirVector(v);
	merge(v,nuevo);
	writeln('NUEVO VECTOR QUE IMPRIME LA INFO DE LAS VENTAS CON MAYORES MONTOS X DIA: ');
	imprimirnuevo(nuevo,1);
	writeln('VECTOR DE LAS VENTAS MAYORES ORDENADO POR MONTO: ');
	OrdenacionPorInsercion(nuevo);
	imprimirnuevo(nuevo,2);
	writeln('CUIT DE LA VENTA CON MAYOR MONTO: ',nuevo[31].cuit);
	writeln('CUIT DE LA VENTA CON MENOR MONTO: ',nuevo[1].cuit);
END.

