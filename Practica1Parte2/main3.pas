
Program main3;

Var 
  Nombre, Clave: String;
  nota: Integer;
  CantAprobados,Cant7Nota: Integer;
Begin
  Clave := 'Zidane Zinedine';
  CantAprobados := 0;
  Cant7Nota := 0;
  Repeat
    WriteLn('ingrese el nombre del alumno');
    ReadLn(Nombre);
    If Nombre <> Clave Then
      Begin
        WriteLn('ingrese la nota del alumno');
        ReadLn(nota);
        If nota>=8  Then
          CantAprobados := CantAprobados+1;
        If nota=7 Then
          Cant7Nota := Cant7Nota+1;
      End;
  Until Nombre = Clave;
  WriteLn(CantAprobados);
  WriteLn(Cant7Nota)
End.
