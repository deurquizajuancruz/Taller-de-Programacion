{ACTIVIDAD 1: En el ProgramaVector.pas (creado en la clase previa)
1. Implementar el módulo OrdenaciónPorInserción (use el pseudocódigo)
2. Invocar al módulo OrdenacionPorInsercion
3. Mostrar el vector ordenado
4. Implementar el módulo BuscarElementoVectorOrdenado que busque de
manera eficiente un valor X sobre el vector ordenado y devuelva su
posición o 0 en caso de no existir. Para ello utilice Búsqueda Binaria (o
dicotómica).
5. Lea un número e informe su posición en el vector o 0 si no existe.}
program Clase1Actividad1;
const
	dimf=10;
type
	vectornum= array[1..dimf] of integer;

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

procedure OrdenacionPorInsercion(var v:vectornum;diml:integer);
var i,j,actual:integer;
begin
	for i:=1 to diml do begin
		actual:=v[i];j:=i-1;
		while ((j>0) and (v[j]>actual)) do begin
			v[j+1]:=v[j];j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;

Function BuscarElementoVectorOrdenado (x:integer; v:vectornum; dimL: integer): integer;
var 
    pos:integer; 
    exito: boolean;
Begin
    pos:=1; 
    exito:= false;
    while (pos <= dimL) and (not exito) do 
    begin
        if (x = v[pos]) then
            exito:= true
        else
            pos:=pos+1;
    end;
    if (exito = false) then 
        pos:=0;
    BuscarElementoVectorOrdenado:= pos;
end;

procedure imprimirVector(v:vectornum;diml:integer);
var i:integer;
begin
	for i:=1 to diml do begin
		writeln('Numero en la posicion ', i, ' es: ',v[i]);
	end;
end;
var
	v:vectornum;valor,diml:integer;
begin
	Randomize;
	diml:=0;
	crearVector(v,diml);OrdenacionPorInsercion(v,diml);imprimirVector(v,diml);
	writeln('Ingrese un valor para buscar en el vector: ');readln(valor);
	writeln('El valor ',valor,' estaba en la posicion: ', BuscarElementoVectorOrdenado(valor,v,diml));
end.
