
Program main6;

Var 
  i,codigo,codigo1, codigo2: Integer;
  Precio, productoBarato, productoBarato2: Real;
  CantProduPar: Integer;
  EsPar: Integer;
Begin
  productoBarato := 9999;
  codigo1 := 0;
  CantProduPar := 0;
  For i:=0 To 4 Do
    Begin
      WriteLn('ingrese el codigo del producto');
      Read(codigo);
      WriteLn('ingrese el precio del producto');
      Read(Precio);
      If precio<productoBarato Then
        Begin
        {precio 2 mas barato con su codigo}
          productoBarato2 := productoBarato;
          codigo2 := codigo1;
        {precio mas barato con su codigo}
          productoBarato := Precio;
          codigo1 := codigo;
        End;
      EsPar := codigo Mod 2;
      If (Precio>16) And (EsPar = 0)Then
        CantProduPar := CantProduPar+1;
    End;
  WriteLn('Producto mas barato: ', codigo1, 'producto 2 mas barato: ', codigo2);
  WriteLn('Cantidad de productos mas 16 pesos con codigo par: ', CantProduPar);
End.
