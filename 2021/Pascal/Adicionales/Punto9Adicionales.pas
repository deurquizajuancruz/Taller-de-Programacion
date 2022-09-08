{Una empresa de logística ofrece 4 tipos de paquetes (1: encomienda común, 2: encomienda
express, 3: encomienda frágil, 4: certificado), y necesita procesar los envíos de sus
clientes.
Para ello se dispone de un módulo “Envíos” que lee la información de los envíos realizados
y genera una estructura con código de paquete, código de localidad de destino, peso y
precio del paquete, agrupados por tipo de paquete. Por cada tipo de paquete, los envíos se
encuentran ordenados por código de localidad.
Se pide implementar un programa en Pascal que:
a) Invoque a un módulo que reciba la estructura de los envíos y utilizando la técnica de
merge o merge acumulador genere un árbol ordenado que contenga código de
localidad y el peso total acumulado entre todos sus envíos. El árbol debe estar
ordenado por el peso total.
b) Implementar un módulo recursivo que reciba la estructura generada en a) y retorne
la cantidad de localidades con peso total inferior a un valor que se recibe como
parámetro
}
program Punto9Adicionales;
type
	paquetes=1..4;
	infopaquete=record
		codigo:integer;
		codigolocalidad:integer;
		peso:real;
		precio:real;
		tipopaquete:paquetes;
	end;
	lista=^nodo;
	nodo=record
		elem:infopaquete;
		sig:lista;
	end;
	vpaquetes=array[paquetes] of lista;
	infoenvios=record
		codigolocalidad:integer;
		pesototal:real;
	end;
	arbol=^nodo2;
	nodo2=record
		elem:infoenvios;
		hi:arbol;
		hd:arbol;
	end;

procedure inicializarv(var v:vpaquetes);
var i:paquetes;
begin
	for i:=1 to 4 do
		v[i]:=nil;
end;

procedure leerinfopaquetes(var info:infopaquete);
begin
	writeln('Ingrese el codigo de paquete: ');readln(info.codigo);
	if (info.codigo<>-1) then begin
		writeln('Ingrese el codigo de la localidad de destino: ');readln(info.codigolocalidad);
		writeln('Ingrese el peso del paquete: ');readln(info.peso);
		writeln('Ingrese el precio del paquete: ');readln(info.precio);
		writeln('Ingrese el tipo del paquete(1: encomienda comun, 2: encomienda express, 3: encomienda fragil, 4: certificado)): ');readln(info.tipopaquete);
	end;
end;

procedure insertar(var l:lista;info:infopaquete);
var ant,nuevo,act:lista;
begin
	new(nuevo);nuevo^.elem:=info;act:=l;ant:=l;
	while ((act<>nil) and (act^.elem.codigolocalidad<info.codigolocalidad)) do begin
		ant:=act;act:=act^.sig;
	end;
	if (ant=act) then
		l:=nuevo
	else
		ant^.sig:=nuevo;
	nuevo^.sig:=act;
end;

procedure cargarvector(var v:vpaquetes);
var info:infopaquete;
begin
	leerinfopaquetes(info);
	while (info.codigo<>-1) do begin
		insertar(v[info.tipopaquete],info);
		leerinfopaquetes(info);
	end;
end;

{procedure imprimirvector(v:vpaquetes);
var i:paquetes;
begin
	for i:=1 to 4 do begin
		writeln('Codigo del paquete: ',v[i]^.elem.codigo, ' Codigo de la localidad: ',v[i]^.elem.codigolocalidad, ' Peso: ', v[i]^.elem.peso, ' Precio: ', v[i]^.elem.precio, ' Tipo de paquete: ', v[i]^.elem.tipopaquete);
	end;
end;}

//

procedure minimo(var v:vpaquetes;var min:infopaquete);
var i:paquetes;
c:integer;
begin
	c:=0;min.codigolocalidad:=32000;
	for i:=1 to 4 do begin
		if ((v[i]<>nil) and (v[i]^.elem.codigolocalidad<=min.codigolocalidad)) then begin
			c:=i;min.codigolocalidad:=v[i]^.elem.codigolocalidad;
		end;
	end;
	if (c<>0) then begin
		min:=v[c]^.elem;v[c]:=v[c]^.sig;
	end;
end;

procedure insertarenelarbol(var a:arbol;e:infoenvios);
begin
	if (a=nil) then begin
		new(a);a^.elem:=e;a^.hi:=nil;a^.hd:=nil;
	end
	else
		if (a^.elem.pesototal>e.pesototal) then insertarenelarbol(a^.hi,e)
		else insertarenelarbol(a^.hd,e);
end;

procedure merge(var a:arbol;v: vpaquetes);
var 
	min:infopaquete;
	e:infoenvios;
begin
	a:=nil;
	minimo(v,min);
	while (min.codigolocalidad<>32000) do begin
		e.pesototal:=0;e.codigolocalidad:=min.codigolocalidad;
		while ((min.codigolocalidad<>32000) and (e.codigolocalidad=min.codigolocalidad)) do begin
			e.pesototal:= e.pesototal + min.peso;minimo(v,min);
		end;
	insertarenelarbol(a,e);	
	end;
end;

procedure imprimir(a:arbol);
begin
	if (a<>nil) then begin
		imprimir(a^.hi);
		writeln('Codigo de la localidad: ',a^.elem.codigolocalidad, ' peso total: ', a^.elem.pesototal:2:2);
		imprimir(a^.hd);
	end;
end;

procedure menor(a:arbol;valor:real;var cantidad:integer);
begin
	if (a<>nil) then begin
		menor(a^.hi,valor,cantidad);
		if (a^.elem.pesototal<valor) then cantidad:=cantidad+1;
		menor(a^.hd,valor,cantidad);
	end;
end;

var
	a:arbol;v:vpaquetes;valorinferior:real;cantidad:integer;
begin
	inicializarv(v);cargarvector(v);merge(a,v);imprimir(a);cantidad:=0;
	writeln('Ingrese el valor para calcular la cantidad de localidades que tengan un peso total menor: ');readln(valorinferior);
	menor(a,valorinferior,cantidad);writeln('La cantidad de localidades con un peso total menor es de: ',cantidad);
end.
