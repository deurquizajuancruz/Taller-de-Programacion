program listaConRecursion;
type
	lista=^nodo;
	nodo=record
		elem:integer;
		sig:lista;
	end;

procedure agregarAdelante(var l:lista;num:integer);
var nue:lista;
begin
	new(nue);
	nue^.elem:=num;
	nue^.sig:=l;
	l:=nue;
end;

procedure crearLista(var l:lista);
var num:integer;
begin
	num:=random(50);
	while (num<>0) do begin
		agregarAdelante(l,num);
		num:=random(50);
	end;
end;

procedure imprimirLista(l:lista);
begin
	while (l<>nil) do begin
		writeln('El dato de la lista es: ', l^.elem);
		l:=l^.sig;
	end;
end;

procedure ImprimirEnOrden(l:lista);
begin 
	if (l^.sig<>nil) then 
		ImprimirEnOrden(l^.sig);
	writeln('El dato de la lista es: ',l^.elem);
end;

procedure ImprimirOrdenInverso(l:lista);
begin
	if (l<>nil) then begin 
		writeln('El dato de la lista es: ',l^.elem);
		ImprimirOrdenInverso(l^.sig);
	end;
end;

procedure Maximo (l:lista; var max:integer);
begin
	if (l<>nil) then begin
		if (l^.elem > max) then
			max := l^.elem;
		Maximo (l^.sig,max);
	end;
end;
	
procedure Minimo (l:lista; var min:integer);
begin
	if (l<>nil) then begin
		if (l^.elem < min) then
			min := l^.elem;
		Minimo (l^.sig,min);
	end;
end;

function Buscar (l:lista; dato:integer): boolean;
begin
	if (l<>nil) then begin
		Buscar:=false;
		if (l^.elem = dato) then
			buscar := true
		else 
			buscar(L^.sig,dato);
	end;
end;

var
	l:lista;
	max,min,num: integer;
begin
	max:= -1;
	min := 9999;
	Randomize;l:=nil;
	crearLista(l);
	writeln('LISTA ORIGINAL: ');
	imprimirLista(l);
	{writeln('LISTA ORDEN RECURSIVO: ');
	ImprimirEnOrden(l);
	writeln('LISTA ORDEN INVERSO RECURSIVO: ');
	ImprimirOrdenInverso(l);}
	Maximo(l,max);
	writeln('El numero maximo de la lista es: ', max);
	Minimo(l,min);
	writeln('El numero minimo de la lista es: ', min);
	writeln('Ingrese numero a buscar: ');
	readln(num);
	if (Buscar(l,num)) then 
		writeln ('Se encontro el numero.')
	else
		writeln('No se encontro el numero papa.')
end.
