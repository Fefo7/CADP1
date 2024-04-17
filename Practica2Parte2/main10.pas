
Program main10;
Function isVocal ( digit: Char): Boolean;

Begin

  Case digit Of 
    'a': isVocal := True;
    'e': isVocal := True;
    'i': isVocal := True;
    'o': isVocal := True;
    'u': isVocal := True;
    'A': isVocal := True;
    'E': isVocal := True;
    'I': isVocal := True;
    'O': isVocal := True;
    'U': isVocal := True;
    Else isVocal := False;
  End;


End;

Var 
  digit: Char;
Begin
  ReadLn(digit);
  If isVocal(digit) Then
    Begin
      While isVocal(digit) Do
        Begin
          ReadLn(digit);
        End;
      If digit = '$' Then
        Begin
          ReadLn(digit);
          While (isVocal(digit)=False) And (digit<>'#') Do
            ReadLn(digit);
          If digit='#' Then
            WriteLn('esta dentro del patron')
          Else
            WriteLn ('no esta dentro del patron');
        End
      Else
        WriteLn('no esta dentro del patron');
    End
  Else
    WriteLn('no es patron');
End.
