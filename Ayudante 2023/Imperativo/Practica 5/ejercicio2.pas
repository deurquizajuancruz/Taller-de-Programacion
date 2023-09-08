{
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.
}
program ejercicio2;
type

    auto = record
        patente:integer;
        anio:integer;
        marca:string;
        modelo:string;
    end;

    lista =^nodoLista;
    nodoLista = record
        elem:auto;
        sig:lista;
    end;

    infoArbol = record
        marca:string;
        listaAutos:lista;
    end;

    arbolMarcas = ^nodoMarca;
    nodoMarca = record
        elem:infoArbol;
        hi:arbolMarcas;
        hd:arbolMarcas;
    end;

    arbolAutos =^nodoAutos;
    nodoAutos = record
        elem:auto;
        hi:arbolAutos;
        hd:arbolAutos;
    end;

    vector = array [2010..2018] of integer;

procedure agregarAtras(var l: lista; a:auto);
var
    nuevo,aux: lista;
begin
    new(nuevo);
    nuevo^.elem:=a;
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

function randomString():string;
var
    i:integer;
begin
    setLength(randomString,3);
    for i := 1 to 3 do 
        randomString[i]:=chr(random(26)+97);        
end;

function leerAuto():auto;
begin
    writeln('Ingrese marca: ');
    readln(leerAuto.marca);
    if (leerAuto.marca<>'ZZZ') then begin
        leerAuto.patente:=random(10)+1;
        writeln(leerAuto.patente);
        leerAuto.anio:=random(9)+2010;
        writeln(leerAuto.anio);
        leerAuto.modelo:=randomString();
        writeln(leerAuto.modelo);
    end;
end;

procedure cargarAuto(var a:arbolAutos; info:auto);
begin
    if (a = nil) then begin
        new(a);
        a^.elem:=info;
        a^.hi:=nil; 
        a^.hd:=nil; 
    end
    else begin
        if (a^.elem.patente <= info.patente) then
            cargarAuto(a^.hd,info)
        else
            cargarAuto(a^.hi,info);
    end;
end;

procedure cargarMarcas(var a:arbolMarcas; info:auto);
begin
    if (a = nil) then begin
        new(a);
        a^.elem.marca:=info.marca;
        a^.elem.listaAutos:=nil;
        agregarAtras(a^.elem.listaAutos,info);
        a^.hi:=nil;
        a^.hd:=nil;
    end
    else begin
        if (a^.elem.marca = info.marca) then
            agregarAtras(a^.elem.listaAutos,info)
        else if (a^.elem.marca < info.marca) then
            cargarMarcas(a^.hd,info)
        else
            cargarMarcas(a^.hi,info);
    end;
end;

procedure cargarArboles(var autos:arbolAutos; var marcas:arbolMarcas);
var
    info:auto;
begin
    info:=leerAuto();
    while (info.marca<>'ZZZ') do begin
        cargarAuto(autos,info);
        cargarMarcas(marcas,info);
        info:=leerAuto();
    end;
end;

procedure imprimirAutos(a:arbolAutos);
begin
    if (a<>nil) then begin
        imprimirAutos(a^.hi);
        writeln('Patente ',a^.elem.patente, ' Anio ',a^.elem.anio,' Marca ',a^.elem.marca,' Modelo ',a^.elem.modelo);
        imprimirAutos(a^.hd);
    end;
end;

procedure recorrerLista(l:lista);
begin
    while (l<>nil) do begin
        writeln('Patente ',l^.elem.patente, ' Anio ',l^.elem.anio,' Modelo ',l^.elem.modelo);
        l:=l^.sig;
    end;
end;

procedure imprimirMarcas(a:arbolMarcas);
begin
    if (a<>nil) then begin
        imprimirMarcas(a^.hi);
        writeln('Marca ',a^.elem.marca);
        recorrerLista(a^.elem.listaAutos);
        imprimirMarcas(a^.hd);
    end;
end;

function contarAutos(a:arbolAutos;marca:string):integer;
begin
    if (a = nil) then
        contarAutos:=0
    else begin
        contarAutos:=contarAutos(a^.hi,marca) + contarAutos(a^.hd,marca);
        if (a^.elem.marca = marca) then
            contarAutos+=1;
    end;
end;

function contarLista(l:lista):integer;
begin
    contarLista:=0;
    while (l<>nil) do begin
        contarLista+=1;
        l:=l^.sig;
    end;
end;

function contarMarca(a:arbolMarcas;marca:string):integer;
begin
    if (a = nil ) then
        contarMarca:=0
    else
        if (a^.elem.marca = marca) then
            contarMarca:=contarLista(a^.elem.listaAutos)
        else if (a^.elem.marca < marca) then
            contarMarca:=contarMarca(a^.hd,marca)
        else
            contarMarca:=contarMarca(a^.hi,marca);
end;

procedure inicializar(var v:vector);
var
    i:integer;
begin
    for i := 2010 to 2018 do
        v[i]:=0;
end;

procedure contarAnios(a:arbolAutos; var v:vector);
begin
    if (a<>nil) then begin
        contarAnios(a^.hi,v);
        v[a^.elem.anio]+=1;
        contarAnios(a^.hd,v);
    end;
end;

procedure recorrerVector(v:vector);
var
    i:integer;
begin
    for i := 2010 to 2018 do
        writeln('Del anio ',i,' hay ',v[i]);
end;

function buscarPatente(a:arbolAutos;p:integer):string;
begin
    if (a = nil) then
        buscarPatente:=''
    else begin
        if (a^.elem.patente = p) then
            buscarPatente:=a^.elem.modelo
        else if (a^.elem.patente < p) then
            buscarPatente:=buscarPatente(a^.hd,p)
        else
            buscarPatente:=buscarPatente(a^.hi,p)
    end;
end;

function buscarEnLista(l:lista;p:integer):string;
var
    encontre:boolean;
begin
    buscarEnLista:='';
    encontre:=false;
    while (l<>nil) and (not encontre) do begin
        if (l^.elem.patente = p) then begin
            buscarEnLista:=l^.elem.modelo;
            encontre:=true;
        end;
        l:=l^.sig;
    end;
end;

procedure buscarModelo(a:arbolMarcas; p:integer; var modelo:string);
begin
    if (a<>nil) then begin
        modelo:=buscarEnLista(a^.elem.listaAutos,p);
        if (modelo = '') then
            buscarModelo(a^.hi,p,modelo);
        if (modelo = '') then
            buscarModelo(a^.hd,p,modelo);
    end;
end;

var
    autos:arbolAutos;
    marcas:arbolMarcas;
    v:vector;
    modelo:string;
begin
    randomize;
    autos:=nil;
    marcas:=nil;
    cargarArboles(autos,marcas);
    writeln('Autos: ');
    imprimirAutos(autos);
    writeln('Marcas: ');
    imprimirMarcas(marcas);
    writeln('De la marca aa hay ',contarAutos(autos,'aa'));
    writeln('De la marca bb hay ',contarMarca(marcas,'bb'));
    inicializar(v);
    contarAnios(autos,v);
    recorrerVector(v);
    writeln('El modelo del auto con patente 10 es ',buscarPatente(autos,10));
    modelo:='';
    buscarModelo(marcas,4,modelo);
    writeln('El modelo del auto con patente 4 es ',modelo);
end.