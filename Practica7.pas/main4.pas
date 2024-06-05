
Program main4;

Const 
  dimF = 42;

Type 
  paciente = Record
    nombre: String;
    apellido: string;
    pesoRegistrado: array[1..dimF] Of real ;
  End;
  ListaPacientes = ^nodo;
  nodo = Record
    elem: paciente;
    sig: ListaPacientes;
  End;

Var 
  pacientesRegi: ListaPacientes;
  i, numSemana: Integer;
  maximo, totalPeso: real;
Begin
  pacientesRegi := Nil;
  CargarPacientes(pacientesRegi);
  While pacientesRegi<> Nil Do
    Begin
      maximo := 0;
      totalPeso := 0;
      For i:= 1 To dimF Do
        Begin
          If pacientesRegi^.elem.pesoRegistrado[i] > maximo Then
            Begin
              maximo := pacientesRegi^.elem.pesoRegistrado[i];
              numSemana := i;
            End;
          totalPeso := totalPeso+pacientesRegi^.elem.pesoRegistrado[i];
        End;
      WriteLn('la semana con mayo aumento', numSemana, 'con un maximo de: ',
              maximo);
      WriteLn('el aumento total de la embarazada: ',pacientesRegi^.elem.nombre,
              'es de: ', totalPeso );
      pacientesRegi := pacientesRegi^.sig;
    End;
End.
