
Program main7;

Var 
  nombrePiloto: String;
  Tiempo: real;
  i: Integer;
  MaximoTiepo1,MaximoTiepo2: Real;
  MinimoTiempo1, MinimoTiempo2: real;
  nombrePiloto1st,nombrePiloto2do,
  nombrePilotoUltimo, nombrePilotoAnteUltimo : String;
Begin
  MaximoTiepo1 := 0;
  MinimoTiempo1 := 0;
  nombrePiloto1st := ' ';
  nombrePilotoUltimo := ' ';

  For i:=0 To 4 Do
    Begin
      WriteLn('ingrese el nombre del piloto');
      Read(nombrePiloto);
      WriteLn('ingrese el tiempo del piloto');
      read(Tiempo);
      If tiempo>MaximoTiepo1 Then
        Begin
        {segundo puesto}
          MaximoTiepo2 := MaximoTiepo1;
          nombrePiloto2do := nombrePiloto1st;
        {Primer puesto}
          MaximoTiepo1 := Tiempo;
          nombrePiloto1st := nombrePiloto;
        End;
      If Tiempo<MinimoTiempo1 Then
        Begin
        {anteultimo puesto}
          MinimoTiempo2 := MinimoTiempo1;
          nombrePilotoAnteUltimo := nombrePilotoUltimo;
        {ultimo puesto}
          MinimoTiempo1 := Tiempo;
          nombrePilotoUltimo := nombrePiloto;
        End;
    End;
  WriteLn('ganador de la carrera: ', nombrePiloto1st, 'segundo puesto: ',
          nombrePiloto2do);
  WriteLn('ante ultimo: ', nombrePilotoAnteUltimo, 'ultimo de la carrera :( : ',
          nombrePilotoUltimo);
End.
