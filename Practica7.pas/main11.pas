
Program main11;

Const 
  maxEvent =  100;

Type 
  tipoEvento = 1..5;
  evento = Record
    nombre: string;
    tipoDeEvento: tipoEvento;
    lugar: String;
    maxPersonas: Integer;
    costoEntrada: Real;
  End;
  eventos = array[1..maxEvent] Of evento;
  Ventas = Record
    code: Integer;
    numeroEvento: 1..maxEvent;
    DNI: Integer;
    cantEntradas: Integer;
  End;
  listEventos = ^nodo;
  nodo = Record
    elem: Ventas;
    sig: listEventos;
  End;
  vecContadorEventos = array[1..maxEvent] Of Integer;
Procedure crearLista(Var l:listEventos);
Begin
  l := Nil;
End;
Procedure cargarTodosEventos (Var todosEventos: eventos );
Begin
  // se dispone
End;
Procedure inicializarVector(Var vec:vecContadorEventos);

Var 
  i: Integer;
Begin
  For i:=1 To maxEvent Do;
  Begin
    vec[i] := 0;
  End;
End;
Procedure cargarLista(Var l:listEventos);

Var 
  v: Ventas;
  aux: listEventos;
Begin
  cargarVenta(v.code );
  While v.code <>-1 Do
    Begin
      New(aux);
      aux^.elem := v;
      aux^.sig := l;
      l := aux;
      cargarVenta(v.code );
    End;
End;
Procedure cargarVenta(Var v: Ventas;);
Begin
  Read(v.code);
  If v.code <> -1 Then
    Begin
      Read(v.numeroEvento);
      Read(v.DNI);
      Read(v.cantEntradas);
    End;

End;
Function DNImasParesQueImpares (dni: Integer): Boolean;

Var 
  digit: Integer;
  impar: Integer;
  par: Integer;
Begin
  par := 0;
  impar := 0;
  While dni<>0 Do
    Begin
      digit := dni Mod 10;
      dni := dni Div 10;
      If (digit Mod 2) =0 Then
        Begin
          par := par+1
        End
      Else
        impar := impar+1;
    End;
  DNImasParesQueImpares := (par>impar);
End;
Procedure procesarDatos(l: listEventos;vec:vecContadorEventos; todosEventos:
                        eventos; Var MinEvento:
                        Integer;Var MinEvento2:
                        Integer; Var cantVendXDNI:integer; Var superomaxino:
                        Boolean);

Var 
  i: Integer;
  minimo: Integer;
  totalEntraEven50: Integer;

Begin
  cantVendXDNI := 0;
  minimo := 999;
  totalEntraEven50 := 0;
  While l<> Nil Do
    Begin
      vec[l^.elem.numeroEvento] := vec[l^.elem.numeroEvento] +1;
      If (todosEventos[l^.elem.numeroEvento].tipoDeEvento = 3)
         And (DNImasParesQueImpares(l^.elem.DNI)) Then
        cantVendXDNI := cantVendXDNI +1;
      If l^.elem.numeroEvento = 50 Then
        totalEntraEven50 := totalEntraEven50 +l^.elem.cantEntradas;
      l := l^.sig;
    End;
  For i:= 1 To maxEvent Do
    Begin
      If vec[i]< minimo Then
        Begin
          MinEvento2 := MinEvento;
          MinEvento := i;
        End
      Else
        Begin
          If vec[i]< MinEvento2   Then
            MinEvento2 := i;
        End;
    End;
  superomaxino := (totalEntraEven50 > todosEventos[50].maxPersonas);
End;
Procedure informarDatos(todosEventos:eventos;MinEvento: Integer; MinEvento2:
                        Integer;cantVendXDNI:
                        Integer; superomaxino:Boolean);
Begin
  WriteLn('nombre y lugar de los eventos con menos recaudacion: ',
          todosEventos[MinEvento].nombre,todosEventos[MinEvento].lugar,
          todosEventos[MinEvento2].nombre,todosEventos[MinEvento2].lugar);
  WriteLn('cantidad de entradas vendidas cuyo comprador tiene DNI mas par',
          cantVendXDNI);
  If superomaxino Then
    WriteLn('se supero el maximo de ventas del evento 50')
  Else
    WriteLn('no se supero el maximo de ventas del evento 50');
End;

Var 
  l: listEventos;
  todosEventos: eventos;
  MinEvento,MinEvento2,cantVendXDNI: Integer;
  superomaxino : Boolean;
  vec: vecContadorEventos;
Begin
  inicializarVector(vec);
  cargarTodosEventos(todosEventos);
  crearLista(l);
  cargarLista(l);
  procesarDatos(l,vec,todosEventos, MinEvento, MinEvento2, cantVendXDNI,
                superomaxino);
  informarDatos(MinEvento, MinEvento2, cantVendXDNI, superomaxino);
End.
