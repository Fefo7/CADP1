
Program main2;

Const 
  tam = 500;

Type 
  Alumnos = array[1..tam] Of String;

Procedure LeerNomAlumnos(Var AlumnosV: Alumnos; Var DimL: integer);

Var 
  i: Integer;
Begin
  i := 1;
  ReadLn(AlumnosV[i]);
  While AlumnosV[i] <> 'zzz' Do
    Begin
      DimL := DimL+1;
      i := i+1;
      ReadLn(AlumnosV[i]);
    End;
End;

Procedure EliminarOcurrencia(Var AlumnosV: Alumnos;nombre:String; Var DimL:
                             Integer);

Var 
  i: Integer;
  PosOcurrencia: Integer;
Begin
  For i:=1 To DimL Do
    If AlumnosV[i]= nombre Then PosOcurrencia := i;
  If ((PosOcurrencia >=1) And (PosOcurrencia<=DimL)) Then
    Begin
      For i:= PosOcurrencia To (DimL-1) Do
        AlumnosV[i] := AlumnosV[i+1];
    End;
  DimL := DimL-1;
End;

Procedure InsertarValor(Var AlumnosV: Alumnos;Var DimL:Integer ; nombre:String);

Var 
  i: Integer;
Begin
  If ((DimL+1)<= tam) And (4>=1) Then
    Begin
      For i:= DimL Downto 4  Do
        Begin
          AlumnosV[i+1] := AlumnosV[i];
        End;
      AlumnosV[4] := nombre;
      DimL := DimL+1;
    End;
End;
Procedure AgregarValor(Var AlumnosV:Alumnos; Var DimL:Integer; nombre:String );
Begin
  If (DimL+1)<= tam Then
    Begin
      DimL := DimL+1;
      AlumnosV[DimL] := nombre;
    End;
End;

Var 
  AlumnosV: Alumnos;
  DimL: Integer;
  NomAEliminar: string;
  nombreAInsertar: String;
  nombreAgregar: string;
Begin
  DimL := 0;
  LeerNomAlumnos(AlumnosV,DimL);
  WriteLn('ingrese el nombre duplicado que quiera eliminar');
  ReadLn(NomAEliminar);
  EliminarOcurrencia(AlumnosV,NomAEliminar, DimL);
  WriteLn('ingrese el nombre a insertar');
  ReadLn(nombreAInsertar);
  InsertarValor(AlumnosV,DimL,nombreAInsertar);
  WriteLn('ingrese el nombre a agregar');
  ReadLn(nombreAgregar);
  AgregarValor(AlumnosV,DimL,nombreAgregar);
End.
