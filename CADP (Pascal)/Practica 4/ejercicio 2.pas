program ejercicio2;
const
    cant_datos = 150;
type
    vector = array [1..cant_datos] of real;

procedure cargarVector (var v:vector; var dimL: integer);
var
 num:real;
 i,cont: integer;
begin
    cont:=1;
    writeln('Ingrese un numero real');
    readln (num);
    while (num <> 0) and (dimL <= cant_datos) do begin
        v[cont]:= num;
        dimL:= dimL+1;
        cont:= cont+1;
        writeln ('Ingrese otro numero');
        readln (num);
    end;
    
    for i:= 1 to dimL do begin
        writeln (i ,'-', v[i]:2:2);
        writeln ('La dimension logica del vector es: ', dimL);
    end;
end;


procedure modificarVectorySumar (var v:vector;dimL:integer; n:real; var suma:real);
var
    i:integer;
begin 
    for i:= 1 to dimL do begin
        writeln ((v[i] + n):2:2);
        suma:= suma+ v[i];
    end;
end;
var 
    v:vector;
    i, dim:integer;
    num,suma: real;

begin
    dim:= 0;
    suma:= 0;
    cargarVector(v,dim);
    writeln ('Ingrese un valor a sumar');
    readln (num);
    modificarVectorySumar(v,dim,num,suma);
    writeln ('La suma de los valroes es: ', suma:2:2);
    writeln ('Se procesaron ', dim, ' numeros');
end.
    
    
    
    
    
    
    