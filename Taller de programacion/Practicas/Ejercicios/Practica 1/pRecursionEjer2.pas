program pRecursionEjer2;
const
	dimF = 5;
type 	

	vector = array [1.. dimF] of integer;
	
procedure leerValor(var num:integer);
begin

	writeln('Ingrese un numero');
	readln(num);

end;
	
procedure cargarV(var v:vector);
var
	i,num:integer;
	
begin

	for i:= 1 to dimF do begin
		leerValor(num);
		v[i]:= num;
	end;

end;

function maximo(v:vector;i:integer):integer;
var
	max:integer;
begin
	
	if(i <= dimF) then begin
		max:= maximo(v,i+1);
		if(v[i]> max) then begin	
			maximo:= v[i];
		end
		else begin
			maximo:= max;
		end;
	end
	else begin
		maximo:= -9999;
	end;
end;

function sumarVector(v:vector;i:integer):integer;
begin

	if(i <= dimF) then begin
		sumarVector:= v[i] + sumarVector(v,i+1);
	end
	else begin
		sumarVector:= 0;
	end;
end;

procedure busquedaDicotomica(v:vector; ini,fin:integer; dato:integer;var pos:integer);
var
	med:integer;
begin
	
	if(ini <= fin) then begin
		med:= (ini + fin ) div 2;
		if(v[med] = dato) then begin
			pos:= med;
		end
		else begin
			if(v[med] < dato) then begin
				busquedaDicotomica(v,ini,med-1,dato,pos);
			end
			else begin
				busquedaDicotomica(v,med+1,fin,dato,pos);
			end;
		end;
	
	
	end
	else begin
		pos:= -1;
	end;
end;
	
procedure pasarABinario(num:integer);
var
	resto:integer;
begin

	if(num = 1) then begin
		write(1);
	end
	else begin
		resto:= num MOD 2;
		write(resto);
		pasarABinario(num DIV 2);
	end;
end;
	
var
	v:vector;
	valMax,sumaTotal,i,numParaBinario:integer;
	
BEGIN
	i:=1;
	sumaTotal:= 0;
	cargarV(v);
	
	valMax:= maximo(v,i);
	
	writeln('Max: ', valMax);	
	
	writeln;
	writeln('-------------------');
	writeln;
	
	sumaTotal:= sumarVector(v,i);
	writeln('Suma total: ', sumaTotal);
	
	writeln;
	writeln('-------------------');
	writeln;
	
	writeln('ingrese un numero para pasar a binario');
	readln(numParaBinario);
	pasarABinario(numParaBinario);
	
	
END.

