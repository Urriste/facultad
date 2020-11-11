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

procedure minimo (var v:vector; var min:integer;var pos:integer);
var
    i:integer;
begin

    for i:= 1 to dimF do begin
        if (v[i] < min) then begin
            min:= v[i];
            pos:= i;
        end;
    end;
end;

var
    v:vector;
    min,pos:integer;
begin
    
    min:= 9999;
    pos:=0;
    
    iniVector(v);
    cargarVector(v);
    minimo (v,min,pos);
    
    writeln('La posicion del elemento minimo es: ', pos);

end.

