{ACTIVIDAD 2
Implementar un programa que procese la información de los jugadores de un torneo
de básquet. De cada jugador se lee: dni, nombre y altura. El ingreso de los
jugadores finaliza cuando se lee el dni 0 (que no debe procesarse). Se pide:
a. Cargar la información en una lista. Los jugadores deben quedar en el mismo
orden que fueron leídos.
b. Mostrar la información almacenada en la lista.
c. Generar un vector con aquellos jugadores que superan el promedio de altura.
Se sabe de antemano que como máximo son 20.
d. Mostrar la información almacenada en el vector.
e. Ordenar el vector de jugadores por dni (ascendente)
f. Mostrar el vector ordenado.
g. Buscar en el vector al jugador cuyo dni coincide con uno ingresado e imprimir
su altura.
NOTA: Reutilice los módulos implementados con anterioridad.}
program Clase2Actividad2;
type
	jugador=record
		dni:integer;
		nombre:String;
		altura:integer;
	end;
	lista=^nodo;
	nodo=record
		elem:jugador;
		sig:lista;
	end;
	vector=array[1..20] of jugador;
	
procedure randomString(tamanio:integer; var palabra:string);
var  str,Result: String;
begin
    str:='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Result:='';
    repeat
        Result:=Result+str[Random(Length(str))+1];
    until(Length(Result)=tamanio);
    palabra:=Result;
end;

procedure leerjugador(var j:jugador);
begin
	j.dni:=random(30);
	if (j.dni<>0) then begin
		j.altura:=random(200)+1;
		randomString(10,j.nombre);
	end;
end;

procedure agregarAtras(var l,ult:lista;j:jugador);
var 
	nue:lista;
begin
	new(nue);
	nue^.elem:=j;
	nue^.sig:=nil;
	if (l<>nil) then
		ult^.sig:=nue
	else
		l:=nue;
	ult:=nue;
end;

procedure crearLista(var l:lista;var elementos,suma:integer);
var j:jugador;ult:lista;
begin
	leerjugador(j);
	while (j.dni<>0) do begin
		agregarAtras(l,ult,j);
		elementos:=elementos +1;
		suma:= suma + j.altura;
		leerjugador(j);
	end;
end;

procedure imprimirLista(l:lista);
begin
	while (l<>nil) do begin
		writeln('DNI: ', l^.elem.dni, ' Nombre: ', l^.elem.nombre, ' Altura en cm: ', l^.elem.altura);
		l:=l^.sig;
	end;
end;

procedure procesarLista(l:lista;var v:vector;promedio:real;var diml:integer);
begin
	while (l<>nil) do begin
		if ((l^.elem.altura>promedio) and (diml<20)) then begin
			v[diml]:=l^.elem;diml:=diml+1;
		end;
		l:=l^.sig;
	end;
end;

procedure OrdenacionPorInsercion(var v:vector;diml:integer);
var i,j:integer;actual:jugador;
begin
	for i:=1 to diml do begin
		actual:=v[i];j:=i-1;
		while ((j>0) and (v[j].dni>actual.dni)) do begin
			v[j+1]:=v[j];j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;

procedure imprimirVector(v:vector;diml:integer);
var i:integer;
begin
	for i:=1 to diml do begin
		writeln('El alumno con DNI: ',v[i].dni, ', altura ', v[i].altura, ' y nombre ', v[i].nombre, ', supera el promedio de altura.');
	end;
end;
var
	l:lista;
	elementos,suma,diml:integer;
	promedio:real;
	v:vector;
begin
	Randomize;l:=nil;elementos:=0;promedio:=0;suma:=0;diml:=1;
	crearLista(l,elementos,suma);
	promedio:= (suma / elementos);
	procesarLista(l,v,promedio,diml);imprimirLista(l);
	writeln('El promedio de altura es de: ',promedio:0:2,'cm.');
	OrdenacionPorInsercion(v,diml);
	imprimirVector(v,diml);
end.
