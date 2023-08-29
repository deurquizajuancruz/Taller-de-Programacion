program ejercicio2;

procedure descomponerNumero(numero:integer);
begin
    if (numero<10) then
        writeln(numero)
    else begin
        descomponerNumero(numero div 10);
        writeln(numero mod 10);
    end;
end;

procedure leerNumeros();
var
    numero:integer;
begin
    writeln('Ingrese un numero: ');
    readln(numero);
    while (numero<>0) do begin
        descomponerNumero(numero);
        writeln('Ingrese un numero: ');
        readln(numero);
    end;
end;

begin
    leerNumeros();
end.