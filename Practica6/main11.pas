
Program main11;

Type 
  egresado = Record
    idAlumno: integer;
    apellido: String;
    promedio: real;
  End;
  ListEgresados = ^nodo;
  nodo = Record
    elem: egresado;
    sig: ListEgresados;
  End;

Procedure LeerEgresado(Var e: egresado; Var codicion:Boolean);
Begin
  ReadLn(e.idAlumno);
  If e.idAlumno <>0 Then
    Begin
      Read(e.apellido);
      Read(e.promedio);
      codicion := true;
    End
  Else
    codicion := false;
End;

Procedure crearLista(Var ListE: ListEgresados);
Begin
  ListE := Nil;
End;
Procedure crearNodoLista(Var ListE: ListEgresados; e:egresado);

Var 
  aux, act, ant: ListEgresados;
Begin
  new(aux);
  aux^.elem := e;
  aux^.sig := Nil;
  If ListE=Nil Then ListE := aux
  Else
    Begin
      ant := ListE;{si no es ta vacia ubico los punteros}
      act := ListE;
      While (act<> Nil) And (aux^.elem.promedio<act^.elem.promedio ) Do
        Begin
          ant := act;
          act := act^.sig;
        End;
      If act = ListE Then {si son iguales los primeros entonces lo agrego igual}
        Begin
          aux^.sig := ListE;
          ListE := aux;
        End
      Else
        Begin
          ant^.sig := aux;
          aux^.sig := act;
        End;
    End;
End;

Procedure cargarLista(Var ListE:ListEgresados; e:egresado);

Var 
  codicion: Boolean;
Begin
  crearLista(ListE);
  LeerEgresado(e,codicion);
  While (codicion) Do
    Begin
      crearNodoLista(ListE,e);
      LeerEgresado(e,codicion);
    End;
End;

Var 
  ListE: ListEgresados;
  e: egresado;
  contador: Integer;
Begin
  contador := 1;
  cargarLista(ListE,e);
  While (listE<> Nil) And (contador<=10)  Do
    Begin
      WriteLn('Apellido alumno: ', ListE^.elem.apellido, 'numero de alumno:',
              ListE^.elem.idAlumno);
      contador := contador+1;
      ListE := ListE^.sig;
    End;
End.
