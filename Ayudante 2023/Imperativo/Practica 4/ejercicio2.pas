program ejercicio2;
type
    prestamo = record
        isbn:integer;
        socio:integer;
        dia:integer;
        mes:integer;
        dias:integer;
    end;

    arbolDePrestamos = ^nodoArbolP;
    nodoArbolP = record
        elem:prestamo;
        hi:arbolDePrestamos;
        hd:arbolDePrestamos;
    end;

    lista =^nodo;
    nodo = record
        elem:prestamo;
        sig:lista;
    end;

    libros = record
        isbn:integer;
        prestamos:lista;
        cantidad:integer;
    end;

    arbolDeIsbn = ^nodoI;
    nodoI = record
        elem:libros;
        hi:arbolDeIsbn;
        hd:arbolDeIsbn;
    end;

function leerPrestamo():prestamo;
begin
    writeln('Ingrese ISBN: ');
    readln(leerPrestamo.isbn);
    if (leerPrestamo.isbn<>-1) then begin
        leerPrestamo.socio:=random(5)+1;
        writeln('Socio ',leerPrestamo.socio);
        leerPrestamo.dia:=random(31)+1;
        writeln('Dia ',leerPrestamo.dia);
        leerPrestamo.mes:=random(12)+1;
        writeln('Mes ',leerPrestamo.mes);
        leerPrestamo.dias:=random(100)+1;
        writeln('Dias: ',leerPrestamo.dias);
    end;    
end;

procedure agregarPrestamo(var a:arbolDePrestamos; p:prestamo);
begin
    if (a = nil) then begin
        new(a);
        a^.elem:=p;
        a^.hi:=nil;
        a^.hd:=nil;
    end
    else begin
        if (a^.elem.isbn <= p.isbn) then
            agregarPrestamo(a^.hd,p)
        else
            agregarPrestamo(a^.hi,p);
    end;
end;

procedure agregarAtras(var l: lista; p:prestamo);
var
    nuevo,aux: lista;
begin
    new(nuevo);
    nuevo^.elem:=p;
    nuevo^.sig:=nil;
    if (l = nil) then
        l:=nuevo
    else begin
        aux:=l;
        while (aux^.sig<>nil) do 
            aux:=aux^.sig;
        aux^.sig:=nuevo;
    end;
end;

procedure sumarPrestamo(var a:arbolDeIsbn; p:prestamo);
begin
    if (a = nil) then begin
        new(a);
        a^.elem.isbn:=p.isbn;
        a^.elem.prestamos:=nil;
        agregarAtras(a^.elem.prestamos,p);
        a^.hi:=nil;
        a^.hd:=nil;
    end
    else begin
        if (a^.elem.isbn = p.isbn) then
            agregarAtras(a^.elem.prestamos,p)
        else if (a^.elem.isbn < p.isbn) then
            sumarPrestamo(a^.hd,p)
        else
            sumarPrestamo(a^.hi,p);
    end;
end;

procedure leerPrestamos(var arbolIsbn: arbolDeIsbn; var arbolPrestamos: arbolDePrestamos);
var
    p:prestamo;
begin
    p:=leerPrestamo();
    while (p.isbn<>-1) do begin
        agregarPrestamo(arbolPrestamos,p);
        sumarPrestamo(arbolIsbn,p);
        p:=leerPrestamo();
    end;
end;

procedure imprmirPrestamos(a:arbolDePrestamos);
begin
    if (a<>nil) then begin
        imprmirPrestamos(a^.hi);
        writeln('Prestamo con isbn ',a^.elem.isbn,' socio ',a^.elem.socio,' dia ',a^.elem.dia, ' mes ',a^.elem.mes,' dias ',a^.elem.dias);
        imprmirPrestamos(a^.hd);
    end;    
end;

procedure recorrerPrestamos(l:lista);
begin
    while(l<>nil) do begin
        writeln(' socio ',l^.elem.socio,' dia ',l^.elem.dia, ' mes ',l^.elem.mes,' dias ',l^.elem.dias);
        l:=l^.sig;
    end;
end;

procedure imprimirISBN(a:arbolDeIsbn);
begin
    if (a<>nil) then begin
        imprimirISBN(a^.hi);
        writeln('ISBN: ',a^.elem.isbn,' tiene los prestamos: ');
        recorrerPrestamos(a^.elem.prestamos);
        imprimirISBN(a^.hd);
    end; 
end;

function maximo(var a:arbolDePrestamos):integer;
begin
    if (a^.hd=nil) then
        maximo:=a^.elem.isbn
    else
        maximo:=maximo(a^.hd);
end;

function minimo(var a:arbolDeIsbn):integer;
begin
    if (a^.hi=nil) then
        minimo:=a^.elem.isbn
    else
        minimo:=minimo(a^.hi);
end;

function contarPrestamos(a:arbolDePrestamos; socio:integer):integer;
begin
    if (a = nil) then
        contarPrestamos:=0
    else begin
        contarPrestamos:= contarPrestamos(a^.hi,socio) + contarPrestamos(a^.hd,socio);
        if (a^.elem.socio = socio) then
            contarPrestamos+=1;
    end;
end;

function socioRealizo(l:lista;socio:integer):integer;
begin
    socioRealizo:=0;
    while (l<>nil) do begin
        if (l^.elem.socio = socio) then
            socioRealizo+=1;
        l:=l^.sig;
    end;
end;

