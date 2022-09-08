program Punto7Adicionales;
type
	vacunas=1..4;
	notificacion=record
		fecha:String;
		pais:String;
		dosis:integer;
		tipov:vacunas;
	end;
	lista=^nodo;
	nodo=record
		elem:notificacion;
		sig:lista;
	end;
	vnotificaciones=array[vacunas] of lista;
	infopaises=record
		pais:String;
		totaldosis:integer;
	end;
	arbol=^nodo2;
	nodo2=record
		elem:infopaises;
		hi:arbol;
		hd:arbol;
	end;
	
procedure cargarvector(var v:vnotificaciones); //SE DISPONE
begin  end;

procedure insertararbol(var a:arbol;i:infopaises);
begin
	if (a=nil) then begin
		new(a);a^.elem:=i;a^.hi:=nil;a^.hd:=nil;
	end
	else begin
		if (a^.elem.totaldosis>i.totaldosis) then insertararbol(a^.hi,i)
		else insertararbol(a^.hd,i);
	end;
end;

procedure minimo(var v:vnotificaciones;var min:String);
var c:integer;
i:vacunas;
begin
	c:=0;min:='ZZZ';
	for i:=1 to 4 do begin
		if ((v[i]<>nil) and (v[i]^.elem.pais<min)) then begin
			c:=i;min:=v[i]^.elem.pais;
		end; 
	end;
	if (c<>0) then begin
		min:=v[c]^.elem.pais;v[c]:=v[c]^.sig;
	end;
end;

procedure merge(var a:arbol; v:vnotificaciones);
var
	min:notificacion;
	i:infopaises;
begin
	a:=nil;
	minimo(v,min.pais);
	while (min.pais<>'ZZZ') do begin
		i.pais:=min.pais;i.totaldosis:=0;
		while ((min.pais<>'ZZZ') and (i.pais=min.pais)) do begin
			i.totaldosis:= i.totaldosis + min.dosis;minimo(v,min.pais);
		end;
		insertararbol(a,i);
	end;
end;

procedure paismasdosis(a:arbol; var masdosis:String);
begin
	if (a^.hd<>nil) then begin
		paismasdosis(a^.hd,masdosis);
	end
	else begin
		masdosis:=a^.elem.pais;
	end;
end;

var
	v:vnotificaciones;a:arbol;masdosis:String;
begin
	cargarvector(v);// SE DISPONE
	merge(a,v);
	paismasdosis(a,masdosis);writeln('El pais con mas dosis es: ',masdosis);
end.
