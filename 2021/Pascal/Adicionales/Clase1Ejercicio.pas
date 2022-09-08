program Clase1Ejercicio;
const
	dimf=20;
type
	participante = record
	codigo:integer;
	edad:integer;
end;
	vparticipantes=array[1..dimf] of participante;
	lista=^nodo;
	nodo=record
		elem:participante;
		sig:lista;
	end;
procedure generararreglo(var v:vparticipantes; var diml:integer);
var
	p:participante;
begin
	writeln('Ingrese el codigo del participante: ');readln(p.codigo);
	while (p.codigo<>-1) and (diml<dimf) do begin
		diml:=diml +1;
		writeln('Ingrese la edad del participante: ');readln(p.edad);
		v[diml]:=p;
		writeln('Ingrese el codigo del participante: ');readln(p.codigo);
		end;
end;
procedure imprimirarreglo(v:vparticipantes;diml:integer);
var
	i:integer;
begin
	for i:=1 to diml do begin
		writeln('Edad del participante en la posicion ', i,': ', v[i].edad);
		writeln('Codigo del participante en la posicion ',i,': ', v[i].codigo);
		end;
end;
procedure ordenarvector (var v:vparticipantes;diml:integer);
var
	i,j: integer;
	pa:participante;
begin
	for i:=2 to diml do begin
		pa:=v[i];
		j:=i-1;
		while (v[j].edad>pa.edad) do begin
			v[j+1]:=v[j];
			j:=j-1;
			end;
		v[j+1]:=pa;	
		end;
end;
procedure eliminar (var v:vparticipantes; var diml:integer);
var
	canteliminar,pos,i:integer;
begin
	canteliminar:=0;pos:=1;
	while (pos<=diml) and (v[pos].edad<20) do begin
		pos:=pos +1;
		end;
	while (pos<=diml) and (v[pos].edad<=22) do begin
		pos:=pos +1; canteliminar:= canteliminar +1;
		end;
	for i:=diml downto pos do begin
		v[i-canteliminar]:=v[i]; diml:=diml-canteliminar;
		end;
end;
procedure agregarfinal (var l:lista;p:participante);
var
	nuevo,aux:lista;
begin
	new(nuevo);nuevo^.elem:=p;nuevo^.sig:=nil;
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
procedure armarlista (var l:lista;diml:integer;v:vparticipantes);
var
	i:integer;
begin
	for i:=1 to diml do begin
		agregarfinal(l,v[i]);
	end;
end;
var
	v:vparticipantes;
	diml:integer;
	l:lista;
begin
	diml:=0;l:=nil;
	generararreglo(v,diml); // inciso a
	imprimirarreglo(v,diml); //inciso b
	ordenarvector(v,diml); // inciso c
	imprimirarreglo(v,diml); //inciso d
	eliminar(v,diml); //inciso e
	imprimirarreglo(v,diml); //inciso f
	armarlista(l,diml,v); //inciso g
end.
