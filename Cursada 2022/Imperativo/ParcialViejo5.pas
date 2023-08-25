{
El Gobierno de la Provincia de Buenos Aires necesita un sistema para organizar la distribución de dosis de vacunas contra el COVID‑19 en cada ciudad. 
De cada entrega de dosis realizada se conoce: tipo de vacuna (1:Pfizer, 2:Moderna, 3:AstraZeneca, 4:Sputnik), cantidad de dosis, fecha y nombre de ciudad donde se realizó la entrega. 
Se dispone una estructura que almacena las entregas agrupadas por tipo de vacuna. Para cada tipo, las entregas realizadas se encuentran ordenadas por nombre de ciudad.
Implemente un programa que: 
Reciba la estructura que almacena las entregas y, usando la técnica de merge acumulador, genere un ABB (ordenado por cantidad de dosis) que contenga para cada ciudad de destino, la cantidad total de dosis entregadas. 
Implementar un módulo recursivo que reciba la estructura generada en a) y retorne la cantidad de ciudades cuya cantidad de dosis entregadas sea menor a un valor que se recibe como parámetro.
NOTA: Para cada ciudad se puede haber realizado más de una entrega. 
No es necesario implementar la carga de la estructura que se dispone. Alcanza con declarar el encabezado del procedimiento e invocarlo para que el programa compile satisfactoriamente.
}
program ParcialViejo5;
type
	vacunas=1..4;
	entrega=record
		tipovacuna:vacunas;
		cantidad:integer;
		fecha:integer;
		ciudad:String;	
	end;
	lista=^nodo;
	nodo=record
		elem:entrega;
		sig:lista;
	end;
	vvacunas=array[vacunas] of lista;
	elemarbol=record
		ciudad:String;
		canttotal:integer;
	end;
	arbol=^nodo2;
	nodo2=record
		elem:elemarbol;
		hi:arbol;
		hd:arbol;
	end;
	
procedure inicializarvector(var v:vvacunas);
var
	i:vacunas;
begin
	for i:=1 to 4 do begin
		v[i]:=nil;
	end;
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

procedure leerentrega(var e:entrega);	
begin
	e.cantidad:=Random(50);
	if (e.cantidad<>0) then begin
		e.tipovacuna:=Random(4)+1;
		e.fecha:=Random(31)+1;
		randomString(1,e.ciudad);
	end;
end;

procedure insertarenlista(var l:lista;e:entrega);
var ant,nue,act:lista;
begin
	new(nue);
	nue^.elem:=e;
	act:=l;
	ant:=l;
	while (act<>nil) and (act^.elem.ciudad<e.ciudad)do begin
		ant:=act;
		act:=act^.sig;
	end;
	if (act=l) then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure cargarVector(var v:vvacunas);
var e:entrega;
begin
	leerentrega(e);
	while (e.cantidad<>0) do begin
		insertarenlista(v[e.tipovacuna],e);
		leerentrega(e);
	end;
end;

procedure imprimirLista(l:lista);
begin
	while (l<>nil) do begin
		writeln('Ciudad: ',l^.elem.ciudad, ' Cantidad de vacunas: ',l^.elem.cantidad, ' Fecha: ',l^.elem.fecha);
		l:=l^.sig;
	end;
end;

procedure imprimirVector(v:vvacunas);
var
	i:vacunas;
begin
	for i:=1 to 4 do begin
		writeln('Informacion de la vacuna numero ',i);
		imprimirLista(v[i]);
	end;
end;

procedure buscarminimo(var min:entrega;var v:vvacunas);
var
	pos,i:vacunas;
begin
	min.ciudad:='zzzz';
	for i:=1 to 4 do begin
		if (v[i]<>nil) then begin
			if (v[i]^.elem.ciudad<min.ciudad) then begin
				min:=v[i]^.elem;
				pos:=i;
			end;
		end;
	end;
	if (min.ciudad<>'zzzz') then
		v[pos]:=v[pos]^.sig;
end;

procedure InsertarArbolOrdenado(var a:arbol; unaciudad:elemarbol);
begin
	if (a=nil) then begin
		new(a);
		a^.elem:=unaciudad;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else
		if (a^.elem.canttotal<unaciudad.canttotal) then
			InsertarArbolOrdenado(a^.hd,unaciudad)
	else
		if (a^.elem.canttotal>unaciudad.canttotal) then
			InsertarArbolOrdenado(a^.hi,unaciudad);
end;

procedure merge(v:vvacunas;var a:arbol);
var
	min:entrega;
	actual:elemarbol;
begin
	buscarminimo(min,v);
	while (min.ciudad<>'zzzz') do begin
		actual.ciudad:=min.ciudad;
		actual.canttotal:=0;
		while (min.ciudad=actual.ciudad) do begin
			actual.canttotal:= actual.canttotal + min.cantidad;
			buscarminimo(min,v);
		end;
		InsertarArbolOrdenado(a,actual);
	end;
end;

procedure imprimirenorden(a:arbol);
begin
	if (a<>nil) then begin
		imprimirenorden(a^.hi);
		writeln('Cantidad total de dosis de esa ciudad: ',a^.elem.canttotal,' Ciudad: ',a^.elem.ciudad);
		imprimirenorden(a^.hd);
		end;
end;

procedure menorcantidad(a:arbol;dosis:integer;var cantidad:integer);
begin
	if (a<>nil) then begin
		if (a^.elem.canttotal<dosis) then begin
			cantidad:=cantidad + 1;
			menorcantidad(a^.hd,dosis,cantidad);
		end;
		menorcantidad(a^.hi,dosis,cantidad);
	end;
end;

var
	v:vvacunas;
	cantidad,dosis:integer;
	a:arbol;
BEGIN
	Randomize;
	inicializarvector(v);a:=nil;cantidad:=0;
	cargarVector(v);
	writeln('VACUNAS: 1:Pfizer, 2:Moderna, 3:AstraZeneca, 4:Sputnik');
	imprimirvector(v);
	merge(v,a);
	writeln('ARBOL ORDENADO POR CANTIDAD DE DOSIS: ');
	imprimirenorden(a);
	dosis:=100;
	menorcantidad(a,dosis,cantidad);
	writeln('La cantidad de ciudades con dosis entregadas menores a ',dosis, ' es de ',cantidad);
END.
