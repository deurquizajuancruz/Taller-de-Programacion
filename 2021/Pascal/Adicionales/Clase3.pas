program Clase3;
type
	lista=^nodo;
	nodo=record
	elem:string;
	sig:lista;
end;
	vestantes=array [1..5] of lista;
procedure agregaratras(l:lista;min:string);
var nuevo,aux:lista;
begin
	new(nuevo);nuevo^.elem:=min;nuevo^.sig:=nil;
	if (l=nil) then l:=nuevo
	else begin
	aux:=l;
	while (aux^.sig<>nil) do begin
		aux:=aux^.sig;
		end;
	aux^.sig:=nuevo;
	end;
end;
procedure minimo(v:vestantes;var min:string);
var
	indicemin,i:integer;
begin
	min:='ZZZ';indicemin:=-1;
	for i:=1 to 5 do 
		if (v[i]<>nil) then
			if (v[i]^.elem<=min) then begin
			indicemin:=i;min:=v[i]^.elem
			end;
		if (indicemin<>-1) then begin
		min:=v[indicemin]^.elem;
		v[indicemin]:=v[indicemin]^.sig;
		end;
end;
procedure mergelistas(v:vestantes;var nueva:lista);
var
	min:string;
begin
	nueva:=nil;
	minimo(v,min);
	while (min<>'ZZZ') do begin
		agregaratras(nueva,min);
		minimo(v,min);
	end;
end;
var
	vector:vestantes;nueva:lista;
begin
// 	Se cargan las listas del vector (estantes).
	mergelistas(vector,nueva);
end.
