
Program main;

Var 
  n1: Integer;
  n2: Integer;
Begin
  Read(n1);
  Read(n2);
  If n1=n2 Then
    WriteLn('los numeros son iguales')
  Else
    Begin
      If n1>n2 Then
        WriteLn(n1)
      Else
        WriteLn(n2)
    End;
End.
