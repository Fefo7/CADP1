
Program main9;

Const 
  tam = 400;
  AluG = 2;

Type 
  alumno = Record
    nroInscripcion: integer;
    dni: Integer;
    apellido: String;
    nombre: String;
    year: Integer;
  End;
  alumnos = array[1..tam] Of alumno;
  AlumnosMasGrandes = array[1..AluG] Of alumno;
Procedure LeerAlumno(Var a:alumno; Var condicion:Boolean);
Begin
  WriteLn('numero de DNI: ');
  ReadLn(a.dni);
  If a.dni <> -1  Then
    Begin
      WriteLn('numero de inscripcion: ');
      ReadLn(a.nroInscripcion);
      WriteLn('Apellido: ');
      ReadLn(a.apellido);
      WriteLn('Nombre: ');
      ReadLn(a.nombre);
      WriteLn('Año de nacimeinto: ');
      ReadLn(a.year);
      condicion := True;
    End
  Else
    condicion := False;
End;
Procedure CargaDatosALumnos(Var Valumnos: alumnos;  condicion:Boolean);

Var 
  i: Integer;
Begin
  i := 1;
  While (condicion <> False) And (i<=tam) Do
    Begin
      LeerAlumno(Valumnos[i], condicion);
      i := i+1;
    End;

End;

Function esDniPar(dni: Integer ): Boolean;

Var 
  aux: integer;
  condicion: Boolean;
Begin
  While (dni<>0) And (condicion = False) Do
    Begin
      aux := dni Mod 10;
      If ((aux Mod 2)= 0) Then
        Begin
          dni := dni Div 10;
          condicion := True;
        End
      Else
        condicion := False ;
    End;
  esDniPar := condicion;
End;


Var 
  i,j: Integer;
  a: alumnos;
  CantDniPar: Integer;
  aG: AlumnosMasGrandes;
  condicion: Boolean;
Begin
  CantDniPar := 0;
  aG[1].year := 9999;
  CargaDatosALumnos(a,condicion);
  For i:=1 To tam Do
    Begin
      If esDniPar(a[i].dni) Then
        CantDniPar := CantDniPar +1;
      If a[i].year < aG[1].year Then
        Begin
          aG[2] := aG[1];
          aG[1] := a[i];
        End
      Else If a[i].year < ag[2].year Then
             aG[2] := a[i];
    End;
  WriteLn('porcetanje de alumnos con dni todos par: ',
          (CantDniPar/tam)*100  );
  WriteLn('alumnos con mayo edad');
  For j:= 1 To AluG Do
    Begin
      WriteLn('nombre: ', ag[j].nombre, 'apellido: ',
              ag[j].apellido );
    End;
End.
