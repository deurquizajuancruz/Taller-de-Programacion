program Punto3Adicionales;
const dimf=300;
type
	oficina=record
		codigo:integer;
		dni:real;
		valor:real;
	end;
	voficinas=array[1..dimf] of oficina;
	
procedure leeroficina(var o:oficina);
begin
	writeln('Ingrese el codigo de la oficina: ');readln(o.codigo);
	if (o.codigo<>-1) then begin
		writeln('Ingrese el dni del propietario: ');readln(o.dni);
		writeln('Ingrese el valor de la expensa: ');readln(o.valor);
		end;
end;

procedure cargarvector(var v:voficinas;var diml:integer);
var o:oficina;
begin
	diml:=0;
	leeroficina(o);
	while (diml<300) and (o.codigo<>-1) do begin
		diml:=diml + 1;v[diml]:=o;leeroficina(o);
	end;
end;

procedure ordenarvector(var v: voficinas;dimL : integer);
var 
i, j: integer; 
actual : oficina;
begin
	for i:=2 to dimL do
	begin 
		actual := v[i];
		j:= i-1;
		while (j > 0) and (v[j].codigo > actual.codigo)do
		begin
			v[j+1] := v[j];
			j:= j-1;
		end;
		v[j+1] := actual;
	end;
end;

procedure busquedaDicotomica(var v:voficinas;var pos:integer;diml:integer;codigo:integer);
var pri,ult,med:integer;
begin
	pos:=0;pri:=1;ult:=diml;med:=((pri + ult)div 2);
	while (pri<=ult) and (codigo<>v[med].codigo) do begin
		if (codigo<v[med].codigo) then ult:=(med-1)
		else pri:=(med+1);
		med:=((pri + ult) div 2);
	end;
	if (pri<=ult) then pos:=med
	else pos:=0;
end;
var
	v:voficinas;diml:integer;codigo,pos:integer;
begin
	cargarvector(v,diml);ordenarvector(v,diml);
	writeln('Ingrese un codigo para buscar en el vector: ');readln(codigo);
	busquedaDicotomica(v,pos,diml,codigo);
	if (pos<>0) then
		writeln('La posicion del codigo es: ',pos)
	else writeln('El codigo no esta en el vector.');
end.
