program supermercado;
type
    dias=1..5;

    producto=record
        codigo:integer;
        cantidad:integer;
        cliente:integer;
    end;

    lista=^nodo;
    nodo=record
        elem:producto;
        sig:lista;
    end;

    vlistas=array[1..5] of lista;

    productoTotal=record
        codigo: integer;
        canttotal: integer;
    end;

    listaM = ^nodo2;
    nodo2 = record  
        elem:productoTotal;
        sig:listaM;
    end;

procedure inicializarvector (var v:vlistas);
var i:integer;
begin   
    for i := 1 to 5 do begin    
        v[i]:= nil;
    end;
end;

procedure leerProducto(var p:producto);
begin
    p.codigo:=Random(20)-1;
    if (p.codigo<>-1) then begin
        p.cantidad:=Random(50)+1;
        p.cliente:=Random(100)+1;
    end;
    {writeln('Ingrese codigo del producto: ');readln(p.codigo);
    writeln('Ingrese cantidad vendida: ');readln(p.cantidad);
    writeln('Ingrese codigo del cliente: ');readln(p.cliente);}
end;

procedure insertarOrdenado(var l:lista;p:producto);
var 
    ant,nue,act:lista;
begin
	new(nue);
	nue^.elem:=p;
	act:=l;
	ant:=l;
	while (act<>nil) and (act^.elem.codigo<p.codigo)do begin
		ant:=act;
		act:=act^.sig;
	end;
	if (act=l) then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure cargarvector(var v:vlistas);
var
    p:producto;
    dia:dias;
begin
    //writeln('Ingrese el dia de venta del producto: ');readln(dia);
    dia:=Random(5)+1;leerProducto(p);
    while (p.codigo<>-1) do begin
        insertarOrdenado(v[dia],p);
        dia:=Random(5)+1;leerProducto(p);
    end;
end;

procedure imprimirLista(l:lista);
begin
    while (l<>nil) do begin
        writeln('Codigo de producto: ',l^.elem.codigo,' Cantidad vendida en esta venta: ',l^.elem.cantidad,' Codigo del cliente: ',l^.elem.cliente);
        l:=l^.sig;
    end;
end;

procedure imprimirVector(v:vlistas);
var
    i:dias;
begin
    for i:=1 to 5 do begin
        writeln('Informacion de los productos vendidos el dia ',i);
        imprimirLista(v[i]);
    end;
end;

procedure buscarminimo(var v : vlistas; var min:producto);
var
   pos,i: dias;
begin
	min.codigo:=9999;
	for i:= 1 to 5 do begin
        if (v[i] <> nil) then begin
            if (v[i]^.elem.codigo < min.codigo) then begin
                min := v[i]^.elem;
			    pos := i;
            end;
        end;
    end;				
	if (min.codigo <> 9999) then
		v[pos] := v[pos]^.sig;
end;

procedure agregarAtras(var L,ult:listaM;actual:productoTotal);
var
  aux : listaM;
begin
   new(aux); 
   aux^.elem:=actual;
   aux^.sig:=nil;
   if (l<>nil) then
        ult^.sig:=aux
   else
        l:=aux;
   ult:=aux;
end;

procedure merge(v:vlistas;var nuevo:listaM);
var
    ult:listam;
    min:producto;
    actual:productoTotal;
begin
    ult:=nil;
	buscarminimo(v,min);
	while (min.codigo<>9999) do begin
		actual.codigo:=min.codigo;
        actual.canttotal:= 0;
		while (min.codigo=actual.codigo) do begin
			actual.canttotal:=actual.canttotal+1;
			buscarminimo(v,min);
		end;
        agregarAtras(nuevo,ult,actual);
	end;
end;

procedure buscarMayorCantidad(nueva:listaM;var max,codmax:integer);
begin
    if (nueva<>nil) then begin
        if (nueva^.elem.canttotal>max) then begin  
            max:=nueva^.elem.canttotal;
            codmax:=nueva^.elem.codigo;
        end;
        buscarMayorCantidad(nueva^.sig,max,codmax);
    end;
end;

procedure imprimirListaNueva(l:listaM);
begin
    while (l<>nil) do begin
        writeln('La cantidad de productos que se vendieron en esta semana del producto con el codigo ',l^.elem.codigo,' es de: ',l^.elem.canttotal);
        l:=l^.sig;
    end;
end;

var
    v:vlistas;
    listaNueva:listaM;
    max,codigomax:integer;
begin
    Randomize;
    listanueva:=nil;
    inicializarvector(v);
    cargarvector(v);
    imprimirVector(v);
    merge(v,listanueva);
    imprimirListaNueva(listanueva);
    max:=-1;codigomax:=0;
    buscarMayorCantidad(listanueva,max,codigomax);
    writeln('El codigo del producto que mas se vendio esta semana es: ',codigomax);
end.