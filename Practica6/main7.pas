
Program main7;

Type 
  CatEspectro = 1..7;
  sonda = Record
    nombre: string;
    duracionEstimada: Real;
    costoConstruccion: real;
    costoMantenimiento: real;
    CatEspectro: CatEspectro;
  End;
  listaSonda = ^nodo;
  nodo = Record
    elem: sonda;
    sig: listaSonda;
  End;

Procedure CrearLista(Var listSonda:listaSonda);
Begin
  listSonda := Nil;
End;
Procedure CargarSonda(Var so: sonda);
Begin
  ReadLn(so.nombre);
  ReadLn(so.duracionEstimada);
  ReadLn(so.costoConstruccion);
  ReadLn(so.costoMantenimiento);
  ReadLn(so.CatEspectro);
End;

Procedure NuevoNodo(Var listSonda: listaSonda; so: sonda);

Var 
  aux: listaSonda;
Begin
  New(aux);
  aux^.elem := so;
  aux^.sig := Nil;
  If aux = Nil Then
    listSonda := aux
  Else
    Begin
      aux^.sig := listSonda;
      listSonda := aux;
    End;
End;
Procedure CargarListaSonda(Var listSonda:listaSonda);

Var 
  son: sonda;
Begin
  CrearLista(listSonda);
  Repeat
    CargarSonda(son);
    NuevoNodo(listSonda,son);
  Until (son.nombre = 'GAIA')
End;
Function CumpleRequisitos(so:sonda): Boolean;
Begin
  CumpleRequisitos := (so.costoMantenimiento < so.costoConstruccion) And (so.
                      CatEspectro <>1);
End;

Procedure RecorreListaSonda(listSonda: listaSonda;Var  listCumple: listaSonda;
                            Var  listNoCumple: listaSonda);

Var 
  costoTotalNoF: Real;
  cantNoFinanciados: Integer;

Begin
  costoTotalNoF := 0;
  cantNoFinanciados := 0;
  While listSonda<>Nil Do
    Begin
      If  CumpleRequisitos(listSonda^.elem) Then
        NuevoNodo(listCumple, listSonda^.elem)
      Else
        Begin
          NuevoNodo(listNoCumple,listSonda^.elem);
          cantNoFinanciados := cantNoFinanciados+1;
          costoTotalNoF := costoTotalNoF + (listSonda^.elem.costoConstruccion+
                           listSonda^.elem.costoMantenimiento);
        End;
      listSonda := listSonda^.sig;
    End;
  WriteLn('cantida de proyectos no financiados: ', cantNoFinanciados);
  WriteLn('costo total de los NO financiados: ', costoTotalNoF);

End;

Var 
  listSonda, listCumple,listNoCumple: listaSonda;
Begin
  CrearLista(listSonda);
  CrearLista(listCumple);
  CrearLista(listNoCumple);
  CargarListaSonda(listSonda);
  RecorreListaSonda(listSonda,listCumple,listNoCumple);

End.
