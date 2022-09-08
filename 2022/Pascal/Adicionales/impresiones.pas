{
Se requiere implementar un programa para administrar una impresora de red, la que almacenará en su memoria datos estadísticos sobre impresiones realizadas por los usuarios 
Se pide:
a) Leer información de impresiones (nombre del documento, páginas, tamaño en KB, nombre del
usuario) y generar una estructura eficiente para la búsqueda por usuario, que guarde para cada
usuario la cantidad total de documentos impresos, la cantidad total de páginas impresas y el
nombre del último documento impreso. La lectura es en orden temporal y finaliza con tamaño O
A partir de la estructura generada en a), realice módulos independientes para
b) Obtener la información del usuario que imprimió más documentos en total
s últimos documentos impresos de los usuarios con nombre
sabiendo que como máximo son 20. La estructura debe guardar

c) Generar una estructura con lo:
ento impreso, y quedar ordenada por nombre de usuario.

comprendido entre dos valores, si
nombre de usuario y su último docum
El programa debe invocar a los módulos realizados, mostrar las estructuras generadas e información

obtenida.

 
}
program impresiones;
type
    impresion=record
        nombre:string;
        paginas:integer;
        tamanio:integer;
        usuario:string;
    end;

    impresionarbol=record
        cantidad:integer;
        imp:impresion;
    end;

    arbol=^nodo;
    nodo=record
        elem:impresionarbol;
        hi:arbol;
        hd:arbol;
    end;

    ventrevalores=array[1..20] of impresion;

procedure randomString(tamanio:integer; var palabra:string);
var  str,Result: String;
begin
    str:='ABCDEFGHIJKLMNOPQRSTUVWXYZ';//abcdefghijklmnopqrstuvwxyz
    Result:='';
    repeat
        Result:=Result+str[Random(Length(str))+1];
    until(Length(Result)=tamanio);
    palabra:=Result;
end;

procedure leerImpresion(var im:impresion);
begin
    //writeln('Ingrese tamanio: ');readln(im.tamanio);
    im.tamanio:=Random(10);
    if (im.tamanio<>0) then begin
        randomString(2,im.nombre);
        im.paginas:=Random(10)+1;
        randomString(1,im.usuario);
        //writeln('Ingrese nombre de usuario: ');readln(im.usuario);
    end;
end;

procedure insertarArbolOrdenado(var a:arbol;im:impresion);
begin
    if (a=nil) then begin
        new(a);
        a^.elem.imp.usuario:=im.usuario;
        a^.elem.cantidad:=1;
        a^.elem.imp.paginas:=im.paginas;
        a^.elem.imp.nombre:=im.nombre;
    end
    else
        if (a^.elem.imp.usuario=im.usuario) then begin
            a^.elem.cantidad:=a^.elem.cantidad+1;
            a^.elem.imp.paginas:=a^.elem.imp.paginas + im.paginas;
            a^.elem.imp.nombre:=im.nombre;
        end
        else
            if (a^.elem.imp.usuario<im.usuario) then
                insertarArbolOrdenado(a^.hd,im)
            else
                insertarArbolOrdenado(a^.hi,im);
end;

procedure info(im:impresion);
begin
    writeln('Nombre del usuario que va a imprimir: ',im.usuario,' Nombre del documento: ',im.nombre,' Paginas a imprimir: ',im.paginas,' Tamanio en KB a imprimir: ',im.tamanio);
end;

procedure cargarArbol(var a:arbol);
var
    im:impresion;
begin
    leerImpresion(im);
    while (im.tamanio<>0) do begin
        info(im);
        InsertarArbolOrdenado(a,im);
        leerImpresion(im);
    end;
end;

procedure imprimirArbolOrdenado(a:arbol);
begin
    if (a<>nil) then begin
        imprimirArbolOrdenado(a^.hi);
        writeln('Nombre de usuario: ',a^.elem.imp.usuario,' Cantidad de documentos que imprimio: ',a^.elem.cantidad,' Total de paginas q imprimio: ',a^.elem.imp.paginas,' Nombre del ultimo documento impreso: ',a^.elem.imp.nombre);
        imprimirArbolOrdenado(a^.hd);
    end;
