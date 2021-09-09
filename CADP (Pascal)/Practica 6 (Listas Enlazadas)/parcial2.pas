program parcial2;
type
	rango = 1..12;
	sesiones = record
		codigo:rango;
		costo:real;
		cant_sesiones:integer;
	end;
	cliente = record
		nombre:string[30];
		dni:integer;
		ciudad:string[30];
		codigo_plan:rango;
		finalizo:string[2];
	end;
	
	vSesiones = array[rango] of sesiones;
	
	lista = ^nodo;
	nodo = record
		dato:cliente;
		sig:lista;
	end;
	
procedure cargarSesiones (var j:vSesiones; s:sesiones);
var
	i:integer;
begin
	
	for i:= 1 to 12 do begin
		writeln('Ingrese el precio de la sesion');
		readln (s.costo);
		writeln('Ingrese la cantidad de sesiones');
		readln(s.cant_sesiones);
		j[i]:= s;
	end;
end;
procedure leerDatos (var c:cliente);
begin

		writeln('Ingrese su nombre');
		readln (c.nombre);
		writeln('Ingrese su dni');
		readln(c.dni);
		writeln('Ingrese su ciudad de origen');
		readln(c.ciudad);
		writeln('Ingrese el codigo de su plan (1 al 12)');
		readln(c.codigo_plan);
		writeln('Usted finalizo con sus sesiones? (SI / NO)');
		readln(c.finalizo);
	

end;
	
procedure agregarAdelante (var p:lista; c:cliente);
var
	aux:lista;
begin
	new(aux);
	aux^.dato:= c;
	aux^.sig:=nil;
	
	if (p = nil) then begin
		p:= aux;
	end
	else 
		aux^.sig:= p;
		p:= aux;
end;

procedure procesarDatos (var p:lista; var c:cliente);
begin
	
	repeat 
		
		leerDatos(c);
		agregarAdelante(p,c);
	
	until((c.nombre = 'Mirtha Legrand') and (c.dni = 2000));

end;

procedure recogerDatos (var cant_cli:integer; var ganancia:real; j:vSesiones; p:lista);
var 
	aux:lista;
begin

	aux:= p;
	
	while (aux^.sig <> nil) do begin
		if ( (aux^.dato.ciudad = 'La Plata') or (aux^.dato.ciudad = 'Berisso') or (aux^.dato.ciudad = 'Ensenada') and (aux^.dato.finalizo = 'No')) then
			cant_cli:= cant_cli+1;
		ganancia:= ganancia + j[aux^.dato.codigo_plan].costo;
		aux:= aux^.sig;
	end;
	writeln('La cantidad de clientes de La Plata, Berisso o Ensenada que estan en trataminto es de: ', cant_cli);
	writeln('La ganancia total es: ', ganancia:4:2);
end;
var
	p:lista;
	c:cliente;
	cant_cli:integer;
	ganancia:real;
	j: vSesiones;
	s: sesiones;
begin
	p:= nil;
	ganancia:= 0;
	cant_cli:= 0;
	
	cargarSesiones(j,s);
	procesarDatos(p,c);
	recogerDatos(cant_cli,ganancia,j,p);
	
end.
	
	
	
	
	
	



















	
	
	
	
	
	
	
	
	
	
