
Program main9;

Type 
  str25 = String[25];

Procedure numSubSmall(lastName: str25;numSub: Integer; Var lastNameMin: str25;
                      Var  lastNameMin2: str25; Var minium: Integer; Var minium2
                      :Integer );
Begin
  If numSub < minium Then
    Begin
      minium2 := minium;
      lastNameMin2 := lastNameMin;

      minium := numSub;
      lastNameMin := lastName;

    End
  Else If numSub < minium2 Then
         Begin
           minium2 := numSub;
           lastNameMin2 := lastName;
         End;
End;

Procedure numSubBig(name:str25; numSub: Integer; Var NameMax:str25; Var NameMax2
                    : str25; Var Maximum: Integer; Var Maximum2: Integer);
Begin
  If numSub> Maximum Then
    Begin
      Maximum2 := Maximum;
      NameMax2 := NameMax;
      Maximum := numSub;
      NameMax := name
    End
  Else If numSub> Maximum2 Then
         Begin
           Maximum2 := numSub;
           NameMax2 := name;
         End;
End;

Procedure percentageNumPeer(amountStudentsPeers:Integer; amountStudents: Integer
                            ; Var percentage:Real);
Begin
  percentage := (amountStudentsPeers* amountStudents)/100;
End;

Var 
  name,lastName: str25;
  numSub: Integer;
  amountStudentsPeers: Integer;
  StudentsTotal: Integer;
  percentage: real;
  {variables para las funciones}
  lastNameMin,lastNameMin2: str25;
  minium,minium2: Integer;

  NameMax,NameMax2: str25;
  Maximum,Maximum2: Integer;
Begin
  amountStudentsPeers := 0;
  StudentsTotal := 0;
  minium := 9999;
  minium2 := 9999;
  Maximum := -1;
  Maximum2 := -1;
  Repeat
    Begin
      WriteLn('ingrese el nombre');
      ReadLn(name);
      WriteLn('ingrese el apellido');
      ReadLn(lastName);
      WriteLn('ingrese el numero de inscripcion');
      ReadLn(numSub);
      StudentsTotal := StudentsTotal+1;
      numSubSmall(lastName, numSub, lastNameMin,lastNameMin2,minium,minium2);
      numSubBig(name,numSub,NameMax,NameMax2, Maximum,Maximum2);
      If ((numSub Mod 2)=0) Then
        Begin
          amountStudentsPeers := amountStudentsPeers+1;
        End;

    End;
  Until (numSub = 1200);
  percentageNumPeer(amountStudentsPeers,StudentsTotal,percentage);
  WriteLn('apellido de los alumnos con inscripcion mas chico', lastNameMin,
          'segundo mas chico: ', lastNameMin2 );
  WriteLn('nombre de los dos alumnos con numero de inscripcion mas grande: ',
          NameMax,
          'segundo mas grande: ', NameMax2 );
  WriteLn('porcentaje de alumnos con inscripcion par',percentage);
End.
