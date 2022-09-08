{
Una feria municipal tiene 20 puestos de venta y necesita procesar las compras de sus
clientes.
Para ello sedisponede un módulo “Compras” que lee la información de las compras
realizadas en los puestos de venta y genera una estructura con código de cliente, dni de
cliente, fecha y monto de la compra, agrupados por puesto de venta. Para cada puesto de
venta, los clientes se encuentran ordenados por dni de cliente.
Se pide implementar un programa en Pascal que:
a) Invoque a un módulo que reciba la estructura de las compras y utilizando la técnica
de merge o merge acumulador genere un árbol ordenado por código de cliente que
contenga el código de cliente y monto de la compra de mayor valor.
b) Implementar un módulo recursivo que reciba la estructura generada en a) y retorne el monto de la compra de mayor valor para un código de cliente que se recibe como
parámetro, o -1 si el código de cliente no existe.
NOTA: Cada puesto puede realizar más de una venta al mismo cliente.
No es necesario implementar la carga de la estructura que se dispone. Alcanza con declarar
el encabezado del procedimiento e invocarlo para que el programa compile
satisfactoriamente.
}
program feriamunicipal;
type
    fecha=record
        dia:integer;
        mes:integer;
        anio:integer;
    end;
    compras=record
        codigo:integer;
        dni:integer;
        f:fecha;
        monto:real;
    end;

    lista=^nodo;
    nodo=record
        elem:compras;
        sig:lista;
    end;

    vpuestos=array[1..20] of lista;

    productoArbol=record
        codigo:integer;
        montomayor:real;
    end;

    arbol=^nodo2;
    nodo2=record
        elem:productoArbol;
        hi:arbol;
        hd:arbol;
    end;

procedure inicializarV(var v:vpuestos);
var
    i:integer;
begin
    for i:=1 to 20 do begin
        v[i]:=nil;
    end;
end;

procedure leerCompra(var c:compras);
begin
    c.codigo:=Random(10);
    if (c.codigo<>0) then begin
        c.dni:=Random(200)+1;
        c.f.dia:=Random(31)+1;
        c.f.mes:=Random(12)+1;
        c.f.anio:=Random(22)+2000;
        c.monto:=Random(1000)*1.2785;
    end;
end;

procedure insertarOrdenado(var l:lista;c:compras);
var ant,nue,act:lista;
begin
	new(nue);
	nue^.elem:=c;
	act:=l;
	ant:=l;
	while (act<>nil) and (act^.elem.dni<c.dni)do begin
		ant:=act;
		act:=act^.sig;
	end;
	if (act=l) then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure cargarVector(var v:vpuestos);
var
    punto:integer;
    c:compras;
begin
    leerCompra(c);
    punto:=Random(20)+1;
    while(c.codigo<>0) do begin
        InsertarOrdenado(v[punto],c);
        leerCompra(c);
        punto:=Random(20)+1;
    end;
end;

procedure imprimirLista(l:lista);
begin
    while (l<>nil) do begin
        writeln('DNI: ',l^.elem.dni,' Codigo de cliente: ',l^.elem.codigo,' Fecha: ',l^.elem.f.dia,'/',l^.elem.f.mes,'/',l^.elem.f.anio,' Monto de la compra: ',l^.elem.monto:0:2);
        l:=l^.sig;
    end;
end;

procedure Vector(var v:vpuestos);
var
    i:integer;
begin
    inicializarV(v);
    cargarVector(v);
    for i:=1 to 20 do begin
        writeln('Informacion de la sucursal numero ',i,':');
        imprimirLista(v[i]);
        writeln('--------------');
    end;
end;

procedure InsertarArbolOrdenado(var a:arbol; codigo:integer;monto:real);
begin
	if (a=nil) then begin
		new(a);
		a^.elem.codigo:=codigo;
        a^.elem.montomayor:=monto;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else
		if (a^.elem.codigo<codigo) then
			InsertarArbolOrdenado(a^.hd,codigo,monto)
	else
		if (a^.elem.codigo>codigo) then
			InsertarArbolOrdenado(a^.hi,codigo,monto);
end;

procedure buscarminimo(var v:vpuestos;var min:compras);
var
    pos,i:integer;
begin
    min.dni:=9999;
    for i:=1 to 20 do begin
        if (v[i]<>nil) then begin
            if (v[i]^.elem.dni<min.dni) then begin
                min:=v[i]^.elem;
                pos:=i;
            end;
        end;
    end;
    if (min.dni <> 9999) then
		v[pos] := v[pos]^.sig; 
end;

procedure merge(var a:arbol;v:vpuestos);
var
    min,actual:compras;
begin
    buscarminimo(v,min);
    while(min.dni<>9999) do begin
        actual:=min;
        while (actual.dni=min.dni) do begin
            if (min.monto>actual.monto) then 
                actual.monto:=min.monto;
            buscarminimo(v,min);
        end;
        InsertarArbolOrdenado(a,actual.codigo,actual.monto);
    end;
end;

procedure imprimirArbolOrdenado(a:arbol);
begin
    if (a<>nil) then begin
        imprimirArbolOrdenado(a^.hi);
        writeln('Codigo del cliente: ',a^.elem.codigo,' Monto mayor realizado por ese cliente: ',a^.elem.montomayor:0:2);
        imprimirArbolOrdenado(a^.hd);
    end;
end;

procedure buscarArbol(a:arbol;codigo:integer;var monto:real);
begin
    if (a<>nil) then begin
        if (a^.elem.codigo=codigo) then
            monto:=a^.elem.montomayor
        else
            if (a^.elem.codigo>codigo) then
                buscarArbol(a^.hi,codigo,monto)
            else
                buscarArbol(a^.hd,codigo,monto);
    end;
end;

var
    v:vpuestos;
    a:arbol;
    codigobuscado:integer;
    montobuscado:real;
begin
    montobuscado:=-1;
    Randomize;
    Vector(v);
    merge(a,v);
    writeln('IMPRESION DEL ARBOL: ');
    imprimirArbolOrdenado(a);
    writeln('Ingrese el codigo de cliente del cual quiere buscar el monto: ');
    readln(codigobuscado);
    buscarArbol(a,codigobuscado,montobuscado);
    if (montobuscado<>-1) then 
        writeln('El monto mayor realizado por el cliente con codigo ',codigobuscado,' es: ',montobuscado:0:2)
    else
        writeln('El codigo de cliente no existe.');
end.4
