program ejercicio3;
type
    productos= 1..1000;
    productosTabla = record
        precio: real;
        stock: integer;
    end;

    tabla = array [productos] of productosTabla;

    detalle = record
        codigo: integer;
        cantidadVendida: integer;
        precioUnitario: real;
    end;

    lista=^nodo;
    nodo = record
        elem: detalle;
        sig: lista;
    end;

    ticket = record
        codigo: integer;
        detalles: lista;
        montoTotal: real;
    end;

    listaTickets = ^nodoTickets;
    nodoTickets = record
        elem: ticket;
        sig: listaTickets;
    end;

procedure agregarAtras(var l: lista; d: detalle);
var
    nuevo,aux: lista;
begin
    new(nuevo);
    nuevo^.elem:=d;
    nuevo^.sig:=nil;
    if (l = nil) then
        l:=nuevo
    else begin
        aux:=l;
        while (aux^.sig<>nil) do begin
            aux:=aux^.sig;
        end;
        aux^.sig:=nuevo;
    end;
end;

procedure agregarAtrasTicket(var l: listaTickets; t: ticket);
var
    nuevo,aux: listaTickets;
begin
    new(nuevo);
    nuevo^.elem:=t;
    nuevo^.sig:=nil;
    if (l = nil) then
        l:=nuevo
    else begin
        aux:=l;
        while (aux^.sig<>nil) do begin
            aux:=aux^.sig;
        end;
        aux^.sig:=nuevo;
    end;
end;

procedure leerVenta(t: tabla; var listaDetalles: lista; var monto: real);
var
    d: detalle;
begin
    d.codigo:=random(10)+1;
    d.cantidadVendida:=random(5);
    while (d.cantidadVendida<>0) do begin
        if (d.cantidadVendida > t[d.codigo].stock) then begin
            d.cantidadVendida := t[d.codigo].stock;
            t[d.codigo].stock:= 0;
        end else
            t[d.codigo].stock -= d.cantidadVendida;
        d.precioUnitario:= t[d.codigo].precio;
        monto+= d.precioUnitario * d.cantidadVendida;
        agregarAtras(listaDetalles,d);
        d.codigo:=random(10)+1;
        d.cantidadVendida:=random(5);
    end;
end;

procedure cargarVentas(t: tabla; var l:listaTickets);
var
    nuevo: ticket;
begin
    writeln('Ingrese codigo de venta: ');
    readln(nuevo.codigo);
    while (nuevo.codigo<>-1) do begin
        nuevo.detalles:=nil;
        nuevo.montoTotal:=0;
        leerVenta(t,nuevo.detalles,nuevo.montoTotal);
        agregarAtrasTicket(l,nuevo);
        writeln('Ingrese codigo de venta: ');
        readln(nuevo.codigo);
    end;
end;

var
    t:tabla;
    l:listaTickets;
begin
    randomize;
    // cargarTabla() SE DISPONE
    l:=nil;
    cargarVentas(t, l);
end.