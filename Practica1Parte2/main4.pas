
{de la forma que esta hecho se toman numeros hasta que se ingrese el 0 y no se lee el 0}

Program main4;

Var 
  i , min,min2, num: Integer;
Begin
  min := 999;
  WriteLn('ingrese un numero');
  Read(num);

  Repeat
    Begin

 {si queres que se  procese el 0 lo pones aca e eliminas las lineas 10,11,23,24}
      {WriteLn('ingrese un numero');
      Read(num);}
      If num<min Then
        Begin
          min2 := min;
          min := num;
        End;
      WriteLn('ingrese un numero');
      Read(num);
    End;
  Until num=0;
  WriteLn('minimo mas grande ', min2, 'minimo mas chico', min);
End.
