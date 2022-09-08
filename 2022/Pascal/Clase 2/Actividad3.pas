{ACTIVIDAD 3: Implementar programaVECTORDELISTAS.pas para resolver el
siguiente problema:
Se cuenta con información de los empleados de una empresa. De cada empleado se
conoce su número de empleado, apellido_y_nombre, antigüedad en años y categoría (1..4).
El programa debe:
a. Leer los datos de empleados hasta que se ingresa el nro. de empleado 0 y guardarlos
ordenados alfabéticamente por apellido_y_nombre y agrupados por categoría.
b. Una vez guardados (implemente un módulo para cada inciso)
i. Para cada categoría, mostrar la información de todos sus empleados.
ii. Generar un vector que contenga, para cada categoría, el empleado más antiguo.
iii. Ordenar el vector por antigüedad (descendente) e informar su contenido.
NOTA: Reutilice los módulos implementados con anterioridad.}
program Clase2Actividad3;
type
	subcat=1..4;
	empleado = record
		numero:integer;
		AyN:String;
		antiguedad:integer;
		categoria:subcat;
	end;
	lista=^nodo;
	nodo=record
		elem:empleado;
		sig:lista;
	end;
	vector=array[subcat] of lista;
	vecant=array[subcat] of empleado;
	
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

procedure leerempleado(var e:empleado);
begin
	e.numero:=random(50);
	if (e.numero<>0) then begin
		randomString(1,e.ayn);
		e.antiguedad:=random(30)+1;
		e.categoria:=random(4)+1;
	end;
end;

procedure InsertarLista(var l:lista;e:empleado);
var ant,nue,act:lista;
begin
	new(nue);
	nue^.elem:=e;
	act:=l;
	ant:=l;
	while (act<>nil) and (act^.elem.ayn<e.ayn)do begin
		ant:=act;
		act:=act^.sig;
	end;
	if (act=l) then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure cargarVector(var v:vector);
var e:empleado;
begin
	leerempleado(e);
	while (e.numero<>0) do begin
		InsertarLista(v[e.categoria],e);
		leerempleado(e);
	end;
end;

procedure imprimirLista(l:lista);
begin
	while (l<>nil) do begin
		writeln('Numero del empleado: ',l^.elem.numero, ' Apellido y nombre: ', l^.elem.ayn, ' Antiguedad: ',l^.elem.antiguedad, ' Categoria: ', l^.elem.categoria);
		l:=l^.sig;
	end;
end;

procedure imprimirVector(v:vector);
var i:integer;
begin
	for i:=1 to 4 do begin
		imprimirLista(v[i]);
	end;
end;

procedure procesarLista(l:lista; var masantiguo:empleado);
var ant:integer;
begin
	ant:=l^.elem.antiguedad;
	while (l<>nil) do begin
		if (l^.elem.antiguedad>ant) then begin
			ant:=l^.elem.antiguedad;masantiguo:=l^.elem;
		end;
		l:=l^.sig;
	end;
end;

procedure nuevoVector(var va:vecant;v:vector);
var i:integer;
	e:empleado;
begin
	for i:=1 to 4 do begin
		procesarLista(v[i],e);
		va[i]:=e;
	end;
end;

procedure imprimirMasAntiguo(v:vecant);
var i:integer;
begin
	for i:=1 to 4 do begin
		writeln('El empleado con mas antiguedad es: ',v[i].ayn,' con numero ',v[i].numero,' antiguedad ',v[i].antiguedad,' y pertenece a la categoria ',v[i].categoria);
	end;
end;


procedure OrdenacionPorInsercion(var v:vecant);
var i,j:integer;actual:empleado;
begin
	for i:=1 to 4 do begin
		actual:=v[i];j:=i-1;
		while ((j>0) and (v[j].antiguedad<actual.antiguedad)) do begin
			v[j+1]:=v[j];j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;

var
	v:vector;
	va:vecant;
begin
	Randomize;
	cargarVector(v);
	imprimirVector(v);nuevoVector(va,v);OrdenacionPorInsercion(va);
	imprimirMasAntiguo(va);
end.
