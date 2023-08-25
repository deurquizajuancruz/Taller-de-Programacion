program numAleatorio;
var
	num:integer;
begin
	Randomize;
	num := random(100); {genera un numero aleatorio entre 0 y 99}
	writeln('el numero es: ', num);
end.
