
Program main9;

Var 
  operador: Char;
  menos, mas: char;
  suma, resta,numeroAoperar: Real;
Begin
  menos := '-';
  mas := '+';
  suma := 0;
  resta := 0;
  WriteLn('elija un operador entre + y - ');
  Read(operador);
  Repeat
    Begin
      WriteLn('ingrese el numero que quiera operar');
      Read(numeroAoperar);
      If operador=mas Then
        suma := suma+numeroAoperar
      Else
        resta := resta-numeroAoperar;
    End;
  Until ((operador=menos) Or (operador=mas)) And (numeroAoperar<>0);
  If operador=mas Then
    WriteLn(suma)
  Else
    WriteLn(resta);
End.
