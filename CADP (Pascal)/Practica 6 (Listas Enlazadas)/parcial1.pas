program parcial1;
type

	rango = 1..10;
	suscripcion = record
		codigo:rango;
		precio:real;
	end;
	
	cliente = record
		nombre: string[15];
		dni:integer;
		edad:integer;
		cod_susc:rango;
	end;
	
	vSuscripciones = array[rango] of suscripcion;
	vContador = array [rango] of real;
	
	lista = ^nodo;
	nodo = record
		dato:cliente;
		sig:lista;
	end;
	
	
procedure cargarSuscripciones (var j:vSuscripciones; s:suscripcion);
var
	i:integer;
begin

	for i:= 1 to 10 do begin
		writeln('Ingrese el precio de la suscripcion ', i);
		readln(s.precio);
		j[i].precio:= s.precio;
	end;

end;
	
procedure insertarOrdenado (var p:lista; c:cliente);
var
	aux:lista;
	ant,act:lista;
begin

	new(aux);
	aux^.dato:= c;
	aux^.sig:=nil;
	act:= p;
	ant:= p;
	
	while (act <> nil) and (c.dni < act^.dato.dni) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant) then begin
		p:= aux;
	end
	else
		ant^.sig:= aux;
	aux^.sig:= act;

end;

procedure leerDatos(var c:cliente);
begin

	writeln('Ingrese su nombre');
	readln(c.nombre);
	writeln('Ingrese su dni');
	readln(c.dni);
	writeln('Ingrese su edad');
	readln(c.edad);
	writeln('Ingrese el codigo de la sucripcion que desesa');
	readln(c.cod_susc);

end;
	

procedure agregarClientes (var p:lista; c:cliente);
var
	i:integer;
begin

	for i:= 1 to 4 do begin
		leerDatos(c);
		insertarOrdenado(p,c);
	end;
end;

procedure recaudacion(var v:vContador; p:lista; j:vSuscripciones);
var
	aux:lista;
	i:integer;
begin
	aux:= p;

	while (aux^.sig <> nil) do begin
		v[aux^.dato.cod_susc]:= v[aux^.dato.cod_susc] + j[aux^.dato.cod_susc].precio;
		aux:= aux^.sig;
	end;
	
	for i:= 1 to 10 do
		writeln('La suscripcion ', i , ' recaudo ', v[i]:2:2);
	
end;
	
var
	p:lista;
	v:vContador;
	j:vSuscripciones;
	c:cliente;
	s:suscripcion;
	
begin
	
	p:= nil;
	cargarSuscripciones(j,s);
	
	agregarClientes(p,c);
	recaudacion(v,p,j);


end.
	
	
	
	
	
	
	
	
	
	
	
	
