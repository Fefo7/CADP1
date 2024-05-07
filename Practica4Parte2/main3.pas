
Program main3;

Const 
  tam = 200;
  VB = 2;

Type 
  Dias = 1..31;
  viaje = Record
    DiaMes: Dias;
    montoDinero: real;
    distanciaRecorrida: real;
  End;
  Viajes = array[1..tam] Of viaje;
  ViajesBaratos = array[1..VB] Of viaje;
  ViajesXDia = array[1..31] Of Integer;
Procedure LeerViaje(Var via: viaje; Var condicion:Boolean);
Begin
  WriteLn('ingrese la distancia recorrida en KM');
  ReadLn(via.distanciaRecorrida);
  If via.distanciaRecorrida <>0 Then
    Begin
      WriteLn('ingrese el dia del mes');
      ReadLn(via.DiaMes);
      WriteLn('ingrese el monto del dinero');
      ReadLn(via.montoDinero);
      condicion := true;
    End
  Else
    condicion := False;
End;

Procedure CargarVector(Var vecViajes: Viajes; Var DimL: Integer);

Var 
  i: integer;
  condicion: Boolean;
Begin
  i := 1;
  LeerViaje(vecViajes[i],condicion);
  While (condicion) And (i<tam) Do
    Begin
      DimL := DimL+1;
      i := i+1;
      LeerViaje(vecViajes[i],condicion);
    End;
End;


Procedure OperacionesVector(vecViajes: Viajes; Var VecBaratos: ViajesBaratos;
                            Var minimo: Real; Var promMonto: real;
                            Var vecXDia:ViajesXDia;DimL:Integer);

Var 
  i: Integer;
  totalMonto: Real;
Begin
  totalMonto := 0;
  For i:= 1 To DimL Do
    Begin
      If vecViajes[i].montoDinero < minimo Then
        Begin
          VecBaratos[2] := VecBaratos[1];
          VecBaratos[1] := vecViajes[i];
        End;
      If vecViajes[i].montoDinero < VecBaratos[2].montoDinero Then
        VecBaratos[2] := vecViajes[i];

    {busco el mismo indice que coincida con los dia para sumarle 1}
      If vecViajes[i].DiaMes = i Then
        vecXDia[i] := vecXDia[i]+1;

      totalMonto := totalMonto+vecViajes[i].montoDinero;
    End;
  promMonto := totalMonto / DimL;
End;

Procedure Eliminar100KM(Var vecViajes: Viajes; LimiteKm:Real; Var DimL:
                        Integer);

Var 
  i: Integer;
  PosLimKm: Integer;
Begin
  For i:=1 To DimL Do
    If vecViajes[i].distanciaRecorrida = LimiteKm Then PosLimKm := i;
  If ((PosLimKm >=1) And (PosLimKm<=DimL)) Then
    Begin
      For i:= PosLimKm To (DimL-1) Do
        vecViajes[i] := vecViajes[i+1];
    End;
  DimL := DimL-1;
End;

Var 
  vecViejes: Viajes;
  vecBaratos: ViajesBaratos;
  vecXDia: ViajesXDia;
  minimo, promMonto,limitKm: Real;
  DimL: Integer;
Begin
  minimo := 9999;
  limitKm := 100;
  CargarVector(vecViejes,DimL);
  OperacionesVector(vecViejes,vecBaratos, minimo, promMonto, vecXDia,DimL);
  Eliminar100KM(vecViejes,limitKm, DimL);
End.
