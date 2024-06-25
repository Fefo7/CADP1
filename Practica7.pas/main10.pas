
Program main10;

Const 
  maxCultivos = 20;

Type 
  Cultivo = Record
    tipo: String;
    cantHectaDedicadas: Real;
    cantMesesCicloCultivo: integer;
  End;
  vecCultivos = array[1..maxCultivos] Of Cultivo;
  Empresa = Record
    code: integer;
    nombre: String;
    tipoEmpresa: String;
    ciudad: String;
    cultivos: vecCultivos;
  End;
  listaEmpresas = ^nodo;
  nodo = Record
    elem: Empresa;
    sig: listaEmpresas;
  End;
Procedure InicializarLista(Var l:listaEmpresas);
Begin
  l := Nil;
End;
Procedure cargarEmpresa (Var em: Empresa;Var condi: Boolean);

Var 
  i: Integer;
Begin
  Read(em.code);
  If em.code <> -1 Then
    Begin
      i := 1;
      read(em.nombre);
      read(em.tipoEmpresa);
      read(em.ciudad);
      Read(em.cultivos[i].cantHectaDedicadas);
      While (em.cultivos[i].cantHectaDedicadas <> 0) And (i <= maxCultivos) Do
        Begin
          Read(em.cultivos[i].tipo);
          Read(em.cultivos[i].cantMesesCicloCultivo);
          i := i+1;
        End;

    End;
End;
Procedure agregarAdelante(Var l: listaEmpresas; em:Empresa);

Var 
  aux: listaEmpresas;

Begin
  New(aux);
  aux^.elem := em;
  aux^.sig := l;
  l := aux;
End;
Procedure cargarLista(Var l: listaEmpresas; em: Empresa);

Var 
  condi: boolean;
Begin
  cargarEmpresa(em, condi);
  While condi Do
    Begin
      agregarAdelante(l,em);
      cargarEmpresa(em, condi);
    End;

End;
Function poseeMenosDosCeros (code: Integer) : Boolean;

Var 
  digit: Integer;
  cant: Integer;
Begin
  cant := 0;
  digit := code Mod 10;
  While (code<> 0 ) And (cant <= 2) Do
    Begin
      If (digit  = 0 )Then
        Begin
          cant := cant+1;
        End;
    End;
  poseeMenosDosCeros := (cant=2);
End;
Procedure buscarMaximo(Var max: Integer; NomEmpresa: String; Var nomMax:String ;
                       tiempo: Integer );
Begin
  If tiempo > max Then
    Begin
      max := tiempo;
      nomMax :=  NomEmpresa;
    End;
End;
Procedure procesarDatos(l: listaEmpresas);

Var 
  i: integer;
  nomMax: String;
  HecatareaSoja, TotalH: real;
Begin
  While l <> Nil Do
    Begin
      HecatareaSoja := 0;
      TotalH := 0;
      max := -1;
      For i:= 1 To maxCultivos Do
        Begin
          If l^.elem.ciudad = 'San Miguel del Monte' And poseeMenosDosCeros(l^.
             elem.code) Then
            Begin
              If l^.elem.cultivos[i].tipo = 'trigo' Then
                Begin
                  WriteLn(
                          'nombre de la empresa que cumple un monton de cosas: '
                          , l^.elem.nombre);
                End;
            End;
          If l^.elem.cultivos[i].tipo = 'maiz' Then
            Begin
              buscarMaximo(max, l^.elem.nombre,nomMax,l^.elem.cultivos[i].
                           cantMesesCicloCultivo,);
            End;
          If l^.elem.cultivos[i].tipo ='soja' Then
            Begin
              HecatareaSoja := HecatareaSoja+ l^.elem.cultivos[i].
                               cantHectaDedicadas;
            End;
          TotalH := TotalH+ l^.elem.cultivos[i].cantHectaDedicadas;
          WriteLn('procentaje de soja con respecto a todas las hectareas: ',
                  (HecatareaSoja/TotalH)*100 );

        End;


    End;
  WriteLn('la empresa que dedica mas tiempo al maiz: ', nomMax);
End;

Var 
  l: listaEmpresas;
  em : Empresa;
Begin
  InicializarLista(l);
  cargarLista(l,em);

  procesarDatos(l);
  incrementarMesGirasol(l);


End.
