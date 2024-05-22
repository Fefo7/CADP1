
Program main8;

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
  {se busca la posicion donde vas a insertar posicionas los punteros}

{si quiero que sea de menor a mayo tiene que ir > por que vas buscando si tiene algun mayor}

{si quiero que sea de mayor a menor tiene que ir < por que vas buscando si tiene algun menor}
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
Begin

End.
