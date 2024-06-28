
Program Bizarp2023;

Const 
  maxGenero = 5;

Type 
  generoM = 1..maxGenero;
  sesion = Record
    titulo: String;
    nombreArtista: string;
    generoMusica: generoM;
    cantViualizaciones: Integer;
  End;
  listSesion = ^nodo;
  nodo = Record
    elem: sesion;
    sig: listSesion;
  End;
  contadorGeneros = array[generoM] Of Integer;

Procedure crearLista(Var s:listSesion);
Begin
  s := Nil;
End;
Procedure inicializarVector(Var vec: contadorGeneros);

Var 
  i: Integer;
Begin
  For i:= 1 To maxGenero Do
    Begin
      vec[i] := 0;
    End;
End;
Procedure cargarSesion(Var s: sesion);
Begin
  ReadLn(s.titulo);
  ReadLn(s.nombreArtista);
  ReadLn(s.generoMusica);
  ReadLn(s.cantViualizaciones);

End;
Procedure insertarOrdenado (Var sesiones: listSesion;s: sesion);

Var 
  aux, act, ant: listSesion;
Begin
  New(aux);
  aux^.elem := s;
  act := sesiones;
  ant := sesiones;
  While  act <> Nil And s.titulo>act^.elem.titulo Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If act=ant Then
    Begin
      sesiones := aux;
    End
  Else
    Begin
      ant^.sig := aux;
    End;
  aux^.sig := act;

End;
Procedure cargarLista(Var sesiones:listSesion; Var contadorG: contadorGeneros);

Var 
  s: sesion;
Begin
  Repeat
    cargarSesion(s);
    contadorG[s.generoMusica] := contadorG[s.generoMusica]
                                 + s.cantViualizaciones;
    insertarOrdenado(sesiones,s);
  Until s.nombreArtista = 'Peso Pluma';
End;
Function Igualdigitos(Viualizaciones: Integer): Boolean;

Var 
  digit,par,impar: integer;
Begin
  par := 0;
  impar := 0;
  While Viualizaciones<>0 Do
    Begin
      digit := Viualizaciones Mod 10;
      Viualizaciones := Viualizaciones Div 10;
      If (digit Mod 2)=0 Then
        Begin
          par := par+1;
        End
      Else
        impar := impar*1;
    End;
  Igualdigitos := (par=impar);
End;
Procedure procesarDatos(sesiones:listSesion; contadorG:contadorGeneros;
                        Var code: integer;Var  code2: Integer;Var cantSesion:
                        Integer);

Var 
  i,max: Integer;
Begin
  max := -1;
  For i:=1 To maxGenero Do
    Begin
      If contadorG[i]> max Then
        Begin
          code2 := code;
          code := contadorG[i];
        End;
    End;
  While sesiones<>Nil Do
    Begin
      If (sesiones^.elem.generoMusica=2) And
         (Igualdigitos(sesiones^.elem.cantViualizaciones))Then
        Begin
          cantSesion := cantSesion+1;
        End;
    End;
End;

Procedure eliminarSesion(Var sesiones:listSesion; tituloAeliminar:String);

Var 
  act, ant: listSesion;
Begin
  act := sesiones;
  ant := sesiones;
  While (act<> Nil) And (tituloAeliminar<> act^.elem.titulo) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act<>Nil) And (act^.elem.titulo = tituloAeliminar) Then
    Begin
      If act= sesiones Then
        sesiones := act^.sig
      Else
        ant^.sig := act^.sig;
      Dispose(act);
    End
  Else
    WriteLn('no se encontro la sesion a eliminar');
End;

Var 
  sesiones: listSesion;
  contadorG: contadorGeneros;
  tituloAeliminar: String;
  code,code2: Integer;
  cantSesion: Integer;

Begin
  cantSesion := 0;
  crearLista(sesiones);
  inicializarVector(contadorG);

  cargarLista(sesiones,contadorG);
  procesarDatos(sesiones,contadorG, code,code2,cantSesion);

  WriteLn('los dos codigos con mas visualizaciones: ', code, code2);
  WriteLn('cantidad de sesiones de genero reggaeton, ', cantSesion);

  WriteLn('ingrese un titulo que quiera borrar');
  ReadLn(tituloAeliminar);
  eliminarSesion(sesiones, tituloAeliminar);

End.
