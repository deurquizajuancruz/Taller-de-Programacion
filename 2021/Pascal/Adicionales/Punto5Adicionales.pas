{Una cadena de gimnasios que tiene 5 sucursales necesita procesar las asistencias de los
clientes. Implementar un programa con:
a. Un módulo que lea la información de las asistencias realizadas en las sucursales y
genere una estructura con código de cliente, dni de cliente, fecha y cantidad de
minutos que asistió a la sucursal, agrupados por sucursal. Para cada sucursal, los
clientes deben estar ordenados por código de cliente. De cada asistencia se lee: código
de sucursal (1..5), dni del cliente, código del cliente, fecha y cantidad de minutos que
asistió. La lectura finaliza con el código de cliente -1, el cual no se procesa.
b. Un módulo que reciba la estructura generada en a) y utilizando la técnica de merge o
merge acumulador genere un árbol ordenado por dni que contenga el dni de cliente y
la cantidad total de veces que asistió a las sucursales del gimnasio.
}
program Punto5Adicionales;
type
	subrango=1..5;
	fecha=record
		dia:integer;
		mes:integer;
		anio:integer;
	end;
	asistencia=record
		codigosucursal:subrango;
		dni:integer;
		codigo:integer;
		lafecha:fecha;
		minutos:integer;
	end;
	lista=^nodo;
	nodo=record
		elem:asistencia;
		sig:lista;
	end;
	vlistas=array[subrango] of lista;
	cliente=record
		dni:real;
		veces:integer;
	end;
	arbol=^nodoA;
	nodoA=record
		elem:cliente;
		hi:arbol;
		hd:arbol;
	end;
//INCISO A
procedure inicializarvector (var v:vlistas);
var i:subrango;
begin
	for i:=1 to 5 do
		v[i]:=nil;
end;

procedure leerasistencia(var a:asistencia);
begin
	writeln('Ingrese codigo de sucursal: ');readln(a.codigosucursal);
	writeln('Ingrese dni del cliente: ');readln(a.dni);
	writeln('Ingrese el codigo del cliente: ');readln(a.codigo);
	if (a.codigo<>-1) then begin
		writeln('Ingrese el dia: ');readln(a.lafecha.dia);
		writeln('Ingrese el mes: ');readln(a.lafecha.mes);
		writeln('Ingrese el anio: ');readln(a.lafecha.anio);
		writeln('Ingrese la cantidad de minutos que asistio" ');readln(a.minutos);
	end;
end;

procedure insertarordenado(var l:lista;a:asistencia);
var ant,act,nue:lista;
begin
	new(nue);nue^.elem:=a;nue^.sig:=nil;
	if (l=nil) then
		l:=nue
	else begin
		act:=l;ant:=l;
		while (act<>nil) and (act^.elem.codigo<a.codigo) do begin
			ant:=act;act:=act^.sig;
		end;
		if (ant=act) then
			l:=nue
		else
			ant^.sig:=nue;
		nue^.sig:=act;
	end;
end;

procedure cargarvector(var v:vlistas);
var a:asistencia;
begin
	leerasistencia(a);
	while (a.codigo<>-1) do begin
		insertarordenado(v[a.codigosucursal],a);leerasistencia(a);
	end;
end;
//INCISO B

procedure minimo(var v:vlistas; var min,dniactual:integer);
var camb,i:integer;
begin
	min:=32767;camb:=0;
	for i:=1 to 5 do begin
		if ((v[i]<>nil) and (v[i]^.elem.codigo<min)) then begin
			camb:=i;min:=v[i]^.elem.dni;
		end;
	end;
	if (camb<>0) then begin
		dniactual:=v[camb]^.elem.dni;v[camb]:=v[camb]^.sig;
	end;
end;

procedure insertararbol(var a:arbol;c:cliente);
begin
	if (a=nil) then begin
		new(a);a^.hi:=nil;a^.hd:=nil;a^.elem:=c;
	end
	else begin
		if (c.dni>a^.elem.dni) then insertararbol(a^.hd,c)
		else insertararbol(a^.hi,c);
	end;
end;

procedure merge(v:vlistas;var ar:arbol);
var
	dniactual,min:integer;
	c:cliente;
begin
	ar:=nil;
	minimo(v,min,dniactual);
	while (min<>32767) do begin
		c.veces:=0;c.dni:=dniactual;
		while ((min<>32767) and (c.dni=dniactual)) do begin
			c.veces:=c.veces + 1;minimo(v,min,dniactual);
		end;
		insertararbol(ar,c);
	end;
end;
var
	vector:vlistas;tree:arbol;
begin
	inicializarvector(vector);cargarvector(vector);
	merge(vector,tree);
end.
