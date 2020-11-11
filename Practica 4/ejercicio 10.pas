program ejercicio10;
const 
    dimF = 5;
type 
    
    vector = array [1..dimF] of real;
    
    
procedure cargarVector (var v:vector; var dimL:integer;var salarioTot:real);
var 
    salario:real;
begin

    writeln('Ingrese su salario');
    readln (salario);
    dimL:= dimL + 1;
    v[dimL]:= salario;
    salarioTot:= salarioTot+salario;
    while (dimL < dimF) and (salario <> 0) do begin
        writeln('Ingrese su salario');
        readln (salario);
        dimL:= dimL + 1;
        v[dimL]:= salario;
        salarioTot:= salarioTot+salario;
    end;
    
end;

procedure aumentarSalario (porcentaje:integer;v:vector;dimL:integer);
var
    i:integer;
    porcentaje_a_sumar:real;
begin

    for i:= 1 to dimL do begin
        porcentaje_a_sumar:= ((v[i] * porcentaje)/100);
        v[i]:= v[i] + porcentaje_a_sumar;
        writeln (i , '-', v[i]:2:2);
        porcentaje_a_sumar:= 0;
    end;
end;
    
procedure salarioPromedio (salarioTot:real;dimL:integer);
begin

    salarioTot:= salarioTot/dimL;
    writeln('El salario promedio es de: $', salarioTot:2:2);

end;
    
    
var
    v:vector;
    porcentaje,dimL:integer;
    salarioTot:real;
    
begin
    dimL:=0;
    porcentaje:= 0;
    
    

    cargarVector(v,dimL,salarioTot);
    
    writeln ('Ingrese el porcentaje que quiere sumarle a los salarios');
    readln (porcentaje);
    aumentarSalario (porcentaje,v,dimL);
    
    salarioPromedio (salarioTot,dimL);

end.
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    