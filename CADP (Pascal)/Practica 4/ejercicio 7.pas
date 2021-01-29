program ejercicio7;
const
    dimF = 10;
type
    str20 = string[20];
    vector = array [1..dimF] of str20;
    

procedure cargarVector (var v:vector;var dimL:integer);
var
    nombre:str20;
begin
    dimL:= 0;
    writeln ('Ingrese un nombre');
    readln (nombre);
    while (nombre <> 'ZZZ') and (dimL <= dimF) do begin
         dimL:= dimL+1;
        v[dimL]:= nombre;
        writeln ('Ingrese otro nombre');
        readln (nombre);
   
        
    end;
end;


procedure insertarElemento (var v:vector;var dimL:integer;nomb_insertar:str20;pos:integer);
var
    i:integer;
begin

    if ( ((dimL +1) <= dimF) and (pos <= dimL) and (pos >= 1) ) then begin
        for i:= dimL downto pos do 
            v[i+1]:= v[i];
        v[pos]:= nomb_insertar;
        dimL:= dimL+1;
    end;
end;

procedure agregarElemento (var v:vector;var dimL:integer;nomb_agregar:str20);
begin

    if ((dimL +1) <= dimF) then begin
        v[dimL+1]:= nomb_agregar;
        dimL:= dimL+1
    end;
end;

procedure borrarElemento (var v:vector;var dimL:integer;pos:integer);
var 
    i:integer;
begin

     for i := pos to dimL do
        v[i] := v[i+1];
    dimL := dimL - 1;

end;


procedure imprimirVector (v:vector);
var
    i:integer;
begin

    for i:= 1 to dimF do 
        writeln (v[i]);

end;

var

    v:vector;
    pos,dimL:integer;
    nomb_agregar,nomb_insertar,nomb_eliminar:str20;

begin

    cargarVector(v,dimL);
    
    
    writeln ('Ingrese un elemento a insertar');
    readln (nomb_insertar);
    writeln('Ingrese la posicion en la que lo quiere insertar');
    readln (pos);
    insertarElemento(v,dimL,nomb_insertar,pos);
    
    writeln ('Ingrese un nombre para agregar al final del vector');
    readln (nomb_agregar);
    agregarElemento(v,dimL,nomb_agregar);
    
    writeln ('Ingrese una posicion a eliminar');
    readln (pos);
    borrarElemento(v,dimL,pos);

    imprimirVector(v);

end.
















