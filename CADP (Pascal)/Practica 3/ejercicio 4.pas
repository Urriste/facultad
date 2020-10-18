program ejercicio4;
const
    dimF = 2;
    costo_minutos = 3.40;
    costo_mb = 1.35;
type 
    linea = record 
        num_telefono: integer;
        min_cons:integer;
        mb_cons:integer;
    end;
    
    cliente = record
        cod_cliente : integer;
        cant_lineas: integer;
    end;    
    
procedure leerCliente (var c: cliente);
begin

    writeln ('Ingrese su codigo de cliente');
    readln (c.cod_cliente);
    writeln ('Ingrese la cantidad de lineas que posee');
    readln (c.cant_lineas);
    
end;


procedure leerLinea (var l:linea);
begin 

    writeln ('Ingrese el numero de telefono');
    readln (l.num_telefono);
    writeln ('Ingrese la cantidad de minutos consumidos');
    readln (l.min_cons);
    writeln ('Ingrese la cantidad de MB consumidos');
    readln (l.mb_cons);

end;
procedure calcularTotal (var c:cliente; var costoMb_total,costoMin_total: real);
var
    i: integer;
    l:linea;
begin
    for i:= 1 to c.cant_lineas do begin
        leerLinea (l);
        costoMb_total:= costoMb_total + l.mb_cons;
        costoMin_total:= costoMin_total + l.min_cons;
    end;
end;
var 
    costoMb_total,costoMin_total:real;
    l:linea;
    c:cliente; 
    i:integer;
begin

    for i:= 1 to dimF do begin
        leerCliente (c);
        leerLinea (l);
        calcularTotal (c,costoMb_total,costoMin_total);
        costoMin_total:= costoMin_total * costo_minutos;
        costoMb_total:= costoMb_total * costo_mb;
        writeln ('Los montos a pagar del cliente', c.cod_cliente, 'es de ', costoMb_total:2:0, 'y', costoMin_total:2:0);
    end;
end.
