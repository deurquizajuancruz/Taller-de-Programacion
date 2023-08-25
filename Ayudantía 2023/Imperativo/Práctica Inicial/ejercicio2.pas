program ejercicio2;
type
    zonas = 1..5;
    propiedad = record
        zona: zonas;
        codigo: integer;
        tipo: string;
        metros: integer;
        precio: real;
    end;

    propiedadTotal = record
        codigo: integer;
        tipo: string;
        precioTotal : real;
    end;

    lista = ^nodo;
    nodo = record
        elem: propiedadTotal;
        sig: lista;
    end;

    arrayPropiedades = array [zonas] of lista;

procedure insertarOrdenado(var l:lista; p:propiedadTotal);
var
    ant,act,nue: lista;
begin
    new(nue);
    nue^.elem:=p;
    ant:=l;
    act:=l;
    while((act<>nil)and (act^.elem.tipo<p.tipo))do begin
        ant:=act;
        act:=act^.sig;
    end; 
    if(ant=act)then
        l:=nue
    else
        ant^.sig:=nue;
    nue^.sig:=act;
end;

function randomString():string;
var
    i:integer;
begin
    setLength(randomString,3);
    for i := 1 to 3 do 
        randomString[i]:=chr(random(26)+97);        
end;

function leerPropiedad():propiedad;
begin
    leerPropiedad.zona:=random(5)+1;
    writeln('Zona: ',leerPropiedad.zona);
    leerPropiedad.codigo:=random(50)+1;
    readln(leerPropiedad.tipo);
    //leerPropiedad.tipo:=randomString();
    leerPropiedad.metros:=random(30)+1;
    readln(leerPropiedad.precio);
    //leerPropiedad.precio:=random()*100;
end;

procedure cargarPropiedades(var arrayP:arrayPropiedades);
var
    p: propiedad;
    propiedadAgregar: propiedadTotal;
begin
    p:=leerPropiedad();
    while (p.precio<>-1) do begin
        propiedadAgregar.codigo:=p.codigo;
        propiedadAgregar.tipo:=p.tipo;
        propiedadAgregar.precioTotal:= p.metros * p.precio;
        insertarOrdenado(arrayP[p.zona],propiedadAgregar);
        p:=leerPropiedad();
    end;
end;

procedure inicializarListas(var arrayP: arrayPropiedades);
var
    i: zonas;
begin
    for i := 1 to 5 do
        arrayP[i]:=nil;
end;

procedure imprimirLista(l:lista);
begin
    while (l<>nil) do begin
        writeln('Codigo: ',l^.elem.codigo);
        writeln('Tipo: ',l^.elem.tipo);
        writeln('Precio total: ',l^.elem.precioTotal:0:2);
        l:=l^.sig;
    end;
end;

procedure imprimirListas(arrayP:arrayPropiedades);
var
    i: zonas;
begin
    for i := 1 to 5 do begin
        writeln('Zona: ',i);
        imprimirLista(arrayP[i]);
    end;
end;

procedure buscarTipo(zona: zonas; tipo:string; arrayP: arrayPropiedades);
begin
    while (arrayP[zona]<>nil) do begin
        if (arrayP[zona]^.elem.tipo = tipo) then
            writeln('La propiedad con codigo ', arrayP[zona]^.elem.codigo, ' es de la zona ', zona, ' y del tipo ', tipo);
        arrayP[zona]:=arrayP[zona]^.sig;
    end;
end;

var
    arrayP: arrayPropiedades;
    zonaBuscada: zonas;
    tipoBuscado: string;
begin
    randomize;
    inicializarListas(arrayP);
    cargarPropiedades(arrayP);
    imprimirListas(arrayP);
    writeln('Ingrese zona a buscar: ');
    readln(zonaBuscada);
    writeln('Ingrese tipo a buscar: ');
    readln(tipoBuscado);
    buscarTipo(zonaBuscada, tipoBuscado, arrayP);
end.