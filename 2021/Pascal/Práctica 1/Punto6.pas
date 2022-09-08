program Punto6Practica1;
type
	indice=integer;
	vector=array [1..10]of integer;
procedure cargarvector(var v:vector);
var
	i:integer;
begin
	for i:=1 to 10 do
		v[i]:=random(50);
end;
procedure ordenarvector(var v:vector);
var
	i,j,p,item:integer;
begin
	for i:=1 to 9 do
		begin
		p:=i;
		for j:=i+1 to 10 do
			if (v[j]<v[p]) then p:=j;
		item:=v[p];
		v[p]:=v[i];
		v[i]:=item;
		end;
end;
procedure imprimirvector(v:vector);
var
	i:integer;
begin
	for i:=1 to 10 do
		writeln(v[i]);
end;
procedure busquedadicotomica (v:vector;ini,fin:indice;dato:integer;var pos:indice);
begin
  if (ini>fin) then
    pos := -1
  else
    begin
      pos := (ini+fin) DIV 2;
      if (v[pos]<>dato) then
        begin
          if (dato<v[pos]) then
            busquedaDicotomica(v, ini, pos-1, dato, pos)
          else
            busquedaDicotomica(v, pos+1, fin, dato, pos);
        end;
    end;
end;
var
	v:vector;ini,fin,pos:indice;dato:integer;
begin
	randomize;cargarvector(v);ordenarvector(v);imprimirvector(v);
	writeln('Ingrese el dato a buscar en el vector: ');readln(dato);pos:=1;ini:=1;fin:=10;
	busquedadicotomica(v,ini,fin,dato,pos);writeln(pos);
end.
