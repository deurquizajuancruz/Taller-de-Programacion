{IMPORTANTE : Cree un programa en Pascal. Utilice su apellido como nombre del
programa. Entrega : envie por correo el archivo .pas realizado con su apellido.
El Gobierno de la Provincia de Buenos Aires necesita un sistema para organizar la
distribución de dosis de vacunas contra el COVID - 19 en cada ciudad De cada entrega de
dosis realizada se conoce : tipo de vacuna ( 1:Pfizer , 2 Moderna 3:AstraZeneca , 4 Sputnik ),
cantidad de dosis fecha y nombre de ciudad donde se realizó la entrega .
Se dispone una estructura que almacena las entregas agrupadas por tipo de vacuna Para
cada tipo las entregas realizadas se encuentran ordenadas por nombre de ciudad
Implemente un programa que
a) Reciba la estructura que almacena las entregas y, usando la técnica de merge
acumulador , genere un ABB ( ordenado por cantidad de dosis ) que contenga para
cada ciudad de destino , la cantidad total de dosis entregadas .
b) Implementar un módulo recursivo que reciba la estructura generada en a ) y retorne
la cantidad de ciudades cuya cantidad de dosis entregadas es menor a un valor que
se recibe como parámetro .
NOTA : Para cada ciudad se puede haber realizado más de una entrega .
No es necesario implementar la carga de la estructura que se dispone . Alcanza con declarar
el encabezado del procedimiento e invocarlo para que el programa compile
satisfactoriamente .
}
program Punto8Adicionales;
type
	vacunas=1..4;
	entrega=record
		vacunas:vacunas;
		cantidad:integer;
		fecha:String;
		ciudad:String;
	end;
	lista=^nodo;
	nodo=record
		elem:entrega;
		sig:lista;
	end;
	ventregas=array[vacunas] of lista;
	infociudad=record
		nombre:String;
		totaldosis:integer;
	end;
	arbol=^nodo2;
	nodo2=record
		elem:infociudad;
		hi:arbol;
		hd:arbol;
	end;

procedure inicializarvector(var v:ventregas);
var i:vacunas;
begin
	for i:=1 to 4 do begin
		v[i]:=nil;
	end;
end;

procedure leerentrega (var e:entrega);
begin
	writeln('Ingrese el tipo de vacuna( 1 Pfizer, 2 Moderna, 3 AstraZeneca, 4 Sputnik ): ');readln(e.vacunas);
	writeln('Ingrese la cantidad de vacunas de la entrega: ');readln(e.cantidad);
	if (e.cantidad<>-1) then begin
		writeln('Ingrese la fecha de la entrega: ');readln(e.fecha);
		writeln('Ingrese la ciudad de la entrega: ');readln(e.ciudad);
	end;
end;

procedure insertarO(var l:lista;e:entrega);
var ant,nuevo,act:lista;
begin
	new(nuevo);nuevo^.elem:=e;ant:=l;act:=l;
	while ((act<>nil) and (act^.elem.ciudad<e.ciudad)) do begin
		ant:=act;act:=act^.sig;
	end;
	if (ant=act) then
		l:=nuevo
	else
		ant^.sig:=nuevo;
	nuevo^.sig:=act;
end;


procedure cargarvector(var v:ventregas);
var e:entrega;
begin 
	leerentrega(e);
	while (e.cantidad<>-1) do begin
		insertarO(v[e.vacunas],e);leerentrega(e);
	end;
end;

procedure minimo(var v:ventregas;var min:entrega);
var c:integer;i:vacunas;
begin
	c:=0;min.ciudad:='ZZZ';
	for i:=1 to 4 do begin
		if ((v[i]<>nil) and (v[i]^.elem.ciudad<min.ciudad)) then begin
			c:=i;min.ciudad:=v[i]^.elem.ciudad;
		end;
	end;
	if (c<>0) then begin
		min:=v[c]^.elem;v[c]:=v[c]^.sig;
	end;
end;

procedure insertar(var a:arbol;i:infociudad);
begin
	if (a=nil) then begin
		new(a);a^.elem:=i;a^.hi:=nil;a^.hd:=nil;
	end
	else
		if (a^.elem.totaldosis>i.totaldosis) then insertar(a^.hi,i)
		else insertar(a^.hd,i);
end;

procedure merge(var a:arbol;v:ventregas);
var min:entrega;info:infociudad;
begin
	a:=nil;
	minimo(v,min);
	while (min.ciudad<>'ZZZ') do begin
		info.totaldosis:=0;info.nombre:=min.ciudad;
		while ((min.ciudad<>'ZZZ') and (info.nombre=min.ciudad)) do begin
			info.totaldosis:=info.totaldosis + min.cantidad;minimo(v,min);
		end;
		insertar(a,info);
	end;
end;

procedure imprimir(a:arbol);
begin
	if (a<>nil) then begin
		imprimir(a^.hi);
		writeln('Nombre de la ciudad: ',a^.elem.nombre, ' Cantidad total de dosis: ',a^.elem.totaldosis);
		imprimir(a^.hd);
	end;
end;

procedure menordosis(a:arbol;valor:integer;var cantidad:integer);
begin
	if (a<>nil) then begin
		menordosis(a^.hi,valor,cantidad);
		if (a^.elem.totaldosis<valor) then cantidad:=cantidad +1;
		menordosis(a^.hd,valor,cantidad);
	end;
end;

var v:ventregas;a:arbol;valor,cantidad:integer;
begin
	inicializarvector(v);cargarvector(v);merge(a,v);imprimir(a);cantidad:=0;
	writeln('Ingrese una cantidad para saber la cantidad de ciudades que tienen menos dosis: ');readln(valor);menordosis(a,valor,cantidad);
	writeln('La cantidad de ciudades que tienen menos dosis que ese valor es de: ',cantidad);
end.
