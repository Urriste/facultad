program ejercicio11;
const
    dimF = 3;
type
    
    str20 = string[20];
    
    fotos = record 
        titulo:str20;
        autor:str20;
        cant_mg:integer;
        cant_clicks:integer;
        cant_coment:integer;
    end;
    
    vector = array [1..200] of fotos;
    
procedure fotoMasVista (v:vector;var titulo_mas_vista:str20;var max:integer);
var 
    i:integer;
begin

    for i:= 1 to dimF do begin    
        if (v[i].cant_clicks > max) then begin
            max:= v[i].cant_clicks;
            titulo_mas_vista:= v[i].titulo;
        end;
    end;
end;
    
    
procedure cargarVectorProcesarDatos (var v:vector;var r:fotos;var mg_vandelay:integer;var tot_coment:integer;var max:integer;var titulo_mas_vista:str20);
var 
    i:integer;
begin

    for i:= 1 to dimF do begin
        writeln('Ingrese el titulo de su foto');
        readln (r.titulo);
        
        writeln ('Ingrese el autor de la foto');
        readln (r.autor);
        
        writeln ('Ingrese la cantidad de me gustas de la foto');
        readln (r.cant_mg);
        if (r.autor = 'Art Vandelay') then 
            mg_vandelay:= mg_vandelay + r.cant_mg;
            
        writeln ('Ingrese la cantidad de clicks que obtuvo esa foto');
        readln (r.cant_clicks);
        
        
        writeln ('Ingrese la cantidad de comentarios que obtuvo la foto ');
        readln (r.cant_coment);
        tot_coment:= tot_coment + r.cant_coment;
        v[i]:= r;
    end;    
end;
    
    
var
    v:vector;
    r:fotos;
    mg_vandelay,tot_coment,max:integer;
    titulo_mas_vista:str20;
begin

    cargarVectorProcesarDatos (v,r,mg_vandelay,tot_coment,max,titulo_mas_vista);
    fotoMasVista (v,titulo_mas_vista,max);
    
    writeln('El titulo de la foto mas vista es: ', titulo_mas_vista);
    writeln ('La cantidad de me gustas para el artista Art Vandelay es de: ', mg_vandelay);
    writeln ('La cantidad de comentarios recibida fue de: ', tot_coment);


end.
    
    
    
    
    
    