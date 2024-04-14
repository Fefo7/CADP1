
Program main6;

Type 
  typeProduct = String[25];
Procedure SearchTwoCheap(price:real; code:Integer;
                         Var minimum:Real; Var minimum2: real;
                         Var codeM: integer;Var codeM2:Integer);
Begin
  If price< minimum Then
    Begin
      minimum2 := minimum;
      codeM2 := codeM;
      minimum := price;
      codeM := code;

    End
  Else
    If price < minimum2  Then
      Begin
        minimum2 := price;
        codeM2 := code;

      End;
End;
Procedure SearchPrecioExpensive(price:real;code:Integer; Var maxPrice:real ;
                                Var codePMax: Integer);
Begin
  If price > maxPrice Then
    Begin
      maxPrice := price;
      codePMax := code;
    End;

End;

Var 
  productType: typeProduct;
  price: real;
  amountProdu, code,i: Integer;
  promProdu,totalPrice: real;
  maxPrice: Real;
  minimum,minimum2: real;
  codeMax,codeMin,codeMin2: Integer;
Begin
  amountProdu := 0;
  totalPrice := 0;
  maxPrice := -1;
  minimum := 999;
  minimum2 := 999;
  For i:=1 To 3 Do
    Begin
      WriteLn('ingrese el tipo del producto');
      ReadLn(productType);
      WriteLn('ingrese el codigo');
      ReadLn(code);
      WriteLn('ingrese el precio');
      ReadLn(price);
      SearchTwoCheap(price, code, minimum,minimum2,codeMin,codeMin2);
      If productType = 'pantalon' Then
        SearchPrecioExpensive(price, code,maxPrice,codeMax);
      totalPrice := totalPrice+price;
      amountProdu := amountProdu+1;
    End;
  promProdu := totalPrice/amountProdu;
  WriteLn('codigo de los productos mas baratos: ', codeMin, ' el segundo: ',
          codeMin2);
  WriteLn('codigo del producto mas caro: ', codeMax);
  WriteLn('precio promedio de los productos: ', promProdu);
End.
