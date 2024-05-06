
Program main10;

Const 
  tam = 300;
  aum = 15;

Type 
  Salarios = array[1..tam] Of real;


Procedure IncrementarSalario(salario: real; Var nuevoSalario:real);
Begin
  nuevoSalario := ((salario/aum) *100) + salario
End;

Procedure CargarSalarios (Var sa:Salarios);

Var 
  i: Integer;
Begin
  // CUANDO VAY HACER LA OTRA LOGICA NO SE TIENE QUE PONER
  // DENTRO DE UN BUCLE SI NO SE REPITE SIEMPRE EL PRIMERO
  i := 1;
  ReadLn(sa[i]);
  While (sa[i] <> 0) And  (i <= tam) Do
    Begin
      i := i+1;
      ReadLn(sa[i]);
    End;
End;

Var 
  sa: Salarios;
Begin
  CargarSalarios(sa);
End.
