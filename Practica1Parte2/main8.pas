
Program main8;

Var 
  i: Integer;
  CantVentas,CantVentasMaxima,DiaMayorVenta: Integer;
  TotalVentasD,TotalVentasM,Monto: real;


Begin
  CantVentas := 0;
  TotalVentasD := 0;
  TotalVentasM := 0;
  CantVentasMaxima := 0;
  For i:=1 To 3 Do
    Begin
      WriteLn('ingrese el monto de la venta');
      Read(Monto);
      While Monto <> 0 Do
        Begin
          CantVentas := CantVentas+1;
          TotalVentasD := TotalVentasD+ Monto;
          WriteLn('ingrese el monto de la venta');
          Read(Monto);
        End;
      If CantVentas>CantVentasMaxima Then
        Begin
          CantVentasMaxima := CantVentas;
          DiaMayorVenta := i;
        End;
      WriteLn('Cantidad de ventas del dia ', i,' =', CantVentas);

      CantVentas := 0;
    End;
  TotalVentasM := TotalVentasM+TotalVentasD;
  WriteLn('Monto total del mes ',' =', TotalVentasD);
  WriteLn('El dia  maximo de ventas es: ', DiaMayorVenta, 'se hicieron',
          CantVentasMaxima);
End.
