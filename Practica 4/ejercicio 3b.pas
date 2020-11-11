program ejercicio3;
const
    dimF = 15;
type
    
    vector = array  [1.. dimF] of integer;
    
    
    
procedure inicializarVector (var v:vector);
var
    i:integer;
begin
    for i:= 1 to dimF do
        v[i]:= 0;
end;
    
    
procedure cargarVector (var v:vector; var dimL:integer);
var
    cont,num:integer;
begin
    cont:= 1;
    writeln ('Ingresar numero entero');
    readln (num);
    while (num <> 0) and (dimL <= dimF) do begin
        writeln('Ingresar otro numero entero');
        readln (num);
        v[cont]:= num;
        dimL:= dimL+1;
        cont:= cont+1;
    end;    
end;
    
procedure imprimirVector (v:vector; dimL:integer);
var
    i:integer;
begin   

    for i:= dimL downto 1 do
        writeln (i, '-' , v[i]);
    
end;
    
var
    v:vector;
    dimL:integer;
begin
    inicializarVector(v);
    cargarVector(v,dimL);
    imprimirVector (v,dimL);

end.
    