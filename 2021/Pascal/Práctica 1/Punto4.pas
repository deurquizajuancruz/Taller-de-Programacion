program Punto4Practica1;
type
	lista=^nodo;
	nodo=record
		elem:integer;
		sig:lista;
	end;
procedure crearlista(var l:lista);
var
	nue:lista;num:integer;
begin
	writeln('Ingrese un numero: ');readln(num);
	while (num<>-1) do begin
	new(nue);nue^.elem:=num;nue^.sig:=nil;
	if (l=nil) then
		l:=nue
	else
		begin
			nue^.sig:=l;l:=nue;
		end;
	writeln('Ingrese un numero: ');readln(num);
	end; 
end;
procedure minimo(l:lista;var min:integer);
begin
	if (l<>nil) then begin
		if (l^.elem<min) then
			min:=l^.elem;
		minimo(l^.sig,min);
	end;
end;
procedure maximo (l:lista;var max:integer);
begin
	if (l<>nil) then begin
		if (l^.elem>max) then
			max:=l^.elem;
		maximo(l^.sig,max);
	end;
end;
function encontrar (l:lista;valor:integer):boolean;
begin
	if (l<>nil) then begin
		if (l^.elem=valor) then
			encontrar:=true
		else
			encontrar:= encontrar(l^.sig,valor);
		end
	else
		encontrar:=false;
end;
procedure buscar(l:lista);
var
	valor:integer;
begin
	writeln('Ingrese el valor que quiera encontrar en la lista: ');readln(valor);
	if (encontrar(l,valor)=true) then
		writeln('El valor se encontraba en la lista')
	else
		writeln('El valor no se encontraba en la lista');
end;
procedure imprimir(max,min:integer);
begin
	writeln('El valor maximo de la lista es: ',max);
	writeln('El valor minimo de la lista es: ',min);
end;
var
	l:lista;min,max:integer;
begin
	l:=nil;min:=32767;max:=-32767;crearlista(l);minimo(l,min);maximo(l,max);imprimir(max,min);buscar(l);
end.
