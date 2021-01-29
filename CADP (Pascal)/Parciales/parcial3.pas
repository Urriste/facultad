program parcial3;
type
	
	depto = record
		superficie: integer;
		monto_invertido:real;
		localidad:string[30];
	end;
	
	vDeptos = array[1..5] of depto;
	
	lista =^nodo;
	nodo = record 
		dato:depto;
		sig:lista;
	end;
	
procedure cargarDeptos (var j:vDeptos; d:depto);
var
	i: integer;
begin
	
	for i:= 1 to 5 do begin
		writeln('Superficie');
		readln(d.superficie);
		writeln('-----------------');
		writeln('Monto Invertido');
		readln(d.monto_invertido);
		writeln('-----------------');
		writeln('Localidad');
		readln(d.localidad);
		writeln('-----------------');
		j[i]:= d;
	end;
end;

procedure agregarAdelante(var p:lista;d:depto);
var
	aux:lista;
begin

	new(aux);
	aux^.dato:= d;
	aux^.sig:=nil;
	
	if (p = nil) then begin
		p:= aux;
	end
	else
		aux^.sig:= p;
		p:= aux;
end;

procedure deptosGrandes(var p:lista; j:vDeptos);
var 
	i:integer;
begin
	
	for i:= 1 to 5 do begin
		if (j[i].superficie > 75.0) then
			agregarAdelante(p,j[i]);
	end;
end;


procedure imprimirLista (p:lista);
var
	aux:lista;
begin
	aux:= p;
	
	while (aux <> nil) do begin
		writeln('Superficie: ', aux^.dato.superficie);
		writeln('Monto invertido: ', aux^.dato.monto_invertido:4:4);
		writeln('Localidad: ', aux^.dato.localidad);
		aux:= aux^.sig;
	end;
end;

procedure totalInvertido(j:vDeptos);
var
	i:integer;
	loc_act:string[30];
	total_inv:real;
begin
	i:= 0;

	while(i <= 5) do begin
		loc_act:= j[i].localidad;
		total_inv:= total_inv + j[i].monto_invertido;
		i:= i+1;
		while (loc_act = j[i].localidad) do begin
			total_inv:= total_inv + j[i].monto_invertido;
			i:= i+1;
		end;
		writeln('La localidad ', loc_act , ' recibio una inversion total de: ', total_inv:2:2);
		total_inv:= 0;
	end;
end;
var
	j:vDeptos;
	p:lista;
	d:depto;
	
begin
	
	p:= nil;
	cargarDeptos(j,d);
	
	deptosGrandes(p,j);
	totalInvertido(j);
	imprimirLista(p);
	
	
	
end.
