program Punto8Practica1;
type
	arbol=^nodo;
	nodo=record
		elem:integer;
		hi:arbol;
		hd:arbol;
	end;
procedure cargararbol (var a:arbol;num:integer);
begin
	if (a=nil) then begin
		new(a);a^.elem:=num;a^.hi:=nil;a^.hd:=nil;
	end
	else
		if (num<a^.elem) then cargararbol(a^.hi,num)
	else
		cargararbol(a^.hd,num);
end;
procedure leernumero (var a:arbol);
var
	num:integer;
begin
	writeln('Ingrese un numero: ');readln(num);
	while (num<>0) do begin
		cargararbol(a,num);writeln('Ingrese un numero');readln(num);
	end;
end;
procedure maximo(a:arbol;var max:integer);
begin
	if (a<>nil) then begin
	if (a^.elem>max) then
		max:=a^.elem;
	maximo(a^.hd,max);
	end;
end;
procedure minimo(a:arbol;var min:integer);
begin
	if (a<>nil) then begin
	if (a^.elem<min) then
		min:=a^.elem;
	minimo(a^.hi,min);
	end;
end;
procedure calcular(a:arbol;var contador:integer);
begin
	if (a<>nil) then begin
	calcular(a^.hi,contador);
	contador:=contador + 1;
	calcular(a^.hd,contador);
	end;
end;
procedure ordenA(a:arbol);
begin
	if (a<>nil) then begin
	ordenA(a^.hi);
	writeln(a^.elem);
	ordenA(a^.hd);
	end;
end;
procedure numeropar(a:arbol);
begin
	if (a<>nil) then begin
	numeropar(a^.hi);
	if (a^.elem mod 2=0) then
		writeln(a^.elem);
	numeropar(a^.hd);
	end;
end;
procedure imprimir (a:arbol);
var
	max,min,contador:integer;
begin
	max:=-32000;min:=32000;contador:=0;
	maximo(a,max);
	writeln('El valor maximo del arbol es: ',max);
	minimo(a,min);
	writeln('El valor minimo del arbol es: ',min);
	calcular(a,contador);
	writeln('La cantidad de los valores del arbol es: ',contador);
	writeln('Numeros del arbol en forma ascendente: ');ordenA(a);
	writeln('Numeros del arbol pares: ');numeropar(a);
end;
var
	a:arbol;
begin
	leernumero(a);imprimir(a);
end.
