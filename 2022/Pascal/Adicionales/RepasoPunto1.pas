{. Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con
las entradas vendidas. Se desea procesar la información de una semana. Se pide:
a) Generar 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1 a 7),
código de la obra, asiento, monto. La lectura finaliza con el código de obra igual a 0. Las listas deben
estar ordenadas por código de obra de forma ascendente.
b) Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista debe
estar ordenada por código de obra de forma ascendente.
c) Realice un módulo recursivo que informe el contenido de la lista generada en b)
}
program RepasoPunto1;
type
	entradas=record
		dia:integer;
		codigo:integer;
		asiento:integer;
		monto:real;
	end;
	lista=^nodo;
	nodo=record
		elem:entradas;
		sig:lista;
	end;
	entradas2=record
		total:integer;
		codigo:integer;
	end;
	lista2=^nodo2;
	nodo2=record
		elem:entradas2;
		sig:lista2;
	end;
	vector=array[1..7] of lista;

procedure leerentrada(var e: entradas);
begin
	e.codigo:=Random(10);
	if (e.codigo<>0) then begin
		e.asiento:=Random(100);
		e.monto:=Random * 10;
		e.dia:=Random(7)+1;
	end;
end;

procedure inicializarvector(var v:vector);
var i:integer;
begin
	for i:= 1 to 7 do begin
		v[i]:=nil;
	end;
end;

procedure insertarenlista(var l:lista;e:entradas);
var ant,nue,act:lista;
begin
	new(nue);
	nue^.elem:=e;
	act:=l;
	ant:=l;
	while (act<>nil) and (act^.elem.codigo<e.codigo)do begin
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
var e:entradas;
begin
	leerentrada(e);
	while (e.codigo<>0) do begin
		insertarenlista(v[e.dia],e);
		leerentrada(e);
	end;
end;

procedure imprimirLista(l:lista);
begin
	while (l<>nil) do begin
		writeln('Codigo de la entrada: ', l^.elem.codigo,' Asiento: ',l^.elem.asiento,' Monto: ',l^.elem.monto:0:2);
		l:=l^.sig;
	end;
end;

procedure imprimirVector(v:vector);
var i:integer;
begin
	for i:= 1 to 7 do begin
		writeln('Dia : ',i);
		imprimirLista(v[i]);
	end;
end;

procedure buscarminimo(var min:entradas;var v:vector);
var pos,i:integer;
begin
	min.codigo:=9999;
	for i:= 1 to 7 do begin
		if (v[i]<>nil) then
			if (v[i]^.elem.codigo<min.codigo) then begin
				min:=v[i]^.elem;
				pos:=i;
			end;
	end;
	if (min.codigo<>9999) then 
		v[pos]:=v[pos]^.sig;
end;

procedure AgregarAtras(var l,ult:lista2;codigo,elTotal:integer);
var nue:lista2;
begin
	new(nue);
	nue^.elem.codigo:=codigo;
	nue^.elem.total:=elTotal;
	nue^.sig:=nil;
	if (l<>nil) then
		ult^.sig:=nue
	else
		l:=nue;
	ult:=nue;
end;


procedure mergeAcumulador(v:vector;var nueva:lista2);
var
	min,actual: entradas;
	ult:lista2;
	total: integer;
begin
	ult:=nil;
	buscarminimo(min,v);
	while (min.codigo <>9999) do begin
		actual := min;
		total := 0;
		while (min.codigo = actual.codigo) do begin
			total := total + 1;
			buscarminimo(min,v);
		end;
		AgregarAtras(nueva,ult,actual.codigo,total);
	end;
end;

procedure imprimirnuevaLista(l:lista2);
begin
	if (l<>nil) then begin
		writeln('La obra con codigo ',l^.elem.codigo,' vendio un total de ',l^.elem.total,' entradas');	
		imprimirnuevaLista(l^.sig);
	end;
end;

var v:vector;
nueva:lista2;
begin
	nueva:=nil;
	Randomize;
	inicializarvector(v);
	cargarVector(v);
	imprimirVector(v);
	mergeAcumulador(v,nueva);
	imprimirnuevaLista(nueva);
end.
