{
Una cadena de entrega de Comidas Rápidas necesita procesar su facturación para enviar un regalo de fin de año a sus mejores clientes. 
Entregará para el mes de Octubre un premio diario al cliente que hizo el pedido de mayor monto. 
Se dispone de una estructura que almacena los pedidos de Octubre agrupados por número de punto de envío (de 1 a 10).
Para cada punto de envío los pedidos se encuentran ordenados por dia del mes. 
Por cada pedido se conoce el dia, número de pedido, dni del cliente y monto 
Además se dispone de un vector desordenado con información personal de 3500 clientes. De cada creme se conoce el dni, dirección y teléfono 
Implemente un programa que 
a) Ordene, por dni, los elementos del vector de clientes que se dispone. Es necesario este ordenamiento para obtener información del diente en el siguiente inciso con mayor eficiencia 
b) Reciba la estructura con los pedidos y, usando la técnica de merge imprima en pantalla para cada dia del mes, el número de pedido ganador, dni y teléfono del cliente correspondiente. 
Por cada día, el pedido ganador es aquel con mayor monto. La búsqueda del cliente en el vector de información personal debe implementarse de forma recursiva. Si el cliente no está en el vector, se debe informar el día y 'Premio vacante. 
NOTA En cada punto de envío se pueden haber realizado más de un pedido en el mismo día    
}

program ParcialViejo1;
type
	pedido=record
		puntoenvio:integer;
		dia:integer;
		npedido:integer;
		dni:integer;
		monto:real;
	end;
	cliente=record
		dni:integer;
		direccion:String;
		telefono:integer;
	end;
	lista=^nodo;
	nodo=record
		elem:pedido;
		sig:lista;
	end;
	vpedidos=array[1..10] of lista; //del 1 al 10 son los puntos de envio. Cada punto de envio tiene una lista ordenada por dia del mes de pedidos
	vclientes=array[1..35] of cliente;

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

procedure leerpedido(var p:pedido);
begin
	p.dni:=Random(35);
	if (p.dni<>0) then begin
		p.dia:=Random(31)+1;
		p.npedido:=Random(20);
		p.monto:=Random * 10;
		p.puntoenvio:=Random(10)+1;
	end;
end;

procedure insertarOrdenado(var l:lista;p:pedido);
var ant,nue,act:lista;
begin
	new(nue);
	nue^.elem:=p;
	act:=l;
	ant:=l;
	while (act<>nil) and (act^.elem.dia<p.dia)do begin
		ant:=act;
		act:=act^.sig;
	end;
	if (act=l) then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure cargarVectorPedidos(var vp:vpedidos);
var p:pedido;
begin
	leerpedido(p);
	while (p.dni<>0) do begin
		insertarOrdenado(vp[p.puntoenvio],p);
		leerpedido(p);
	end;
end;

procedure leerCliente(var c:cliente);
begin
	c.dni:=Random(35);
	randomString(10,c.direccion);
	c.telefono:=random(100);
end;

procedure cargarVector(var v:vclientes);
var i:integer;
	c:cliente;
begin
	for i:= 1 to 35 do begin
		leerCliente(c);
		v[i]:=c;
	end;
end;

procedure OrdenacionPorInsercion(var v:vclientes);
var 
	i,j:integer;
	actual:cliente;
begin
	for i:=1 to 35 do begin
		actual:=v[i];j:=i-1;
		while ((j>0) and (v[j].dni>actual.dni)) do begin
			v[j+1]:=v[j];j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;

procedure imprimirLista(l:lista);
begin
	while (l<>nil) do begin
		writeln('Dia del mes: ',l^.elem.dia, ' Numero de pedido: ',l^.elem.npedido, ' DNI del cliente: ',l^.elem.dni, ' Monto: ',l^.elem.monto:0:2);
		l:=l^.sig;
	end;
end;

procedure imprimirVectorPedidos(vp:vpedidos);
var i:integer;
begin
	for i:= 1 to 10 do begin
		writeln('Lista de los pedidos del punto de envio numero ',i);
		imprimirLista(vp[i]);
	end;
end;

procedure buscarminimo(var min:pedido;var vp:vpedidos);
var
	pos,i:integer;
begin
	min.dia:=9999;
	for i:=1 to 10 do begin
		if (vp[i]<>nil) then begin
			if (vp[i]^.elem.dia<min.dia) then begin
				min:=vp[i]^.elem;
				pos:=i;
				end;
		end;
	end;
	if (min.dia<>9999) then 
		vp[pos]:=vp[pos]^.sig;
end;

{buscar e/ los pedidos el de mayor monto de cada dia
del pedido de mayor monto, agarrar el dni, y buscarlo en el vector de clientes
con ese dni, acceder al vector de clientes, encontrarlo e imprimir su info
si no existe, decir que el premio esta vacante.}

procedure buscarenVector(v:vclientes;i,dni:integer);
begin
	if (i<35) then begin
		if (v[i].dni=dni) then
			writeln('El cliente con el DNI ',dni,' tiene telefono: ',v[i].telefono)
		else
			buscarenVector(v,(i+1),dni);
	end
	else
		writeln('Premio vacante.');
end;

Procedure busquedaDicotomica(v: vclientes;ini,fin,dni:integer;var pos: integer);
var medio:integer;
begin
	if (ini>fin) then pos:=-1
	else begin
		medio:=(ini + fin) div 2;
		if (v[medio].dni=dni) then pos:=medio
		else
			if (v[medio].dni>dni) then BusquedaDicotomica(v,ini,medio-1,dni,pos)
		    else busquedaDicotomica(v,medio+1,fin,dni,pos);
	end;
end;

procedure merge (vp:vpedidos;v:vclientes);
var
	min,actual:pedido;
	pos:integer;
begin
	buscarminimo(min,vp); // encuentra el dia minimo entre todos los pedidos de las listas
	while (min.dia<>9999) do begin
		actual:=min;
		while (min.dia=actual.dia) do begin //mientras el dia minimo sea el mismo
			if (min.monto>actual.monto) then //si el monto del dia minimo> al actual, actualizo el actual a un nuevo maximo
				actual.monto:=min.monto;
			buscarminimo(min,vp);
		end;
		writeln('El monto maximo del dia ',actual.dia, ' es de: ',actual.monto:0:2,' y el nro de pedido es: ',actual.npedido,'. El DNI del pedido con mayor monto es: ',actual.dni);
		pos:=0;
		//buscarenVector(v,pos,actual.dni);
		busquedaDicotomica(v,1,35,actual.dni,pos);
		if (pos<>-1) then
			writeln('El cliente con el DNI ',actual.dni,' es el ganador de este dia y su telefono es: ',v[pos].telefono)
		else
			writeln('El premio del dia queda vacante.');
	end;
end;

var
	v:vclientes;
	i:integer;
	vp:vpedidos;
BEGIN
	Randomize;
	cargarVector(v);
	cargarVectorPedidos(vp);
	writeln('VECTOR ORDENADO POR DNI: ');
	OrdenacionPorInsercion(v);
	for i:= 1 to 35 do begin
		writeln(' DNI: ',v[i].dni,' Direccion: ',v[i].direccion,' Telefono: ',v[i].telefono);
	end;
	imprimirVectorPedidos(vp);
	writeln('MONTOS MAXIMOS: ');
	merge(vp,v);
END.

