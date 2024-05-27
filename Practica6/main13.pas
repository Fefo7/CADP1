
Program main13;

Const 
  dimF = 3600;
  vC = 4;

Type 
  usuario = Record
    nombre = string;
    email: string;
    rol: Integer;
    revista: String;
    cantDiasAcceso: integer;
  End;
  usuarios = array[1..dimF] Of usuario;
  CantUsXRol = array [1..vC] Of Integer;
  listaRevistaEconomica = ^nodo;
  nodo = Record
    elem: usuario;
    sig: listaRevistaEconomica;
  End;
  // puede no estar este proceso
Procedure ListaOrdenadaRevista(Var listRevista:listaRevistaEconomica ;
                               usuariosRevista:usuarios);

Var 
  i: Integer;
Begin
  For i:= 1 To dimF Do
    Begin
      If usuariosRevista[i].revista = 'Economica' Then
        Begin
          CargarOrdenado(listRevista,usuariosRevista[i]);
        End;
    End;
End;
Procedure CargarOrdenado (Var listRevista: listaRevistaEconomica;
                          usuariosRevista: usuarios );

Var 
  nuevo,act,ant: listaRevistaEconomica;
Begin
  New(nuevo);
  nuevo^.elem := usuariosRevista;
  nuevo^.sig := Nil;
  If listRevista= Nil Then listRevista := nuevo
  Else
    Begin
      act := listRevista;
      ant := listRevista;
      While (listRevista<>Nil) And (nuevo^.elem.cantDiasAcceso> act^.elem.
            cantDiasAcceso) Do
        Begin
          ant := act;
          act := act^.sig;
        End;
      If act= listRevista Then
        Begin
          nuevo^.sig := listRevista;
          listRevista := nuevo;
        End
      Else
        ant^.sig := nuevo;
      nuevo^.sig := act;
    End;
End;

Procedure ContarCantUsuarios (us: usuarios; Var vectorContador: CantUsXRol;);

Var 
  i: Integer;
Begin
  vectorContador[1] := 0;
  vectorContador[2] := 0;
  vectorContador[3] := 0;
  vectorContador[4] := 0;
  For i:= 1 To dimF Do
    Begin
      Case us[i].rol Of 
        1: vectorContador[1] := vectorContador[1]+1;
        2: vectorContador[2] := vectorContador[2]+1;
        3: vectorContador[3] := vectorContador[3]+1;
        3: vectorContador[4] := vectorContador[4]+1;
      End;
    End;
End;
Procedure DosUsNoIngresantes(us:usuarios; maximo,maximo2:Integer; email,email2:
                             String;Var listRevista: listaRevistaEconomica);

Var 
  i: Integer;
Begin
  For i:= 1 To dimf Do
    Begin
      If us[i].revista = 'Economica' Then
        Begin
          CargarOrdenado(listRevista,us[i]);
        End;

      If us[i].cantDiasAcceso > maximo Then
        Begin
          maximo2 := maximo;
          email2 := email;
          maximo := us[i].cantDiasAcceso;
          email := us[i].email;
        End
      Else If (us[i].cantDiasAcceso> maximo2)Then
             Begin
               maximo2 := us[i].cantDiasAcceso;
               email2 := us[i].email;
             End;
    End;
End;

Var 
  usuariosRevista: usuarios;
  listRevista: listaRevistaEconomica;
  maximo,maximo2: Integer;
  email,email2: String;
  vectorContador: CantUsXRol;
Begin
  cargarUsuarios(usuariosRevista);
  listRevista := Nil;
  maximo := -1;
  DosUsNoIngresantes(usuariosRevista,maximo,maximo2,email,email2, listRevista);
  ContarCantUsuarios(usuariosRevista,vectorContador);
  // se dispone
  While listRevista<> Nil Do
    Begin
      WriteLn(listRevista^.elem.nombre,listRevista^.elem.cantDiasAcceso);
      listRevista := listRevista^.sig;
    End;

  WriteLn('1. editor: ',  vectorContador[1]);
  WriteLn('2. autor: ',  vectorContador[2]);
  WriteLn('3. revisor: ',  vectorContador[3]);
  WriteLn('4. lector: ',  vectorContador[4]);
  WriteLn('los dos usuraios que hace mucho no ingresan son: ', email, 'y ',
          email2);
End.
