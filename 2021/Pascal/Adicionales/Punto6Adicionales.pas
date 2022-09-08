program Punto6Adicionales;
type
	subrango=1..20;
	compra=record
		codigocliente:integer;
		dni:real;
		fecha:String;
		monto:real;
	end;
	lista=^nodo;
	nodo=record
		elem:compra;
		sig:lista;
	end;
	puestosventa=array [subrango] of lista;
	cliente=record
		codigo:integer;
		montomayor:real;
	end;
	arbol=^nodo2;
	nodo2=record
		elem:cliente;
		hi:arbol;
		hd:arbol;
	end;
procedure Compras(var v:puestosventa); //SE DISPONE
begin end;

procedure minimo(var v:puestosventa;var min:compra);
var 
	i:subrango;camb:integer;
begin
	i:=1;min.codigocliente:=32767;camb:=0;
	for i:=1 to 20 do begin
		if (v[i]<>nil) and (v[i]^.elem.codigocliente<min.codigocliente) then begin
			camb:=i;min.codigocliente:=v[i]^.elem.codigocliente;
		end;
	end;
	if (camb<>0) then begin
		min:=v[camb]^.elem;v[camb]:=v[camb]^.sig;
	end;
end;

procedure insertarordenado(var a:arbol;c:cliente);
begin
	if (a=nil) then begin
		new(a);a^.elem:=c;a^.hi:=nil;a^.hd:=nil;
	end
	else begin
		if (a^.elem.codigo>c.codigo) then insertarordenado(a^.hi,c)
		else insertarordenado(a^.hd,c);
	end;
end;

procedure maximo(var m:real;monto:real);
begin
	if (monto>m) then
		m:=monto;
end;

procedure merge(var a:arbol;v: puestosventa);
var
	c:cliente;
	min:compra;
begin
	a:=nil;
	minimo(v,min);
	while (min.codigocliente<>32767) do begin
		c.codigo:=min.codigocliente;c.montomayor:=-1;
		while ((min.codigocliente<>32767) and (c.codigo=min.codigocliente)) do begin
			maximo(c.montomayor,min.monto);minimo(v,min);
		end;
		insertarordenado(a,c);
	end;
end;

function mayormonto(a:arbol;codigocliente:integer):real;
begin
	if (a=nil) then mayormonto:=-1
	else
		if (a^.elem.codigo=codigocliente) then begin
			mayormonto:=a^.elem.montomayor;
		end
	else
		if (a^.elem.codigo>codigocliente) then mayormonto:=mayormonto(a^.hi,codigocliente)
		else mayormonto:=mayormonto(a^.hd,codigocliente);
end;
var
	a:arbol;v:puestosventa;
	buscado:integer;
begin
	Compras(v);// SE DISPONE
	merge(a,v);
	writeln('Ingrese el codigo de cliente para buscar su mayor monto: ');readln(buscado);
	writeln('El mayor monto del codigo de cliente ', buscado, ' es: ',mayormonto(a,buscado):2:2);
end.
