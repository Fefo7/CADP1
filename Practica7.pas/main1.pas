
Program main1;


Type 
  CodGen = 1..5;
  persona = Record
    dni: Integer;
    apellido: String;
    nombre: string;
    edad: Integer;
    CodigoGenero: CodGen;
  End;
  listPersona = ^nodo;
  nodo = Record
    elem: persona;
    sig: listPersona;
  End;
  CantCode = array[CodGen] Of Integer;

Procedure CargarPersona(Var p:persona);
Begin
  ReadLn(p.dni);
  ReadLn(p.apellido);
  ReadLn(p.nombre);
  ReadLn(p.edad);
  ReadLn(p.CodigoGenero);
End;
Procedure CrearNodo(Var listaPerso: listPersona; p:persona);

Var 
  aux: listPersona;
Begin
  New(aux);
  aux^.elem := p;
  aux^.sig := Nil;
  If listaPerso= Nil Then listaPerso := aux
  Else
    Begin
      aux^.sig := listaPerso;
      listaPerso := aux;
    End;
End;
Function MasParesQueImpares(dni: Integer): Boolean;

Var 
  dig: Integer;
  Ispar: Integer;
  IsImpar: Integer;
Begin
  Ispar := 0;
  IsImpar := 0;
  While dni <> 0 Do
    Begin
      dig := dni Mod 10;
      If (dig Mod 2) = 0 Then
        Begin
          Ispar := Ispar+1;
        End
      Else
        Begin
          IsImpar := IsImpar+1;
        End;
      dni := dni Div 10;
    End;
  If Ispar>IsImpar Then
    MasParesQueImpares := True
  Else
    MasParesQueImpares := False;
End;
Procedure ContarCodigosGenero(Var codesGen:CantCode; code:Integer);
Begin
  Case code Of 
    1: codesGen[1] := codesGen[1]+1;
    2: codesGen[2] := codesGen[2]+1;
    3: codesGen[3] := codesGen[3]+1;
    4: codesGen[4] := codesGen[4]+1;
    5: codesGen[5] := codesGen[5]+1;
    Else
      WriteLn('codigo no permitido');
  End;
End;

Procedure eliminarPerso(Var listaPerso:listPersona; dni:integer);

Var 
  act: listPersona;
  ant: listPersona;
Begin
  act := listaPerso;
  ant := listaPerso;
  While (act <> Nil) And (act^.elem.dni <> dni) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act=ant) Then
    Begin
      listaPerso := act^.sig;
      Dispose(act);
    End
  Else
    Begin
      If act^.elem.dni = dni Then
        Begin
          ant^.sig := act^.sig;
          Dispose(act);
        End
      Else
        Begin
          WriteLn('no se encontro el dni a borrar');
        End;
    End;
End;

Procedure CargarListaPersona(Var listaPerso:listPersona; p:persona; Var
                             CantPersonasDniPar: Integer; Var codesGen: CantCode
);
Begin
  codesGen[1] := 0;
  codesGen[2] := 0;
  codesGen[3] := 0;
  codesGen[4] := 0;
  codesGen[5] := 0;
  Repeat
    CargarPersona(p);
    CrearNodo(listaPerso, p);
    If MasParesQueImpares(p.dni) Then CantPersonasDniPar := CantPersonasDniPar+1
    ;
    ContarCodigosGenero(codesGen,p.CodigoGenero);
  Until p.dni =33555444
End;

Var 
  listaPerso: listPersona;
  p: persona;
  codesGen: CantCode;

Begin
  listaPerso := Nil;
End.
