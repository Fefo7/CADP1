
Program main12;

Const 
  maxTipoSub = 4;

Type 
  tipoSub = 1..maxTipoSub;
  tablaSub = array[tipoSub] Of real;
  contadorClientes = array[tipoSub] Of Integer;

  cliente = Record
    nombre: String;
    DNI: Integer;
    edad: Integer;
    subComprada: tipoSub;
  End;
  listCLiente = ^nodo;
  nodo = Record
    elem: cliente;
    sig: listCLiente;
  End;
Procedure cargarTabla (Var subs: tablaSub);
Begin
  //se dispone
End;

Procedure inicializarVector(Var contCli: contadorClientes);

Var 
  i: Integer;
Begin
  For i:=1 To maxTipoSub Do
    Begin
      contCli[i] := 0;
    End;
End;
Procedure inicializarLista(Var l: listCLiente);
Begin
  l := Nil;
End;

Procedure cargarCliente(Var c:cliente);
Begin
  Read(c.DNI);
  If c.DNI <> 0 Then
    Begin
      Read(c.nombre);
      Read(c.edad);
      Read(c.subComprada);
    End;
End;
Procedure cargarLista(Var listaClientes:listCLiente);

Var 
  c: cliente;
  aux: listCLiente;
Begin
  cargarCliente(c);
  While c.DNI<> 0 Do
    Begin
      new(aux);
      aux^.elem := c;
      aux^.sig := listaClientes;
      listaClientes := aux;
      cargarCliente(c);
    End;
End;
Procedure insertarOrdenado(Var l:listCLiente; c:cliente );

Var 
  aux,act,ant: listCLiente;
Begin
  New(aux);
  aux^.elem := c;
  act := l;
  ant := l;
  While act<>Nil And c.DNI > act^.elem.DNI Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If act=ant Then
    Begin
      l := aux;
    End
  Else
    ant^.sig := aux;
  aux^.sig := act;

End;
Procedure procesarDatos(subs:tablaSub;listaClientes:listCLiente;
                        Var clientesMayores40:listCLiente;
                        Var contCli: contadorClientes; Var gananciaTotal: real);
Begin
  While listaClientes<> Nil Do
    Begin
      gananciaTotal := gananciaTotal + subs[listaClientes^.elem.subComprada];
      contCli[listaClientes^.elem.subComprada] := contCli[listaClientes^.elem.
                                                  subComprada]+1;
      If (listaClientes^.elem.edad > 40) And (listaClientes^.elem.subComprada =
         3 Or listaClientes^.elem.subComprada= 4)Then
        Begin
          insertarOrdenado(clientesMayores40, listaClientes^.elem);
        End;
      listaClientes := listaClientes^.sig;
    End;
End;
Procedure buscar2SubsMax(contCli: contadorClientes; Var max: Integer; Var max2:
                         Integer);

Var 
  i: Integer;
  maximo: real;
Begin
  maximo := -1;
  For i:=1 To maxTipoSub Do
    Begin
      If contCli[i] > maximo Then
        Begin
          max2 := max;
          max := i;

        End
      Else
        Begin
          If contCli[i]> max2 Then
            Begin
              max2 := i;
            End;
        End;
    End;
End;
Procedure informar(subs:tablaSub;gananciaTotal: real; contCli:contadorClientes;
                   clientesMayores40: listCLiente);

Var 
  i: integer;
  max,max2: Integer;
Begin
  buscar2SubsMax(contCli,max,max2);
  WriteLn('las ganancias totales son: ', gananciaTotal);
  WriteLn('las dos subscripciones con mas cliente: ',subs[max], subs[max2]);
  WriteLn('clientes con mas de 40 que esta subscritos a crossfit o a todas');
  While clientesMayores40 <> Nil Do
    Begin
      Write('nombre: ',clientesMayores40^.elem.nombre, 'DNI: ',clientesMayores40
            ^.elem.DNI);
      clientesMayores40 := clientesMayores40^.sig;
    End;

End;

Var 
  subs: tablaSub;
  contCli: contadorClientes;
  listaClientes: listCLiente;
  clientesMayores40: listCLiente;
  gananciaTotal: real;
Begin
  gananciaTotal := 0;

  cargarTabla(subs);
  inicializarVector(contCli);
  inicializarLista(listaClientes);
  inicializarLista(clientesMayores40);

  cargarLista(listaClientes);
  procesarDatos(subs,listaClientes, clientesMayores40,contCli, gananciaTotal);

  informar(subs,gananciaTotal, contCli, clientesMayores40);

End.
