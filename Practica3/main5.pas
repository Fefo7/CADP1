
Program main5;

Type 
  str20 = String[20];
  Car = Record
    brand : str20;
    model: str20;
    price: real;
  End;

Procedure promPriceBrand( Var promByBrand:real;  priceTotal:Real;
                         amountByBrand: Integer);
Begin
  promByBrand := priceTotal / amountByBrand;
End;
Procedure readCar(Var carInput: Car);
Begin
  WriteLn('ingrese la marca');
  ReadLn(carInput.brand);
  WriteLn('ingrese el modelo');
  ReadLn(carInput.model);
  WriteLn('ingrese el precio del auto');
  ReadLn(carInput.price);
End;
Procedure maxCar(carInput: Car; Var maxCarInput:Car);
Begin
  If carInput.price > maxCarInput.price Then
    Begin
      maxCarInput := carInput;
    End;
End;

Var 
  carInput: Car;
  brandAux: str20;
  prom : real;
  amountByBrand: Integer;
  priceTotal: real;
  maxCarInput: Car;
Begin
  maxCarInput.price := -1;
  readCar(carInput);
  While carInput.brand <> 'zzz'  Do
    Begin
      brandAux := carInput.brand;
      priceTotal := 0;
      amountByBrand := 0;
      While (carInput.brand=brandAux) Do
        Begin
          priceTotal := priceTotal + carInput.price;
          amountByBrand := amountByBrand+1;
          maxCar(carInput, maxCarInput);
          readCar(carInput);
        End;
      promPriceBrand( prom, priceTotal, amountByBrand);
      WriteLn('el promedio de precio de la marca es: ', prom);

    End;
  WriteLn('el auto mas caro es ', maxCarInput.brand, maxCarInput.model);
End.
