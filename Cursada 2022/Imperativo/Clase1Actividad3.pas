program vector;
const
	dimf=10;
type
	vectornum= array[1..dimf] of integer;

{procedure inicializar(var v:vectornum);
var i:integer;
begin
	for i:=1 to dimf do begin
		v[i]:=0;
	end;
end;}

procedure crearVector(var v:vectornum; var diml:integer);
var num:integer;
begin
	num:=random(1000);
	while (num<>0) and (diml<dimf) do begin
		diml:=diml +1;
		v[diml]:=num;
		num:=random(1000);
	end;
end;

procedure imprimirVector(v:vectornum;diml:integer);
var i:integer;
begin
	for i:=1 to diml do begin
		writeln('Numero en la posicion ', i, ' es: ',v[i]);
	end;
end;
var
	v:vectornum;
	
	diml:integer;
begin
	Randomize;
	diml:=0;
	crearVector(v,diml);
	imprimirVector(v,diml);
end.
