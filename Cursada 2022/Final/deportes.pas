{
La casa de deportes “Mi deporte favorito” tiene 6 sucursales y necesita procesar el stock de los productos de las distintas sucursales.
Para ello ya se dispone de un módulo “Generar” que lee la información de los productos y genera una estructura con código de producto, descripción, stock y precio, agrupados por sucursal.
Para cada sucursal, los productos se encuentran ordenados por código de producto.
De cada producto se lee: código de sucursal (1..6), código de producto, stock y precio. 
La lectura finaliza con el código de producto -1, el cual no se procesa. 
Se pide implementar un programa en Pascal que invoque:
a) Al módulo “Generar”. 
b) A un módulo que reciba la estructura generada en a) y retorne una lista que contenga para cada producto, el código del producto, el stock mínimo y el código de sucursal que tiene dicho stock. 
}
program deportes;
type
    sucursales=1..6;
    
    producto=record
        suc:sucursales;
        codigo:integer;
        stock:integer;
        precio:real;
    end;

    productodescripcion=record
        p1:producto;
        descripcion:string;
    end;

    lista=^nodo;
    nodo=record
        elem:productodescripcion;
        sig:lista;
    end;

    vsucursales=array[sucursales] of lista;
    
procedure inicializarV(var v:vsucursales);
var
    i:sucursales;
begin
    for i:=1 to 6 do begin
        v[i]:=nil;
    end;
end;

procedure randomString(tamanio:integer; var palabra:string);
var  str,Result: String;
begin
    str:='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Result:='';
    repeat
        Result:=Result+str[Random(Length(str))+1];
    until(Length(Result)=tamanio);
    palabra:=Result;
end;

procedure leerProducto(var p:producto);
begin
    p.codigo:=Random(50)-1;
    if (p.codigo<>-1) then begin
        p.suc:=Random(6)+1;
        p.stock:=Random(200)+1;
        p.precio:=Random(1000)*1.27;
    end;
end;

procedure InsertarOrdenado(var l:lista; p:producto; d:string); 
var 
    nue, act, ant: lista; 
    cod1,cod2:integer;
begin
    new(nue); 
    nue^.elem.p1 := p; 
    nue^.elem.descripcion:=d; 
    act:= l; 
    ant:= l; 
    cod1:= -1; 
    cod2:= -2; 
    while(act <> nil) and (nue^.elem.p1.codigo >= act^.elem.p1.codigo)do begin
        cod1:= nue^.elem.p1.codigo; 
        cod2:= act^.elem.p1.codigo; 
        ant := act;
        act:= act^.sig; 
    end;
    if (act = nil) then begin
         if (act = ant) then
            l:= nue
        else
            ant^.sig := nue; 
        nue^.sig := act; 
    end
    else
        if (cod1 <> cod2) then begin
            if (act = ant) then
                l:= nue
            else
                ant^.sig := nue; 
            nue^.sig := act; 
        end
end;

procedure cargarVector(var v:vsucursales);
var
    p:producto;
    d:string;
begin
    leerProducto(p);
    while (p.codigo<>-1) do begin
        randomString(10,d);
        InsertarOrdenado(v[p.suc],p,d);
        leerProducto(p);
    end;
end;

procedure imprimirLista(l:lista);
begin
    while (l<>nil) do begin
        writeln('Descripcion del producto: ',l^.elem.descripcion);
        writeln('Codigo del producto: ',l^.elem.p1.codigo,' Stock del producto: ',l^.elem.p1.stock,' Precio del producto: ',l^.elem.p1.precio:0:2);
        l:=l^.sig;
    end;
end;

procedure imprimirVector(v:vsucursales);
var
    i:sucursales;
begin
    for i:=1 to 6 do begin
        writeln('Informacion de la sucursal numero: ',i);
        imprimirLista(v[i]);
        writeln('----------------------------------'); 
    end;
end;

procedure buscarminimo(var v:vsucursales;var min:producto);
var
    pos,i:sucursales;
begin
    min.codigo:=9999;
    for i:=1 to 6 do begin
        if (v[i]<>nil) then begin
            if (v[i]^.elem.p1.codigo<min.codigo) then begin
                min:=v[i]^.elem.p1;
                pos:=i;
            end;
        end;
    end;
    if (min.codigo <> 9999) then
		v[pos] := v[pos]^.sig; 
end;

procedure agregarAtras(var L,ult:lista;codigo,sucursal,stockmin:integer);
var
  aux:lista;
begin
   new(aux); 
   aux^.elem.p1.codigo:=codigo;
   aux^.elem.p1.suc:=sucursal;
   aux^.elem.p1.stock:=stockmin;
   aux^.sig:=nil;
   if (l<>nil) then
        ult^.sig:=aux
   else
        l:=aux;
   ult:=aux;
end;

procedure merge(var nueva:lista;v:vsucursales);
var
    ult:lista;
    actual,min:producto;
    minimo:integer;
begin
    ult:=nil;
    buscarminimo(v,min);//busca en el vector el producto con menor codigo
    while(min.codigo<>9999) do begin
        actual:=min;
        while(actual.codigo=min.codigo) do begin
            if (min.stock<actual.stock) then begin
                actual.stock:=min.stock;
                actual.suc:=min.suc;
            end;
            buscarminimo(v,min);
        end;
        agregarAtras(nueva,ult,actual.codigo,actual.suc,actual.stock);
    end;
end;

procedure imprimirListaNueva(l:lista);
begin
    while (l<>nil) do begin
        writeln('Codigo del producto: ',l^.elem.p1.codigo,' Stock minimo del producto: ',l^.elem.p1.stock,' Sucursal de ese producto: ',l^.elem.p1.suc);
        l:=l^.sig;
    end;
end;

var
    nueva:lista;
    v:vsucursales;
begin
    Randomize;
    nueva:=nil;
    inicializarV(v);
    cargarVector(v);
    imprimirVector(v);
    merge(nueva,v);
    imprimirVector(v);
    imprimirListaNueva(nueva);
end.