{Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada
película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama,
4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado
por las críticas.
Implementar un programa que contenga:
a. Un módulo que lea los datos de películas y los almacene ordenados por código de
película y agrupados por código de género, en una estructura de datos adecuada. La
lectura finaliza cuando se lee el código de película -1.
b. Un módulo que reciba la estructura generada en el punto a y retorne una
estructura de datos donde estén todas las películas almacenadas ordenadas por código de
película.
}
program Punto11Practica1;
type
	subrango=1..8;
	pelicula=record
		codigo:integer;
		genero:subrango;
		promedio:real;
	end;
	lista=^nodo;
	nodo=record
		elem:pelicula;
		sig:lista;
	end;
	vgeneros=array[subrango] of lista;
procedure agregaratras(var l:lista;p:pelicula);
var nuevo,aux:lista;
begin
	new(nuevo);nuevo^.elem:=p;nuevo^.sig:=nil;
	if (l=nil) then l:=nuevo
	else begin
	aux:=l;
	while (aux^.sig<>nil) do begin
		aux:=aux^.sig;
		end;
	aux^.sig:=nuevo;
	end;
end;
procedure inicializarlistas(var v:vgeneros);
var i:subrango;
begin
	for i:=1 to 8 do 
		v[i]:=nil;
end;
procedure insertarordenado(var l:lista;p:pelicula);
var ant,act,nue:lista;
begin
	new(nue);nue^.elem:=p;nue^.sig:=nil;
	if (l=nil) then l:=nue
	else begin act:=l;ant:=l;
	while (act<>nil) and (act^.elem.codigo<p.codigo) do begin ant:=act;act:=act^.sig;
		end;
	if (ant=act) then l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
	end;
end;
procedure peliculas (var p:pelicula);
begin
	writeln('Ingrese el codigo de la pelicula: ');readln(p.codigo);
	if (p.codigo<>-1) then begin
		writeln('Ingrese el codigo del genero de la pelicula(del 1 al 8): ');readln(p.genero);writeln('Ingrese el puntaje promedio de la pelicula: ');readln(p.promedio);
	end;
end;
procedure cargarpeliculas(var v:vgeneros);
var p:pelicula;
begin
	peliculas(p);
	while (p.codigo<>-1) do begin
		insertarordenado(v[p.genero],p);peliculas(p);
	end;
end;
procedure imprimirlista(l:lista);
begin
	while (l<>nil) do begin
	writeln('Codigo: ', l^.elem.codigo);writeln('Genero: ',l^.elem.genero);writeln('Puntaje: ',l^.elem.promedio:2:2);
	l:=l^.sig;
	end;
end;
procedure minimo(var v:vgeneros;var p:pelicula);
var indicemin:integer;i:subrango;
begin
	indicemin:=-1;p.codigo:=32000;
	for i:=1 to 8 do
		if (v[i]<>nil) then
			if (v[i]^.elem.codigo<=p.codigo) then begin indicemin:=i;p.codigo:=v[i]^.elem.codigo;
			end;
	if (indicemin<>-1) then begin
		p:=v[indicemin]^.elem;v[indicemin]:=v[indicemin]^.sig;
	end;
end;
procedure merge(v:vgeneros; var nueva:lista);
var min:pelicula;
begin
	nueva:=nil;minimo(v,min);
	while (min.codigo<>32000) do begin
		agregaratras(nueva,min);minimo(v,min);	
	end;
end;
var
	v:vgeneros;nueva:lista;
begin
	inicializarlistas(v);cargarpeliculas(v);merge(v,nueva);imprimirlista(nueva);
end.
