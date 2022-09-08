{Una familia de 4 integrantes lleva registro de sus gastos (tipo de gasto y monto gastado).
Se pide:
a) Generar una estructura que almacene los gastos de los integrantes de la familia, agrupados según
el integrante. Por cada integrante, se leen gastos hasta tipo de gasto 0. Los gastos de cada
integrante deben ordenarse por tipo de gasto.
b) Imprimir la estructura generada en a.
c) A partir de la estructura generada en a, realice un merge para obtener los montos totales gastados
por cada tipo de gasto. Genere un ABB con monto total y tipo de gasto, ordenado por monto total.
d) A partir del ABB, busque e imprima el tipo de gasto con mayor monto total.
}
program RepasoPunto2;
type
	gasto=record
		integrante:integer;
		tipo:integer;
		monto:real;
	end;
	lista=^nodo;
	nodo=record
		elem:gasto;
		sig:lista;
	end;
	gastototal=record
		montototal:real;
		tipo:integer;
	end;
	vector=array[1..4] of lista;
	arbol=^nodo2;
	nodo2=record
		elem:gastototal;
		hi:arbol;
		hd:arbol;
	end;
		
procedure inicializarvector(var v:vector);
var i:integer;
begin
	for i:=1 to 4 do begin
		v[i]:=nil;
	end;
end;

procedure leerGasto(var g:gasto);
begin
	g.tipo:=Random(20);
	if (g.tipo<>0) then begin
		g.monto:=Random * 100;
		g.integrante:=Random(4)+1;
	end;
end;

procedure insertarenlista(var l:lista;g:gasto);
var
	ant,act,nue:lista;
begin
	new(nue);
	nue^.elem:=g;
	act:=l;
	ant:=l;
	while (act<>nil) and (act^.elem.tipo<g.tipo)do begin
		ant:=act;
		act:=act^.sig;
	end;
	if (act=l) then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure cargarVector(var v:vector);
var g:gasto;
begin
	leerGasto(g);
	while (g.tipo<>0) do begin
		insertarenlista(v[g.integrante],g);
		leerGasto(g);
	end;
end;

procedure imprimirLista(l:lista);
begin
	while (l<>nil) do begin
		writeln('Tipo de gasto: ',l^.elem.tipo,' Monto del gasto: ',l^.elem.monto:0:2);
		l:=l^.sig;
	end;
end;

procedure leervector(v:vector);
var i:integer;
begin
	for i:= 1 to 4 do begin
		writeln('Integrante numero ',i);
		imprimirLista(v[i]);
	end;
end;

procedure buscarminimo(var min:gasto;var v:vector);
var pos,i:integer;
begin
	min.tipo:=999;
	for i:= 1 to 4 do begin
		if (v[i]<>nil) then
			if (v[i]^.elem.tipo<min.tipo) then begin
				min:=v[i]^.elem;
				pos:=i;
			end;
	end;
	if (min.tipo<>999) then begin
		v[pos]:=v[pos]^.sig;
	end;
end;

procedure InsertarenArbol(var a: arbol; numerotipo:integer;total:real);
begin
 if (a = nil) then begin
	new(a);
	a^.elem.tipo:= numerotipo;
	a^.elem.montototal:=total;
	a^.HI:= nil;
	a^.HD:= nil;
 end
 else
	if (a^.elem.montototal > total) then
		InsertarenArbol(a^.HI, numerotipo,total)
 else
	if (a^.elem.montototal < total) then
		InsertarenArbol(a^.HD, numerotipo,total);
end;

procedure mergeAcumulador(v:vector;var a:arbol);
var
	min,actual:gasto;
	total:real;
begin
	buscarminimo(min,v);
	while (min.tipo<>999) do begin
		actual:=min;
		total:=0;
		while (min.tipo=actual.tipo) do begin
			total:= total + min.monto;
			buscarminimo(min,v);
		end;
		InsertarenArbol(a,actual.tipo,total);
	end;
end;

procedure enorden(a:arbol);
begin
	if (a <> nil) then begin
		enorden (a^.HI);
		writeln('Monto total: ',a^.elem.montototal:0:2,' Tipo de gasto: ',a^.elem.tipo);
		enorden (a^.HD);
	end;
end;

procedure VerMax(a:arbol;var max:real);
begin
	if (a<>nil) then begin
		max:=a^.elem.montototal;
		VerMax(a^.hd,max);
	end;
end;

var
	v:vector;
	a:arbol;
	max:real;
begin
	a:=nil;
	Randomize;
	inicializarvector(v);
	cargarVector(v);
	leervector(v);
	mergeAcumulador(v,a);
	writeln('Impresion del arbol: ');
	enorden(a);
	VerMax(a,max);
	writeln('El valor maximo del arbol es: ',max:0:2);
end.