end;

procedure mayorCantidad(a:arbol;var mayor:impresionarbol);
begin
    if (a<>nil) then begin
        mayorCantidad(a^.hi,mayor);
        if (a^.elem.cantidad>mayor.cantidad) then begin
            mayor:=a^.elem;
        end;
        mayorCantidad(a^.hd,mayor);
    end;
end;

{procedure entre2Valores(a:arbol;valor1,valor2:char;var v:ventrevalores;var diml:integer);
begin
	if (a<>nil) then begin
        if (a^.elem.imp.usuario>=valor1) and (a^.elem.imp.usuario<=valor2) then begin //si el usuario esta entre los 2 valores, lo agrego al vector
            if (diml<20) then begin
                diml:=diml+1;
                v[diml]:=a^.elem.imp;
            end;
            entre2Valores(a^.hd,valor1,valor2,v,diml);
            entre2Valores(a^.hi,valor1,valor2,v,diml)
        end
        else
            if (a^.elem.imp.usuario>valor2) then
                entre2Valores(a^.hi,valor1,valor2,v,diml)
            else
                if (a^.elem.imp.usuario<valor1) then
                    entre2Valores(a^.hd,valor2,valor2,v,diml);
	end;
end;}

procedure entre2Valores(a:arbol;valor1,valor2:char;var diml:integer;var v:ventrevalores);
begin
	if (a<>nil) then begin
		if (a^.elem.imp.usuario>=valor1) then begin
            entre2Valores(a^.hi,valor1,valor2,diml,v);
			if (a^.elem.imp.usuario<=valor2) then begin
                entre2Valores(a^.hd,valor1,valor2,diml,v);
				if (diml<20) then  begin
                    diml:=diml+1;
                    v[diml]:=a^.elem.imp;
                end;
			end;
		end
		else entre2Valores(a^.hd,valor1,valor2,diml,v);
	end;
end;

procedure OrdenacionPorInsercion(var v:ventrevalores;diml:integer);
var 
	i,j:integer;
	actual:impresion;
begin
	for i:=1 to diml do begin
		actual:=v[i];j:=i-1;
		while ((j>0) and (v[j].usuario>actual.usuario)) do begin
			v[j+1]:=v[j];j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;

procedure vector(v:ventrevalores;diml:integer);
var
    i:integer;
begin
    for i:=1 to diml do begin
        writeln('Numero ',i);
        writeln('Nombre del usuario: ',v[i].usuario,' Nombre del ultimo documento que imprimio: ',v[i].nombre);
    end;
end;

var
    a:arbol;
    mayor:impresionarbol;
    v:ventrevalores;
    valor1,valor2:char;
    diml:integer;
begin
    Randomize;
    cargarArbol(a);
    writeln('----------------');
    writeln('IMPRESION DEL ARBOL: ');
    imprimirArbolOrdenado(a);
    mayor.cantidad:=-1;
    mayorCantidad(a,mayor);
    writeln('----------------');
    writeln('El usuario que mas documentos imprimio fue: ',mayor.imp.usuario,' que imprimio ',mayor.cantidad,' con ',mayor.imp.paginas,' paginas impresas, siendo ',mayor.imp.nombre,' el ultimo documento que imprimio');
    diml:=0;
    writeln('----------------');
    writeln('Ingrese el primer valor: ');readln(valor1);
    writeln('Ingrese el segundo valor: ');readln(valor2);
    writeln('Buscando como maximo 20 los usuarios comprendidos entre los valores ',valor1,' y ',valor2,'.');
    entre2Valores(a,valor1,valor2,diml,v);
    writeln('Informacion de los usuarios que sus nombres estan comprendidos entre ',valor1,' y ',valor2,':');
    OrdenacionPorInsercion(v,diml);
    vector(v,diml);
end.