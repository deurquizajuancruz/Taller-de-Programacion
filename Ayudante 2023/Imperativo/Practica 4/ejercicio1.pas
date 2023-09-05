program ejercicio1;
type
    producto = record
        codigo:integer;
        unidades: integer;
        monto: real;
    end;

    venta = record
        codigo:integer;
        vendido: producto;
    end;

    arbol=^nodo;
    nodo = record
        elem: producto;
        hi:arbol;
        hd:arbol;
    end;

procedure agregarNodo(var a:arbol; p:producto);
begin
    if (a = nil) then begin
        new(a);
        a^.elem:=p;
        a^.hi:=nil;
        a^.hd:=nil;
    end
    else begin
        if (a^.elem.codigo = p.codigo) then
            a^.elem.unidades+=p.unidades
        else if (a^.elem.codigo < p.codigo) then
            agregarNodo(a^.hd,p)
        else
            agregarNodo(a^.hi,p);
    end;
end;

function leerVenta():venta;
begin
    writeln('Ingrese codigo de venta: ');
    readln(leerVenta.codigo);
    if (leerVenta.codigo<>-1) then begin
        leerVenta.vendido.codigo:=random(20)+1;
        writeln('Codigo ',leerVenta.vendido.codigo);
        leerVenta.vendido.unidades:=random(100)+1;
        writeln('Unidades: ',leerVenta.vendido.unidades);
        leerVenta.vendido.monto:=random()*50;
        writeln('Monto: ',leerVenta.vendido.monto:0:2);
    end;    
end;

procedure cargarArbol(var a:arbol);
var
    v:venta;
begin
    v:=leerVenta();
    while (v.codigo<>-1) do begin
        agregarNodo(a,v.vendido);
        v:=leerVenta();
    end;
end;

procedure imprimirArbol(a:arbol);
begin
    if (a<>nil) then begin
        imprimirArbol(a^.hi);
        writeln('Codigo ',a^.elem.codigo, ' Unidades totales: ',a^.elem.unidades, ' Monto total: ',a^.elem.monto:0:2);
        imprimirArbol(a^.hd);
    end;
end;

procedure mayorUnidades(a:arbol; var maxUnidades,maxCodigo:integer);
begin
    if (a<>nil) then begin
        mayorUnidades(a^.hi,maxUnidades,maxCodigo);
        mayorUnidades(a^.hd,maxUnidades,maxCodigo);
        if (a^.elem.unidades>maxUnidades) then begin
            maxUnidades:=a^.elem.unidades;
            maxCodigo:=a^.elem.codigo;
        end;
    end;
end;

function cantidadMenor(a:arbol; codigo:integer):integer;
begin
    if (a=nil) then
        cantidadMenor:=0
    else begin
        if (a^.elem.codigo > codigo) then
            cantidadMenor:=cantidadMenor(a^.hi,codigo)
        else
            cantidadMenor:=cantidadMenor(a^.hi,codigo) + 1 + cantidadMenor(a^.hd,codigo);
    end;
end;

function montoRango(a:arbol; codigo1,codigo2: integer):real;
begin
    if (a = nil) then
        montoRango:=0
    else begin
        if (a^.elem.codigo > codigo1) and (a^.elem.codigo < codigo2) then
            montoRango:= montoRango(a^.hi,codigo1,codigo2) + montoRango(a^.hd,codigo1,codigo2) + a^.elem.monto
        else if (a^.elem.codigo < codigo1) then
            montoRango:=montoRango(a^.hd,codigo1,codigo2)
        else
            montoRango:=montoRango(a^.hi,codigo1,codigo2);
    end;
end;

var
    a:arbol;
    codigoMenor,maxUnidades,maxCodigo,codigo1,codigo2:integer;
begin
    randomize;
    a:=nil;
    cargarArbol(a);
    imprimirArbol(a);
    maxUnidades:=-1;
    mayorUnidades(a,maxUnidades,maxCodigo);
    writeln('El codigo del producto con mayor unidades vendidas es: ',maxCodigo, ' con ',maxUnidades);
    writeln('Ingrese codigo para saber cuantos productos hay con un codigo menor a este: ');
    readln(codigoMenor);
    writeln('La cantidad de producto con un codigo menor a ',codigoMenor, ' es: ',cantidadMenor(a,codigoMenor));
    writeln('Ingrese el primer codigo del rango: ');
    readln(codigo1);
    writeln('Ingrese el segundo codigo del rango: ');
    readln(codigo2);
    writeln('El monto de los productos comprendidos entre ',codigo1, ' y ',codigo2,' es de: ',montoRango(a,codigo1,codigo2):0:2);
end.