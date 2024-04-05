
Program main5;

Var 
  n1, dobleN1,NumAux: Real;
  i: Integer;
Begin
  i := 0;
  Read(n1);
  dobleN1 := n1*2;
  WriteLn(dobleN1);
  Repeat
    Read(NumAux);
    i := i + 1;
  Until (NumAux=dobleAux) Or (i = 10);
  If i=10 Then
    WriteLn('no se encontro el doble');
End.
