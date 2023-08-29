program ejercicio4;
type
    vector = array [1..20] of integer;

procedure cargarVector(var v:vector; pos:integer);
begin
    if (pos<=20) then begin
        v[pos]:=random(98)+1;
        cargarVector(v,pos +1);
    end;
end;

procedure maximoValor(v:vector; var max:integer; pos:integer);
begin
    if (pos<21) then begin
        if (v[pos]>max) then
            max:=v[pos];
        maximoValor(v,max,pos+1);
    end;
end;

function maximos(v:vector; pos:integer):integer;
var
    max:integer;
begin
    if (pos = 20) then
        maximos:=v[pos]
    else begin
        max:=maximos(v,pos+1);
        if (v[pos]>max) then
            maximos:=v[pos]
        else
            maximos:=max;
    end;
end;

procedure sumaValores(v:vector; var suma:integer; pos:integer);
begin
    if (pos<21) then begin
        suma += v[pos];
        sumaValores(v,suma,pos+1);
    end;
end;

function sumando(v:vector;pos:integer):integer;
begin
    if (pos = 20) then
        sumando:=v[pos]
    else 
        sumando:= sumando(v,pos+1) + v[pos];
end;

var
    v:vector;
    suma, max, i:integer;
begin
    randomize;
    cargarVector(v,1);
    for i := 1 to 20 do
        writeln('Numero ', i, ': ',v[i]);
    max:=0;
    maximoValor(v,max,1);
    writeln('Maximo: ',maximos(v,1));
    suma:=0;
    sumaValores(v,suma,1);
    writeln('Suma: ',sumando(v,1));
end.