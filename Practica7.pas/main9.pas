
Program main9;

Const 

Type 
  codeGenero = 1..8;
  pelicula = Record
    codePelicula: Integer;
    titulo: String;
    codG: codeGenero;
    puntajeProm: Real;
  End;
  listPelicula = ^nodo;
  nodo = Record
    ele: pelicula;
    sig: listPelicula;
  End;
  critica = Record
    codePelicula: integer;
    dni: Integer;
    apellido: string;
    nombre: string;
    puntajeOtorgado: real;
  End;

Procedure CargarCritica(Var c:critica; Var condicion:Boolean);
Begin
  ReadLn(c.codePelicula);
  If c.codePelicula Then
    Begin
      ReadLn(c.dni);
      ReadLn(c.apellido);
      ReadLn(c.nombre);
      ReadLn(c.puntajeOtorgado);
      condicion := true;
    End
  Else
    condicion := false;
End;
Procedure BuscarMaximos(CodG:Integer; puntajeOtorgado: real; Var maximo,maximo2:
                        real
                        ;Var  codeGM, codeGM2:Integer);
Begin
  If puntajeOtorgado > maximo Then
    Begin
      maximo2 := maximo;
      codeGM2 := CodG;
      maximo := puntajeOtorgado;
      codeGM := CodG;
    End
  Else
    Begin
      If puntajeOtorgado > maximo2 Then
        Begin
          maximo2 := puntajeOtorgado;
          codeGM2 := CodG;
        End;
    End;
End;
Function MismosImparPar(dni: Integer): Boolean;

Var 
  digit,isPar,isImpar: integer;
Begin
  While dni<> 0 Do
    Begin
      digit := dni Mod 10;
      If (digit Mod 2) = 0 Then
        Begin
          isPar := isPar+1;
        End
      Else
        isImpar := isImpar+1;
      dni := dni Div 10;
    End;
  MismosImparPar := (isPar=4 And isImpar=4);
End;
Procedure buscarElemento (Peliculas:listPelicula;Var act,ant: listPelicula;
                          elemAbuscar:Integer; condicion:Boolean);

Var 
  act,ant: listPelicula;

Begin

  condicion := False;
  ant := Peliculas;
  act := Peliculas;
  While act <> Nil And (condicion = False) Do
    Begin
      If act^.ele.codePelicula = elemAbuscar Then
        condicion := true
      Else
        Begin
          ant := act;
          act := act^.sig;
          condicion := False;
        End;
    End;
End;
Procedure eliminarNodo(Var peliculas:listPelicula ;ant,act : listPelicula);

Begin
  If ant=act Then
    peliculas := act^.sig
  Else
    ant^.sig := act^.sig;
  Dispose(act);
  act := ant;
End;

Var 
  Peliculas,aux, act,ant: listPelicula;
  newCritica: critica;
  codeActual,codeAborrar: Integer;
  codicion,condicionBus: Boolean;
  cantCriticas: integer;
  maximo,maximo2: real;
  codeGM,codeGM2: Integer;
Begin
  Peliculas := Nil;
  CargarPeliculas(Peliculas);
  aux := Peliculas;
  While aux<> Nil Do
    Begin
      cantCriticas := 0;
      aux^.ele.puntajeProm := 0;

      codeActual := aux^.ele.codePelicula;
      CargarCritica(newCritica,codicion);
      While condicion And codeActual =  newCritica.codePelicula Do
        Begin
          cantCriticas := cantCritica+1;
          aux^.ele.puntajeProm := aux^.ele.puntajeProm + newCritica.
                                  puntajeOtorgado;
          If  MismosImparPar Then
            Begin
              WriteLn(










                 'nombre y apellido de los criticos con dni mismo par que impar'
                      ,newCritica.nombre,newCritica.apellido);
            End;
          CargarCritica(newCritica,codicion);
        End;
      aux^.ele.puntajeProm := aux^.ele.puntajeProm / cantCriticas;
      //busco maximos de los codigos de genero
      BuscarMaximos(aux^.ele.codePelicula,aux^.ele.puntajeProm,
                    maximo,maximo2, codGM,codGM2);
      aux := aux^.sig;
    End;
  WriteLn('ingrese el codigo de la pelicula que quiera borrar');
  ReadLn(codeAborrar);
  buscarElemento(Peliculas,act,ant,codeAborrar,condicionBus);
  If condicionBus Then
    Begin
      eliminarNodo(Peliculas,ant,act);
    End
  Else
    WriteLn('no se econtro el codigo de la pelicula');
End.
