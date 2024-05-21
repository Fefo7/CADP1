
Program main6;

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
  cantCategoriasEspectros = array[CatEspectro] Of Integer;

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

Procedure CantidadCategoriasEspec(Var catEspec:cantCategoriasEspectros; cat:
                                  Integer);
Begin
  Case cat Of 
    1: catEspec[1] := catEspec[1]+1;
    2: catEspec[2] := catEspec[2]+1;
    3: catEspec[3] := catEspec[3]+1;
    4: catEspec[4]  := catEspec[4]+1;
    5: catEspec[5] := catEspec[5]+1;
    6: catEspec[6] := catEspec[6]+1;
    7: catEspec[7] := catEspec[7]+1;
    Else
      WriteLn('no pertenece a las categorias del espectro');
  End;
End;


Procedure RecorrerLista(listSonda: listaSonda; Var SondaMasCara:String; Var
                        catEspec: cantCategoriasEspectros; Var CantDuracio:
                        integer; Var promDuracion,promConstru: real);

Var 
  maximo, CostoTotalSonda: Real;
  totalDuracion: Real;
  totalConstruccion: Real;
  dmlLista: Integer;
Begin
  maximo := -1;
  dmlLista := 0;
  totalConstruccion := 0;
  totalDuracion := 0;
  While listSonda <> Nil Do
    Begin
      CostoTotalSonda := (listSonda^.elem.costoConstruccion +
                         listSonda^.
                         elem.
                         costoMantenimiento);

      If  CostoTotalSonda> maximo Then
        Begin
          maximo := CostoTotalSonda;
          SondaMasCara := listSonda^.elem.nombre;
        End;
      CantidadCategoriasEspec(catEspec,listSonda^.elem.CatEspectro);

      totalDuracion := totalDuracion+listSonda^.elem.duracionEstimada;
      totalConstruccion := totalConstruccion + CostoTotalSonda;

      dmlLista := dmlLista+1;
      listSonda := listSonda^.sig;
    End;
  promDuracion := totalDuracion / dmlLista;
  promConstru := totalConstruccion / dmlLista;
End;
Procedure RecorreListaDos(listSonda: listaSonda; Var sondasMayorPromedio:
                          integer; promDuracion: real; promConstru:real );
Begin
  While listSonda<>Nil Do
    Begin
      If listSonda^.elem.duracionEstimada> promDuracion Then sondasMayorPromedio
        := sondasMayorPromedio+1;
      If  listSonda^.elem.costoConstruccion > promConstru Then
        Begin
          WriteLn('la sonda',listSonda^.elem.nombre,
                  'supera el costo promedio entre todas las sondas' );
        End;
      listSonda := listSonda^.sig;

    End;
End;

Var 
  listSonda: listaSonda;
  SondaMasCara: String;
  catEspec: cantCategoriasEspectros;
  cantDuracion: Integer;
  promConstru,promDuracion: real;
  sondasMayorPromedio,i: Integer;
Begin
  sondasMayorPromedio := 0;
  CargarListaSonda(listSonda);
  RecorrerLista(listSonda,SondaMasCara,catEspec,cantDuracion, promDuracion,
                promConstru);
  RecorreListaDos(listSonda,sondasMayorPromedio,promDuracion,promConstru);

  WriteLn('el nombre de la sonda mas costosa es: ', SondaMasCara);

  WriteLn('cantidad de sondas estudidas por categoria: ');
  WriteLn('1. radio', catEspec[1]);
  WriteLn('2. microondas', catEspec[2]);
  WriteLn('3. infrarrojo', catEspec[3]);
  WriteLn('4. luz visible', catEspec[4]);
  WriteLn('5. ultravioleta', catEspec[5]);
  WriteLn('6. rayos x', catEspec[6]);
  WriteLn('7. rayo gamma', catEspec[7]);

  WriteLn('cantidad de sondas cuya duracion supera el promedio de las sondas:',
          sondasMayorPromedio);

End.
