
Program main5;

Type 
  producto = Record
    codigo : Integer;
    descripcion: String;
    stockA: integer;
    stockM: Integer;
    precio: real;
  End;
  listaProductos = ^nodo;
  listaDescripciones = ^nodo;
  nodo = Record
    elem: producto;
    sig: listaProductos;
  End;

Procedure CrearLista(Var lp: listaProductos);
Begin
  lp := Nil;
End;

Procedure AgregarNodoLista(Var lp: listaProductos; produ: producto);

Var 
  aux: listaProductos;
Begin
  New(aux);
  aux^.elem := produ;
  aux^.sig := Nil;
  // evalua si el primer caso esta vacio en ese caso lo agrega ahi
  If (lp= Nil) Then lp := aux
  Else
    Begin
      aux^.sig := lp;
      lp := aux;
    End;
End;

Procedure CargarProducto(Var p:producto; Var  condicion: boolean);
Begin
  ReadLn(p.codigo);
  If p.codigo <> -1 Then
    Begin
      ReadLn(p.descripcion);
      ReadLn(p.stockA);
      ReadLn(p.stockM);
      ReadLn(p.precio);
      condicion := true;
    End
  Else
    condicion := False;
End;


Function DigitosPares(codigo: Integer): Boolean;

Var 
  digito: Integer;
  cantPares: Integer;
Begin
  cantPares := 0;
  While (codigo <> 0) And (cantPares <= 3) Do
    Begin
      digito := codigo Mod 10;
      If (digito Mod 2 = 0) Then
        cantPares := cantPares + 1;
      codigo := codigo Div 10;
    End;
  DigitosPares := (cantPares = 3);
End;


Procedure dosProductosMasBaratos(lp: listaProductos; Var minimo: Real;
                                 Var minimo2:real; Var codigo: integer;
                                 Var codigo2: integer);
Begin
  While lp<> Nil Do
    Begin
      If lp^.elem.precio < minimo Then
        Begin
          minimo2 := minimo;
          codigo2 := codigo;
          codigo := lp^.elem.codigo;
          minimo := lp^.elem.precio;
        End
      Else If lp^.elem.precio < minimo2 Then
             Begin
               minimo2 := lp^.elem.precio;
               codigo2 := lp^.elem.codigo;
             End;
      lp := lp^.sig;
    End;
End;

Var 
  produ: producto;
  listaProdu,aux: listaProductos;
  listaDescripcion,auxDescripciones: listaDescripciones;
  condicion: Boolean;
  cantProduAReponer, cantProductos: Integer;
  porcentaje: Real;
  minimo,minimo2: Real;
  codigo,codigo2: integer;
Begin
  cantProduAReponer := 0;
  cantProductos := 0;
  minimo := 9999;
  CrearLista(listaProdu);
  CargarProducto(produ, condicion);
  While condicion= True Do
    Begin
      AgregarNodoLista(listaProdu, produ);
      CargarProducto(produ, condicion);
    End;
  // recorrer la lista
  aux := listaProdu;
  While aux<>Nil Do
    Begin
      If aux^.elem.stockA< aux^.elem.stockM Then
        Begin
          cantProduAReponer := cantProduAReponer+1;
        End;
      //  las descripciones de todos los productos de 3 digitos pares
      If DigitosPares(aux^.elem.codigo) Then
        Begin
          AgregarNodoLista(listaDescripcion, aux^.elem);
        End;
      cantProductos := cantProductos+1;
      aux := aux^.sig;
    End;

  dosProductosMasBaratos(listaProdu, minimo, minimo2, codigo,codigo2);
  WriteLn('codigo de los 2 productos mas baratos: ', codigo, codigo2);
  porcentaje := ((cantProduAReponer/cantProductos)*100);
  WriteLn('el porcentaje de prodcutos a reponer es: ', porcentaje,'%');
  //Recorrer la lista de descripciones y mostralas
  auxDescripciones :=  listaDescripcion;
  While auxDescripciones <> Nil Do
    Begin
      WriteLn('descipcion de los productos compuestos'
              ,auxDescripciones^.elem.descripcion);
      auxDescripciones := auxDescripciones^.sig;
    End;
End.
