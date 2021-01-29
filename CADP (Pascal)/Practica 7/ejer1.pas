program ejer1;
const
	dimF = 5;
type
	
	rango = 1..5;
	persona = record
		dni:integer;
		ap_y_nom:string[40];
		edad:integer;
		codigo:rango;
	end;
	
	vContador = array[1..dimF] of integer;
	
	lista=^nodo;
	nodo = record
		dato:persona;
		sig:lista;
	end;
	
procedure iniV (var v:vContador);
var
	i:integer;
begin
	
	for i:= 1 to dimF do
		v[i]:= 0;
end;

procedure leerDatos (var c:persona);
begin

	writeln('DNI');
	readln(c.dni);
	writeln('Apellido y nombre');
	readln(c.ap_y_nom);
	writeln('Edad');
	readln(c.edad);
	writeln('Codigo');
	readln(c.codigo);
	
end;

procedure agregarAdelante (var p:lista; c:persona);
var
	aux:lista;
begin
		new(aux);
		aux^.dato:= c;
		aux^.sig:=nil;
		
		if (p = nil) then begin
			p:=aux;
		end
		else
			aux^.sig:= p;
			p:= aux;
end;

procedure procesarDatos (var p:lista; var v:vContador; c: persona);
begin

	repeat 
		leerDatos(c);
		v[c.codigo]:= v[c.codigo] +1;
		agregarAdelante(p,c);
	
	until (c.dni = 3355);
	
end;

procedure maximos (v:vContador);
var
	max1,max2,i,codmax1,codmax2:integer;
begin
	max1:= -1;
	max2:= -2;
	codmax1:= 0;
	codmax2:= 0;

	for i:= 1 to dimF do begin	
		if(v[i] > max1) then begin
			max2:= max1;
			max1:= v[i];
			codmax2:= codmax1;
			codmax1:=i;
		end;
		if (v[i] > max2) then begin
			max2:= v[i];
			codmax2:= i;
		end;
	end;
	writeln('El codigo mas elegido es: ', codmax1);
	writeln('El segundo mas elegido es: ', codmax2);
end;

procedure digPares(p:lista);
var
	aux:lista;
	pares,impares:integer;
	cant_dni_pares:integer;
	dig:integer;
begin	

	pares:= 0;
	impares:= 0;
	cant_dni_pares:= 0; 

	aux:= p;
	
	while (aux <> nil) do begin
		while(aux^.dato.dni <> 0) do begin
			dig:= (aux^.dato.dni mod 10);
			if ((dig mod 2) = 2) then begin
				pares:= pares+1;
			end 
			else
				impares:= impares+1;
			aux^.dato.dni:= aux^.dato.dni div 10;
		end;
		if (pares > impares) then
			cant_dni_pares:= cant_dni_pares+1;
		pares:= 0;
		impares:= 0;
		aux:= aux^.sig;
	end;
end;

procedure eliminar (var p:lista; valor:integer);
var
	act,ant:lista;
begin
	act:= p;
	ant:= p;
	
	while (act <> nil) and (act^.dato.dni <> valor) do begin
		ant:= act;
		act:= act^.sig;
	end;
	
	if (act <> nil) then begin
		if (act = p) then begin
			p:=act^.sig;
		end
		else
			ant^.sig:= act^.sig;
		dispose(act);
	end;
end;

var 
	p:lista;
	valor:integer;
	v:vContador;
	c: persona;

begin
	valor:= 0;
	p:= nil;
	
	iniV(v);
	procesarDatos(p,v,c);
	maximos(v);
	digPares(p);
	writeln('valor a eliminar');
	readln(valor);
	eliminar(p,valor);
end.
