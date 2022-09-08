program Punto5Practica1;
type
	subrango=1..20;
	venteros=array [subrango]of integer;
procedure generarvector(var v:venteros);
var
	i:subrango;num:integer;
begin
	for i:=1 to 20 do begin
		writeln('Ingrese un numero: ');readln(num);
		v[i]:=num;
	end;
end;
procedure maximo (v:venteros;var max,i:integer);
begin
	if (i<=20) then begin
	if (v[i]>max) then
		max:=v[i];
	i:=i+1;
	maximo(v,max,i);
	end;
end;
procedure imprimir(max,suma:integer);
begin
	writeln('El valor maximo del vector es: ',max);writeln('El valor de todo el vector sumado es: ',suma);
end;
procedure sumar(v:venteros;var suma,j:integer);
begin
	if (j<=20) then begin
	suma:=suma + v[j];
	j:=j +1;
	sumar(v,suma,j);
	end;
end;
var
	v:venteros;max,i,j,suma:integer;
begin
	randomize;max:=-32001;i:=1;generarvector(v);maximo(v,max,i);j:=1;suma:=0;sumar(v,suma,j);imprimir(max,suma);
end.
