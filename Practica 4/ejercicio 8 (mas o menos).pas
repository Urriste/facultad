program ejercicio8;
const
    dimF = 3;
type 

    str20 = string[20];

    alumnos = record 
        nro_inscipcion:integer;
        dni:integer;
        apellido:str20;
        nombre:str20;
        anio_nac:integer;
    end;
    
    vector = array [1..dimF] of alumnos;
     
    
procedure cargarRegistro (var a:alumnos);
begin

    writeln ('Ingrese el numero de inscripcion');
    readln (a.nro_inscipcion);
    
    writeln ('Ingrese su dni');
    readln (a.dni);
    
    writeln ('Ingrese su apellido');
    readln (a.apellido);
    
    writeln ('Ingrese su nombre');
    readln (a.nombre);
    
    writeln('Ingrese su año de nacimiento');
    readln(a.anio_nac);

end;

procedure minimos (a:alumnos;var nom_min:str20;var ap_min:str20;var min1:integer;var min2:integer;var nom_min2:str20;var ap_min2:str20);
begin

    if (a.anio_nac < min1) then begin
        min2:= min1;
        min1:= a.anio_nac;
        nom_min:= a.nombre;
        ap_min:= a.apellido;
    end;
    if (a.anio_nac < min2) then begin
        min2:= a.anio_nac;
        nom_min2:= a.nombre;
        ap_min2:= a.apellido;
    end;
    
end;

var
    a:alumnos;
    v:vector;
    nom_min,ap_min,nom_min2,ap_min2:str20;
    min1,min2,dimL,i:integer;

begin
    
    min1:= 2020;
    min2:=2020;
    dimL:=0;


    for i:= 1 to dimF do begin
        cargarRegistro (a);
        minimos (a,nom_min,ap_min,min1,min2,ap_min,nom_min2);
        v[dimL]:= a;
        dimL:=dimL+1;
    end;
    
    writeln ('Los mas viejos son: ', nom_min ,ap_min ,' y ', nom_min2 , ap_min2);
    
end.

