program Punto1Adicionales;
const
	dimf=250;
type
	subcategoria=1..20;
	infovector=record
		legajo:integer;
		dni:real;
	end;
	empleado=record
		legajoydni:infovector;
		categoria:subcategoria;
		ingreso:integer;
	end;
	arbol=^nodo;
	nodo=record
		elem:empleado;
		hi:arbol;
		hd:arbol;
	end;
	vlegajos=array [1..dimf] of infovector;
procedure agregaralvector(var v:vlegajos;diml,legajo:integer;dni:real);
begin
	if (diml<dimf) then begin
		diml:=diml + 1;
		v[diml].legajo:=legajo;v[diml].dni:=dni;
		end;
end;
procedure recibir(A,B,diml:integer;ar:arbol;categoria:subcategoria;var v:vlegajos);
begin
	if (ar<>nil) then begin
		recibir(A,B,diml,ar^.hi,categoria,v);
		if (ar^.elem.legajoydni.legajo>A) and (ar^.elem.legajoydni.legajo<B) and (ar^.elem.categoria=categoria) then
			agregaralvector(v,diml,ar^.elem.legajoydni.legajo,ar^.elem.legajoydni.dni);
		recibir(A,B,diml,ar^.hd,categoria,v);
	end;
end;
function promedio (v:vlegajos;diml,i:integer):real;
begin
	if (i<=diml) then
		promedio:=((v[i].dni)/diml) + promedio(v,diml,(i+1))
	else
		promedio:=0;
end;
var 
	ar:arbol;
	A,B,diml,i:integer;
	categoria:subcategoria;
	v:vlegajos;
begin
//	se carga el arbol
	diml:=0;i:=1;
	writeln('Ingrese el numero A: ');readln(A);
	writeln('Ingrese el numero B: ');readln(B);
	writeln('Ingrese el numero de categoria: ');readln(categoria);
	recibir(A,B,diml,ar,categoria,v);
	promedio(v,diml,i);
end.
