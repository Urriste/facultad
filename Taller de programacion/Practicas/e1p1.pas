program p1e1;
const

	dimF = 5;
	
type
	
	office = record
		code: integer;
		dni:integer;
		expValue:real;
	end;
		
	
	vOffice = array[1..dimF] of office;
	
procedure readOffice (var o: office);
begin 

	o.code:= random(12) - 1;
	if (o.code <> -1) then begin 
		o.dni:= random(5000);
		o.expValue:= random(500)
	end;
end;

procedure selectionSort(var v:vOffice; dimL: integer);
var
	i,j,p:integer;
	item:office;
begin
	
	for i:= 1 to dimL - 1 do begin
		p:= i;
		for j:= i+1 to dimL do begin
			if(v[j].code > v[p].code) then begin
				p:=j;
			end;
		end;
		
		item:= v[p];
		v[p]:= v[i];
		v[i]:= item;
	
	end;	
end;

procedure insertionSort(var v:vOffice);
var
	actual:office;
	i,j:integer;
begin

	for i:= 2 to dimF do begin
		actual:= v[i];
		j:= i - 1;
		while (j > 0) and (v[j].code > actual.code) do begin
			v[j + 1]:= v[j];
			j:= j - 1;
		end;
		v[j+1]:= actual;
	end;

end;
		
procedure loadV(var v:vOffice;var dimL:integer);
var
	o:office;
begin

	readOffice(o);
	dimL:= 0;
	while (o.code <> -1) and (dimL < dimF) do begin
		dimL:= dimL + 1;
		v[dimL]:= o;
		readOffice(o)
	end;
	
end;

procedure writeV (v:vOffice; dimL:integer);
var 
	i:integer;
begin

	for i:= 1 to dimL do begin
		writeln(v[i].code, '|');
	end;	

end;

var

	v:vOffice;
	dimL:integer;
	
BEGIN
	randomize;
	
	loadV(v,dimL);
	writeV(v,dimL);
	insertionSort(v);
	
	writeln;
	writeln('------------------------ Array insertion sort ----------------------');
	writeV(v,dimL);
	
	selectionSort(v,dimL);
	writeln;
	writeln('------------------------ Array selection sort ----------------------');
	writeV(v,dimL);
	
END.

