program JugamosConListas;

type
    lista = ^nodo;
    nodo = record   
        num : integer;  
        sig : lista;
    end;
var 
    pri : lista;  
    valor : integer;
    
procedure armarNodo(var L: lista; v: integer);
var  
    aux : lista;
begin  
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
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
        armarNodo(pri, valor);  
        writeln('Ingrese un numero');  
        read(valor); 
    end;

    imprimirLista(pri);
    
    
    writeln ('Ingrese un valor para incrementar cada numero de su lista');
    readln(valInc);
    incrementarLista(pri,valInc);

    
end.


