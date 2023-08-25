{
Ejercicio 3. Una perfumería dispone en papel de la información de las ventas de sus productos. De
cada venta conoce: código de producto, tipo de producto, fecha, cantidad de unidades vendida y
monto.
Se pide realizar un programa que:
a) A partir de la información de ventas ingresadas por teclado, genere un ABB que almacene para
cada código de producto: su tipo, la cantidad total de unidades vendidas y el monto total vendido
(entre todas las ventas realizadas). El ABB debe ordenarse por código de producto. El ingreso de
información finaliza cuando se lee cantidad vendida 0.
b) Luego de generado el ABB, informar (implementar un módulo para cada inciso):
i - El tipo de los productos cuyo código está comprendido entre los valores 1500 y 2200.
ii – La cantidad de productos con monto total vendido comprendido entre 10000 y 50000.
}
program RepasoPunto3;
type
    venta=record
        codigo:integer;
        tipo:integer;
        fecha:integer;
        cant:integer;
        monto:real;
    end;
    lista=^nodo;
    nodo=record
        elem:venta;
        sig:lista;
    end;
    venta2=record
        codigo:integer;
        tipo:integer;
        cantTotal:integer;
        montoTotal:real;
    end;
    arbol=^nodo2;
    nodo2=record
        elem:venta2;
        hi:arbol;
        hd:arbol;
    end;
    
procedure leerVenta(var v:venta);
begin
	v.cant:=random(10);
    if(v.cant<>0) then begin
		v.codigo:=Random(25);
		v.tipo:=random(10)+1;
        v.fecha:=random(31)+1;
        v.monto:=random*50;
    end;
end;
    
procedure insertarOrdenado(var l:lista; v:venta);
var ant,nue,act:lista;
begin
	new(nue);
    nue^.elem:=v;
    ant:=l;
    act:=l;
    while(act<>nil) and(act^.elem.codigo<v.codigo)do begin
		ant:=act;
        act:=act^.sig;
    end;
    if(act=l)then
		l:=nue
    else
		ant^.sig:=nue;
    nue^.sig:=act;
end;
    
procedure cargarLista(var l:lista);
var
	v:venta;
begin
	leerVenta(v);
    while(v.cant<>0)do begin
		insertarOrdenado(l,v);
        leerVenta(v);
    end;    
end;

procedure imprimirLista(l:lista);
begin
	if(l<>nil)then begin
		writeln('Codigo: ',l^.elem.Codigo,' Tipo: ',l^.elem.Tipo, ' Fecha: ',l^.elem.fecha, ' Cantidad: ',l^.elem.Cant, ' Monto: ', l^.elem.Monto:0:2);
		imprimirLista(l^.sig);
    end;
end;
    
procedure InsertarArbolOrdenado(var a:arbol; v:venta2);
begin
	if (a=nil) then begin
		new(a);
		a^.elem:=v;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else
		if (a^.elem.codigo<v.codigo) then
			InsertarArbolOrdenado(a^.hd,v)
	else
		if (a^.elem.codigo>v.codigo) then
			InsertarArbolOrdenado(a^.hi,v);
end;

procedure juntarDatos(var a:arbol;l:lista);
var
	actual:venta2;
begin
	while (l<>nil) do begin
		actual.codigo:=l^.elem.codigo;
		actual.montototal:=0;actual.canttotal:=0;
		actual.tipo:=l^.elem.tipo;
		while (l<>nil) and (l^.elem.codigo=actual.codigo) do begin
			actual.montototal:= actual.montototal + l^.elem.monto;
			actual.canttotal:= actual.canttotal + l^.elem.cant;
			l:=l^.sig;
		end;
		InsertarArbolOrdenado(a,actual);
	end;
end;

procedure orden(a:arbol);
begin
	if (a<>nil) then begin
		orden(a^.hi);
		writeln('Codigo: ',a^.elem.Codigo,' Tipo: ',a^.elem.Tipo,' Cantidad total: ',a^.elem.Canttotal, ' Monto total: ', a^.elem.Montototal:0:2);
		orden(a^.hd);
	end;
end;

procedure entre2Valores(a:arbol;num1,num2:integer);
begin
	if (a<>nil) then begin
		if (a^.elem.codigo>=num1) then begin
			if (a^.elem.codigo<=num2) then begin
				writeln('El tipo ',a^.elem.tipo, ' tiene el codigo ',a^.elem.codigo,' que se encuentra comprendido entre 15 y 22');
				entre2Valores(a^.hd,num1,num2);
			end
			else entre2Valores(a^.hi,num1,num2);
		end
		else entre2Valores(a^.hd,num1,num2);
	end;
end;

procedure cantidadentre2Valores(a:arbol;num1,num2:integer;var cant:integer);
begin
	if (a<>nil) then begin
		cantidadentre2Valores(a^.hi,num1,num2,cant);
		if ((a^.elem.montototal>=num1) and (a^.elem.montototal<=num2)) then begin
				cant:=cant+1;
				end;
		cantidadentre2Valores(a^.hd,num1,num2,cant);
	end;
end;

var
    a:arbol;
    l:lista;
    cant:integer;
begin
	Randomize;cant:=0;
	l:=nil;a:=nil;
	cargarLista(l);
	imprimirLista(l);
	juntarDatos(a,l);
	writeln('IMPRESION DEL ARBOL: ');
	orden(a);
	writeln('CODIGO COMPRENDIDO: ');
	entre2Valores(a,15,22);
	writeln('MONTOS ENTRE 2 VALORES:');
	cantidadentre2Valores(a,10,50,cant);
	writeln('La cantidad de elementos que tienen montos entre los valores 10 y 50 es de: ',cant);
end.


