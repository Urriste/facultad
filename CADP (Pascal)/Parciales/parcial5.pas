program parcial5;
const 
	dimF = 4;
type
	
	rango = 1..4;
	str30= string[30];
	clases = record
		nombre:str30;
		costo:real;
		cupo:integer;
	end;
	
	cliente = record
		nombre:str30;
		dni:integer;
		edad:integer;
		codigo:rango;
	end;
	
	vSuscripciones = array[rango] of clases;
	vContador = array[rango] of integer;
	
	lista = ^nodo;
	nodo = record
		dato:cliente;
		sig:lista;
	end;
	
procedure cargarSuscripciones(var j:vSuscripciones; k:clases);
var
	i:integer;
	
begin
	
	for i:= 1 to 4 do begin

		writeln('nombre clase');
		readln(k.nombre);
		writeln('costo clase');
		readln(k.costo);
		writeln('cupo clase');
		readln(k.cupo);
		
		j[i]:= k;
	end;
end;
	
procedure leerDatos(var c:cliente);
begin

		writeln('nombre cliente');
		readln(c.nombre);
		writeln('dni cliente');
		readln(c.dni);
		writeln('edad cliente');
		readln(c.edad);
		writeln('codigo clase');
		readln(c.codigo)

end;

procedure agregarAdelante (var p:lista; c:cliente);
var
	aux:lista;
begin
	
	new(aux);
	aux^.dato:= c;
	aux^.sig:= nil;
	
	if (p = nil) then begin
		p:= aux;
	end
	else
		aux^.sig:= p;
		p:= aux;
end;

procedure procesarDatos (var p:lista; c:cliente; j:vSuscripciones);
var
	cupo_spinning:integer;
begin

	cupo_spinning:= 0;
	
	leerDatos(c);
	while (c.nombre <> 'zzz') and (cupo_spinning <= j[2].cupo) do begin
		agregarAdelante(p,c);
		if (p^.dato.codigo = 2) then
			cupo_spinning:= cupo_spinning +1;
		leerDatos(c);
	end;
end;

procedure recorrerLista(p:lista; var v:vContador);
begin

	while (p <> nil) do begin
		if(p^.dato.codigo = 4) then 
			writeln('El cliente ', p^.dato.nombre, ' de edad ', p^.dato.edad, ' asistira a todas las clases ');
		v[p^.dato.codigo]:=v[p^.dato.codigo] +1;
		p:= p^.sig;
	end;
end;

procedure imprimirVector (v:vContador);
var
	i: integer;
begin

	for i:= 1 to 4 do
		writeln(i ,' - ', v[i]);
end;

var
	v:vContador;
	c:cliente;
	p:lista;
	j:vSuscripciones;
	k:clases;

begin
	
	p:= nil;
	cargarSuscripciones(j,k);
	procesarDatos(p,c,j);
	recorrerLista(p,v);
	imprimirVector(v);


end.
	
	
	
	








	
	
	
