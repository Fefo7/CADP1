
Program main2;

Const 
  dimF = 6;

Type 
  cP = 1..6;
  cliente = Record
    codeCliente: integer;
    dni: Integer;
    apellido: String;
    nombre: string;
    codePoliza: cP;
    montoBasico: real;
  End;
  listClientes = ^nodo;
  nodo = Record
    elem: cliente;
    sig: listClientes;
  End;
  montoAdicional = array[1..dimF] Of Integer;
Procedure CrearLista(Var listaClientes: listClientes);
Begin
  listaClientes := Nil;
End;
Procedure cargarCliente(Var cl:cliente);
Begin
  readLn(cl.codeCliente);
  ReadLn(cl.dni);
  ReadLn(cl.apellido);
  ReadLn(cl.nombre);
  ReadLn(cl.codePoliza);
  ReadLn(cl.montoBasico);
End;
Procedure crearNodo(Var listaClientes: listClientes;cl:cliente);

Var 
  aux: listClientes;
Begin
  new(aux);
  aux^.elem := cl;
  aux^.sig := Nil;
  If listaClientes = Nil Then listaClientes := aux
  Else
    Begin
      aux^.sig := listaClientes;
      listaClientes := aux;
    End;
End;

Procedure cargarLista(Var ListaClientes: listClientes; cl:cliente);
Begin
  CrearLista(ListaClientes);
  Repeat
    cargarCliente(cl);
    crearNodo(ListaClientes, cl);
  Until cl.codeCliente = 1122
End;


Function  DosDigitosPares(dni: Integer): Boolean;

Var 
  digit: integer;
  counter: integer;
Begin
  counter := 0;
  While dni<>0  And (counter <= 2) Do
    Begin
      digit := dni Mod 10;
      If (digit Mod 2)=0 Then
        Begin
          counter := counter+1;
        End;
      dni := dni Div 10;
    End;
  If  counter >= 2 Then
    Begin
      DosDigitosPares := True;
    End
  Else
    DosDigitosPares := false;
End;
Procedure eliminarCliente(code:Integer;Var listaClientes:listClientes);

Var 
  act,ant: listClientes;

Begin
  act := listaClientes;
  ant := listaClientes;
  While act<> Nil And (act^.elem.codeCliente <> code)  Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If act <> Nil Then
    Begin
      If act = listaClientes Then
        listaClientes := listaClientes^.sig
      Else
        Begin
          ant^.sig := act^.sig;
        End;
      Dispose(act);
    End;

End;

Var 
  listaClientes: listClientes;
  cl: cliente;
  tablaMonAdi: montoAdicional;
  auxMontoAdi: integer;
Begin
  cargarLista(listaClientes,cl);
  cargarTablaMontosAdicional(tablaMonAdi);
  While listClientes <> Nil Do
    Begin
      auxMontoAdi := 0;
      auxMontoAdi := listClientes^.elem.montoBasico +
                     tablaMonAdi[listClientes^.elem.codePoliza];
      WriteLn(listClientes^.elem.dni,listClientes^.elem.apellido,
              listClientes^.elem.nombre, auxMontoAdi);
      If DosDigitosPares(listClientes^.elem.dni) Then
        Begin
          WriteLn(listClientes^.elem.apellido,
                  listClientes^.elem.nombre);
        End;

      listaClientes := listaClientes^.sig;
    End;
End.
