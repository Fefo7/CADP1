
Program main6;

Var 
  NumeroLegajo, CantidadAlumnos: Integer;
  Promedio,CantAprobados, AlumnosDestacados ,Porcentaje: Real;
Begin
  CantAprobados := 0;
  CantidadAlumnos := 0;
  AlumnosDestacados := 0;

  WriteLn('ingrese el numero de legajo');
  Read(NumeroLegajo);
  WriteLn('ingrese el promedio');
  Read(Promedio);
  While (NumeroLegajo<>-1) Do
    Begin
      If Promedio > 6.5 Then
        CantAprobados := CantAprobados +1;
      If (Promedio>8.5) And (NumeroLegajo <2500) Then
        AlumnosDestacados := AlumnosDestacados +1;
      CantidadAlumnos := CantidadAlumnos+1;
      WriteLn('ingrese el numero de legajo');
      Read(NumeroLegajo);
      WriteLn('ingrese el promedio');
      Read(Promedio);

    End;
  Porcentaje := (AlumnosDestacados*CantidadAlumnos)/100;
  WriteLn(CantidadAlumnos:2);
  WriteLn(CantAprobados:2);
  WriteLn(Porcentaje:2);

End.
