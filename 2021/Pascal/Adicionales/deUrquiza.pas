program deUrquiza;
type
	mes=1..31;
	entradas=record
		CUIT:integer;
		codigoobra:integer;
		asiento:integer;
		monto:real;
	end;
	lista=^nodo;
	nodo=record
		elem:entradas;
		sig:lista;
	end;
	nuevae=record
		montototal:real;
		codigo:integer;
	end;
	lista2=^nodo2;
	nodo2=record
		elem:nuevae;
		sig:lista2;
	end;
	ventradas=array[mes] of lista;

procedure cargarvector(var v:ventradas);
begin	end; //SE DISPONE

procedure insertarordenado(var l:lista2; e:nuevae);
var
	nuevo,actual,anterior:lista2;
begin
	new(nuevo);nuevo^.elem:=e;anterior:=l;actual:=l;
	while ((actual<>nil) and (actual^.elem.montototal<e.montototal)) do begin
		anterior:=actual;actual:=actual^.sig;
	end;
	if (anterior=actual) then l:=nuevo
	else
		anterior^.sig:=nuevo;
	nuevo^.sig:=actual;
end;

procedure minimo(var v:ventradas;var e:entradas);
var
	c,i:integer;
begin
	c:=0;e.codigoobra:=9999;
	for i:=1 to 31 do begin
		if ((v[i]<>nil) and (v[i]^.elem.codigoobra<e.codigoobra)) then begin
			c:=i;e.codigoobra:=v[i]^.elem.codigoobra;
		end;
	end;
	if (c<>0) then begin
		e:=v[c]^.elem;v[c]:=v[c]^.sig;
	end;
end;

procedure merge(v:ventradas;var l:lista2);
var
	min:entradas;
	e:nuevae;
begin
	l:=nil;
	minimo(v,min);
	while (min.codigoobra<>9999) do begin
		e.montototal:=0;e.codigo:=min.codigoobra;
		while ((min.codigoobra<>9999) and (e.codigo=min.codigoobra)) do begin
			e.montototal:= e.montototal + min.monto;
			minimo(v,min);
		end;
		insertarordenado(l,e);
	end;
end;

procedure informarmonto(l:lista2;monto:real);
begin
	while (l<>nil) do begin
		if (monto<l^.elem.montototal) then begin
			writeln('La obra con codigo ', l^.elem.codigo, ' tuvo una mayor recaduacion que el monto ingresado.');
		end;
		l:=l^.sig;
	end;
end;

var
	v:ventradas;
	nueva:lista2;
	montobuscar:real;
begin
	cargarvector(v); //SE DISPONE
	merge(v,nueva); //INCISO A
	//INCISO B
	writeln('Ingrese el monto para informar los codigos de las obras que tuvieron mayor recaudacion: ');
	readln(montobuscar);
	informarmonto(nueva,montobuscar);
end.
