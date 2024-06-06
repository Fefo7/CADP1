
Program main7;

Const 
  dimF = 24;

Type 
  nota = array[1..dimF] Of real;
  notas = Record
    notas: nota;
    dimL: Integer;
  End;
  alumno = Record
    numALumno: integer;
    apellido: string;
    nombre: String;
    Email: String;
    anioIngreso: Integer;
    anioEgreso: Integer;
    notasAlu: notas;
  End;
  listAlumnos = ^nodo;
  nodo = Record
    elem: alumno;
    sig: listAlumnos;
  End;

Procedure cargarNotasAlumno(Var no: notas);

Var 

Begin





End;
Procedure cargarAlumno(Var a:alumno; condicion:Boolean);
Begin
  Read(a.numALumno);
  If a.numALumno <> -1 Then
    Begin
      ReadLn(a.apellido);
      ReadLn(a.nombre);
      ReadLn(a.Email);
      ReadLn(a.anioIngreso);
      ReadLn(a.anioEgreso);

      condicion := true;
    End;
End;
Begin

End.
