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


procedure imprimirLista (p:lista);
begin

    while (pri^.sig <> nil) do begin
        writeln(pri^.num);
        pri:= pri^.sig;
    end;

end;

procedure maximo (p:lista;var max:integer);
begin

		if (p^.num > max) then begin
		 	max:= p^.num;
		 end;	
	
end;

procedure minimo (p:lista;var min:integer);
begin

		if (p^.num < min) then begin
		 	min:= p^.num;
		 end;	
	
end;

procedure multiplos (p:lista;multiplo:integer;var total:integer);
begin

	if ((p^.num mod multiplo) = 0) then 
		total:= total +1;

end;

var 
	max,min,total,multiplo: integer;

begin

	max:= -1;
	min:= 27800;
	multiplo:= 5; //ingresar el multiplo que se desee//
	total:= 0;


    pri := nil; 
    writeln('Ingrese un numero');
    read(valor);  
    while (valor <> 0) do begin 
        armarNodo(pri, valor);  
        maximo(pri,max);
        minimo(pri,min);
        multiplos(pri,multiplo,total);
        writeln('Ingrese un numero');  
        read(valor); 
    end;

   // imprimirLista(pri); //
    
    writeln('La cantidad de multiplos de ', multiplo , ' es ', total);
	writeln('El nodo mas grande es: ', max);
	writeln('El nodo mas chico es: ', min);
    
end. 
