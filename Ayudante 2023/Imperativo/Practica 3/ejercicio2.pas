program ejercicio2;
type
    venta = record
        codigo: integer;
        fecha: string;
        vendidas: integer;
    end;
    
    arbol=^nodo;
    nodo = record
        elem:venta;
        hi:arbol;
        hd:arbol;
    end;

function randomString():string;
var
    i:integer;
begin
    setLength(randomString,5);
    for i := 1 to 5 do 
        randomString[i]:=chr(random(26)+97);        
end;

function leerVenta():venta;
begin
    writeln('Ingrese codigo de producto: ');
    readln(leerVenta.codigo);
    if (leerVenta.codigo<>0) then begin
        leerVenta.fecha:=randomString();
        leerVenta.vendidas:=random(70)+1;
    end;
end;

procedure agregarVenta(var a:arbol; v:venta);
begin
    if (a = nil) then begin
        new(a);
        a^.elem:=v;
        a^.hi:=nil;
        a^.hd:=nil;
    end
    else begin
        if (a^.elem.codigo <= v.codigo) then
            agregarVenta(a^.hd,v)
        else
            agregarVenta(a^.hi,v);
    end;
end;

procedure agregarProducto(var a:arbol; codigo, vendidas:integer);
begin
    if (a = nil) then begin
        new(a);
        a^.elem.codigo:=codigo;
        a^.elem.vendidas:=vendidas;
        a^.elem.fecha:='';
        a^.hi:=nil;
        a^.hd:=nil;
    end
    else begin
        if (a^.elem.codigo = codigo) then
            a^.elem.vendidas+=vendidas
        else if (a^.elem.codigo < codigo) then
            agregarProducto(a^.hd,codigo,vendidas)
        else
            agregarProducto(a^.hi,codigo,vendidas);
    end;
end;

procedure cargarArboles(var arbolVentas, arbolProductos: arbol);
var
    v:venta;
begin
    v:=leerVenta();
    while (v.codigo<>0) do begin
        agregarVenta(arbolVentas,v);
        agregarProducto(arbolProductos,v.codigo, v.vendidas);
        v:=leerVenta();
    end;
end;

procedure imprimirArbol(a:arbol);
begin
    if (a<>nil) then begin
        writeln('Codigo producto: ',a^.elem.codigo, ' Unidades vendidas: ',a^.elem.vendidas);
        if (a^.elem.fecha <> '') then
            writeln('Venta realizada en la fecha: ',a^.elem.fecha);
        imprimirArbol(a^.hi);
        imprimirArbol(a^.hd);
    end;
end;

function buscarProductoVentas(a:arbol; codigo:integer):integer;
var
    aux:integer;
begin
    aux:=0;
    if (a<>nil) then begin
        if (a^.elem.codigo = codigo) then
            aux:=a^.elem.vendidas;
        if (a^.elem.codigo <= codigo) then
            aux+=buscarProductoVentas(a^.hd,codigo)
        else
            aux+=buscarProductoVentas(a^.hi,codigo)
    end;
    buscarProductoVentas:=aux;
end;

function buscarProducto(a:arbol; codigo:integer):integer;
var
    aux: integer;
begin
    aux:=0;
    if (a<>nil) then begin
        if (a^.elem.codigo = codigo) then
            aux:=a^.elem.vendidas
        else if (a^.elem.codigo < codigo) then
            aux+=buscarProducto(a^.hd,codigo)
        else
            aux+=buscarProducto(a^.hi,codigo)
    end;
    buscarProducto:=aux;
end;

var
    arbolProductos,arbolVentas: arbol;
begin
    randomize;
    arbolProductos:=nil;
    arbolVentas:=nil;
    cargarArboles(arbolVentas,arbolProductos);
    writeln('Arbol ventas: ');
    imprimirArbol(arbolVentas);
    writeln('Arbol productos: ');
    imprimirArbol(arbolProductos);
    writeln('La cantidad total vendida de los productos con codigo 50 en el arbol de ventas es ',buscarProductoVentas(arbolVentas,50));
    writeln('La cantidad total vendida de los productos con codigo 50 en el arbol de productos es ',buscarProducto(arbolProductos,50));
end.