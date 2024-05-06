
Program main1AB;

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
Function BusquedaMejorada(NumEnteros: numerosEnteros;
                          numeroABuscar: integer): Boolean;

Var 
  i: Integer;
Begin
  i := 1;
  While (i<= tam) And (NumEnteros[i]< numeroABuscar) Do
    Begin
      i := i+1;
    End;
  If ((i<= tam) And (NumEnteros[i]=numeroABuscar)) Then
    BusquedaMejorada := True
  Else
    BusquedaMejorada := False;

End;

Procedure BusquedaBinaria(NumEnteros:numerosEnteros; numeroABuscar:integer; Var
                          ok:Boolean);

Var 
  inicio, ultimo,medio: Integer;
Begin
  ok := False;
  inicio := 1;
  ultimo := tam;
  medio := (inicio+ultimo)Div 2;
  While (inicio <= ultimo)And (numeroABuscar<> NumEnteros[medio]) Do
    Begin
      If (numeroABuscar < NumEnteros[medio]) Then
        ultimo := medio-1
      Else
        inicio := medio+1;
      medio := (inicio+ultimo)Div 2;
    End;
  If (inicio<= ultimo)And (numeroABuscar = NumEnteros[medio]) Then
    ok := True;
End;


Var 
  vNumeros: numerosEnteros;
  n: Integer;
  ok: Boolean;
Begin
 { proceso de cargar el vector de 500}
  n := 3;
  cargarVector(vNumeros);
  WriteLn(BusquedaMejorada(vNumeros,n));
  BusquedaBinaria(vNumeros,n,ok);
  WriteLn(ok);

End.
