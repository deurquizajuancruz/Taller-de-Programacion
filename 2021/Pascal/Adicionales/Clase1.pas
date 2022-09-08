program Clase1;
const
	dimf=20;
type
	venteros=array [1..dimf] of integer;
	lista=^nodo;
	nodo=record
		elem:integer;
		sig:lista;
	end;
procedure generararreglo(var v:venteros; var diml:integer);
var
	valor:integer;
begin
	writeln('Ingrese el valor a agregar en el vector: ');readln(valor);
	while (valor<>0) and (diml<dimf) do begin
		diml:=diml +1;
		v[diml]:=valor;
		writeln('Ingrese el valor a agregar en el vector: ');readln(valor);
		end;
end;
procedure imprimirarreglo(v:venteros;diml:integer);
var
	i:integer;
begin
	for i:=1 to diml do
		writeln('Valor en la posicion ',i, ': ',v[i]);
end;
procedure eliminarvalor (var v:venteros;var diml:integer;eliminar:integer);
var
	estar,poder:boolean;
	pos,i:integer;
begin
	pos:=1;poder:=false;estar:=false;
	while(pos<=diml) and (estar=false) do begin
		if (v[pos]=eliminar) then
			estar:=true
		else
			pos:=pos +1;
		end;
	if (estar=true) and (pos<=diml) then begin
		for i:=pos to diml do begin
			v[i]:=v[i+1];
			end;
		poder:=true;
		diml:=diml-1;
		end;
	if (poder=true) then
		writeln('El valor se encontraba en el vector y fue eliminado correctamente.')
	else
		writeln('El valor no se encontraba en el vector por lo que no fue eliminado.');
end;
procedure agregarfinal (var l:lista;num:integer);
var
	nuevo,aux:lista;
begin
	new(nuevo);nuevo^.elem:=num;nuevo^.sig:=nil;
	if (l=nil) then
		l:=nuevo
	else
		begin
		aux:=l;
		while (aux^.sig<>nil) do begin
			aux:=aux^.sig;
			end;
		aux^.sig:=nuevo;
		end;
end;
procedure armarlista (var l:lista);
var
	num:integer;
begin
	num:=random(16);
	while (num<>15) do begin
		agregarfinal(l,num);
		num:=random(16);
		end;
end;
var
	vector:venteros;
	diml,valoraeliminar:integer;
	l:lista;
begin
	diml:=0;l:=nil;
	generararreglo(vector,diml);
	writeln('Ingrese el valor a eliminar, si es posible, del vector: ');readln(valoraeliminar);
	eliminarvalor(vector,diml,valoraeliminar);
	imprimirarreglo(vector,diml);
	armarlista(l);
end.
