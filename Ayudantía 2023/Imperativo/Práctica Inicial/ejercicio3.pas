program ejercicio3;
type
    productos: 1..1000;
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

procedure leerVenta(t: tabla; var listaDetalles: lista; var monto: real);
var
    d: detalle;
begin
    d.codigo:=random(10)+1;
    d.unidadesSolicitadas:=random(5);
    while (d.unidadesSolicitadas<>0) do begin
        if (d.unidadesSolicitadas > t[d.codigo].stock) then begin
            d.unidadesSolicitadas := t[d.codigo].stock;
            t[d.codigo].stock:= 0;
        end else
            t[d.codigo].stock -= d.unidadesSolicitadas;
        d.precioUnitario:= t[d.codigo].precio;
        monto+= d.precioUnitario * d.unidadesSolicitadas;
        agregarAtras(listaDetalles,d);
        d.codigo:=random(10)+1;
        d.unidadesSolicitadas:=random(5);
    end;
end;

procedure cargarVentas(t: tabla);
var
    codigoVenta: integer;
    nuevo: ticket;
begin
    writeln('Ingrese codigo de venta: ');
    readln(t.codigo);
    while (codigoVenta<>-1) do begin
        t.detalles:=nil;
        t.montoTotal:=0;
        leerVenta(t,t.detalles,t.montoTotal);
        // agregar ticket a la lista de tickets
        writeln('Ingrese codigo de venta: ');
        readln(t.codigo);
    end;
end;

begin
    randomize;
end.