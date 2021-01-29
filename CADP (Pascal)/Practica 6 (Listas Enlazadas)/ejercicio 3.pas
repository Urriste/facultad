program JugamosConListas;

type
    lista = ^nodo;
    nodo = record   
        num : integer;  
        sig : lista;
    end;
var 
    pri,ult : lista;  
    valor : integer;
    
procedure armarNodo(var l,ult: lista; v: integer);
var  
    aux : lista;
begin  
    new(aux);
    aux^.num := v;
    aux^.sig := l;
    if (l = nil) then begin
        l := aux;
    end
    else
    ult^.sig := aux;
    ult:= aux;
        
        
end;

procedure incrementarLista (var p:lista;valInc:integer);
begin

    while (p^.sig <> nil) do begin
        p^.num:= p^.num + valInc;
        p:= p^.sig;
    end;
        
end;

procedure imprimirLista (p:lista);
begin

    while (pri^.sig <> nil) do begin
        writeln(pri^.num);
        pri:= pri^.sig;
    end;

end;

var 
    valInc: integer;

begin
    pri := nil; 
    writeln('Ingrese un numero');
    read(valor);  
    while (valor <> 0) do begin 
        armarNodo(pri,ult, valor);  
        writeln('Ingrese un numero');  
        read(valor); 
    end;

    imprimirLista(pri);
    

    
end.