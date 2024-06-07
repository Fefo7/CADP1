
Program example;
 {aca van las costantes}
  {aca van las variables globales del programa}

Type 
{aca van los tipos de datos definidos por el programador}
  EjemploTipoDato = String[25];


Procedure EjemploProceso(Var Param_EntradaSalida: integer;  Param_Entrada : real
);
Begin
   {aca va el programa del proceso}

End;

Var 
  {aca van las variables locales del programa}
  arr : array[1..10] Of integer;
  i,j,n,temp: Integer;

Begin

 { Ordenación por burbuja }
  writeln('Ingrese los elementos del arreglo:');
  n := 10;
  For i := 1 To n Do
    readln(arr[i]);

  For i := 1 To n-1 Do
    For j := i+1 To n Do
      If arr[i] > arr[j] Then
        Begin
          temp := arr[i];
          arr[i] := arr[j];
          arr[j] := temp;
        End;


  writeln('Arreglo ordenado:');
  For i := 1 To n Do
    writeln(arr[i]);
End.
