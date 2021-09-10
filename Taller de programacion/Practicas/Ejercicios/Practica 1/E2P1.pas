program P1E2;
const 
	cant_generos = 8;
type
		tPelicula = record 
			codigoP:integer;
			codigoG: 1..cant_generos;
			puntaje:real;
		end;
		
		lista = ^nodo;
		nodo = record
			dato: tPelicula;
			sig:lista;
		end;
		
		vListasPorGenero = array [1..cant_generos] of lista;
		
		vMejoresPelis = array [1..cant_generos] of tPelicula;
		
		
procedure leerPelicula(var p:tPelicula);
begin
			p.codigoP := random(12) - 1;
			if(p.codigoP <> -1) then begin
				p.codigoG := random(8) + 1;
				p.puntaje:= random(500) + random()
			end;
end;

procedure iniciarListas(var l:vListasPorGenero);
var
	i:integer;
begin
	for i:= 1 to cant_generos do begin
		l[i]:= nil;
	end;
end;

procedure agregarAtras(var pri:lista; p:tPelicula; var ult:lista);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:= nil;
	if (pri = nil) then begin
		pri:= nue;
	end
	else begin
		ult^.sig:= nue;
	end;
	ult:= nue;
end;

procedure cargarListas(var l:vListasPorGenero);
var
	p:tPelicula;
	ult:vListasPorGenero;
begin
	
	leerPelicula(p);
	while(p.codigoP <> -1) do begin
		agregarAtras(l[p.codigoG],p,ult[p.codigoG]);
		leerPelicula(p);
	end;
end;

procedure imprimirLista(pri:lista);
begin
	while(pri <> nil) do begin
		writeln(pri^.dato.codigoP);
		pri:= pri^.sig;
	end;
end;

procedure imprimirCodigosDePeliculas(l:vListasPorGenero);
var
	i:integer;
begin
	for i:= 1 to cant_generos do begin
		imprimirLista(l[i]);
	end;
	writeln;
end;

procedure calcularPeliMaxDeGenero(pri:lista; var peliMax:tPelicula);
var
	max:real;
begin
	max := -1;
	while (pri <> nil) do begin
		if(pri^.dato.puntaje > max) then begin
			max:= pri^.dato.puntaje;
			peliMax:= pri^.dato;
		end;
		pri:= pri^.sig;
	end;
end;

procedure generarVectorMejores(l:vListasPorGenero; var v: vMejoresPelis);
var
	i:integer;
	peliMax:tPelicula;
begin
	for i:= 1 to cant_generos do begin
		calcularPeliMaxDeGenero(l[i],peliMax);
		v[i]:= peliMax;
	end;
end;

Procedure ordenarVg(var vector:vMejoresPelis);
Var
	actual:tPelicula;
	i, j :integer;
Begin
	for i:= 2 to cant_generos do Begin
		actual:=vector[i];                                          
		j:=i-1;
		while(j>0)and(vector[j].puntaje > actual.puntaje)do Begin
			vector[j+1]:=vector[j];
			j:=j-1;
		end;
		vector[j+1]:=actual;
	end;	
end;
var
		l:vListasPorGenero;
		v:vMejoresPelis;

BEGIN

	randomize;
	iniciarListas(l);
	cargarListas(l);
	imprimirLista(l[8]);
	generarVectorMejores(l,v);
	ordenarVg(v);
	writeln('El codigo de la pelicula con mayour puntaje es: ', v[8].codigoP);
	
	
END.

