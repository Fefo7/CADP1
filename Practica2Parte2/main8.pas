
Program main8;

Procedure DisarmNum(num: Integer; Var addDigitsPeers: Integer;Var
                    amountDigitsOdd: Integer);

Var 
  rest: Integer;
Begin
  While num <>0  Do
    Begin
      rest := num Mod 10;
      If (rest Mod 2) = 0 Then
        Begin
          addDigitsPeers := addDigitsPeers + rest;
        End
      Else
        amountDigitsOdd := amountDigitsOdd+1;
      num := num Div 10;
    End;
End;

Var 
  num, addDigitsPeers, amountDigitsOdd: Integer;
Begin

  WriteLn('ingrese un numero');
  ReadLn(num);
  While num <> 123456 Do
    Begin
      addDigitsPeers := 0;
      amountDigitsOdd := 0;
      DisarmNum(num, addDigitsPeers,amountDigitsOdd);
      WriteLn('suma de sus digitos pares ', addDigitsPeers);
      WriteLn('cantidad de digitos impares que posee ', amountDigitsOdd);
      WriteLn('ingrese un nuevo numero');
      ReadLn(num);
    End;
End.
