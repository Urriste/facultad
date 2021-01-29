program ejercicio4;
const
    dimF = 5;
type 
    
    vector = array [1..dimF] of integer;

procedure iniVector (var v:vector);
var
    i:integer;
    
begin
    for i:= 1 to dimF do
        v[i]:= 0;
end;


procedure cargarVector (var v:vector);
var
    num,i:integer;
begin

    for i:= 1 to dimF do begin
        writeln ('Ingrese un numero');
        readln (num);
        v[i]:= num;
    end;
end;

procedure sumarVector (var v:vector; var suma:integer);
var
    i:integer;
begin

    for i:= 1 to dimF do 
        suma:= suma + v[i]

end;

var
    v:vector;
    suma:integer;
begin
    
    suma:= 0;
    
    iniVector(v);
    cargarVector(v);
    sumarVector(v,suma);

    writeln('La suma de todos los valores del array es: ', suma);
    

end.

