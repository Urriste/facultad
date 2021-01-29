program parcial6;
type
	
	str30 = string[30];
	rango = 1..4;
	
	paquete = record
		localidad:str30;
		peso:integer;
		tipo:rango;
	end;
	
	vContador = array [rango] of integer;
	
	lista = ^nodo;
	nodo = record
		dato:paquete;
		sig:lista;
	end;
	
procedure recorrerLista (p:lista; var v: vContador);
var
	loc_actual: str30;
	peso_tot:integer;
begin
	
	while (p <> nil) do begin
		
		loc_actual:= p^.dato.localidad;
		
		while (loc_act = p^.dato.localidad) and ( p <> nil) do begin
			peso_tot:= peso_tot + p^.dato.peso;
			v[p^.dato.tipo]:= v[p^.dato.tipo] + 1;
			p:= p^.sig;
		end;
		writeln(peso_tot);
		peso_tot:= 0;
	end;
end;

procedure imprimirVector (v:vContador);
var
	i:integer;
begin

	for i:= 1 to 4 do 
		writeln(i, ' - ', v[i]);

end;
var 
	p:lista;
	v:vContador;
begin

	p:= nil;
	//se carga la lista de paquetes//
	
	recorrerLista(p,v);
	imprimirVector(v);
	
end.






