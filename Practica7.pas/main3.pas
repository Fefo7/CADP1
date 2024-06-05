
Program main3;

Type 
  viaje = Record
    numViaje: Integer;
    codeAuto: integer;
    direOrigen: String;
    direDestino: string;
    kmRecorridos: real;
  End;
  listViajes = ^nodo;
  nodo = Record
    elem: viaje;
    sig: listViajes;
  End;


Procedure BuscarMaximos(code: Integer; totalKmRecorrido:Real;
                        Var maximo,maximo2:real;Var code1,code2:Integer);
Begin
  If totalKmRecorrido > maximo Then
    Begin
      maximo2 := maximo;
      code2 := code1;
      maximo := totalKmRecorrido;
      code1 := code;
    End
  Else
    Begin
      If totalKmRecorrido > maximo2 Then
        Begin
          maximo2 := totalKmRecorrido;
          code2 := code;
        End;
    End;
End;
Procedure insertarOrdenado( v:viaje; Var Viajes5km:listViajes);

Var 
  aux,ant,act: listViajes;
Begin
  New(aux);
  aux.elem := v;
  aux^.sig := Nil;
  If Viajes5km=Nil Then Viajes5km := aux
  Else
    Begin
      While act<>Nil And aux^.elem.numViaje > act^.elem.numViaje Do
        Begin
          ant := act;
          act := act^.sig;
        End;
      If act = Viajes5km Then
        Begin
          aux^.sig := Viajes5km;
          Viajes5km := aux;
        End
      Else
        Begin
          ant^.sig := aux;
          aux^.sig := act;
        End;
    End;


End;

Var 
  listaViajes,aux,Viajes5km: listViajes;
  Viajes5km,ult: listViajes;

  maximo, maximo2,totalKmRecorrido: real;
  code1, code2: Integer;
  codeAux: Integer;
  v: viaje;
Begin
  maximo := -1;
  listaViajes := Nil;
  Viajes5km := Nil;
  CargarListaOrdenada(listaViajes,viaje);
  aux: listaViajes;
  While aux<>Nil Do
    Begin
      codeAux := aux^.elem.codeAuto;
      totalKmRecorrido := 0;
      While (aux<>Nil) And (codeAux = aux^.elem.codeAuto) Do
        Begin
          totalKmRecorrido := totalKmRecorrido+aux^.elem.kmRecorridos;
          aux := aux^.sig;
          If aux^.elem.kmRecorridos > 5 Then
            Begin
              insertarOrdenado(aux^.elem,Viajes5km);
            End;
        End;
      BuscarMaximos(aux^.elem.codeAuto,totalKmRecorrido,maximo,maximo2,code1,
                    code2);
    End;
End.
