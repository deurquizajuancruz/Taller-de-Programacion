{Implementar un programa que procese la información de los participantes de un
concurso. De cada participante se lee: código de participante, código de ciudad de
origen y edad. La lectura finaliza con el código de ciudad 0.
Implementar un programa que:
a) Genere una estructura a partir de la información leída. La estructura debe ser
eficiente para la búsqueda por código de participante.
A partir de la estructura generada:
a) Genere una lista con los participantes de la ciudad cuyo código se recibe. Luego,
muestre el contenido de la lista.
b) Calcule e informe la edad promedio de los participantes del concurso.
c) Calcule e informe el participante de menor edad.
d) Dado un código, informe si el mismo corresponde al de un participante inscripto.
e) Calcule e informe la cantidad de participantes cuyos códigos están comprendidos
entre dos valores determinados que se reciben.}
program Clase4Actividad5;
type
	participante=record
		codigo:integer;
		codigociudad:integer;
		edad:integer;
	end;
	arbol=^nodo;
	nodo=record
		elem:participante;
		hi:arbol;
		hd:arbol;
	end;
	lista=^nodo2;
	nodo2=record
		elem:participante;
		sig:lista;
	end;
	
procedure leerparticipante(var p:participante);
begin
	p.codigociudad:=random(15);
	if (p.codigociudad<>0) then begin
		p.codigo:=random(100);
		p.edad:=random(80)+1;
	end;
end;

procedure Insertar(var a: arbol; dato: participante);
begin
 if (a = nil) then begin
	new(a);
	a^.elem:= dato;
	a^.HI:= nil;
	a^.HD:= nil;
 end
 else
	if (a^.elem.codigo > dato.codigo) then
		Insertar(a^.HI, dato)
 else
	if (a^.elem.codigo < dato.codigo) then
		Insertar (a^.HD, dato);
end;

procedure crearABB(var a:arbol);
var p:participante;
begin
	leerparticipante(p);
	while (p.codigociudad<>0) do begin
		Insertar(a,p);leerparticipante(p);
	end;
end;

procedure enorden(a:arbol);
begin
	if (a <> nil) then begin
		enorden (a^.HI);
		writeln('Codigo del participante: ',a^.elem.codigo,' Codigo de ciudad: ',a^.elem.codigociudad,' Edad: ',a^.elem.edad);
		enorden (a^.HD);
	end;
end;

procedure imprimirlista(l:lista);
begin
	while (l<>nil) do begin
		writeln('Codigo del participante: ',l^.elem.codigo,' Edad: ',l^.elem.edad);
		l:=l^.sig;
	end;
end;

procedure AgregarAtras (var pri, ult: lista; p: participante);
var nue : lista;
begin
	new (nue);
	nue^.elem:= p;
	nue^.sig := NIL;
	if pri <> Nil then
		ult^.sig := nue
	else
		pri := nue;
	ult := nue;
end;

procedure buscarenArbol(a:arbol;cc:integer;var l,aux:lista);
begin
	if (a<>nil) then begin
		if(a^.elem.codigociudad = cc) then
			agregarAtras(l,aux,a^.elem);
		buscarenArbol(a^.hd,cc,l,aux);
		buscarenArbol(a^.hi,cc,l,aux);
		end;
end;

procedure promedioEdad (a:arbol;var totalp,totaledad:integer);
begin
	if (a<>nil) then begin
		totalp:=totalp + 1;
		totaledad:=totaledad + a^.elem.edad;
		promedioEdad(a^.hi,totalp,totaledad);
		promedioEdad(a^.hd,totalp,totaledad);
	end;
end;

procedure VerMin(a:arbol; var min:integer);
begin
	if (a<>nil) then begin
		if (a^.elem.edad <min) then
			min:=a^.elem.edad;
		VerMin(a^.hi,min);
		VerMin(a^.hd,min);
	end;
end;

function Buscar (a:arbol; dato:integer): arbol;
begin
	if (a=nil) then
		Buscar:=nil
	else
		if (dato= a^.elem.codigo) then Buscar:=a
		else
			if (dato < a^.elem.codigo) then
				Buscar:=Buscar(a^.HI ,dato)
			else
				Buscar:=Buscar(a^.HD ,dato);
end;

procedure DosValores (valor1,valor2:integer; var cant:integer; a:arbol);
begin
	if (a<>nil) then begin
			if (a^.elem.codigo>=valor1) then begin
				DosValores(valor1,valor2,cant,a^.hi);
				if (a^.elem.codigo<=valor2) then begin
					DosValores(valor1,valor2,cant,a^.hd);
					cant:=cant+1;
					end;
				end
			else
				DosValores(valor1,valor2,cant,a^.hd);
			end;
end;

procedure procesarLista(var l,aux:lista;a:arbol);
var 
	ciudadbuscada:integer;
begin
	writeln('Ingrese el codigo de la ciudad a buscar: ');readln(ciudadbuscada);
	buscarenArbol(a,ciudadbuscada,l,aux);
	writeln('Informacion de los participantes con el codigo de ciudad ',ciudadbuscada);
	imprimirlista(l);
end;
var
	l,aux:lista;
	a:arbol;
	min,totalp,totaledad,codigo,valor1,valor2,cant:integer;
begin
	Randomize;l:=nil;aux:=nil;totalp:=0;totaledad:=0;min:=100;cant:=0;
	crearABB(a);
	enorden(a);
	procesarLista(l,aux,a);
	promedioEdad(a,totalp,totaledad);
	writeln('El promedio de la edad de los participantes del concurso es: ',(totaledad/totalp):0:2);
	VerMin(a,min);
	writeln('El participante con menor edad tiene ',min);
	writeln('Ingrese el codigo del participante a buscar: ');
	readln(codigo);
	if (Buscar(a,codigo)<>nil) then
		writeln('Se encontro el participante con codigo: ', codigo)
	else
		writeln('No se encontro el participante con codigo ', codigo);
	writeln('Ingrese el primer valor(minimo): ');readln(valor1);
	writeln('Ingrese el segundo valor(maximo): ');readln(valor2);
	DosValores(valor1,valor2,cant,a);
	writeln('La cantidad de participantes que tienen codigo mayor a ',valor1, ' y menor a ',valor2,' es de: ',cant);
end.
