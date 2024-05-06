
Program main1;

Const 
  tam = 10;

Type 
  numerosEnteros = array[1..tam] Of Integer;

Procedure cargarVector(Var vc: numerosEnteros);

Var 
  i: Integer;
Begin
  For i:= 1 To tam Do
    Begin
      ReadLn(vc[i]);
    End;
End;
Function EncontrarNumero(NumEnteros: numerosEnteros;
                         numeroABuscar: integer): Boolean;

Var 
  i: Integer;
  encontre: Boolean;
Begin
  i := 1;
  encontre := False;
  While (i<= tam) And (Not encontre) Do
    Begin
      If (NumEnteros[i]= numeroABuscar) Then
        Begin
          encontre := True;
        End
      Else
        i := i+1;
    End;
  EncontrarNumero := encontre;
End;

Var 
  vNumeros: numerosEnteros;
  n: Integer;
Begin
 { proceso de cargar el vector de 500}
  n := 3;
  cargarVector(vNumeros);
  WriteLn(EncontrarNumero(vNumeros,n));
End.
