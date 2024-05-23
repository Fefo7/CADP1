
Program main9;

Type 
  lista = ^nodo;
  nodo = Record
    num : integer;
    sig : lista;
  End;
Procedure armarNodo(Var L: lista; num: integer);

Var 
  aux : lista;
  act,ant: lista;
Begin
  new(aux);
  aux^.num := num;
  act := L;{seria como el posterior al que quiero insertar}
  ant := L;
  While (act<> Nil) And (num > act^.num) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act = ant) Then {agregas al inicio o si esta vacia la lista}
    l := aux
  Else {insertar al medio o al final}
    ant^.sig := aux;
  aux^.sig := act;
End;

Function ListaOrdenada(list:lista): Boolean;
//preguntar al profe si esta bien pensado que la lista sea de menor a mayor?























//supuse que era menor a mayor, entonces siempre el siguiente tiene que ser mayor, si no es mayor el siguiente quiere decir que no esta ordenada

Var 
  ordenada: Boolean;
  siguiente: Integer;
Begin
  ordenada := True;
  siguiente := -999;
  While (list <> Nil)  And ordenada Do
    Begin
      If list^.num > siguiente Then
        Begin
          ordenada := True;
          siguiente := list^.num;
          list := list^.sig;
        End
      Else
        ordenada := False;
    End;
  ListaOrdenada := ordenada;
End;

Procedure eliminarElementoLista(Var list: lista; numABorrar:Integer);

Var 
  act,ant: lista;
Begin
  act := list;
  While (act<> Nil) And (numABorrar <> act^.num) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If act <> Nil Then
    Begin
      If act = list Then
        Begin
          list := list^.sig;
        End
      Else
        ant^.sig := act^.sig;
      Dispose(act);
    End
  Else
    Begin
      WriteLn('no esta tu numero a borrar');
    End;
End;
Procedure eliminarElementoListaMasDeDosVeces(Var list: lista; numABorrar:Integer
);

Var 
  act,ant: lista;
Begin
  act := list;
  While (act<> Nil)   Do
    Begin
      If (numABorrar <> act^.num) Then
        Begin
          ant := act;
          act := act^.sig;
        End
      Else
        Begin
          If act = list Then
            Begin
              list := list^.sig;
            End
          Else
            ant^.sig := act^.sig;
          Dispose(act);
          act := ant;
        End

    End;

End;

Begin

End.
