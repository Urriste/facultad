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

procedure maximo (var v:vector; var max:integer;var pos:integer);
var
    i:integer;
begin

    for i:= 1 to dimF do begin
        if (v[i] > max) then begin
            max:= v[i];
            pos:= i;
        end;
    end;
end;

var
    v:vector;
    max,pos:integer;
begin
    
    max:= 0;
    pos:=0;
    
    iniVector(v);
    cargarVector(v);
    maximo (v,max,pos);
    
    writeln('La posicion del elemento maximo es: ', pos);

end.

