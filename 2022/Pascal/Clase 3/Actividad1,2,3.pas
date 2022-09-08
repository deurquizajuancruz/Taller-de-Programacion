program Clase3Actividad1;

function potencia (x,n: integer): real;
begin
 if (n=0) then potencia:= 1
 else potencia := x * potencia(x,n-1);
end;

function potencia1 (x,n: integer): real;
begin
 potencia1 := x * potencia1(x,n-1);
end; (*Esta funcion no anda ya que no hay un caso base, por lo que la recursion es infinita.*)

function potencia2 (x,n: integer): real;
begin
 if (n = 0) then potencia2:= 1
 else potencia2 := x * potencia2(x,n);
end; (*Esta funcion no anda ya que nunca decrementa a n en el llamado recursivo, por lo que se queda en un loop.*)



var x,n:integer;
begin
	writeln('Ingrese la base de la potencia: ');readln(x);
	writeln('Ingrese la potencia: ');readln(n);
	writeln(x, ' elevado a la ',n, ' = ', potencia(x,n):0:2);
end.
