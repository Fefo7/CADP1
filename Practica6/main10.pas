
Program main10;

Type 
  cliente = Record
    Dni: Integer;
    numLlegada: integer;
  End;
  listaEspera = ^nodo;
  nodo = Record
    elem: cliente;
    sig: listaEspera;
  End;



Procedure CargarCliente(Var c:cliente; condicion:Boolean);
Begin
  ReadLn(c.Dni);
  If c.Dni <> 0 Then
    Begin
      c.numLlegada := 0;
      condicion := true;
    End
  Else
    condicion := false;
End;

Procedure RecibirCliente(Var ClientesEspera,ult: listaEspera; clie:cliente);

Var 
  aux: listaEspera;
  ult: listaEspera;
Begin
  New(aux, ult);
  aux^.elem := clie;
  aux^.sig := Nil;
  If ClientesEspera = Nil Then
    Begin
      aux^.elem.numLlegada := 1;
      ClientesEspera := aux;
      ult := aux;
    End
  Else
    Begin
      aux^.elem.numLlegada := ult^.elem.numLlegada +1;
      ult^.sig := aux;
      ult := aux;
    End;
End;
Procedure AtenderCliente(Var ClientesEspera: listaEspera; numCliente,DNI:
                         integer);

Var 
  Atendido: listaEspera;
Begin
  If ClientesEspera <> Nil Then
    Begin
      numCliente := ClientesEspera^.elem.numLlegada;
      DNI := ClientesEspera^.elem.Dni;
      Atendido := ClientesEspera;
      ClientesEspera := ClientesEspera^.sig;
      Dispose(Atendido);
    End;
End;


Var 
  listClient,ult: listaEspera;
  c: cliente;
  condicion: Boolean;
  numCliente, DNI: Integer;
  DimLList: Integer;
  atendido,i: Integer;
Begin
  DimLList := 0;
  CargarCliente(c, condicion);
  While (condicion)  Do
    Begin
      RecibirCliente(listClient,ult,c);
      CargarCliente(c, condicion);
      DimLList := DimLList+1;
    End;

  For i:=1 To DimLList Do
    Begin
      WriteLn('fue atendido?' );
      WriteLn('ingrese 1 si fue atendido');
      ReadLn(atendido);
      If atendido = 1 Then
        Begin
          AtenderCliente(listClient,numCliente,DNI);
          WriteLn(' A ser atendido: ',numCliente,' ', DNI, );
        End;
    End;
End.
