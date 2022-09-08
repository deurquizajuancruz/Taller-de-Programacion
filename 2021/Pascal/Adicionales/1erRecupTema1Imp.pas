program Tema1Imp;
const
	max_suc = 20;
	max_cli = 5000;
	corte = 999;
	max_dia = 31;
type
	rangoSucursal = 1..max_suc;
	rangoDia = 1..max_dia;
	
	venta = record		
		dia : rangoDia;
		nroFact : integer; 
		dni : integer;
		monto : real;
	end;

	lista = ^nodo;
	nodo = record
		dato : venta;
		sig : lista;
	end;
	
	vectorVentas = array[rangoSucursal] of lista;
	
	cliente = record
		dni : integer;
		email : string;
		telefono : string;
	end;
	
	rangoCliente = 1..max_cli;
	vectorClientes = array[rangoCliente] of cliente;
	
procedure cargarVentas(var vv : vectorVentas);
begin
end;

procedure cargarClientes(var vc : vectorClientes);
begin
end;

// Ordenamiento por inserción
procedure ordenarClientes(var vc: vectorClientes);
var 
	i, j: integer;
	actual: cliente;
begin
	for i:=2 to max_cli do begin 
		actual:= vc[i];
		j:= i-1; 
		while ((j > 0) and (vc[j].dni > actual.dni)) do begin
			vc[j+1]:= vc[j];
			j:= j - 1;
		end;  
		vc[j+1]:= actual; 
	end;
end;

function buscarCliente(vc:vectorClientes;ini, fin, dni:integer):integer;
var
	pos:integer;
begin
	if (ini > fin) Then
		buscarCliente:= -1
	else begin
		pos := (ini+fin) DIV 2;
		if (vc[pos].dni <> dni) then
			if (dni < vC[pos].dni) then
				buscarCliente:= buscarCliente(vc, ini, pos-1, dni)
			else
				buscarCliente:= buscarCliente(vC, pos+1, fin, dni)
		else
			buscarCliente:= pos;
    end;
end;

procedure minimo(var vv : vectorVentas; var ventaMin : venta);
var
	minIndice, i : rangoSucursal ;
begin
	ventaMin.dia := max_dia;
	ventaMin.nroFact:= corte;
	for i:=1 to max_suc do begin
		if (vv[i] <> nil) and (vv[i]^.dato.dia <= ventaMin.dia) then begin
			minIndice := i;
			ventaMin := vv[i]^.dato;
		end;
	end;	
	if (ventaMin.nroFact <> corte) then
		vv[minIndice] := vv[minIndice]^.sig;
end;

procedure maximo(ventaMin:venta; var ventaAct:venta);
begin
	if (ventaMin.monto > ventaAct.monto) then
		ventaAct:= ventaMin;
end;

procedure merge(vv : vectorVentas; vc : vectorClientes);
var
	ventaMin, ventaAct: venta;
	posCli:integer;
begin
	minimo(vv, ventaMin);
	while (ventaMin.nroFact <> corte) do begin
		ventaAct := ventaMin; 
		while ((ventaMin.nroFact <> corte) and (ventaMin.dia = ventaAct.dia)) do begin
			maximo(ventaMin, ventaAct);
			minimo(vv, ventaMin);
		end;
		posCli:= buscarCliente(vc, 1, max_cli, ventaAct.dni);
		if (posCli <> -1) then
			writeln('Para el dia: ', ventaAct.dia, ' factura ganadora: ', ventaAct.nroFact,  ' dni: ', ventaAct.dni, ' telefono: ', vc[posCli].telefono)
		else
			writeln('Para el dia: ', ventaAct.dia, ' premio vacante');	
	end;
end;

var
	vv : vectorVentas;
	vc : vectorClientes;
BEGIN
	// Carga el vector con las ventas por sucursal. No se debe implementar porque se dispone.
	cargarVentas(vv);
	
	// Carga el vector con los clientes. No se debe implementar porque se dispone.
	cargarClientes(vc);
	
	ordenarClientes(vc);
	
	merge(vv, vc);	
END.
