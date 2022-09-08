program Punto10Practica1;
type
	alumno=record
	legajo:integer;
	apellido:string;
	nombre:string;
	dni:integer;
	anio:integer;
end;
	arbol=^nodo;
	nodo=record
		elem:alumno;
		hi:arbol;
		hd:arbol;
	end;
procedure cargararbol (var a:arbol;al:alumno);
begin
	if (a=nil) then begin
		new(a);a^.elem:=al;a^.hi:=nil;a^.hd:=nil;
	end
	else
		if (al.legajo<a^.elem.legajo) then cargararbol(a^.hi,al)
	else
		cargararbol(a^.hd,al);
end;
procedure datos (var al:alumno);
begin
	writeln('Ingrese legajo del alumno: ');readln(al.legajo);
	writeln('Ingrese apellido del alumno: ');readln(al.apellido);
	writeln('Ingrese nombre del alumno: ');readln(al.nombre);
	writeln('Ingrese dni del alumno: ');readln(al.dni);
	writeln('Ingrese anio de ingreso del alumno: ');readln(al.anio);
end;
procedure leeralumno(var a:arbol);
var
	al:alumno;
begin
	datos(al);
	while (al.anio<>0) do begin
	if (al.anio>2010) then
		cargararbol(a,al);
	datos(al);
	end;
end;
procedure informar15853(a:arbol);
begin
	if (a<>nil) then begin
		if (a^.elem.legajo<15853) then begin
			informar15853(a^.hd);
			writeln('Info de alumnos con legajos menores a 15853.');
			writeln('Nombre: ',a^.elem.nombre);writeln('Apellido: ',a^.elem.apellido);
		end;
		informar15853(a^.hi);
	end;
end;
procedure entrenumeros(a:arbol);
begin
	if (a<>nil) then begin
	if (a^.elem.legajo>=1258) and (a^.elem.legajo<=7692) then begin
		entrenumeros(a^.hd);entrenumeros(a^.hi);
		writeln('Info de alumnos con legajos entre 1258 y 7692.');
		writeln('Nombre: ',a^.elem.nombre);writeln('Apellido: ',a^.elem.apellido);
		end
	else if (a^.elem.legajo>=1258) then entrenumeros(a^.hi)
	else entrenumeros(a^.hd);
	end;
end;
var
	a:arbol;
begin
	leeralumno(a);informar15853(a);entrenumeros(a);
end.
