program Punto7Practica1;
procedure binario (num:integer);
begin
	if (num>0) then begin
		binario(num div 2);
		write(num mod 2);
	end;
end;
procedure numero;
var
	num:integer;
begin
	writeln('Ingrese el numero a pasar en binario: ');readln(num);
	while (num<>0) do begin
		binario(num);writeln(' Ingrese el numero a pasar en binario: ');readln(num);
	end;
end;
begin
	numero;
end.
