program ejer1practica3;
type 
    str20 = string[20];
    alumno = record 
        codigo: integer;
        nombre: str20;
        promedio: real;
    end;
    
procedure maximo (var nom_max:str20;var max:real; a:alumno);
begin
    
    if (a.promedio > max) then begin
        max:= a.promedio;
        nom_max:= a.nombre;
    end;
end;    
    
procedure leer_y_analizar (var a:alumno;var cant_alu: integer; var nom_max:str20;var max:real);
begin
    writeln ('Ingrese el codigo del alumno');
    readln (a.codigo);
    while (a.codigo <> 0) do begin
        writeln ('Ingrese el nombre del alumno');
        readln (a.nombre);
        cant_alu:= cant_alu+1;
        writeln('Ingrese el promedio del alumno');
        readln (a.promedio);
        maximo (nom_max, max,a);
        writeln ('Ingrese el nuevo codigo de alumno');
        readln (a.codigo);
    end;
end;


var
    a: alumno;
    cant_a: integer;
    max: real;
    n_max:str20;
begin 
    
    max:= 0;n_max:=''; cant_a:=0;
   
    leer_y_analizar(a,cant_a,n_max,max);
    
    writeln ('La cantidad de alumnos leida es: ', cant_a);
    writeln('El alumno con mejor promedio es: ', n_max);
     
end.


