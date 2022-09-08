program Clase3Ejercicio;
type
	gasto=record
	monto:real;
	rubro:string;
	end;
	lista=^nodo;
	nodo=record
	elem:gasto;
	sig:lista;
	end;
	familia=record
	nombre:string;
	listado:lista;
	end;
procedure leergasto(var g:gasto);
begin
	writeln('Monto del gasto: ');readln(g.monto);
	writeln('Rubro del gasto: ');readln(g.rubro);
end;
procedure familia(var n1,n2,n3,n4:string);
begin
	writeln('Ingrese el nombre del primer integrante de la familia: ');readln(n1);
	writeln('Ingrese el nombre del segundo integrante de la familia: ');readln(n2);
	writeln('Ingrese el nombre del tercer integrante de la familia: ');readln(n3);
	writeln('Ingrese el nombre del cuarto integrante de la familia: ');readln(n4);
end;
procedure insertarordenado(var l:lista;g:gasto);
var
	ant,act,nue:lista;
begin
	new(nue);nue^.elem:=g;nue^.sig:=nil;
	if (l=nil) then l:=nue
	else begin
	act:=l;ant:=l;
	while (act<>nil) and (act^.elem.rubro<g.rubro) do begin
		ant:=act;act:=act^.sig;
		end;
	if (ant=act) then l:=nue
	else
		ant^.sig:=act;
	end;
end;
procedure armarlista(var l:lista);
var
	g:gasto;
begin
	leergasto(g);
	insertarordenado(l,g);
end;
procedure leernombre(var l1,l2,l3,l4:lista;n1,n2,n3,n4:string);
var
	n:string;
begin
	writeln('Ingrese el nombre del duenio del listado: ');readln(n);
	while (n<>'ZZZ') do begin
		if (n=n1) then armarlista(l1);
		if (n=n2) then armarlista(l2);
		if (n=n3) then armarlista(l3);
		if (n=n4) then armarlista(l4);
		if (n<>n1) and (n<>n2) and (n<>n3) and (n<>n4) then writeln('Esa persona no es integrante de la familia.');
	writeln('Ingrese el nombre del duenio del listado: ');readln(n);
	end;
end;
procedure imprimirlista(l:lista);
begin
	while (l<>nil) do begin
		writeln('El rubro del gasto es: ',l^.elem.rubro);
		writeln('El monto del gasto es: ',l^.elem.monto:2:2);
		l:=l^.sig;
		end;
end;
var
	l1,l2,l3,l4:lista;n1,n2,n3,n4:string;
begin
	leernombre(l1,l2,l3,l4,n1,n2,n3,n4);
end.
