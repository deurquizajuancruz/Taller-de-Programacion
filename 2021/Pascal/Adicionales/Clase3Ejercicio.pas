program Clase3Ejercicio;
type
	gasto=record
	monto:real;
	rubro:string;
	end;
	lista=^nodo;
	nodo=record
	elem:gasto;
	sig:lista;
	end;
	familia=record
	nombre:string;
	listado:lista;
	end;
	vfamilias=array [1..4] of familia;
procedure family(var v:vfamilias);
var
	i:integer;
begin
	i:=1;
	writeln('Ingrese el nombre del primer integrante de la familia: ');readln(v[i].nombre);
	writeln('Ingrese el nombre del segundo integrante de la familia: ');readln(v[i+1].nombre);
	writeln('Ingrese el nombre del tercer integrante de la familia: ');readln(v[i+2].nombre);
	writeln('Ingrese el nombre del cuarto integrante de la familia: ');readln(v[i+3].nombre);
end;
procedure agregaratras(var l:lista;g:gasto);
var nuevo,aux:lista;
begin
	new(nuevo);nuevo^.elem:=g;nuevo^.sig:=nil;
	if (l=nil) then l:=nuevo
	else begin
	aux:=l;
	while (aux^.sig<>nil) do begin
		aux:=aux^.sig;
		end;
	aux^.sig:=nuevo;
	end;
end;
procedure leergasto(var g:gasto);
begin
	writeln('Monto del gasto: ');readln(g.monto);
	writeln('Rubro del gasto: ');readln(g.rubro);
end;
procedure insertarordenado(var l:lista;g:gasto);
var
	ant,act,nue:lista;
begin
	new(nue);nue^.elem:=g;nue^.sig:=nil;
	if (l=nil) then l:=nue
	else begin
	act:=l;ant:=l;
	while (act<>nil) and (act^.elem.rubro<g.rubro) do begin
		ant:=act;act:=act^.sig;
		end;
	if (ant=act) then l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
	end;
end;
procedure armarlista(var l:lista);
var
	g:gasto;
begin
	leergasto(g);
	insertarordenado(l,g);
end;
procedure leernombre(var v:vfamilias);
var
	n:string;i:integer;
begin
	i:=1;
	writeln('Ingrese el nombre del duenio del listado: ');readln(n);
	while (n<>'zzz') do begin
		if (n=v[i].nombre) then armarlista(v[i].listado);
		if (n=v[i+1].nombre) then armarlista(v[i+1].listado);
		if (n=v[i+2].nombre) then armarlista(v[i+2].listado);
		if (n=v[1+3].nombre) then armarlista(v[i+3].listado);
		if (n<>v[i].nombre) and (n<>v[i+1].nombre) and (n<>v[i+2].nombre) and (n<>v[i+3].nombre) then writeln('Esa persona no es integrante de la familia.');
	writeln('Ingrese el nombre del duenio del listado: ');readln(n);
	end;
end;
procedure imprimirlista(l:lista);
begin
	while (l<>nil) do begin
		writeln('El rubro del gasto es: ',l^.elem.rubro);
		writeln('El monto del gasto es: $',l^.elem.monto:2:2);
		l:=l^.sig;
		end;
end;
procedure todaslistas(v:vfamilias);
var i:integer;
begin
	i:=1;
	writeln('Lista de ',v[i].nombre);imprimirlista(v[i].listado);
	writeln('Lista de ',v[i+1].nombre);imprimirlista(v[i+1].listado);
	writeln('Lista de ',v[i+2].nombre);imprimirlista(v[i+2].listado);
	writeln('Lista de ',v[1+3].nombre);imprimirlista(v[i+3].listado);
end;
procedure minimo(var v:vfamilias;var min:string);
var indicemin,i:integer;
begin
	min:='zzz';indicemin:=-1;
	for i:=1 to 4 do
		if (v[i].listado<>nil) then
			if (v[i].listado^.elem.rubro<=min) then begin
				indicemin:=i;min:=v[i].listado^.elem.rubro;
				end;
	if (indicemin<>-1) then begin
	min:=v[i].listado^.elem.rubro;v[indicemin].listado:=v[indicemin].listado^.sig;
	end;
end;
procedure merge(v:vfamilias;var l:lista);
var min:string;i:integer;
begin
	l:=nil;i:=1;minimo(v,min);
	while (min<>'ZZZ') do begin
	agregaratras(l,v[i].listado^.elem);minimo(v,min);i:=i+1;
	end;
end;
var
	v:vfamilias;nueva:lista;
begin
	family(v);
	leernombre(v);
	todaslistas(v);
	merge(v,nueva);
	imprimirlista(nueva);
end.
