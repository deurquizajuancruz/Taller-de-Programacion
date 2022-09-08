program Punto2Adicionales;
type
	dias=1..7;
	entrada=record
		dia:dias;
		codigo:integer;
		asiento:integer;
		monto:real;
	end;
	lista=^nodo;
	nodo=record
		elem:entrada;
		sig:lista;
	end;
	nuevaentrada=record
		codigo:integer;
		cantidad:integer;
	end;
	nuevalista=^nodo2;
	nodo2=record
		elem:nuevaentrada;
		sig:nuevalista;
	end;
	vlistas=array [dias] of lista;
	
procedure insertarordenado (var l:lista;e:entrada);
var ant,act,nue:lista;
begin
	new(nue);nue^.elem:=e;act:=l;ant:=l;
	while (act<>nil) and (act^.elem.codigo<e.codigo) do begin
		ant:=act;act:=act^.sig;
	end;
	if (ant=act) then l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure leerentrada(var e:entrada);
begin
	writeln('Ingrese el dia de la entrada: ');readln(e.dia);
	writeln('Ingrese el codigo de la obra: ');readln(e.codigo);
	if (e.codigo<>0) then begin
		writeln('Ingrese el asiento de la obra: ');readln(e.asiento);
		writeln('Ingrese el monto de la obra: ');readln(e.monto);
	end;
end;

procedure cargarlistas(var v:vlistas);
var e:entrada;
begin
	leerentrada(e);
	while (e.codigo<>0) do begin
		insertarordenado(v[e.dia],e);leerentrada(e);
	end;
end;

procedure minimo(var v:vlistas;var e:nuevaentrada);
var pos:integer;i:dias;
begin
	e.codigo:=9999;pos:=-1;
	for i:=1 to 7 do begin
		if (v[i]<>nil) and (v[i]^.elem.codigo<=e.codigo) then begin
			pos:=i;e.codigo:=v[i]^.elem.codigo;
		end;
	end;
	if (pos<>-1) then begin
		v[pos]:=v[pos]^.sig;
	end;
end;

procedure agregarAtras(var l:nuevalista;e:nuevaentrada);
var nue,aux:nuevalista;
begin
	new(nue);nue^.elem:=e;nue^.sig:=nil;
	if (l=nil) then begin
		l:=nue;
	end
	else begin
		aux:=l;
		while (aux^.sig<>nil) do begin
			aux:=aux^.sig;
		end;
		aux^.sig:=nue;
	end;
end;

procedure merge(var l:nuevalista;v:vlistas);
var
	ventas:integer;
	min,act:nuevaentrada;
begin
	minimo(v,min);
	while (min.codigo<>9999) do begin
		act:=min;ventas:=0;
		while (min.codigo<>9999) and (min.codigo=act.codigo) do begin
			ventas:=ventas +1;minimo(v,min);
		end;
		act.cantidad:=ventas;agregarAtras(l,act);
	end;
end;
procedure imprimir(l:nuevalista);
begin
	if (l<>nil) then begin
		writeln('Codigo de la obra: ',l^.elem.codigo);
		writeln('Cantidad vendidas de la obra: ',l^.elem.cantidad);
		l:=l^.sig;
		imprimir(l);
	end;
end;
var
	v:vlistas;
	l:nuevalista;
begin
	l:=nil;
	cargarlistas(v);merge(l,v);
end.