function buscarSocio(a:arbolDeIsbn;socio:integer):integer;
begin
    if (a =nil) then
        buscarSocio:=0
    else begin
        buscarSocio:= buscarSocio(a^.hi,socio) + buscarSocio(a^.hd,socio);
        buscarSocio+= socioRealizo(a^.elem.prestamos,socio);
    end;
end;

procedure agregarIsbn(var a:arbolDeIsbn; isbn,cantidad:integer);
begin
    if (a = nil) then begin
        new(a);
        a^.elem.isbn:=isbn;
        a^.elem.cantidad:=cantidad;
        a^.hi:=nil;
        a^.hd:=nil;
    end
    else begin
        if (a^.elem.isbn = isbn) then
            a^.elem.cantidad+=cantidad
        else if (a^.elem.isbn < isbn) then
            agregarIsbn(a^.hd,isbn,cantidad)
        else
            agregarIsbn(a^.hi,isbn,cantidad);
    end;
end;

function recorrerLista(l:lista):integer;
begin
    recorrerLista:=0;
    while(l<>nil) do begin
        recorrerLista+=1;
        l:=l^.sig;
    end;
end;

procedure totalIsbn(a:arbolDeIsbn; var nuevo:arbolDeIsbn);
begin
    if (a<>nil) then begin
        totalIsbn(a^.hi,nuevo);
        agregarIsbn(nuevo,a^.elem.isbn,recorrerLista(a^.elem.prestamos));
        totalIsbn(a^.hd,nuevo);
    end;
end;

procedure agregarNuevo(var a:arbolDeIsbn; codigo:integer);
begin
        if (a = nil) then begin
        new(a);
        a^.elem.isbn:=codigo;
        a^.elem.cantidad:=1;
        a^.hi:=nil;
        a^.hd:=nil;
    end
    else begin
        if (a^.elem.isbn = codigo) then
            a^.elem.cantidad+=1
        else if (a^.elem.isbn < codigo) then
            agregarNuevo(a^.hd,codigo)
        else
            agregarNuevo(a^.hi,codigo);
    end;
end;

procedure totalPrestamos(a:arbolDePrestamos; var nuevo:arbolDeIsbn);
begin
    if (a<>nil) then begin
        totalPrestamos(a^.hi,nuevo);
        agregarNuevo(nuevo,a^.elem.isbn);
        totalPrestamos(a^.hd,nuevo);
    end;
end;

procedure imprimirCantidad(a:arbolDeIsbn);
begin
    if (a<>nil) then begin
        imprimirCantidad(a^.hi);
        writeln('El ISBN ',a^.elem.isbn,' tuvo ',a^.elem.cantidad);
        imprimirCantidad(a^.hd);
    end;
end;

function cantidadPrestamos(a:arbolDePrestamos; uno,dos:integer):integer;
begin
    if (a = nil) then
        cantidadPrestamos:=0
    else begin
        if (a^.elem.isbn >= uno) and (a^.elem.isbn <= dos) then
            cantidadPrestamos:= cantidadPrestamos(a^.hi,uno,dos) + cantidadPrestamos(a^.hd,uno,dos) + 1
        else if (a^.elem.isbn < uno) then
            cantidadPrestamos:=cantidadPrestamos(a^.hd,uno,dos)
        else
            cantidadPrestamos:=cantidadPrestamos(a^.hi,uno,dos);
    end;
end;

function cantidadIsbn(a:arbolDeIsbn;uno,dos:integer):integer;
begin
    if (a = nil) then
        cantidadIsbn:=0
    else begin
        if (a^.elem.isbn >= uno) and (a^.elem.isbn <= dos) then
            cantidadIsbn:= cantidadIsbn(a^.hi,uno,dos) + cantidadIsbn(a^.hd,uno,dos) + recorrerLista(a^.elem.prestamos)
        else if (a^.elem.isbn < uno) then
            cantidadIsbn:=cantidadIsbn(a^.hd,uno,dos)
        else
            cantidadIsbn:=cantidadIsbn(a^.hi,uno,dos);
    end;
end;

var
    nuevo,arbolIsbn,nuevoP:arbolDeIsbn;
    arbolPrestamos:arbolDePrestamos;
begin
    randomize;
    arbolIsbn:=nil;
    arbolPrestamos:=nil;
    leerPrestamos(arbolIsbn,arbolPrestamos);
    imprmirPrestamos(arbolPrestamos);
    imprimirISBN(arbolIsbn);
    writeln('El ISBN maximo es: ',maximo(arbolPrestamos));
    writeln('El ISBN minimo es: ',minimo(arbolIsbn));
    writeln('La cantidad de prestamos hecho por el socio 2 es de ', contarPrestamos(arbolPrestamos,2));
    writeln('La cantidad de prestamos hecho por el socio 4 es de ', buscarSocio(arbolIsbn,4));
    nuevo:=nil;
    totalIsbn(arbolIsbn,nuevo);
    nuevoP:=nil;
    totalPrestamos(arbolPrestamos,nuevoP);
    imprimirCantidad(nuevo);
    imprimirCantidad(nuevoP);
    writeln('La cantidad de prestamos de los ISBN entre 5 y 10 es de: ',cantidadPrestamos(arbolPrestamos,5,10));
    writeln('La cantidad de prestamos de los ISBN entre 1 y 5 es de: ',cantidadIsbn(arbolIsbn,1,5));
end.