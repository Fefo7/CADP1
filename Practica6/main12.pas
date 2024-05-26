
Program main12;

Type 
  dispositivo = Record
    versionAndrodi: Integer;
    tamanioPantalla: real;
    cantMemoria: Integer;
  End;
  ListDispositivo = ^nodo;
  nodo = Record
    elem: dispositivo;
    sig: ListDispositivo;
  End;
  Version = Record
    nombre: Integer;
    cantTotal: Integer;
  End;
  ListaVersiones = ^nodo2;
  nodo2 = Record
    elem: Version;
    sig: ListaVersiones;
  End;
Procedure cargarDispositivo(Var ListDispositivo);
Begin
  // acciones de cargar el dispositivo
End;
Procedure AgregarListaVersion(Var ListV,ult: ListaVersiones; nombre,cantTotal:
                              Integer);

Var 
  aux: ListaVersiones;
Begin
  New(aux);
  aux^.elem.nombre := nombre;
  aux^.elem.cantTotal := cantTotal;
  aux^.sig := Nil;
  If ListV= Nil Then
    Begin
      ListV := aux;
      ult := aux;
    End
  Else
    Begin
      ult^.sig := aux;
      ult := aux;
    End;
End;

Var 
  dispositivos: ListDispositivo;
  actual,contadorDispo, cantMemosYPan: Integer;
  cantDispositivos: Integer;
  totalPantallas: Real;
  promedioPantalla: real;
  listV: ListaVersiones;
Begin
  listV := Nil;
  cargarDispositivo(dispositivos);
  cantMemosYPan := 0;
  cantDispositivos := 0;
  totalPantallas := 0;
  While dispositivos<>Nil Do
    Begin
      actual := dispositivos^.elem.versionAndrodi;
      contadorDispo := 0;
      While (dispositivos^.elem.versionAndrodi = actual ) Do
        Begin
          contadorDispo := contadorDispo+1;
        End;
      If (dispositivo^.elem.cantMemoria> 3) And (dispositivo^.elem.
         tamanioPantalla >= 5) Then
        cantMemosYPan := cantMemosYPan+1;

      AgregarListaVersion(listV, actual, contadorDispo);
      totalPantallas := totalPantallas + ispositivo^.elem.
                        tamanioPantalla;
      cantDispositivos := cantDispositivos+1;
      dispositivo := dispositivos^.sig;
    End;
  WriteLn('cantidad de dispositvos con mas de 3gb y con 5 pulgas,' ,
          cantMemosYPan);
  WriteLn('tamanio promedio de todas las patanllas: ', (totalPantallas/
          cantDispositivos));
  While listV<>Nil Do
    Begin
      WriteLn('version: ', listV^.elem.nombre, 'cantidad: ', listV^.elem.
              cantTotal);
      listV := listV^.sig;
    End;
End.
