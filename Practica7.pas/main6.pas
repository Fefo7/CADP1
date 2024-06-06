
Program main6;

Const 
  dimF = 7;

Type 
  cateObjetos = 1..7;
  objeto = Record
    codeObject: Integer;
    categoria: cateObjetos;
    nombre: string;
    distancia: real;
    nombreDescubridor: string;
    anio: integer;
  End;

  listObject = ^nodo;
  nodo = Record
    elem: objeto;
    sig: listObject;
  End;
  ObjObservados = array [1..dimF] Of Integer;


Procedure initializarVector(Var obj: ObjObservados);

Var 
  i: Integer;
Begin
  For i:=1 To dimF Do
    Begin
      obj[i] := 0;
    End;
End;
Procedure cargarObjeto(Var obj:objeto; codicion:Boolean);
Begin
  Read(obj.codeObject);
  If obj.codeObject <> -1 Then
    Begin
      Read(obj.categoria);
      Read(obj.nombre);
      Read(obj.distancia);
      Read(obj.nombreDescubridor);
      Read(obj.anio);
      codicion := true;
    End
  Else
    codicion := false;
End;

Procedure crearNodoAlFinal(Var Pi,ult: listObject; o:objeto);

Var 
  aux: listObject;
Begin
  New(aux);
  aux^.elem := o;
  aux^.sig := Nil;
  If Pi= Nil Then
    Begin
      pi := aux;
      ult := aux;
    End
  Else
    Begin
      Pi^.sig := aux;
      ult := aux;

    End;

End;
Procedure CargarLista(Var listaObjetos,ult:listObject);

Var 
  o: objeto;
  codicion: Boolean;
Begin
  cargarObjeto(o,codicion);
  While codicion Do
    Begin
      crearNodoAlFinal(listaObjetos,ult,o);
      cargarObjeto(o,codicion);
    End;
End;
Procedure ContarCategoria(Var contadorObejtos: ObjObservados;
                          categoria:Integer);
Begin
  Case categoria Of 
    1: contadorObejtos[categoria] := contadorObejtos[categoria]+1;
    2: contadorObejtos[categoria] := contadorObejtos[categoria]+1;
    3: contadorObejtos[categoria] := contadorObejtos[categoria]+1;
    4: contadorObejtos[categoria] := contadorObejtos[categoria]+1;
    5: contadorObejtos[categoria] := contadorObejtos[categoria]+1;
    6: contadorObejtos[categoria] := contadorObejtos[categoria]+1;
    7: contadorObejtos[categoria] := contadorObejtos[categoria]+1;
    Else
      WriteLn('no se encuentra la categoria');
  End;
End;
Function MasDigitosPares(codigo:Integer): Boolean;

Var 
  digit: Integer;
  isPar,isImpar: integer;
Begin
  isPar := 0;
  isImpar := 0;
  While codigo<>0  Do
    Begin
      digit := codigo Mod 10;
      If (digit Mod 2)=0 Then
        isPar := isPar+1

      Else
        isImpar := isImpar+1;
      codigo := codigo Div 10;
    End;
  MasDigitosPares := isPar > isImpar;

End;

Var 
  listaObjetos,ult: listObject;
  maximo,maximo2: Real;
  code1,code2: Integer;
  cantObjetos: Integer;
  contadorObejtos: ObjObservados;
Begin
  listaObjetos := Nil;
  ult := Nil;
  CargarLista(listaObjetos,ult);
  initializarVector(contadorObejtos);
  cantObjetos := 0;
  While listaObjetos<> Nil Do
    Begin
      If listaObjetos^.elem.distancia > maximo Then
        Begin
          maximo2 := maximo;
          code2 := code1;
          maximo := listaObjetos^.elem.distancia;
          code1 := listaObjetos^.elem.codeObject;
        End
      Else
        Begin
          If listaObjetos^.elem.distancia> maximo2 Then
            Begin
              maximo2 := listaObjetos^.elem.distancia;
              code2 := listaObjetos^.elem.codeObject;
            End;
        End;
      If (listaObjetos^.elem.nombreDescubridor =
         'Galileo Galilei')And
         (listaObjetos^.elem.anio < 1600) Then
        Begin
          cantObjetos := cantObjetos+1;
        End;
      If MasDigitosPares(listaObjetos^.elem.codeObject) Then
        WriteLn('nombre de la estrella con codigo pares', listaObjetos^.elem.
                nombre);
      ContarCategoria(contadorObejtos, listaObjetos^.elem.categoria);
      listaObjetos := listaObjetos^.sig;
    End;

End.
