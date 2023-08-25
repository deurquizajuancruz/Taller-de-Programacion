program Clase3Actividad4;
type digito=-1..9;

var num: integer;
    max: digito;

procedure digitoMaximoRec(n: integer; var max: digito); (*Si la variable max se pasa por valor y no por referencia, no se actualiza nunca y en el pp principal imprime -1*)
var
  dig: integer;
begin
  if (n <> 0) then begin 
	dig:= n mod 10; (*CASO BASE*)
    if (dig > max) then 
		max:= dig;
    n:= n div 10;
    (*writeln('max:',max); El valor que se muestra en cada llamada recursiva es el digito mas grande, empezando de derecha a izquierda.*)
    digitoMaximoRec(n, max); (*Se acerca al caso base dividiendo el digito n por 10, lo que va achicando al numero ingresado.*)
    writeln('max:',max); (*El valor que se muestra es siempre el digito mas grande del numero, en el pp principal tambien.*)
    end;
end;

procedure ImprimirDigitos1(n:integer);
var dig:integer;
begin
	if (n<>0) then begin
		dig:=n mod 10;
		n:=n div 10;
		writeln(dig);
		ImprimirDigitos1(n);
	end;
end;

procedure ImprimirDigitos2(n:integer);
var dig:integer;
begin
	if (n<>0) then begin
		dig:=n mod 10;
		n:=n div 10;
		ImprimirDigitos2(n);writeln(dig);
	end;
end;

begin
  read (num);
  {max := -1;
  digitoMaximoRec(num, max);
  write ('El digito maximo de ', num, ' es: ', max);}
  ImprimirDigitos2(num);
end.
