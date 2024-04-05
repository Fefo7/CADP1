
Program main7;

Var 
  codigoProdu: Integer;
  PrecioAct, PrecioNew, PorceA, PorceN : Real;
Begin
  Repeat
    WriteLn('ingrese el codigo del producto');
    read(codigoProdu);
    WriteLn('ingrese el precio actual');
    read(PrecioAct);
    WriteLn('ingrese el precio nuevo');
    read(PrecioNew);
    PorceA := (PrecioAct*10)/100;
    PorceN := (PrecioNew*10)/100;
    If PorceN>PorceA Then
      WriteLn('el aumento de precio del producto es superior al 10%')
    Else
      WriteLn('el aumento de precio del prodcuto no supera al 10%')
  Until codigoProdu = 32767;
End.
