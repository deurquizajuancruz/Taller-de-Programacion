program ejercicio5;
type
    indice = -1..50;
    vector = array [1..50] of integer;

procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
var
    medio:indice;
begin
    if (ini>fin) then
        pos:=-1
    else begin
        medio:= (ini + fin) div 2;
        if (v[medio]=dato) then
            pos:=medio
        else if (dato<v[medio]) then
            busquedaDicotomica(v,ini,medio-1,dato,pos)
        else
            busquedaDicotomica(v,medio+1,fin,dato,pos);
    end;
end;

var
    v:vector;
    i:integer;
    pos:indice;
begin
    randomize;
    for i := 1 to 50 do
        v[i]:=random(40)+1;
    for i := 1 to 50 do
        writeln(v[i]);
    busquedaDicotomica(v,1,50,3,pos);
    writeln(pos);
end.