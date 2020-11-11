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



procedure min_max (var v:vector; var min:integer;var posMin:integer; var max:integer;var posMax:integer);
var
    i:integer;
begin

    for i:= 1 to dimF do begin
        if (v[i] < min) then begin
            min:= v[i];
            posMin:= i;
        end;
        if (v[i] > max) then begin
            max:= v[i];
            posMax:= i;
        end;
    end;
end;

procedure intercambiarValores (var v:vector;max:integer;min:integer; posMax:integer; posMin:integer);
var
    i:integer;
begin

    for i:= 1 to dimF do begin
        if (v[i] = max) then
            v[i]:= min;
    end;    
end;



var
    v:vector;
    max,min,posMin,posMax:integer;
begin
    
    min:= 9999;
    max:= -1;
    posMax:=0;
    posMin:=0;
    
    iniVector(v);
    cargarVector(v);
    min_max(v,min,posMin,max,posMax);

    
    intercambiarValores (v,max,min,posMax,posMin);
    
    writeln ('El elemento máximo ', max ,  ' que se encontraba en la posición ', posMax , ' fue intercambiado con el elemento mínimo ', min ,' que se encontraba en la posición ', posMin);
    
    
end.
