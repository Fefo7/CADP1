
Program main5;


{a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB
es el doble de numA.}
Procedure DoblenumA(numA,numB:Integer; Var IsOlder:Boolean );
Begin
  If (numA*2) = numB Then
    IsOlder := True
  Else
    IsOlder := False;
End;

Var 
  numA, numB, amountPeers, amountDoubleB: Integer;
  isDoble: Boolean;
Begin
  amountPeers := 0;
  amountDoubleB := 0;
  WriteLn('enter a number');
  ReadLn(numA);
  WriteLn('enter other Number');
  ReadLn(numB);
  While (numA<>0) And (numB<>0) Do
    Begin
      amountPeers := amountPeers+1;
      DoblenumA(numA,numB,isDoble);
      If isDoble Then
        amountDoubleB := amountDoubleB+1;
      WriteLn('enter a number');
      ReadLn(numA);
      WriteLn('enter other Number');
      ReadLn(numB);

    End;
  WriteLn('number Of pairs entered', amountPeers,
          'Number Of pairs in which B is double A', amountDoubleB);
End.
