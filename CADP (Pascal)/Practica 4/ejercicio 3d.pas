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
    
procedure imprimirVector (v:vector; dimL:integer; posX:integer; posY:integer);
var
    i:integer;
begin   
    
    if (posX < posY) then begin
        for i:= posX to posY do
            writeln (i ,'-' , v[i]);
    end;
    if (posX > posY) then begin
            for i:= posX downto posY do
            writeln (i ,'-' , v[i]);
    end;
end;
    
var
    v:vector;
    posX,posY,dimL:integer;
    
begin



    inicializarVector(v);
    cargarVector(v,dimL);
    
    writeln ('Ingrese la posicion X (Menor o igual a ', dimL , ')');
    readln (posX);
    writeln ('Ingrese la posicion Y');
    readln (posY);
    
    imprimirVector (v,dimL,posX,posY);

end.
    