program pRecursionEjer1;
type
	lista = ^nodo;
	nodo = record
		dato:integer;
		sig:lista;
	end;

procedure leerNum(var num:integer);
begin

	writeln('Ingrese un numero');
	readln(num);

end;

procedure agregarAdelante(var l:lista; var valor:integer);
var
	aux:lista;
begin
	new (aux);
	aux^.dato:= valor;
	aux^.sig:=nil;
	
	if (l = nil) then begin
		l:= aux;
	end
	else begin
		aux^.sig:= l;
		l:= aux;
	end;
end;

procedure cargarLista(var l:lista);
var 
	num:integer;
begin
	
	leerNum(num);
	while (num <> -1) do begin
		agregarAdelante(l,num);
		leerNum(num);
	end;
end;
	
function minimo(l:lista): integer;
var
	min:integer;
begin
	if(l <> nil) then begin
		min:= minimo(l^.sig);
		if(l^.dato < min) then begin
			minimo:= l^.dato;
			
		end
		else begin
			minimo:= min;
		end;
	end;
end;

function maximo(l:lista): integer;
var
	max:integer;
begin
	if(l <> nil) then begin
		max:= maximo(l^.sig);
		if(l^.dato > max) then begin
			maximo:= l^.dato;
		end
		else begin
			maximo:= max;
		end;
	end;
end;
	
function encontrarValor(l:lista;val:integer): boolean;
begin

	if(l <> nil) then begin
		if(l^.dato = val) then begin
			encontrarValor:= true;
		end
		else begin
		encontrarValor:=false;
			encontrarValor(l^.sig,val);
		end;
	end
	else begin
		encontrarValor:= false;
	end;
end;
	
	
procedure imprimirLista(l:lista);
begin
	writeln;
	writeln('------------------------------------------------------');
	if(l <> nil) then begin
		
		writeln(l^.dato);
		l:= l^.sig;
		imprimirLista(l);
	end;
	
end;

	
	
	
var
	l:lista;
	valMinimo,valMaximo,val:integer;
	valEncontrado:boolean;
BEGIN
	valMinimo:= 0;
	valMaximo:= 0;
	
	cargarLista(l);
	
	valMinimo := minimo(l);
	writeln('val minimo: ', valMinimo);
	
	writeln;
	writeln;
	writeln('---------------------------------------');
	writeln;
	writeln;
	
	valMaximo:= maximo(l);
	writeln('val maximo: ', valMaximo);
	
	writeln;
	writeln;
	writeln('---------------------------------------');
	writeln;
	writeln;
	
	
	writeln('Ingrese el valor que quiere encontrar'); read(val);
	valEncontrado:= encontrarValor(l,val);
	writeln('Se encontro el valor? ', valEncontrado);

	
END.

