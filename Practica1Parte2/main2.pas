
Program main2;

Var 
  numAoperar,NumMayor: real;
  i,posicion: Integer;
Begin
  NumMayor := 0;
  For i := 1 To 10 Do
    Begin
      Read(numAoperar);
      If numAoperar> NumMayor Then
        Begin
          NumMayor := numAoperar;
          posicion := i;
        End;
    End;
  WriteLn(NumMayor);
  WriteLn(posicion);

End.
