program prueba;
type
	subrango=1..6;
	vector=array [subrango] of integer;
	
procedure imprimirvector(v:vector);
var
	i:subrango;
begin
	for i:=1 to 6 do begin
		writeln('Posicion ',i,' del vector: ', v[i]);
	end;
end;

procedure ordenarvector(var v:vector);
var
	i,j,p,item:integer;
begin
	for i:=1 to 5 do begin
		p:=i;
		for j:=(i+1) to 6 do
			if (v[j]<v[p]) then p:=j;
		item:=v[p];v[p]:=v[i];v[i]:=item;
	end;
end;

procedure ordenarvector2(var v:vector);
var
	i,j,actual:integer;
begin
	actual:=0;
	for i:= 2 to 6 do begin
		actual:=v[i];
		j:=(i-1);
		while ((j>0) and (v[j]>actual)) do begin
			v[j+1]:=v[j];j:=(j-1);
		end;
		v[j+1]:=actual;
	end;
end;

var
	i:subrango;
	numero:integer;
	v:vector;
begin
	for i:= 1 to 6 do begin
		writeln('Ingrese un numero para insertar en el vector: ');readln(numero);
		v[i]:=numero;
	end;
	imprimirvector(v);ordenarvector2(v);imprimirvector(v);
end.
