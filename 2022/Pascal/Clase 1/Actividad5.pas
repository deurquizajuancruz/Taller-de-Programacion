program Clase1Actividad2;
type
	cadena=String[5];
	alumno=record
		codigo:integer;
		apellido:cadena;
		promedio:integer;
	end;
	
	lista=^nodo;
	nodo=record
		dato:alumno;
		sig:lista;
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

procedure leeralumno(var a:alumno);
begin
	a.codigo:=random(100);
	if (a.codigo<>0) then begin
		a.promedio:=random(10)+1;
		randomString(5,a.apellido);
	end;
end;

procedure insertarOrdenado(var l:lista;a:alumno);
var ant,nue,act:lista;
begin
	new(nue);
	nue^.dato:=a;
	act:=l;ant:=l;
	while (act<>nil) and (act^.dato.promedio>a.promedio) do begin
		ant:=act;act:=act^.sig;
	end;
	if (act=l) then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure crearLista(var l:lista);
var a:alumno;
begin
	leeralumno(a);
	while (a.codigo<>0) do begin
		insertarOrdenado(l,a);
		leeralumno(a);
	end;
end;

procedure procesar(l:lista);
var i:integer;
begin
	i:=0;
	while (l<>nil) and (i<10) do begin
		i:=i+1;
		writeln('El alumno numero ',i,' con apellido: ',l^.dato.apellido,' con codigo: ',l^.dato.codigo, ' tiene un promedio de: ',l^.dato.promedio,' y se lleva el premio.');
		l:=l^.sig;
	end;
end;

var
	l:lista;
begin
	Randomize;
	l:=nil;
	crearLista(l);
	procesar(l);
end.
