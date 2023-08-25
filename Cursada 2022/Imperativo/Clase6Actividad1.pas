program ProgramaMergeAcumulador;
Type
	gastos = record
		tipo: integer;
		monto: real;
	end;

	lista=^nodo;
	nodo = record
		dato: gastos;
		sig: lista;
	end;
	vectorListas = array [1..4] of lista;
	
	{PROCESOS}
	
procedure inicializarvector(var v:vectorListas);
var i:integer;
begin
	for i:= 1 to 4 do begin
		v[i]:=nil;
	end;
end;	
	
procedure leerGasto(var g:gastos);
begin
	with g do begin
		tipo := random (10);
		if (tipo <> 0) then
			monto := random * 5;
	end;
end;

procedure InsertarOrdenado(var l:lista;g:gastos);
var
	ant,nue,act:lista;
begin
	new(nue);nue^.dato:=g;
	ant:=l;act:=l;
	while (act<>nil) and (act^.dato.tipo<g.tipo) do begin
		ant:=act;act:=act^.sig;
	end;
	if (act=l) then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;


procedure cargarvectorlistas(var v:vectorListas);
var i:integer;
	g:gastos;
begin
	for i:= 1 to 4 do begin
		leerGasto(g);
		while (g.tipo<>0) do begin
			InsertarOrdenado(v[i],g);
			leerGasto(g);
		end;
	end;
end;	
	
procedure imprimirLista(l:lista);
begin
	while (l<>nil) do begin
		writeln('El tipo de gasto es: ', l^.dato.tipo, '  con un gasto de: ', l^.dato.monto:0:2);
		l:=l^.sig;
	end;
end;

procedure AgregarAtras(var l,ult:lista; total:real; tipo:integer);
var nue:lista;
begin
	new(nue);
	nue^.dato.tipo:=tipo;
	nue^.dato.monto:=total;
	nue^.sig:=nil;
	if (l<>nil) then
		ult^.sig:=nue
	else
		l:=nue;
	ult:=nue;
end;

procedure buscarminimo(var min:gastos;var v:vectorlistas);
var pos,i:integer;
begin
	min.tipo:=100;
	for i:= 1 to 4 do begin
		if (v[i]<>nil) then
			if (v[i]^.dato.tipo<min.tipo) then begin
				min:=v[i]^.dato;
				pos:=i;
			end;
	end;
	if (min.tipo<>100) then 
		v[pos]:=v[pos]^.sig;
end;

procedure ImprimirVectorListas(v:vectorlistas);
var i:integer;
begin
	for i:=1 to 4 do begin
		writeln('Lista numero: ',i);
		ImprimirLista(v[i]);
	end;
end;

procedure MergeAcumulador (v: vectorlistas; var l:lista);
var
	min,actual: gastos;
	ult: lista;
	total: real;
begin
	buscarminimo(min,v);
	while (min.tipo <>100) do begin
		actual := min;
		total := 0;
		while (min.tipo = actual.tipo) do begin
			total := total + min.monto;
			buscarminimo(min,v);
		end;
		AgregarAtras(l,ult,total,actual.tipo);
	end;
end;

	
var
	V:vectorListas;
	l: lista;
BEGIN
	Randomize;
	l:=nil;
	InicializarVector(v);
	CargarVectorListas(v);
	ImprimirVectorListas(v);
	MergeAcumulador(v,l);
	writeln('Lista del Merge Acumulador papa: ');
	ImprimirLista(l);
	readln;

END.
