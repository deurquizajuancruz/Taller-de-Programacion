program Clase4Actividad1y2y3y4;
type
	arbol=^nodo;
	nodo = record
		elem: integer;
		hi:arbol;
		hd:arbol;
	end;
 // Lista de Arboles PARA IMPRIMIRPORNIVEL
  listaNivel = ^nodoN;
  nodoN = record
    info: arbol;
    sig: listaNivel;
  end;
 
{-------------------MODULOS PARA IMPRIMIRPORNIVEL------------------------------}

// CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l

function ContarElementos (l: listaNivel): integer;
  var c: integer;
begin
 c:= 0;
 While (l <> nil) do begin
   c:= c+1;
   l:= l^.sig;
 End;
 contarElementos := c;
end;

//  AGREGARATRAS - Agrega un elemento atr�s en l

Procedure AgregarAtras (var l, ult: listaNivel; a:arbol);
var nue:listaNivel;
begin
	new (nue);
	nue^.info := a;
	nue^.sig := nil;
	if l= nil then 
		l:= nue
    else 
		ult^.sig:= nue;
	ult:= nue;
end;


// IMPRIMIRPORNIVEL - Muestra los datos del �rbol a por niveles

Procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    cant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to cant do begin
                      write (l^.info^.elem, ' - ');
                      if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                      if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                      aux:= l;
                      l:= l^.sig;
                      dispose (aux);
                     end;
                     writeln;
                 end;
               end;
end;

procedure Insertar(var a: arbol; dato: integer);
begin
 if (a = nil) then begin
	new(a);
	a^.elem:= dato;
	a^.HI:= nil;
	a^.HD:= nil;
 end
 else
	if (a^.elem > dato) then
		Insertar(a^.HI, dato)
 else
	if (a^.elem < dato) then
		Insertar (a^.HD, dato);
end;

procedure crearABB(var a:arbol);
var x:integer;
begin
	writeln('Ingrese un numero: ');readln(x);
	while (x<>0) do begin
		Insertar(a,x);writeln('Ingrese un numero: ');readln(x);
	end;
end;

procedure enorden(a:arbol);
begin
	if (a <> nil) then begin
		enorden (a^.HI);
		writeln(a^.elem);
		enorden (a^.HD);
	end;
end;

procedure preorden(a:arbol);
begin
	if (a <> nil) then begin
		writeln(a^.elem);
		preorden(a^.HI);
		preorden(a^.HD);
	end;
end;

procedure postorden(a:arbol);
begin
	if (a <> nil) then begin
		postorden(a^.HI);
		postorden(a^.HD);
		writeln(a^.elem);
	end;
end;

function Buscar (a:arbol; dato: integer):arbol;
begin
	if (a=nil) then
		Buscar:=nil
	else
		if (dato= a^.elem) then Buscar:=a
		else
			if (dato < a^.elem) then
				Buscar:=Buscar(a^.HI ,dato)
			else
				Buscar:=Buscar(a^.HD ,dato);
end;

procedure VerMin(a:arbol; var min:integer);
begin
	if (a<>nil) then begin
		min:=a^.elem;
		VerMin(a^.hi,min);
	end;
end;

procedure VerMax(a:arbol;var max:integer);
begin
	if (a<>nil) then begin
		max:=a^.elem;
		VerMax(a^.hd,max);
	end;
end;

var a:arbol;
	busc,min,max:integer;
begin
	Randomize;
	crearABB(a);
	imprimirpornivel(a);
	writeln('Impresion en orden: ');enorden(a);
	writeln('Impresion pre orden: ');preorden(a);
	writeln('Impresion post orden: ');postorden(a);
	writeln('Ingrese un valor a buscar en el arbol: ');readln(busc);
	if (Buscar(a,busc)<>nil) then
		writeln('El valor se encontraba en el arbol.')
	else
		writeln('El valor no se encontraba en el arbol.');
	VerMin(a,min);VerMax(a,max);
	writeln('El valor minimo del arbol es: ',min);
	writeln('El valor maximo del arbol es: ',max);
end.
