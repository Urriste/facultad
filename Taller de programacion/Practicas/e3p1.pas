program e3p1;
const

	max_rubro:8;
var
	rProductos = record
		codigoP:integer;
		codigoR: 1..max_rubro;
		precio:real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato: rProductos;
		sig:lista;
	end;
	
	vListasPorRubro = array[1..max_rubro] of lista;
	
	

BEGIN
	
	
END.

