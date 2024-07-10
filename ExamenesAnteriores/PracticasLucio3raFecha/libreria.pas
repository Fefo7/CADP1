
Program libreria;

Const 
  maxG = 20;
  maxMeses = 12;
  maxCalifi = 10;

Type 
  codigo = 1..maxG;
  calificacion = 0..maxCalifi;
  calificaciones = array[1..maxMeses] Of calificacion;
  libro = Record
    codigoLibro: integer;
    titulo: string;
    autor: string;
    codeG: codigo;
    anioPublicidad: integer;
    puntaje: calificaciones;
  End;
  listLibro = ^nodo;
  nodo = Record
    elem: libro;
    sig: listLibro;
  End;
  contadorGenero = array[codigo] Of Integer;

Procedure crearLista (Var l: listLibro);
Begin
  l := Nil;
End;
Procedure inicializarVector(Var v: contadorGenero);

Var 
  i: integer;
Begin
  For i:= 1 To maxG Do
    Begin
      v[i] := 0;
    End;
End;
Procedure contarLibro(Var contGenero: contadorGenero; codG: codigo );
Begin
  contGenero[codG] := contGenero[codG] +1;
End;
Function seVendio6meses (c:calificaciones): Boolean;

Var 
  i,aux: Integer;

Begin
  aux := 0;
  For i:=1 To maxMeses Do
    Begin
      If c[i] >0 Then
        Begin
          aux := aux +1;
        End;
    End;
  seVendio6meses := aux>= 6;
End;
Procedure promedioCa(c: calificaciones; Var promedio: real);

Var 
  i: integer;
  sumaNotas: real;
  cantNotas: Real;
Begin
  sumaNotas := 0;
  cantNotas := 0;
  For i:=1 To maxMeses Do
    Begin
      sumaNotas := sumaNotas + c[i];
      If  c[i] > 0 Then
        cantNotas := cantNotas +1;
    End;
  promedio := sumaNotas /cantNotas;
End;
Procedure buscarMaximoTitulo(c: calificaciones; libtitulo: String; Var max:real;
                             Var max2:real; Var
                             titulo: String; Var titulo2: String);

Var 
  promedio: real;
Begin
  promedioCa(c,promedio);
  If promedio > max Then
    Begin
      max2 := max;
      titulo2 := titulo;
      max := promedio;
      titulo := libtitulo;
    End
  Else
    Begin
      If promedio > max2 Then
        Begin
          max2 := promedio;
          titulo2 := libtitulo;
        End;
    End;
End;
Procedure procesarDatos(libros: listLibro; Var contGenero: contadorGenero; Var
                        titulo: String;Var titulo2: String);

Var 
  max,max2: Real;
Begin
  max := -1;
  While libros <> Nil Do
    Begin
      If libros^.elem.anioPublicidad < 2000 Then
        Begin
          contarLibro(contGenero, libros^.elem.codeG);
        End;
      If seVendio6meses(libros^.elem.puntaje)  Then
        Begin
          buscarMaximoTitulo(libros^.elem.puntaje, libros^.elem.titulo,max,max2
                             ,titulo,titulo2)
        End;
      libros := libros^.sig;
    End;
End;
Procedure informar(contGenero:contadorGenero; titulo: String; titulo2:String);

Var 
  i: integer;
Begin
  For i:=1 To maxG Do
    Begin
      WriteLn('los generos que mas se vieron antes del 2000 son',contGenero[i]);
    End;
  WriteLn('los titulos que se vendieron mas fueron: ', titulo, titulo2);
End;
Procedure insertarOrdenado(Var librosOrde: listLibro; l:libro);

Var 
  aux,act,ant: listLibro;
Begin
  New(aux);
  aux^.elem := l;
  act := librosOrde;
  ant := librosOrde;
  While act<> Nil And aux^.elem.autor > act^.elem.autor  Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If act = ant Then
    Begin
      librosOrde := aux;
    End
  Else
    ant^.sig := aux;
  aux^.sig := act;
End;
Procedure agregarListaOrdenada (libros : listLibro;Var librosOrde:listLibro);
Begin

  While libros <> Nil Do
    Begin
      If tiene4pares(librosOrde) And (libros^.elem.anioPublicidad > 1995 And
         libros^.elem.anioPublicidad < 2005) Then
        Begin
          insertarOrdenado(librosOrde,libros^.elem);
        End;
      libros := libros^.sig;
    End;


End;
Procedure buscarLibro(librosOrde: listLibro; code:integer; Var titulo:String);
Begin
  While librosOrde<> Nil And librosOrde^.elem.codigoLibro <> code Do
    Begin
      librosOrde := librosOrde^.sig;
    End;
  If librosOrde^.elem.codigoLibro = code Then
    titulo := librosOrde^.elem.titulo;
End;

Var 
  libros, librosOrde : listLibro;
  contGenero: contadorGenero;
  titulo,titulo2: String;
  libroAbuscar: Integer;
  tituloAbuscar: string;
Begin
  crearLista(libros);
  crearLista(librosOrde);
  inicializarVector(contGenero);

  procesarDatos(libros, contGenero,titulo,titulo2);
  informar(contGenero, titulo, titulo2);
  agregarListaOrdenada(libros,librosOrde);
  WriteLn('ingrese el codigo de libro que quiera buscar: ');
  ReadLn(libroAbuscar);
  buscarLibro(librosOrde,libroAbuscar,tituloAbuscar);
  WriteLn('el titulo del librio, ', libroAbuscar, 'es: ', tituloAbuscar);
End.
