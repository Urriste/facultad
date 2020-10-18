program ejercicio2;
type 

    str15 = string[15];
    casamientos = record
        dia: integer;
        mes: str15;
        anio:integer;
    end;
procedure leer_datos (var a: casamientos; var cant_verano:integer;var p_d: integer);
begin

    
    writeln ('Ingrese su año de casamiento');
    readln (a.anio);
    while (a.anio <> 2018) do begin 
        writeln('Ingrese el mes de su casamiento');
        readln (a.mes);
        if (a.mes = 'enero') or (a.mes = 'febrero') or (a.mes = 'marzo') then
            cant_verano:= cant_verano+1;
        writeln ('Ingrese el dia de su casamiento');
        readln (a.dia);
        if (a.dia <= 10) and (a.dia > 0) then
            p_d:= p_d +1;
        writeln ('Ingrese el año de su casamiento');
        readln (a.anio);
    end;
end;

var

    a:casamientos;
    cant_verano,primeros_dias:integer;

begin

    leer_datos (a,cant_verano,primeros_dias);
    writeln ('La cantidad de casamientos que se llevaran a cabo en verano es: ', cant_verano);
    writeln ('La cantidad de casamientos que se llevan a cabo en los primeros 10 dias del mes son: ', primeros_dias);


end.

