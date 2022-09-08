program pizzeria;
type
    fecha=record
        dia:integer;
        mes:integer;
        anio:integer;
    end;
    pedido=record
        dni:integer;
        nombre:string;
        f:fecha;
        monto:real;
    end;
    elemlista=record
        f:fecha;
        monto:real;
    end;
    lista=^nodo;
    nodo=record
        elem:elemlista;
        sig:lista;
    end;
    elemarbol=record
        dni:integer;
        nombre:string;
        info:lista;
    end;
    arbol=^nodo2;
    nodo2=record
        elem:elemarbol;
        hi:arbol;
        hd:arbol;
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

procedure leerPedido(var p:pedido);
begin
    p.monto:=Random(50);
    if (p.monto<>0) then begin
        p.dni:=Random(20)+1;
        randomString(10,p.nombre);
        p.f.dia:=Random(31)+1;
        p.f.mes:=Random(12)+1;
        p.f.anio:=Random(22)+2000;
    end;
end;

procedure agregarAdelante(var l:lista;f:fecha;monto:real);
var 
    nue:lista;
begin
	New(nue);
	nue^.elem.f:=f;
    nue^.elem.monto:=monto;
	nue^.sig:=l;
	l:=nue;
end;

procedure InsertarenArbol(var a: arbol; p:pedido);
begin
 if (a = nil) then begin
	new(a);
	a^.elem.dni:= p.dni;
    a^.elem.nombre:=p.nombre;
    agregarAdelante(a^.elem.info,p.f,p.monto);
	a^.HI:= nil;
	a^.HD:= nil;
 end
 else 
    if (a^.elem.dni=p.dni) then
        agregarAdelante(a^.elem.info,p.f,p.monto)
    else
	    if (a^.elem.dni > p.dni) then
		    InsertarenArbol(a^.HI,p)
        else
		    InsertarenArbol(a^.HD,p);
end;

procedure cargarArbol(var a:arbol);
var
    p:pedido;
begin
    leerPedido(p);
    while(p.monto<>0) do begin
        InsertarenArbol(a,p);
        leerPedido(p);
    end;
end;

procedure imprimirLista(l:lista);
begin
    while (l<>nil) do begin
        writeln('Fecha:');
        writeln(l^.elem.f.dia,'/',l^.elem.f.mes,'/',l^.elem.f.anio);
        writeln('Monto: ',l^.elem.monto:0:2);
        l:=l^.sig;
    end;
end;

procedure imprimirenorden(a:arbol);
begin
	if (a<>nil) then begin
		imprimirenorden(a^.hi);
		writeln('DNI del cliente: ',a^.elem.dni,' Nombre del cliente: ',a^.elem.nombre);
        imprimirLista(a^.elem.info);
		imprimirenorden(a^.hd);
		end;
end;

procedure pedirFecha(var f:fecha);
begin
    writeln('Ingrese informacion de la fecha a buscar.');
    write('Ingrese dia: ');readln(f.dia);
    write('Ingrese mes: ');readln(f.mes);
    write('Ingrese anio: ');readln(f.anio);
end;

function mismaFecha(fechadelarbol,buscada:fecha):boolean;
begin
    mismaFecha:=((fechadelarbol.dia=buscada.dia) and (fechadelarbol.mes=buscada.mes) and (fechadelarbol.anio=buscada.anio));
end;

procedure buscarLista(l:lista;fechaBuscada:fecha;var cant:integer);
var
    unavez:boolean;
begin
    unavez:=true;
    while (l<>nil)and (unavez) do begin
        if (mismaFecha(l^.elem.f,fechaBuscada)) then begin
            cant:=cant+1;
            unavez:=false;
        end;
        l:=l^.sig;
    end;
end;

procedure buscar(a:arbol;f:fecha;var cantidad:integer);
begin
    if (a<>nil) then begin
        buscarLista(a^.elem.info,f,cantidad);
        buscar(a^.hd,f,cantidad);
        buscar(a^.hi,f,cantidad);
    end;
end;

procedure recorrerLista(var tm:real;var tp:integer;l:lista);
begin
    while (l<>nil) do begin
        tm:=tm + l^.elem.monto;
        tp:=tp + 1;
        l:=l^.sig;
    end;
end;

procedure totalDNI(a:arbol;dnibuscado:integer;var totalmonto:real;var totalpedidos:integer);
begin
    if (a<>nil) then begin
        if (a^.elem.dni=dnibuscado) then 
            recorrerLista(totalmonto,totalpedidos,a^.elem.info)
        else
            if (a^.elem.dni>dnibuscado) then 
                totalDNI(a^.hi,dnibuscado,totalmonto,totalpedidos)
            else
                totalDNI(a^.hd,dnibuscado,totalmonto,totalpedidos);
    end;
end;

var
    a:arbol;
    buscada:fecha;
    cantidad,dnib,totalp:integer;
    totalm:real;
begin
    Randomize;cantidad:=0;totalp:=0;totalm:=0;
    cargarArbol(a);
    imprimirenorden(a);
    pedirFecha(buscada);
    buscar(a,buscada,cantidad);
    writeln('La cantidad de clientes que compraron en la pizzeria en la fecha ',buscada.dia,'/',buscada.mes,'/',buscada.anio,' es de: ',cantidad);
    writeln('Ingrese el DNI para buscar el monto total y la cantidad de pedidos de sus gastos: ');readln(dnib);
    totalDNI(a,dnib,totalm,totalp);
    writeln('Informacion del cliente con el DNI ',dnib,' Monto total: ',totalm:0:2,' Total de pedidos: ',totalp);
end.