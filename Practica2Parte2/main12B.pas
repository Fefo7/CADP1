
Program main12B;

Const 
  priceTn = 320;


Var 
  locality: String;
  amountHe: Integer;
  typeZone: Integer;
  amount3Febrero: Integer;
  yield : Integer;
Begin
  amount3Febrero := 0;
  Repeat
    WriteLn('ingrese la localidad');
    ReadLn(locality);

    WriteLn('ingrese el tipo de zona');
    ReadLn(typeZone);
    WriteLn('ingrese la canttidad de hectareas');
    ReadLn(amountHe);
    If locality = 'tres de febrero' And yield> 10.000 Then
      amount3Febrero := amount3Febrero+1;
  Until (amountHe = 900) And (locality = 'Saladillo');
End.
