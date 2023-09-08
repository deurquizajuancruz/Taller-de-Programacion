program ejercicio1;
type
    oficina = record
        codigo:integer;
        dni: integer;
        valor:real;
    end;

    vectorOficinas = array [1..300] of oficina;

function leerOficina():oficina;
begin
    writeln('Ingrese codigo ');
    readln(leerOficina.codigo);
    if (leerOficina.codigo<>-1) then begin
        leerOficina.dni:=random(200)+1;
        writeln(leerOficina.dni);
        leerOficina.valor:=random()*100;
        writeln(leerOficina.valor:0:2);
    end;
end;

procedure cargarVector(var v:vectorOficinas; var diml:integer);
var
    o:oficina;
begin
    o:=leerOficina();
    while (o.codigo<>-1) and (diml<300) do begin
        diml+=1;
        v[diml]:=o;
        o:=leerOficina();
    end;
end;

procedure imprimirVector(v:vectorOficinas; diml:integer);
var
    i:integer;
begin
    for i := 1 to diml do
        writeln('Codigo ',v[i].codigo,' DNI ',v[i].dni,' Valor ',v[i].valor:0:2);
end;

procedure insercion (var v:vectorOficinas;diml:integer);
var 
	i,j:integer;
    actual: oficina;
begin
	for i:=2 to diml do begin 
		actual:=v[i];
		j:=i-1;
		while (j>0) and (v[j].codigo>actual.codigo) do begin 
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;

function busquedaDicotomica(v:vectorOficinas; diml,codigo:integer):integer;
var
    ini,fin,medio:integer;
    encontre:boolean;
begin
    ini:=1;
    fin:=diml;
    busquedaDicotomica:=0;
    encontre:=false;
    while (ini<=fin) and (not encontre) do begin
        medio:=ini + fin div 2;
        if (v[medio].codigo=codigo) then begin
            busquedaDicotomica:=medio;
            encontre:=true;            
        end
        else if (v[medio].codigo<codigo) then
            ini:= medio + 1
        else
            fin:=medio - 1;
    end;
end;

function montoTotal(v:vectorOficinas; pos,diml:integer):real;
begin
    if (pos = diml) then
        montoTotal:=v[pos].valor
    else
        montoTotal+=montoTotal(v,pos+1,diml) + v[pos].valor;
end;

var
    v:vectorOficinas;
    diml:integer;
begin
    randomize;
    diml:=0;
    cargarVector(v,diml);
    imprimirVector(v,diml);
    insercion(v,diml);
    writeln('Vector ordenado: ');
    imprimirVector(v,diml);
    writeln('El codigo 12 se encuentra en la posicion ',busquedaDicotomica(v,diml,12));
    writeln('El monto total de las expensas es: ',montoTotal(v,1,diml):0:2);
end.