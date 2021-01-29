program ejercicio5;
type
	producto = record
		codigo:integer;
		descripcion:string[30];
		stock_actual:integer;
		stock_minimo:integer;
		precio:real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato: producto;
		sig:lista;
	end;

procedure agregarAdelante (var l:lista; r:producto);
var
	aux:lista;
begin	

	new(aux);
	aux^.dato:= r;
	aux^.sig:=nil;
	
	if (l = nil) then begin
		l:= aux;
	end
	else
		aux^.sig:= l;
		l:= aux;
end;

procedure porcentaje (r:producto;tot_stock:integer; var porcentaje_stock:integer);
begin

	if (r.stock_actual < r.stock_minimo) then
		porcentaje_stock:= porcentaje_stock +1;
	

end;

procedure leerDatos (var r:producto; var tot_stock:integer;var porcentaje_stock:integer);
begin

	writeln('Ingrese el codigo del producto');
	readln (r.codigo);
	if (r.codigo <> -1 ) then begin
		writeln('Ingrese la descripcion del producto');
		readln(r.descripcion);
		
		writeln('Ingrese el stock actual');
		readln(r.stock_actual);
		tot_stock:= tot_stock + r.stock_actual;
		
		writeln('Ingrese el stock minimo');
		readln(r.stock_minimo);
		if (r.stock_actual < r.stock_minimo) then
			porcentaje_stock:= porcentaje_stock +1;
		
		writeln('Ingrese el precio del producto');
		readln(r.precio);
	end;
	
end;

procedure minimos (var min1,min2:real;var codmin1,codmin2:integer;r:producto);
begin

	if (r.precio < min1) then begin
		min2:= min1;
		min1:= r.precio;
		codmin2:= codmin1;
		codmin1:= r.codigo;
	end;
	if (r.precio < min2) then begin
		min2:= r.precio;
		codmin2:= r.codigo;
	end;

end;


procedure procesarDatos (var l:lista;var r:producto;var min1,min2:real;var codmin1,codmin2:integer);
begin

	leerDatos(r);
	minimos (min1,min2,codmin1,codmin2,r);
	while (r.codigo <> -1) do begin
		agregarAdelante(l,r);
		leerDatos(r);
		minimos(min1,min2,codmin1,codmin2,r);
	end;

end;

Function cumple(cod:integer):boolean;
Var
	Par:integer;
	Dig: integer;
Begin
	Par:=0; 
	While(cod<>0) do begin
		Dig:=cod mod 10;
		If((dig mod 2)=0)then
			Par:=Par+1;
		cod:=cod div 10;
	End;
	Cumple:=(Par>=3);
End;


var
	l:lista;
	r:producto;
	codmin1,codmin2,cod:integer;
	min1,min2:real;	
begin
	l:= nil;
	codmin1:= 0; codmin2:=0; min1:=27800; min2:=27800;

	procesarDatos(l,r,min1,min2,codmin1,codmin2);

end.

