
Program main6;

Var 
  i,codigo,codigoBto1, codigoBto2: Integer;
  Precio, productoBarato1, productoBarato2: Real;
  CantProduPar: Integer;
  EsPar: Integer;
Begin
  productoBarato1 := 9999;
  productoBarato2 := 9999;
  CantProduPar := 0;
  For i:=0 To 4 Do
    Begin
      WriteLn('ingrese el codigo del producto');
      Read(codigo);
      WriteLn('ingrese el precio del producto');
      Read(Precio);
      If Precio<productoBarato1 Then
        Begin
          productoBarato2 := productoBarato1;
          productoBarato1 := Precio;
          codigoBto2 := codigo;
        End
      Else If  Precio< productoBarato2 Then
             Begin
               productoBarato2 := Precio;
               codigoBto1 := codigo;
             End;

      EsPar := codigo Mod 2;
      If (Precio>16) And (EsPar = 0)Then
        CantProduPar := CantProduPar+1;

    End;
  WriteLn('Producto mas barato: ', codigoBto2, 'producto 2 mas barato: ',
          codigoBto1);
  WriteLn('Cantidad de productos mas 16 pesos con codigo par: ', CantProduPar);
End.
