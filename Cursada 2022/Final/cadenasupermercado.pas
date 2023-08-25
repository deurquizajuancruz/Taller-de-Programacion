{
Una cadena de supermercados necesita procesar su facturación para enviar un regalo de fin de año a sus mejores clientes. 
Entregará para el mes de Octubre un premio diario al cliente que hizo la compra de mayor monto.
Se dispone de una estructura que almacena las compras de Octubre agrupadas por número de sucursal (de 1 a 15). 
Para cada sucursal, las compras se encuentran ordenadas por día del mes.
Por cada compra se conoce el día, número de ticket, CUIL y monto.
Además se dispone de un vector desordenado con la información personal de 4000 clientes.
De cada cliente se conoce el CUIL, email y teléfono.
Implemente un programa que: 
Ordene, por CUIL, los elementos del vector de clientes que se dispone.
Es necesario este ordenamiento para obtener información del cliente en el siguiente inciso con mayor eficiencia.
Reciba la estructura con las compras y, usando la técnica de merge, imprima en pantalla para cada día del mes, el número de ticket ganador, el CUIL y email del cliente correspondiente. 
Por cada día, el ticket ganador es aquel con mayor monto. 
La búsqueda del cliente en el vector de información personal debe implementarse de forma recursiva. 
Si el cliente no está en el vector, se deberá informar el día y “Premio vacante”.
NOTA: En cada sucursal se pueden haber realizado más de una compra en el mismo día. 

}

program cadenasupermercados;
type
    compra=record
        dia:integer;
        ticket:integer;
        cuil:integer;
        monto:real;
    end;
    
    cliente=record
        cuil:integer;
        email:string;
        telefono:integer;
    end;

    vclientes=array[1..14] of cliente;

    lista=^nodo;
    nodo=record
        elem:compra;
        sig:lista;
    end;

    vsucursales=array[1..15] of lista;

procedure randomString(tamanio:integer; var palabra:string);
var  str,Result: String;
begin
    str:='abcdefghijklmnopqrstuvwxyz';//ABCDEFGHIJKLMNOPQRSTUVWXYZ
    Result:='';
    repeat
        Result:=Result+str[Random(Length(str))+1];
    until(Length(Result)=tamanio);
    palabra:=Result;
end;

procedure leerCompra(var com:compra);
begin
    com.ticket:=Random(30);
    if (com.ticket<>0) then begin
        com.dia:=Random(31)+1;
        com.cuil:=Random(20)+1;
        com.monto:=Random(15)*1.589;
    end;
end;

procedure leercliente(var c:cliente);
begin
    c.cuil:=Random(20)+1;
    c.telefono:=Random(200);
    randomString(2,c.email);
    c.email:=c.email + '@gmail.com';
end;

procedure cargarVector(var v:vclientes);
var
    i:integer;
    c:cliente;
begin
    for i:=1 to 14 do begin
        leerCliente(c);
        v[i]:=c;
    end;
end;

procedure imprimirVector(v:vclientes);
var
    i:integer;
begin
    for i:= 1 to 14 do begin
        writeln('Informacion del cliente numero ',i);
        writeln('CUIL: ',v[i].cuil,' Email: ',v[i].email,' Telefono: ',v[i].telefono);
    end;
end;

procedure OrdenacionPorInsercion(var v:vclientes);
var
    i,j:integer;
    actual:cliente;
begin
    for i:=1 to 14 do begin
        actual:=v[i];
        j:=i-1;
        while ((j>0)and (v[j].cuil>actual.cuil)) do begin
            v[j+1]:=v[j];
            j:=j-1;
        end;
        v[j+1]:=actual;
    end;
end;

procedure inicializarV(var v:vsucursales);
var
    i:integer;
begin
    for i:=1 to 15 do begin
        v[i]:=nil;
    end;
end;

procedure insertarOrdenado(var l:lista;com:compra);
var
    ant,act,nue:lista;
begin
    new(nue);
    nue^.elem:=com;
    nue^.sig:=nil;
    act:=l;
    ant:=l;
    while (act<>nil) and (act^.elem.dia<com.dia) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act=l) then
        l:=nue
    else
        ant^.sig:=nue;
    nue^.sig:=act;
end;

procedure cargarListas(var v:vsucursales);
var
    com:compra;
    sucursal:integer;
begin
    leerCompra(com);
    while (com.ticket<>0) do begin
        sucursal:=Random(15)+1;
        insertarOrdenado(v[sucursal],com);
        leerCompra(com);
    end;
end;

procedure imprimirLista(l:lista);
begin
    while (l<>nil) do begin
        writeln('Dia de la compra: ',l^.elem.dia,' Numero de ticket: ',l^.elem.ticket,' CUIL: ',l^.elem.cuil,' Monto de la compra: ',l^.elem.monto:0:2);
        l:=l^.sig;
    end;
end;

procedure imprimirCompras(v:vsucursales);
var
    i:integer;
begin
    for i:=1 to 15 do begin
        writeln('Informacion de las compras en la sucursal ',i);
        imprimirLista(v[i]);
    end;
end;

procedure buscarminimo(var v:vsucursales;var min:integer);
begin
    
end;

procedure merge(vsucur:vsucursales;vclien:vclientes);
var
    min:integer;
begin
    buscarminimo(v,min);
end;

var
    vectordeclientes:vclientes;
    vectorsucursales:vsucursales;
begin
    Randomize;
    inicializarV(vectorsucursales);
    cargarVector(vectordeclientes);
    OrdenacionPorInsercion(vectordeclientes);
    writeln('VECTOR DE LOS CLIENTES ORDENADO POR CUIL: ');
    imprimirVector(vectordeclientes);
    writeln('INFORMACION DE LAS COMPRAS EN LAS SUCURSALES: ');
    cargarListas(vectorsucursales);
    imprimirCompras(vectorsucursales);   
end.