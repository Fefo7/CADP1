
Program main5;

Const 
  dimF = 100;

Type 
  codeCamion = 1..100;
  camion = Record
    patente: String;
    anioFabricacion: integer;
    capacidad: real;
  End;
  camiones = array [1..dimF] Of camion;
  viaje = Record
    codeViaje: Integer;
    codeCa: codeCamion;
    distanciaRecorrida: real;
    CiudadDestino: string;
    anio: integer;
    dniChofer: integer;
  End;
  listaViajes = ^nodo;
  nodo = Record
    elem: viaje;
    sig: listaViajes;
  End;
  contadorKmRecorrido = array[1..dimF] Of Real;

Procedure CargarViaje(Var v:viaje; Var condicion: Boolean);
Begin
  Read(v.codeViaje);
  If v.codeViaje <> -1  Then
    Begin
      Read(v.codeCa);
      Read(v.distanciaRecorrida);
      Read(v.CiudadDestino);
      Read(v.anio);
      Read(v.dniChofer);
      condicion := true;
    End
  Else
    condicion := False;
End;
Procedure AgregarNodo(Var listVa: listaViajes; v: viaje);

Var 
  aux: listaViajes;
Begin
  New(aux);
  aux^.elem := v;
  aux^.sig := Nil;
  If listVa=Nil Then listVa := aux
  Else
    Begin
      aux^.sig := listVa;
      listVa := aux;
    End;
End;
Procedure CagarLista(Var listVa: listaViajes);

Var 
  condicion : Boolean;
  v: viaje;
Begin
  CargarViaje(v,condicion);
  While condicion Do
    Begin
      AgregarNodo(listVa,v);
      CargarViaje(v,condicion);
    End;

End;
Procedure InizializarVector(Var contador: contadorKmRecorrido);

Var 
  i : Integer;
Begin
  For i:=1 To dimF Do;
  Begin
    contador[i] := 0;
  End;
End;
Function SoloDigitImpar(dni: Integer): Boolean;

Var 
  digit: Integer;
Begin
  SoloDigitImpar := True;
  While (dni <> 0) And SoloDigitImpar Do
    Begin
      digit := dni Mod 10;
      If (digit Mod 2) = 0 Then
        Begin
          SoloDigitImpar := False;
        End;
      dni := dni Div 10;

    End;
End;



Var 
  camionesCargados: camiones;
  listaViajesR: listaViajes;
  cantViajes,antiguedad,i : Integer ;
  contadorKm: contadorKmRecorrido;
  auxCa,auxCaMinimo: Integer;
  minimo, maximo: real;
Begin
  cargarCamiones(camionesCargados);
  InizializarVector(contadorKm);
  listaViajesR := Nil;
  CagarLista(listaViajesR);

  cantViajes := 0;

  While listaViajesR<>Nil Do
    Begin
      contadorKm[listaViajesR^.elem.codeCa] := contadorKm[listaViajesR^.elem.
                                               codeCa]
                                               + listaViajesR^.elem.
                                               distanciaRecorrida;
      antiguedad := listaViajesR^.elem.anio- camionesCargados[
                    listaViajesR^.elem
                    .codeCa].anioFabricacion;
      If  (camionesCargados[listaViajesR^.elem.codeCa].
         capacidad) > 30.5 And
         (antiguedad>5) Then
        Begin
          cantViajes := cantViejes+1;
        End;
      If SoloDigitImpar(listaViajesR^.elem.dniChofer) Then
        WriteLn('codigo del viaje', listaViajesR^.elem.
                codeViaje);
      listaViajesR := listaViajesR^.sig;
    End;
  minimo := 9999;
  maximo := -1;
  For i:=1 To dimF Do;
  Begin
    If  contadorKm[i]> maximo Then
      Begin
        maximo := contadorKm[i];
        auxCa := i;
      End;
    If  contadorKm[i]< minimo Then
      Begin
        minimo := contadorKm[i];
        auxCaMinimo := i;
      End;
  End;
  WriteLn('auto que recorrio mas: ',camionesCargados[auxCa].patente );
  WriteLn('auto que recorrio mas: ',camionesCargados[auxCaMinimo].patente );

End.
