program Clase3Actividad11;
const
	dimf=10;
type
	vectornum= array[1..dimf] of integer;

procedure crearVector(var v:vectornum; var diml:integer);
var num:integer;
begin
	num:=random(10);
	while (num<>0) and (diml<dimf) do begin
		diml:=diml +1;
		v[diml]:=num;
		num:=random(10);
	end;
end;

procedure imprimirVector(v:vectornum;diml:integer);
var i:integer;
begin
	for i:=1 to diml do begin
		writeln('Numero en la posicion ', i, ' es: ',v[i]);
	end;
end;

procedure Maximo(v:vectornum;var max:integer;i:integer);
begin
	if (i<=dimf) then begin
		if (v[i]>max) then
			max:=v[i];
		Maximo(v,max,i+1);
	end;
end;

procedure Suma(v:vectornum;var total:integer;i:integer);
begin
	if (i<=dimf) then begin
		total:= total + v[i];
		Suma(v,total,i+1);
	end;
end;

var
	v:vectornum;
	diml,max,i,total:integer;
begin
	Randomize;diml:=0;max:=-1;i:=1;total:=0;
	crearVector(v,diml);imprimirVector(v,diml);Maximo(v,max,i);
	writeln('El valor maximo del vector es: ',max);
	Suma(v,total,i);
	writeln('La suma de todos los numeros del vector es: ',total);
end.
