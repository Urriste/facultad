program ejercicio4;
const
    dimF = 5;
type 
    
    vector = array [1..dimF] of integer;

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

procedure intercambiarValor (var v:vector);
var
    i,x,y:integer;
begin
    writeln('Ingrese el valor a buscar dentro del array');
    readln (x);
    
    writeln('Ingrese el valor para intercambiar');
    readln(y);
    
    for i:= 1 to dimF do begin
        if (v[i] = x) then
            v[i]:= y;
    end;    
end;

procedure imprimirVector (v:vector);
var
    i:integer;
begin

    for i:= 1 to dimF do
        writeln (i , '-', v[i]);

end;




var
    v:vector;
 
begin
    
    cargarVector(v);
    intercambiarValor(v);
    imprimirVector(v)

end.

