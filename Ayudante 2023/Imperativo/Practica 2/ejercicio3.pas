program ejercicio3;
type
    lista = ^nodo;
    nodo = record
        elem:integer;
        sig:lista;
    end;

procedure agregarAtras (var l:lista;n:integer);
var
	nuevo,aux:lista;
begin
	new(nuevo);
	nuevo^.elem:=n;
	nuevo^.sig:=nil;
	if (l=nil) then 
		l:=nuevo
	else begin
		aux:=l;
		while (aux^.sig<>nil) do
			aux:=aux^.sig;
		aux^.sig:=nuevo;
	end;
end;

procedure listaRandom(var l:lista);
var
    num: integer;
begin
    num:= random(101);
    if (num<>0) then begin
        agregarAtras(l,num);
        listaRandom(l^.sig);
    end;
end;

procedure imprimirLista(l:lista);
begin
    while (l<>nil) do begin
        writeln(l^.elem);
        l:=l^.sig;
    end;
end;

procedure valorMinimo(l:lista; var min:integer);
begin
    if (l<>nil) then begin
        if (l^.elem< min) then
            min:= l^.elem;
        valorMinimo(l^.sig,min);
    end;
end;

procedure valorMaximo(l:lista; var max:integer);
begin
    if (l<>nil) then begin
        if (l^.elem> max) then
            max:= l^.elem;
        valorMaximo(l^.sig,max);
    end;
end;

function estaEnLaLista(l:lista; valor:integer):boolean;
begin
    estaEnLaLista:=false;
    if (l <> nil) then begin
        if (l^.elem = valor) then
            estaEnLaLista:=true
        else
            estaEnLaLista:=estaEnLaLista(l^.sig,valor);
    end;
end;

var
    l:lista;
    max,min: integer;
begin
    l:=nil;
    randomize;
    listaRandom(l);
    imprimirLista(l);
    min:=32767;
    max:=0;
    valorMinimo(l,min);
    writeln('Minimo: ',min);
    valorMaximo(l,max);
    writeln('Maximo: ',max);
    writeln(estaEnLaLista(l,100));
end.