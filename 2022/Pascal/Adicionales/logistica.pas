{
Una empresa de logística ofrece 4 tipos de paquetes (1: encomienda común, 2: encomienda express, 3:  encomienda frágil, 4: certificado), y necesita procesar los envíos de  sus clientes. 
Para ello se dispone de un módulo “Envíos” que lee la información de los envíos realizados y genera una estructura con código de paquete, código de localidad de destino, peso y precio del paquete, agrupados por tipo de paquete.
Por cada tipo de paquete, los envíos se encuentran ordenados por código de localidad.
Se pide implementar un programa en Pascal que:
Invoque a un módulo que reciba la estructura de los envíos y utilizando la técnica de merge o merge acumulador genere un árbol ordenado que contenga código de localidad y el peso total acumulado entre todos sus envíos. 
El árbol debe estar ordenado por el peso total.
Implementar un módulo recursivo que reciba la estructura generada en a) y retorne la cantidad de localidades con peso total inferior a un valor que se recibe como parámetro.
NOTA: Para cada tipo de paquete puede haber más de un envío de la misma localidad.
No es necesario implementar la carga de la estructura que se dispone. 
Alcanza con declarar el encabezado del procedimiento e invocarlo para que el programa compile satisfactoriamente.
}

program logistica;
type
    envio=record
        paquete:integer;
        localidad:integer;
        peso:real;
        precio:real;
    end;

    lista=^nodo;
    nodo=record
        elem:envio;
        sig:lista;
    end;

    venvios=array[1..4] of lista;

    envioArbol=record
        codigo:integer;
        pesototal:real;
    end;
    
    arbol=^nodo2;
    nodo2=record
        elem:envioArbol;
        hi:arbol;
        hd:arbol;
    end;

procedure inicializarV(var v:venvios);
var
    i:integer;
begin
    for i:=1 to 4 do begin
        v[i]:=nil;
    end;
end;

procedure leerEnvio(var e:envio);
begin
    e.paquete:=Random(50);
    if (e.paquete<>0) then begin
        e.localidad:=Random(50);
        e.peso:=Random(50)*1.254;
        e.precio:=Random(50)*2.569;
    end;
end;

procedure insertarOrdenado(var l:lista;e:envio);
var 
    ant,nue,act:lista;
begin
	new(nue);
	nue^.elem:=e;
	act:=l;
	ant:=l;
	while (act<>nil) and (act^.elem.localidad<e.localidad)do begin
		ant:=act;
		act:=act^.sig;
	end;
	if (act=l) then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure cargarvector(var v:venvios);
var
    tipo:integer;
    e:envio;
begin
    leerEnvio(e);
    tipo:=Random(4)+1;
    while (e.paquete<>0) do begin
        insertarOrdenado(v[tipo],e);
        leerEnvio(e);
        tipo:=Random(4)+1;
    end;
end;

procedure imprimirLista(l:lista);
begin
    while(l<>nil) do begin
        writeln('Codigo de localidad: ',l^.elem.localidad,' Codigo de paquete: ',l^.elem.paquete,' Peso del paquete: ',l^.elem.peso:0:2,' Precio del paquete: ',l^.elem.precio:0:2);
        l:=l^.sig;
    end;
end;

procedure imprimirVector(var v:venvios);
var
    i:integer;
begin
    inicializarV(v);
    cargarVector(v);
    for i:=1 to 4 do begin
        writeln('Informacion de los paquetes de tipo ',i);
        imprimirLista(v[i]);
        writeln('----------');
    end;
end;

procedure buscarminimo(var v:venvios;var min:envio);
var
    pos,i:integer;
begin
    min.localidad:=9999;
    for i:=1 to 4 do begin
        if (v[i]<>nil) then begin
            if (v[i]^.elem.localidad<min.localidad) then begin
                min:=v[i]^.elem;
                pos:=i;
            end;
        end;
    end;
    if (min.localidad <> 9999) then
		v[pos] := v[pos]^.sig; 
end;

procedure InsertarArbolOrdenado(var a:arbol; e:envioArbol);
begin
	if (a=nil) then begin
		new(a);
		a^.elem:=e;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else
		if (a^.elem.pesototal<e.pesototal) then
			InsertarArbolOrdenado(a^.hd,e)
	else
		if (a^.elem.pesototal>e.pesototal) then
			InsertarArbolOrdenado(a^.hi,e);
end;

procedure merge(var a:arbol;v:venvios);
var
    min:envio;
    actual:envioArbol;
begin
    buscarminimo(v,min);
    while(min.localidad<>9999) do begin
        actual.codigo:=min.localidad;
        actual.pesototal:=0;
        while (actual.codigo=min.localidad) do begin
            actual.pesototal:=actual.pesototal+min.peso;
            buscarminimo(v,min);
        end;
        InsertarArbolOrdenado(a,actual);
    end;
end;

procedure imprimirArbolOrdenado(a:arbol);
begin
    if (a<>nil) then begin
        imprimirArbolOrdenado(a^.hi);
        writeln('Peso total de los pedidos de esa localidad: ',a^.elem.pesototal:0:2,' Codigo de la localidad: ',a^.elem.codigo);
        imprimirArbolOrdenado(a^.hd);
    end;
end;

procedure cantidadLocalidades(a:arbol;var cantidad:integer;peso:real);
begin
    if (a<>nil) then begin
        if (a^.elem.pesototal<peso) then begin
            cantidad:=cantidad+1;
            cantidadLocalidades(a^.hd,cantidad,peso)
        end;
        cantidadLocalidades(a^.hi,cantidad,peso);
    end;
end;


var
    v:venvios;
    a:arbol;
    cantidad:integer;
    pesoinferior:real;
begin
    Randomize;
    cantidad:=0;
    imprimirVector(v);
    merge(a,v);
    writeln('IMPRESION DEL ARBOL: ');
    imprimirArbolOrdenado(a);
    writeln('Ingrese el peso para saber cuantas localidades tienen un peso total inferior: ');readln(pesoinferior);
    cantidadLocalidades(a,cantidad,pesoinferior);
    writeln('La cantidad de localidades con un peso total inferior a ',pesoinferior:0:2,' es de: ',cantidad);
end.