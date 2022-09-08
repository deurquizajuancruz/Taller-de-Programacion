program Clase2;
type
	arbol=^nodo;
	nodo=record
		elem:integer;
		hi:arbol;
		hd:arbol;
	end;
Procedure crear2 (var a:arbol; num:integer);
Begin
  if (A = nil) then
   begin
      new(A);
      A^.elem:= num; A^.HI:= nil; A^.HD:= nil;
   end
   else
    if (num < A^.elem) then crear2(A^.HI,num)
    else crear2(A^.HD,num)   
End;
procedure enorden(a:arbol;var suma:integer);
begin
	if (a<>nil) then begin
		enorden(a^.hi,suma);
		suma:=suma + a^.elem;
		enorden(a^.hd,suma);
		suma:=suma + a^.elem;
		end;
end;
function sumar(a:arbol):integer;
begin
	if(a<>nil) then begin
		sumar:=a^.elem +sumar(a^.hi) + sumar(a^.hd);
	end
	else
		sumar:=0;
end;
procedure numero58 (var a:arbol);
var
	num:integer;
begin
	writeln('Ingrese un numero: ');readln(num);
	while (num<>58) do begin
		crear2(a,num);
		writeln('Ingrese un numero: ');readln(num);
	end;
end;
procedure imprimir(a:arbol);
begin
	if (a<>nil) then begin
	imprimir (a^.hi);
	writeln (a^.elem);
	imprimir (a^.hd);
	end;
end;
procedure multiplicar(var a:arbol);
begin
	if (a<>nil) then begin
	multiplicar(a^.hi);
	a^.elem:=a^.elem * 2;
	multiplicar(a^.hd);
	end;
end;
function maximo(a:arbol):integer;
begin
	if (a=nil) then maximo:=-1
	else
		if (a^.hd=nil) then maximo:=a^.elem
		else
			maximo:=maximo(a^.hd);
end;
var
	a:arbol;suma:integer;
begin
	suma:=0;
	numero58(a);multiplicar(a);imprimir(a);
end.
