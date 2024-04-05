
Program main1;

Var 
  suma, numAoperar: Integer;
  cantNumMayores,i: Integer;
Begin
  suma := 0;
  cantNumMayores := 0;
  For i := 1 To 10 Do
    Begin
      Read(numAoperar);
      suma := suma + numAoperar;
      If numAoperar>5 Then
        cantNumMayores := cantNumMayores+1;
    End;
  WriteLn(suma);
  WriteLn(cantNumMayores);

End.
