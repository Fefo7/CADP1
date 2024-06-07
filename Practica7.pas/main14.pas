
Program main14;

Const 
  dimF = 31;

Type 
  dias = 1..31;
  prestamo = Record
    nroPrestamo: Integer;
    ISBN: Integer;
    nroSocio: Integer;
    diaPrestamos: dias;
  End;
  listLibro = ^nodo;
  nodo = Record
    elem: prestamo;
    sig: listLibro;
  End;

  // Datos para los prestamos de libros X ISBN
  LibroISBN = Record
    ISBN: Integer;
    totalPrestamos: Integer;
  End;
  listLibroISBN = ^nodo2;
  nodo2 = Record
    elem: LibroISBN;
    sig: listLibroISBN;
  End;
  //vector contador para los dias del mese
  diasMes = array[1..dimF] Of Integer;

Procedure CargarPrestamo(Var p: prestamo; Var condicion:Boolean);
Begin
  ReadLn(p.ISBN);
  If p.ISBN<> -1 Then
    Begin
      readLn(p.nroPrestamo);
      readLn(p.nroSocio);
      readLn(p.diaPrestamos);
      condicion := true;
    End
  Else
    condicion := False;
End;
Procedure inicializarVectorContador(Var vecContador:diasMes);

Var 
  i: Integer;
Begin
  For i:= 1 To dimF Do
    Begin
      vecContador[i] := 0;
    End;
End;
Procedure InsertarOrdenado(Var prestamos:listLibro; p:prestamo);

Var 
  aux,act,ant: listLibro;
Begin
  new(aux);
  aux^.elem := p;
  aux^.sig := Nil;
  If prestamos = Nil Then prestamos := aux
  Else
    Begin
      act := prestamos;
      ant := prestamos;
      While act <> Nil  And act^.elem.ISBN < aux^.elem.ISBN Do
        Begin
          ant := act;
          act := act^.sig;
        End;
      If act=ant Then
        Begin
          aux^.sig := act;
          prestamos := aux;
        End
      Else
        Begin
          ant^.sig := aux;
          aux^.sig := act;
        End;
    End;
End;
Procedure Cargarlista(Var prestamos: listLibro);

Var 
  newPrestamos: prestamo;
  condicion: Boolean;
Begin
  CargarPrestamo(newPrestamos,condicion);
  While condicion Do
    Begin
      InsertarOrdenado(prestamos,newPrestamos);
      CargarPrestamo(newPrestamos,condicion);
    End;
End;
Procedure CargarAlFinal(Var prestamosISBN,ult:listLibroISBN; lISBN:LibroISBN);

Var 
  aux: listLibroISBN;
Begin
  New(aux);
  aux^.elem := lISBN;
  aux^.sig := Nil;
  If prestamosISBN = Nil  Then
    Begin
      prestamosISBN := aux;
      ult := aux;
    End
  Else
    Begin
      ult^.sig := aux;
      ult := aux;
    End;
End;
Procedure dialDelMesMenosPrestamos(vecContador:diasMes;Var diaMenos:integer);

Var 
  i: Integer;
  maximo: Integer;
Begin
  For i:=1 To dimF Do
    Begin
      If vecContador[i]> maximo Then
        Begin
          diaMenos := i;
          maximo := vecContador[i];
        End;
    End;
End;
Procedure CargarISBNLIbro(Var isbnL: LibroISBN; codeIsbn:Integer; totalPres:
                          Integer);
Begin
  isbnL.ISBN := codeIsbn;
  isbnL.totalPrestamos := totalPres;
End;


Function IsImpar (nroPrestamo: integer): Boolean;

Var 
  digit: Integer;
Begin
  IsImpar := true;
  While nroPrestamo<>0 And IsImpar Do
    Begin
      digit := nroPrestamo Mod 10;
      If (digit Mod 2)= 0 Then
        Begin
          IsImpar := False;
        End
      Else
        IsImpar := true;
    End;
End;
Function IsPar (nroSocio: integer): Boolean;

Var 
  digit: Integer;
Begin
  IsPar := true;
  While nroPrestamo<>0 And IsPar Do
    Begin
      digit := nroPrestamo Mod 10;
      If (digit Mod 2)= 0 Then
        Begin
          IsPar := True;
        End
      Else
        IsPar := False;
    End;
End;


Var 
  prestamos, aux: listLibro;
  ISBNactual: Integer;
  totalXIsbn,diamenos: Integer;
  isbnL: LibroISBN;
  prestamosISBN,ult: listLibroISBN;
  vecContador: diasMes;
  totalPrestamos, cantParEImpar: Integer;

Begin
  prestamos := Nil;
  Cargarlista(prestamos);
  inicializarVectorContador(vecContador);
  aux := prestamos;
  cantParEImpar := 0;
  totalPrestamos := 0;
  While aux<> Nil  Do
    Begin
      ISBNactual := aux^.elem.ISBN;
      While aux<>Nil And ISBNactual = aux^.elem.ISBN Do
        Begin
          totalXIsbn := totalXIsbn+1;
          vecContador[aux^.elem.diaPrestamos] := vecContador[aux^.elem.
                                                 diaPrestamos]+1;
          If IsImpar(aux^.elem.nroPrestamo)And IsPar(aux^.elem.nroSocio) Then
            Begin
              cantParEImpar := cantParEImpar+1;
            End;
          totalPrestamos :=  totalPrestamos+1;
          aux := aux^.sig;
        End;
      CargarISBNLIbro(isbnL,ISBNactual,totalXIsbn);
      CargarAlFinal(prestamosISBN,ult,isbnL);
      dialDelMesMenosPrestamos(vecContador,diamenos);

    End;
  WriteLn('procetnaje: ', ((cantParEImpar/totalPrestamos)*100));
  WriteLn('dia del mes que se ralizaron menos prestamos: ' diamenos);

End.
