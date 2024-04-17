
Program main12;

Procedure yieldOfSoybean(amountHa:integer; typeZone: integer; priceTHa:integer;
                         Var Total: integer);
Begin
  Case typeZone Of 
    1: Total := priceTHa * amountHa;
    2: Total := priceTHa * amountHa;
    3: Total := priceTHa * amountHa;
  End;

End;

Var 
  amountHa, typeZone, priceTHa, Total: Integer;
Begin
  Total := 0;
  WriteLn('ingrese las cantidad de hectareas');
  ReadLn(amountHa);
  WriteLn('ingrese el precio por Hectareas en U$D');
  ReadLn(priceTHa);
  WriteLn('ingrese tipo de zona');
  ReadLn(typeZone);
  yieldOfSoybean(amountHa,typeZone,priceTHa,Total);
  Write('el total es: ', Total);
End.
