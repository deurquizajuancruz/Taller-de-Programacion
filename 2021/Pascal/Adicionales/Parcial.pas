{Un delivery dispone de una lista de los entregas realizadas.
De cada entrega se tiene código de entrega, DNI del cliente y la lista de los menús pedidos (código de menú y cantidad).
Además se dispone de un árbol de menús. De cada menú se tiene código y stock. El árbol está ordenado por código de menú.
Implemente un programa con:
Un módulo recursivo que recorra la lista de entregas actualizando el stock de los menús. 
En el caso que el código de menú no exista, debe incorporarse al árbol con stock en cero.
Un módulo que reciba el árbol de menús y un código de menú y 
retorne una lista con los códigos de los menús con stock 1 para los códigos menores al código recibido. 
}
program Parciales
type
	entrega= record
		codigo:integer;
		dni:integer;
		menuspedidos:lista1;
	end;
	menus=record
		codigo:integer;
		cantidad:integer;
	end;
	lista1=^nodo;
	nodo=record
		elem:menus;
		sig:lista1;
	end;
	lista2=^nodo2;
	nodo2=record
		elem:entrega;sig:lista2;
	end;
	arbol=^nodo3;
	nodo3=record
		elem:menus;
		hi:arbol;hd:arbol;
	end;


procedure cargaryordenararbol(var a:arbol); //SE DISPONE
begin end;

procedure cargarlistaentregas(var l:lista2); //SE DISPONE
begin end;

procedure cargarlistamenu(var l:lista1); // SE DISPONE
begin end;

procedure agregararbol(var a:arbol, M:menu);
begin end;

function buscar(a:arbol;codigo:integer):arbol;
begin
	if (a=nil) then buscar:=nil
	else if (codigo<a^.elem.codigo) buscar:=a
	else if (codigo<a^.elem.codigo) then buscar:=buscar(a^.hi,codigo)
	else buscar:=buscar(a^.hd,codigo);
end;

procedure actualizarlista(l:lista2;var a:arbol);
var
	aux:arbol;m:menus;
begin
	if (l<>nil) then begin
		while (l^.elem.menuspedidos<>nil) do begin
			aux:=buscar(a,l^.elem.menuspedidos^.elem.codigo);
			if (aux<>nil) then
				aux^.elem.cantidad:=aux^.elem.cantidad-l^.elem.menuspedidos^.elem.cantidad
			else
				m.codigo:=l^.elem.menuspedidos^.elem.codidog; m.cantidad:=0;agregararbol(a,m);
		end;
	end;


end;

begin


end.
