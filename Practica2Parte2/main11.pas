
Program main11;
Procedure isPatterB(digit: char; Var amountSpecial: Integer);
Begin
  If digit= '@' Then
    amountSpecial := amountSpecial+1;
End;

Var 
  digit: char;
  amountSpecial: Integer;


Begin
  amountSpecial := 0;
  read(digit);
  If digit<>'$' Then
    Begin
      While digit<>'$' Do
        ReadLn(digit);
      If digit='%' Then
        Begin
          isPatterB(digit, amountSpecial);
          While (digit<>'$') And (amountSpecial <= 3) Do
            Begin
              ReadLn(digit);
              isPatterB(digit,amountSpecial);
            End;
          If digit='*' Then
            WriteLn('el patron es correcto')
          Else
            WriteLn('el patron es incorrecto');
        End
      Else
        WriteLn('el patron es incorrecto');
    End
  Else
    WriteLn('el patron es incorrecto');
End.
