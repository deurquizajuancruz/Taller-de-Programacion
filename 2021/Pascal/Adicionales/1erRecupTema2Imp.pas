program Tema2Imp;
type 
	producto = record
		cod: integer;
		cant: integer;
	end;
	
	lProductos = ^nodoProd;
	nodoProd = record
		dato: producto;
		sig: lProductos;
	end;
	
	pedido = record
		cod: integer;
		dni: integer;
		productos: lProductos;
	end;
	
	lPedidos = ^nodoPed;
	nodoPed = record
		dato: pedido;
		sig: lPedidos;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: producto;
		hi: arbol;
		hd: arbol;
	end;
	
	lCodigos = ^nodoCod;
	nodoCod = record
		cod: integer;
		sig: lCodigos;
	end;

procedure cargarLista(var l:lPedidos);
begin
end;

procedure cargarArbol(var a:arbol);
begin
end;

procedure actualizarStock(var a:arbol; p:producto);
begin
	if(a = nil)then begin
		new(a);
		a^.dato.cant:= 0;
		a^.dato.cod:= p.cod;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else
		if (a^.dato.cod = p.cod) then 
			a^.dato.cant:= a^.dato.cant - p.cant 
		else 
			if (p.cod < a^.dato.cod) then
				actualizarStock(a^.hi, p)
			else
				actualizarStock(a^.hd, p);
end;

procedure recorrerPedidos(l:lPedidos; var a:arbol);
var
	lProd:lProductos;
begin
	if (l <> nil) then begin
		lProd:= l^.dato.productos;
		while (lProd <> nil) do begin
			actualizarStock(a, lProd^.dato);
			lProd:= lProd^.sig;
		end;
		recorrerPedidos(l^.sig, a);
	end;
end;

procedure insertarAdelante(var lCod:lCodigos; cod:integer);
var
	nue: lCodigos;
begin
	new(nue);
	nue^.cod:= cod;
	nue^.sig:= lCod;
	lCod:= nue;
end;

procedure buscarCodigos(a:arbol; cod1, cod2:integer; var lCod:lCodigos);
begin
	if (a <> nil) then
		if (a^.dato.cod >= cod1) then begin 
			if (a^.dato.cod <= cod2) then begin 
				if (a^.dato.cant = 0) then
					insertarAdelante(lCod, a^.dato.cod);
				buscarCodigos(a^.hi, cod1, cod2, lCod);
				buscarCodigos(a^.hd, cod1, cod2, lCod);
			end
			else
				buscarCodigos(a^.hi, cod1, cod2, lCod);
		end
		else
			buscarCodigos(a^.hd, cod1, cod2, lCod);
end;

var
	a: arbol;
	l: lPedidos;
	lCod: lCodigos;
	cod1, cod2: integer;
begin
	cargarLista(l); //se dispone
	cargarArbol(a); //se dispone
	
	recorrerPedidos(l, a);
	
	readln(cod1);
	readln(cod2);
	lCod:= nil;
	buscarCodigos(a, cod1, cod2, lCod);
end.
