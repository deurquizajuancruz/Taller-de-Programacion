program programaLista;

type
	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
	end;
	
	
procedure agregarAdelante(var l:lista;num:integer);
var nue:lista;
begin
	New(nue);
	nue^.dato:=num;
	nue^.sig:=l;
	l:=nue;
end;

procedure imprimirLista(l:lista);
begin
	while (l<>nil) do begin
		writeln('El dato de la lista es: ', l^.dato);
		l:=l^.sig;
	end;
end;
procedure crearLista1(var l:lista);
var num:integer;
begin
	num:=random(100);
	while (num<>0) do begin
		agregarAdelante(l,num);
		num:=random(100);
	end;
end;

procedure agregarAtras(var l,ult:lista;num:integer);
var 
	nue:lista;
begin
	new(nue);
	nue^.dato:=num;
	nue^.sig:=nil;
	if (l<>nil) then
		ult^.sig:=nue
	else
		l:=nue;
	ult:=nue;
end;
procedure crearLista2(var l,ult2:lista);
var num:integer;
begin
	num:=random(100);
	while (num<>0) do begin
		agregarAtras(l,ult2,num);
		num:=random(100);
	end;
end;

procedure InsertarLista(var l:lista;num:integer);
var ant,nue,act:lista;
begin
	new(nue);
	nue^.dato:=num;
	act:=l;
	ant:=l;
	while (act<>nil) and (act^.dato<num)do begin
		ant:=act;
		act:=act^.sig;
	end;
	if (act=l) then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;
procedure crearLista3(var l:lista);
var num:integer;
begin
	num:=random(100);
	while (num<>0) do begin
		InsertarLista(l,num);
		num:=random(100);
	end;
end;
var
	L1,L2,ult2,L3: lista;
begin
	Randomize;
	L1:=nil;L2:=nil;ult2:=nil;
	{writeln('Lista 1: ');
	crearLista1(L1);
	imprimirLista(L1);
	writeln('Lista 2: ');
	crearLista2(L2,ult2);
	imprimirLista(L2);}
	writeln('Lista 3: ');
	crearLista3(L3);
	imprimirLista(L3);
end.
