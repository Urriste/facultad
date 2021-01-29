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

procedure buscarValor (v:vector;x:integer);
var
    c:integer;
begin
    c:= 1;
    writeln('Ingrese el valor a buscar dentro del array');
    readln (x);
    
    while (v[c] <> x) do begin
            writeln ('-1');
            c:= c+1;
    end;
    writeln ('Se ha encontrado el numero en la posición: ', c);
end;


var
    v:vector;
    x:integer;
    
begin
    
    cargarVector(v);
    buscarValor(v,x);

end.








