program ejercicio1;
type
    productos = 1..50;
    dias = 0..31;
    codigos = 1..15;
    cantidad = 1..99;
    venta = record
        dia: dias;
        codigo: codigos;
        cantidadVendida: cantidad;
    end;

    arrayProductos = array [productos] of venta;

procedure cargarArray(var a:arrayProductos; var diml:integer);
var
    v:venta;
begin
    writeln('Ingrese dia de venta: ');
    readln(v.dia);
    while (v.dia<>0) and (diml<50) do begin
        diml+=1;
        v.codigo:=random(15)+1;
        v.cantidadVendida:=random(99)+1;
        a[diml]:=v;
        writeln('Ingrese dia de venta: ');
        readln(v.dia);
    end;
end;

procedure imprimirArray(a: arrayProductos; diml:integer);
var
    i:productos;
begin
    for i := 1 to diml do begin
        writeln('Codigo: ',a[i].codigo);
        writeln('Cantidad vendida: ',a[i].cantidadVendida);
        writeln('Dia: ',a[i].dia);
    end;
end;

procedure insercion (var v:arrayProductos;diml:integer);
var 
	i,j,actual:integer;
begin
	for i:=2 to diml do begin 
		actual:=v[i].codigo;
		j:=i-1;
		while (j>0) and (v[j].codigo>actual) do begin 
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1].codigo:=actual;
	end;
end;

procedure eliminar (var v:arrayProductos; var diml:integer; codigo1, codigo2: integer);
var
    i,eliminar,pos:integer;
begin
    eliminar:=0;
    pos:=1;
    while pos<=diml and v[pos].codigo<codigo1 do
        pos+=1;
    while pos<=diml and v[pos].codigo<=codigo2 do begin
        pos+=1;
        eliminar+=1;
    end;
    for i := diml downto pos do begin
        v[i-eliminar]:=v[i];
        diml-=1;  
    end;
end;

procedure cargarPares(v:arrayProductos; diml:integer; var dimlPares: integer; var vPares: arrayProductos);
var
    i:integer;
begin
    for i := 1 to diml do begin
        if (v[i].codigo mod 2 = 0) then begin
            dimlPares+=1;
            vPares[dimlPares]=v[i];
        end;
    end;
end;

var
    vector, vectorPares: arrayProductos;
    diml,dimlPares:integer;
begin
    randomize;
    diml:=0;
    dimlPares:=0;
    cargarArray(vector,diml);
    imprimirArray(vector,diml);
    writeln('Vector ordenado: ');
    insercion(vector,diml);
    imprimirArray(vector,diml);
end.