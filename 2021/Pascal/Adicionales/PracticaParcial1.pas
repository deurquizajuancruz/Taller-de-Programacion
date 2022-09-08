program PracticaParcial1;
type
	venta=record
		fecha:String;
		codigo:integer;
		cantidad:integer;
		monto:real;
	end;
	lista=^nodo;
	nodo=record
		elem:venta;
		sig:lista;
	end;
	nuevaventa=record
		codigo:integer;
		canttotal:integer;
	end;
	arbol=^nodo2;
	nodo2=record
		elem:nuevaventa;
		hi:arbol;
		hd:arbol;
	end;
	
procedure leerventa(var v:venta);
begin
//	writeln('Ingrese la fecha de la venta: ');readln(v.fecha);
	writeln('Ingrese el codigo de la venta: ');readln(v.codigo);
	if (v.codigo<>-1) then begin
		writeln('Ingrese la cantidad vendida de la venta: ');readln(v.cantidad);
//		writeln('Ingrese el monto de la venta: ');readln(v.monto);
	end;
end;

procedure agregaradelante(var l:lista;v:venta);
var nuevo:lista;
begin
	new(nuevo);nuevo^.elem:=v;nuevo^.sig:=nil;
	if (l=nil) then
		l:=nuevo
	else begin
		nuevo^.sig:=l;l:=nuevo;
	end;
end;

procedure cargarlista(var l:lista);
var
	v:venta;
begin
	leerventa(v);
	while (v.codigo<>-1) do begin
		agregaradelante(l,v);leerventa(v);
	end;
end;

function buscarenelarbol(a:arbol;codigo:integer):arbol;
begin
	if (a=nil) then buscarenelarbol:=nil
	else
		if (codigo=a^.elem.codigo) then buscarenelarbol:=a
		else if (codigo<a^.elem.codigo) then buscarenelarbol:=buscarenelarbol(a^.hi,codigo)
		else buscarenelarbol:=buscarenelarbol(a^.hd,codigo);
end;

procedure insertar(var a:arbol;codigo,cantidad:integer);
begin
	if (a=nil) then begin
		new(a);a^.elem.canttotal:=cantidad;a^.elem.codigo:=codigo;a^.hi:=nil;a^.hd:=nil;
	end
	else
		if (a^.elem.codigo>codigo) then insertar(a^.hi,codigo,cantidad)
		else insertar(a^.hd,codigo,cantidad);
end;

procedure creararbol(var a:arbol;l:lista);
var aux:arbol;
begin
	while (l<>nil) do begin
		aux:=buscarenelarbol(a,l^.elem.codigo);
		if (aux=nil) then insertar(a,l^.elem.codigo,l^.elem.cantidad)
		else
			aux^.elem.canttotal:=aux^.elem.canttotal + l^.elem.cantidad;
		l:=l^.sig;
	end;
end;

procedure enorden(a:arbol);
begin
	if (a<>nil) then begin
		enorden(a^.hi);
		writeln('Codigo: ',a^.elem.codigo,' Cantidad: ',a^.elem.canttotal);
		enorden(a^.hd);
	end;
end;

procedure mayorcantidad(a:arbol;cantidad:integer;var mayor:integer);
begin
	if (a<>nil) then begin
		mayorcantidad(a^.hi,cantidad,mayor);
		if (a^.elem.canttotal>cantidad) then mayor:=mayor +1;
		mayorcantidad(a^.hd,cantidad,mayor);
	end;
end;

var
	l:lista;a:arbol;cantidad,mayor:integer;
begin
	mayor:=0;l:=nil;a:=nil;
	cargarlista(l);
	creararbol(a,l);
	enorden(a);
	writeln('Ingrese la cantidad para saber cuantos codigos de productos superan esa cantidad: ');readln(cantidad);mayorcantidad(a,cantidad,mayor);
	writeln('La cantidad es: ',mayor);
end.
