
Program main8;

Var 
  Letra: char;
  contadorVocales,i: Integer;

Begin
  contadorVocales := 0;
  For i := 1 To 3 Do
    Begin
      WriteLn('ingrese una letra letras');
      ReadLn(Letra);
      Case Letra Of 
        'a': contadorVocales := contadorVocales+1;
        'e': contadorVocales := contadorVocales+1;
        'i': contadorVocales := contadorVocales+1;
        'o': contadorVocales := contadorVocales+1;
        'u': contadorVocales := contadorVocales+1;
        Else
          writeln('Al menos un caracter no era vocal');
      End;
    End;
  If contadorVocales=3 Then
    WriteLn('Los tres son vocales');
End.
