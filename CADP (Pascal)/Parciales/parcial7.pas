program parcial7;
type 

	str30 = string[30];
	rango = 1..4;
	
	pedido = record 
		destino: str30;
		pago:rango;
	end;
	
	vContador = array [rango] of integer;
	
	lista = ^nodo;
	
	nodo = record 
		dato:pedido;
		sig:lista;
	end;

procedure iniV (var v:vector);
var
	i:integer;
begin
	
	for i:= 1 to 4 do 
		v[i]:= 0;

end;

procedure maximo (var max:integer; valor:integer; p:lista; var pais:str30);
begin

	if ( valor > max) then begin
		max:= valor;
		pais:= p^.dato.destino;
	end;
end;

procedure recorrerLista(p,v);
var
	pais_act:str30;
	pais_max:str30;
	max:integer;
	pedidos_tot:integer;
begin

	max:= 0;
	pedidos_tot:= 0;
	
	while (p <> nil) do begin	
		pais_act:= p^.dato.destino;
		
		while (pais_act = p^.dato.destino) and (p <> nil) do begin
			pedidos_tot:= pedidos_tot +1;
			v[p^.dato.pago]:= v[p^.dato.pago] +1;
			p:= p^.sig;
		end;
		maximo(max,pedidos_tot,p,pais_max);
		pedidos_tot:= 0;
	end;
	writeln (pais_max);
end;

procedure imprimirV (v:vector);
var
	i:integer;
begin
	
	for i:= 1 to 4 do 
		writeln(i, ' - ', v[i]);
end;

var
	p:lista;
	v:vContador;
	c:pedido;

begin
	 
	p:= nil;
	cargarLista(p,c);
	
	recorrerLista(p,v);
	imprimirV(v);
	
end.














	
	
	
	
	
	
