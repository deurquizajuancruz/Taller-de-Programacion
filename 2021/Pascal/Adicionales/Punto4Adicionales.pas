program Punto4Adicionales;
type
	subrango=2010..2018;
	auto=record
		patente:String;
		anio:subrango;
		marca:String;
		modelo:String;
	end;
	arbol=^nodo;
	nodo=record
		elem:auto;
		hi:arbol;
		hd:arbol;
	end;
	lista=^nodo2;
	nodo2=record
		elem:auto;
		sig:lista;
	end;
	vlistas=array[1..8] of lista;
procedure leerauto(var au:auto);
begin
	writeln('Ingrese la patente del auto: ');readln(au.patente);
	if (au.patente<>'ZZZ') then begin
		writeln('Ingrese el anio de fabricacion(del 2010 al 2018): ');readln(au.anio);
		writeln('Ingrese la marca del auto: ');readln(au.marca);
		writeln('Ingrese el modelo del auto: ');readln(au.modelo);
	end;
end;

procedure creararbol(var a:arbol;au:auto);
begin
	if (a=nil) then begin
		new(a);a^.hi:=nil;a^.hd:=nil;a^.elem:=au;
	end
	else begin
		if (au.patente<a^.elem.patente) then creararbol(a^.hi,au)
		else creararbol(a^.hd,au); 
	end;
end;

procedure cargararbol(var a:arbol);
var au:auto;
begin
	leerauto(au);
	while (au.patente<>'ZZZ') do begin
		creararbol(a,au);leerauto(au);
	end;
end;

procedure cantidadmarcas(a:arbol;marca:String;var contador:integer);
begin
	if (a<>nil) then begin
		cantidadmarcas(a^.hi,marca,contador);
		if (a^.elem.marca=marca) then
			contador:=contador + 1;
		cantidadmarcas(a^.hd,marca,contador);
	end;
end;

procedure agregarAtras(var l:lista;au:auto);
var nue,act:lista;
begin
	new(nue);nue^.elem:=au;nue^.sig:=nil;
	if (l<>nil) then begin
		act:=l;
		while(act^.sig<>nil) do begin
			act:=act^.sig;
		end;
		act^.sig:=nue;
	end
	else l:=nue;
end;

procedure agrupar(a:arbol;var v:vlistas);
begin
	if (a<>nil) then begin
		agrupar(a^.hi,v);
		agregarAtras(v[a^.elem.anio],a^.elem);
		agrupar(a^.hd,v);
	end;
end;

procedure inicializarv(var v:vlistas);
var i:integer;
begin
	for i:=1 to 8 do begin
		v[i]:=nil;
	end;
end;

procedure buscarpatente(a:arbol;patente:String;var anio:subrango);
begin
	if (a<>nil) then begin
		buscarpatente(a^.hi,patente,anio);
		if (a^.elem.patente=patente) then
			anio:=a^.elem.anio;
		buscarpatente(a^.hd,patente,anio);
	end;
end;

function buspat(a:arbol;patente:String):integer;
begin
	if (a<>nil) then begin
		if (a^.elem.patente=patente) then
			buspat:=a^.elem.anio
		else buspat:=buspat(a^.hi,patente)+ buspat(a^.hd,patente);
	end
	else buspat:=0;
end;

var
	a:arbol;anio:subrango;
	contador:integer;patentebuscar,marca:String;
	v:vlistas;
begin
	contador:=0;
	cargararbol(a);
	writeln('Ingrese la marca para contar la cantidad de autos con esa marca: ');readln(marca);
	cantidadmarcas(a,marca,contador);
	writeln('La cantidad de autos con esa marca es de: ',contador);
	inicializarv(v);
	agrupar(a,v);
	writeln('Ingrese la patente a buscar: ');readln(patentebuscar);buscarpatente(a,patentebuscar,anio);
	writeln('El anio en el que se fabrico el auto con esa patente es: ',buspat(a,patentebuscar));
end.
