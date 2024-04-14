
Program main7;
Procedure DigitsNum(num: Integer; Var amountDigit: Integer;
                    Var AddTotal:Integer);

Var 
  rest: Integer;

Begin
  While num<>0 Do
    Begin
      rest := num Mod 10;
      amountDigit := amountDigit +1;
      AddTotal := AddTotal+ rest;
      num := num Div 10;
    End;
End;

Var 
  num, amountDigit, AddTotal: Integer;
Begin
  amountDigit := 0;
  Repeat
    AddTotal := 0;
    WriteLn('ingrese un numero');
    ReadLn(num);
    DigitsNum(num,amountDigit,AddTotal);

  Until (AddTotal=10);
  WriteLn('la cantidad de digitos es: ', amountDigit);
End.
