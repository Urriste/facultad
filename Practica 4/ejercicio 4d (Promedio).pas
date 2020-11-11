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

procedure promedio (var v:vector; var suma:real;var prom:real);
var
    i:integer;
begin

    for i:= 1 to dimF do 
        suma:= suma + v[i];
    
    prom:= suma / dimF;
    
end;

var
    v:vector;
    suma,prom:real;
begin
    
    suma:= 0;
    prom:=0;
    
    iniVector(v);
    cargarVector(v);
    promedio(v,suma,prom);

    writeln('El valor promedio del vector es: ', prom:2:0);
    

end.

