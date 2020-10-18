program ejercicio5;
type 
    str20 = string[20];
    autos = record
        marca: str20;
        modelo: integer;
        precio: real;
    end;

procedure leerDatos (var a:autos);
begin
    with a do begin
        writeln ('Ingrese la marca del auto');
        readln (marca);
        if (marca <> 'ZZZ') then begin
            writeln ('Ingrese el modelo del auto');
            readln (modelo);
            writeln('Ingrese el precio del auto');
            readln (precio);
        end;
    end;
end;


procedure maximo (a:autos;var marca_max: str20;var modelo_max:integer; var max: real);
begin

    if (a.precio > max) then begin
        marca_max:= a.marca;
        modelo_max:= a.modelo;
        max:= a.precio;
    end;
end;
var
    a:autos;
    marca_max,marca_actual: str20;
    modelo_max,cont:integer;
    max:real;
    promedio_marca: real;

begin
    
    max:= 0;modelo_max:=0;promedio_marca:=0;marca_max:='';
    
    leerDatos(a);
    while (a.marca <> 'ZZZ') do begin
       marca_actual:= a.marca;
       promedio_marca:= 0;
        while (marca_actual = a.marca) do begin
            promedio_marca:=promedio_marca + a.precio;
            maximo (a,marca_max,modelo_max,max);
            cont:= cont+1;
            leerDatos(a);
        end;
        promedio_marca:= promedio_marca/cont;
        writeln ('El precio promedio de la marca es: ', promedio_marca:6:6);
    end;
    writeln ('El auto mas caro es un ', marca_max , ' modelo ', modelo_max);

end.





