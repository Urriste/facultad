program peliculitas;
const
	CANT_GENEROS = 8;
type
	tPelicula = record
		codigoP: integer;
		codigoG: 1..CANT_GENEROS;
		puntaje: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: tPelicula;
		sig: lista;
	end;
	
	vListasPorGenero = array [1..CANT_GENEROS] of lista;
	
	vMejoresPelis = array [1..CANT_GENEROS] of tPelicula;
	

procedure leerPelicula(var p:tPelicula);
begin
	p.codigoP := random(12) - 1; //numeros del -1 al 10
	if (p.codigoP <> -1) then begin
		p.codigoG := random(8) + 1; //numero entero entre 1 y 8 inclusive
		p.puntaje := random(500) + random();
	end;
end;

procedure IniciarListas(var L: vListasPorGenero);
var
	i: integer;
begin
	for i:=1 to CANT_GENEROS do begin
		L[i] := nil;
	end;
end;

procedure AgregarAtras(var pri: lista; p: tPelicula; var ult: lista);
var
	nue: lista;
begin
	new(nue);
	nue^.dato := p;
	nue^.sig := nil;
	if (pri = nil) then begin
		pri := nue;
	end
	else begin
		ult^.sig := nue;
	end;
	ult := nue;
end;

procedure CargarListas(var L: vListasPorGenero);
var
	p: tPelicula;
	ult: vListasPorGenero;
begin
	leerPelicula(p);
	while (p.codigoP <> -1) do begin
		AgregarAtras(L[p.codigoG],p,ult[p.codigoG]);
		leerPelicula(p);
	end;
end;

procedure ImprimirLista(pri: lista);
begin
	while (pri <> nil) do begin
		writeln(pri^.dato.codigoP);
		pri := pri^.sig;
	end;
end;

procedure ImprimirCodigosDePeliculas(L: vListasPorGenero);
var
	i: integer;
begin
	for i:=1 to CANT_GENEROS do begin
		ImprimirLista(L[i]);
	end;
	writeln;
end;

procedure CalcularPeliMaxDeGenero(pri: lista; var peliMax: tPelicula);
var
	max: real;
begin
	max := -1;
	while (pri <> nil) do begin
		if (pri^.dato.puntaje > max) then begin
			max := pri^.dato.puntaje;
			peliMax := pri^.dato
		end;	
		pri := pri^.sig;
	end;
end;

procedure GenerarVectorMejores(L: vListasPorGenero;var v: vMejoresPelis);
var
	i: integer;
	peliMax: tPelicula;
begin
	for i:=1 to CANT_GENEROS do begin
		CalcularPeliMaxDeGenero(L[i],peliMax);
		v[i] := peliMax;
	end;
end;

Procedure ordenarVg(var vector:vMejoresPelis);
Var
	actual:tPelicula;
	i, j :integer;
Begin
	for i:= 2 to CANT_GENEROS do Begin
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
	L: vListasPorGenero;
	v: vMejoresPelis;
begin
	randomize;
	IniciarListas(L);
	CargarListas(L);
	//imprimir todos los codigos de peliculas de terror
	ImprimirLista(L[8]);
	GenerarVectorMejores(L,v);
	ordenarVg(v);
	writeln('El codigo de la pelicula con mayor puntaje es: ',v[8].codigoP);
end.

