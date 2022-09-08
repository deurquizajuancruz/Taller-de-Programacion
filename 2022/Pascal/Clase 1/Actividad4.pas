{Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone
en papel de información de todos los dispositivos que poseen sus juegos instalados.
De cada dispositivo se conoce la versión de Android instalada, el tamaño de la
pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB).
Realizar un programa que:
a.Lea cada dispositivo y lo guarde en una lista ordenada por versión de Android. La
lectura finaliza con tamaño de la pantalla en 0.
b.Procese la lista para informar:
• La cantidad de dispositivos para cada versión de Android
• La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo
sumo a 5 pulgadas
• El tamaño promedio de las pantallas de todos los dispositivos.
}
program EmpresaTelefonos;
type
	dispositivo = record
		version:integer;
		tamanio:integer; (*tendria que ser real, se puso integer para facilitar el randomize*)
		RAM:integer;
	end;
	vector=array[1..5] of integer; (* no se sabe la cantidad de versiones entonces se eligio un valor random*)
	lista=^nodo;
	nodo=record
		elem:dispositivo;
		sig:lista;
	end;

procedure leerdispositivo (var d:dispositivo);
begin
	d.RAM:=random(50)+1; (*writeln('Ingrese la cantidad de memoria RAM: ');readln(d.RAM);*)
	d.tamanio:=random(10); (*writeln('Ingrese la cantidad de pulgadas: ');readln(d.tamanio);*)
	d.version:=random(5)+1; (*writeln('Ingrese la version: ');readln(d.version);*)
end;

procedure insertarOrdenado (var l:lista;d:dispositivo);
var ant,nue,act:lista;
begin
	new(nue);
	nue^.elem:=d;
	act:=l;ant:=l;
	while (act<>nil) and (act^.elem.version<d.version) do begin
		ant:=act;act:=act^.sig;
	end;
	if (act=l) then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure crearLista(var l:lista);
var d:dispositivo;
begin
	leerdispositivo(d);
	while (d.tamanio<>0) do begin
		insertarOrdenado(l,d);leerdispositivo(d);
	end;
end;

procedure procesarLista (l:lista;var v:vector);
var 
	versionact,requisitos,total,i:integer;
	totalpulgadas,promedio:real;
begin
	total:=0;promedio:=0;requisitos:=0;totalpulgadas:=0;
	while (l<>nil) do begin
		versionact:=l^.elem.version;
		while (l<>nil) and (versionact=l^.elem.version) do begin
			v[versionact]:=v[versionact]+1;
			if (l^.elem.RAM>3) and (l^.elem.tamanio<=5) then
				requisitos:=requisitos+1;
			total:=total+1;totalpulgadas:=totalpulgadas +l^.elem.tamanio;
			l:=l^.sig;
		end;
	end;
	promedio:=(totalpulgadas/total);
	writeln('El tamanio promedio de los dispositivos es: ',promedio:0:2);
	writeln('La cantidad de dispositivos con mas de 3GB de memoria y a lo sumo 5 pulgadas es: ',requisitos);
	for i:=1 to 5 do begin
		writeln('La cantidad de dispositivos Android con la version ',i,' es de: ',v[i]);
	end;
end;

procedure imprimir(l:lista);
begin
	while (l<>nil) do begin
		writeln('Version: ', l^.elem.version, ' RAM: ',l^.elem.RAM, ' Pulgadas: ', l^.elem.tamanio);
		l:=l^.sig;
	end;
end;

var
	v:vector;l:lista;
begin
	Randomize;
	crearLista(l);imprimir(l);
	procesarLista(l,v);
end.
