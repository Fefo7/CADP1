
Program main5;

Var 
  numeros,suma, maximo,minimo: Integer;
Begin
  WriteLn('ingrese un numero');
  read(numeros);
  maximo := -999;
  minimo := 999;
  suma := 0;
  While numeros<>100  Do
    Begin
      If numeros>maximo Then
        maximo := numeros;
      If numeros<minimo Then
        minimo := numeros;
      suma := numeros + suma;
      WriteLn('ingrese un numero');
      read(numeros);
    End;
  WriteLn('maximo: ',maximo, 'minimo: ',minimo, 'suma del total: ', suma);
End.
