
Program main8;

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
Procedure LeerAlumno(Var a:alumno);
Begin
  WriteLn('numero de inscripcion: ');
  ReadLn(a.nroInscripcion);
  WriteLn('numero de DNI: ');
  ReadLn(a.dni);
  WriteLn('Apellido: ');
  ReadLn(a.apellido);
  WriteLn('Nombre: ');
  ReadLn(a.nombre);
  WriteLn('Año de nacimeinto: ');
  ReadLn(a.year);
End;
Procedure CargaDatosALumnos(Var Valumnos: alumnos);

Var 
  i: Integer;
Begin
  For i:= 1 To tam Do
    LeerAlumno(Valumnos[i]);
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
Begin
  CantDniPar := 0;
  aG[1].year := 9999;
  CargaDatosALumnos(a);
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
