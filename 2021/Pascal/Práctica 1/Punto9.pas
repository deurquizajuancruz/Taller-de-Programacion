program Punto9Practica1;
type
	arbol=^nodo;
	nodo=record
		elem:string;
		hi:arbol;
		hd:arbol;
	end;
procedure cargararbol (var a:arbol;nombre:string);
begin
	if (a=nil) then begin
		new(a);a^.elem:=nombre;a^.hi:=nil;a^.hd:=nil;
	end
	else
		if (nombre<a^.elem) then cargararbol(a^.hi,nombre)
	else
		cargararbol(a^.hd,nombre);
end;
procedure pedirnombre(var a:arbol);
var
	nombre:string;
begin
	writeln('Ingrese el nombre de la persona: ');readln(nombre);
	while (nombre<>'ZZZ') do begin
		cargararbol(a,nombre);
		writeln('Ingrese el nombre de la persona: ');readln(nombre);
	end;
end;
{
procedure ordenA(a:arbol);
begin
	if (a<>nil) then begin
	ordenA(a^.hi);
	writeln(a^.elem);
	ordenA(a^.hd);
	end;
end;
}
function encontrar (a:arbol;valor:string):boolean;
begin
	if (a=nil) then encontrar:=false
	else if (a^.elem=valor) then encontrar:=true
	else if (valor<a^.elem) then encontrar:=encontrar(a^.hi,valor)
	else if (valor>a^.elem) then encontrar:=encontrar(a^.hd,valor)
	else encontrar:=false;
end;
procedure buscar(a:arbol);
var nombrebuscar:string;
begin
	writeln('Ingres el nombre a buscar: ');readln(nombrebuscar);
	if (encontrar(a,nombrebuscar)=true) then writeln('El nombre estaba en el arbol')
	else writeln('El nombre no estaba en el arbol');
end;
var
	a:arbol;
begin
	pedirnombre(a);buscar(a);
//	ordenA(a);
end.
