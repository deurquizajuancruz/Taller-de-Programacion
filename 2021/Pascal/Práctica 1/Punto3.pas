program Punto3Practica1;
const
	max=30;
type
	subrangorubro=1..8;
	producto=record
		codigo:integer;
		rubro:subrangorubro;
		precio:real;
	end;
	lista=^nodo;
	nodo=record
		elem:producto;
		sig:lista;
	end;
	vrubros=array[subrangorubro] of lista;
	vrubrotres=array[1..max] of producto;
procedure leerproducto(var p:producto);
begin
	writeln('Ingrese el codigo del producto: ');readln(p.codigo);
	if (p.codigo<>0) then begin
		writeln('Ingrese el rubro del producto(del 1 al 8): ');readln(p.rubro);
		writeln('Ingrese el precio del producto: ');readln(p.precio);
	end;
end;
procedure insertarordenado(var l:lista;p:producto);
var
	ant,act,nue:lista;
begin
	new(nue);nue^.elem:=p;nue^.sig:=nil;
	if (l=nil) then l:=nue
	else
		begin
			act:=l;ant:=l;
			while (act<>nil) and (act^.elem.codigo<p.codigo) do begin
				ant:=act;act:=act^.sig;
			end;
		if (ant=act) then l:=nue
		else
			ant^.sig:=nue;
		nue^.sig:=act;
		end;
end;
procedure inicializarlistas(var v:vrubros);
var
	i:subrangorubro;
begin
	for i:=1 to 8 do
		v[i]:=nil;
end;
procedure cargarrubros(var v:vrubros);
var
	p:producto;
begin
	leerproducto(p);
	while(p.precio<>0) do begin
		insertarordenado(v[p.rubro],p);
		leerproducto(p);
	end;
end;
procedure pasarlista(l:lista);
begin
	while (l<>nil) do begin
		writeln('Codigos de los productos pertenecientes a este rubro: ');
		writeln(l^.elem.codigo);
		l:=l^.sig;
	end;
end;
procedure imprimirvector(v:vrubros);
var
	i:subrangorubro;
begin
	for i:=1 to 8 do begin
		writeln('Rubro numero ',i);
		pasarlista(v[i]);
		end;
end;
procedure cargarvector (v:vrubros;var v2:vrubrotres;var diml:integer);
begin
	while (v[3]<>nil) and (diml<max) do begin
		diml:=diml +1;
		v2[diml]:=v[3]^.elem;
		v[3]:=v[3]^.sig;
		end;
end;
procedure ordenarvector(var v2:vrubrotres;diml:integer);
var
	i,j,p:integer;pr:producto;
begin
	for i:=1 to (diml-1) do begin
		p:=i;
		for j:=i+1 to diml do
			if (v2[j].precio<v2[p].precio) then p:=j;
		pr:=v2[p];
		v2[p]:=v2[i];
		v2[i]:=pr;
	end;
end;
procedure imprimirrubros(v2:vrubrotres;diml:integer);
var
	i:integer;
begin
	for i:=1 to diml do
		writeln('El precio del producto numero ',i,' del rubro 3 es: ',v2[i].precio:2:2);
end;
var
	vector:vrubros;vector2:vrubrotres;diml:integer;
begin
	diml:=0;
	inicializarlistas(vector);
	cargarrubros(vector);
	imprimirvector(vector);
	cargarvector(vector,vector2,diml);
	ordenarvector(vector2,diml);
	writeln('A continuacion se imprimiran los precios de los productos del rubro 3: ');
	imprimirrubros(vector2,diml);
end.
