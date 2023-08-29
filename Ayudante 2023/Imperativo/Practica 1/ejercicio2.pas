program Punto1Practica1;
const
	dimf=300;
type
	oficina=record
		codigo: integer;
		dni: integer;
		valorexpensa: real;
	end;
	voficinas=array[1..dimf] of oficina;

procedure cargarvector(var v:voficinas;var diml:integer);
var
	o:oficina;
begin
	writeln('Ingrese el codigo de identificacion de la oficina: ');
	readln(o.codigo);
	while (o.codigo<>-1) and (diml<dimf) do begin
		diml:=diml +1;
		writeln('Ingrese el dni del propietario de la oficina: ');
		readln(o.dni);
		writeln('Ingrese el valor de la expensa de la oficina: ');
		readln(o.valorexpensa);
		v[diml]:=o;
		writeln('Ingrese el codigo de identificacion de la oficina: ');
		readln(o.codigo);
	end;
end;

procedure seleccion (var v:voficinas;diml:integer);
var
	i,j,p:integer;
	o:oficina;
begin
	for i:=1 to diml-1 do begin
		p:=i;
		for j:=i+1 to diml do
			if v[j].codigo<v[p].codigo then 
				p:=j;
		o:=v[p];
		v[p]:=v[i];
		v[i]:=o;
	end;
end;

procedure insercion (var v:voficinas;diml:integer);
var 
	i,j,actual:integer;
begin
	for i:=2 to diml do begin 
		actual:=v[i].codigo;
		j:=i-1;
		while (j>0) and (v[j].codigo>actual) do begin 
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1].codigo:=actual;
	end;
end;

procedure imprimirarreglo(v:voficinas;diml:integer);
var
	i:integer;
begin
	for i:=1 to diml do begin
		writeln('Codigo de la oficina en la posicion ',i,': ', v[i].codigo);
		writeln('Dni de la oficina en la posicion ',i,': ',v[i].dni);
		writeln('Valor de la expensa de la oficina en la posicion',i,': ',v[i].valorexpensa);
	end;
end;

var
	vector:voficinas;
	diml:integer;
begin
	diml:=0;
	cargarvector(vector,diml);
	seleccion(vector,diml);
	insercion(vector,diml);
	imprimirarreglo(vector,diml);
end.
