program VectorRecursivo;
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
		writeln('Numero en la posicion ', i, 'es: ',v[i]);
	end;
end;

Procedure busquedaDicotomica( v: vectornum; ini,fin: integer; dato:integer; var pos: integer);
var medio:integer;
begin
	if (ini>fin) then pos:=-1
	else begin
		medio:=(ini + fin) div 2;
		if (v[medio]=dato) then pos:=medio
		else
			if (v[medio]>dato) then BusquedaDicotomica(v,ini,medio-1,dato,pos)
		    else busquedaDicotomica(v,medio+1,fin,dato,pos);
	end;
end;
   
{procedure OrdenacionPorInsercion(var v:vectornum; dimL: integer);
var
	actual,i,j: integer;
begin
	for i:= 2 to dimL do begin
		actual := v[i];
		j:= i-1;
		while (j>0) and (v[j] > actual) do begin
			v[j+1] := v[j];
			j:= j-1;
		end;
		v[j+1] := actual;
	end;
end;}

procedure MaximoRecursivo (v:vectornum; diml, pos:integer; var max:integer);
begin
	if (pos < diml) then begin
		if (v[pos] > max) then
			max := v[pos];
		MaximoRecursivo(v,diml,pos+1,max);
	end;
end;

procedure SumaRecursivo(v:vectornum;diml:integer; var suma:integer);
begin
	if (diml<>0) then begin
		SumaRecursivo(v,diml-1,suma);
		suma :=  suma + v[diml];
	end;
end;
var
	v:vectornum;
	diml,pos,p,dato,max,suma:integer;
begin
	diml:=0;
	pos:=0;
	Randomize; 
	p:= 1; 
	max:= -1;
	
	crearVector(v,diml);imprimirVector(v,diml);
	
	{OrdenacionPorInsercion(v,diml);
    writeln('Ingrese el numero a buscar: ');readln(dato);
    busquedaDicotomica(v,1,diml,dato,pos);
    if (pos>-1) then
		writeln('El numero ',dato, ' estaba en la posicion: ',pos)
	else writeln('El numero ',dato, ' no estaba en el vector.');}
	
	MaximoRecursivo(v,diml,p,max);
	writeln(' El numero max es:', max );
	suma:= 0;
	SumaRecursivo(v,diml,suma);
	writeln('La suma total de los numeros en el vector es: ',  suma)
end.
   
   
   
   
