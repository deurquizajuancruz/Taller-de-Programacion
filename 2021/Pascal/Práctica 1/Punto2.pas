program Punto2Practica1;
const
	dimf=8;
type
	subrangogenero=1..8;
	pelicula=record
		codigo:integer;
		puntajeprom:real;
end;
	lista=^nodo;
	nodo=record
		elem:pelicula;
		sig:lista;
end;
	vgeneros=array [subrangogenero] of lista;
	vpuntajes=array [subrangogenero] of pelicula;
procedure agregaratras (var l:lista;p:pelicula);
var
	nuevo,aux:lista;
begin
	new(nuevo);nuevo^.elem:=p;nuevo^.sig:=nil;
	if (l=nil) then l:=nuevo
	else
		begin
		aux:=l;
		while (aux^.sig<>nil) do begin
			aux:=aux^.sig;
			end;
		aux^.sig:=nuevo;
		end;
end;
procedure peliculas (var p:pelicula;var g:subrangogenero);
begin
	writeln('Ingrese el codigo de la pelicula: ');readln(p.codigo);
	if (p.codigo<>-1) then begin
		writeln('Ingrese el codigo del genero de la pelicula(del 1 al 8): ');readln(g);
		writeln('Ingrese el puntaje promedio de la pelicula: ');readln(p.puntajeprom);
	end;
end;
procedure inicializarlistas(var v:vgeneros);
var
	i:integer;
begin
	for i:=1 to 8 do 
		v[i]:=nil;
end;
procedure cargarpeliculas(var v:vgeneros);
var
	p:pelicula;genero:subrangogenero;
begin
	peliculas(p,genero);
	while (p.codigo<>-1) do begin
		agregaratras(v[genero],p);
		peliculas(p,genero);
	end;
end;
procedure maximo (codigo:integer;puntaje:real;var max1:integer;var max2:real);
begin
	if (puntaje>max2) then begin
		max2:=puntaje;
		max1:=codigo;
	end;
end;
procedure recorrerlista (l:lista;var max:pelicula);
begin
	max.puntajeprom:=-100;
	while (l<>nil) do begin
		if (l^.elem.puntajeprom>max.puntajeprom) then begin
		max.puntajeprom:=l^.elem.puntajeprom;max.codigo:=l^.elem.codigo;
		end;
		l:=l^.sig;
	end;
end;
procedure puntajes(v:vgeneros;var v2:vpuntajes;var diml:integer);
var
	i:integer;
begin
	diml:=0;
	for i:=1 to 8 do begin
		if (v[i]<>nil) then begin
		diml:=diml +1;
		recorrerlista(v[i],v2[diml]);
		end;	
	end;
end;
procedure ordenar(var v:vpuntajes;diml:integer);
var
	i,j,p:integer;
	peli:pelicula;
begin
	for i:=1 to diml-1 do begin
		p:=i;
		for j:=i+1 to diml do begin
			if (v[j].puntajeprom < v[p].puntajeprom) then p:=j;
			end;
		peli:= v[p];
		v[p]:=v[i];
		v[i]:=peli;
	end;
end;
var
	vector:vgeneros;vector2:vpuntajes;diml:integer;
begin
	inicializarlistas(vector);
	cargarpeliculas(vector);
	puntajes(vector,vector2,diml);
	ordenar(vector2,diml);
	writeln('Se ordeno el vector segun el puntaje promedio de las peliculas.');
	writeln('Codigo de la pelicula con mayor puntaje: ',vector2[diml].codigo);
	writeln('Codigo de la pelicula con menor puntaje: ',vector2[1].codigo);
end.
	
