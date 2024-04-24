
Program main4;

Const 
  priceMinutes = 3.40;
  priceMB = 1.35;

Type 
  Client = Record
    codeClient: Integer;
    amountLine: Integer;
  End;
  ClientLine = Record
    number: Integer;
    amountMinutes: real;
    amountMB: real;
  End;
Procedure ReadClienteLine(Var line:ClientLine; Var prMB:
                          Real; Var prMinute: real);

Begin
  WriteLn('ingrese el numero del cliente');
  ReadLn(line.number);
  WriteLn('ingrese la cantida de minutos');
  ReadLn(line.amountMinutes);
  WriteLn('ingrese la cantidad de MB consumidas');
  ReadLn(line.amountMB);
  prMinute := prMinute+(line.amountMinutes * priceMinutes);
  prMB := prMB + (line.amountMB * priceMB);

End;
Procedure ReadClient(Var ClientIn:Client);
Begin
  WriteLn('ingrese el codigo del cliente');
  ReadLn(ClientIn.codeClient);
  WriteLn('ingrese las cantidade linea');
  ReadLn(ClientIn.amountLine);
End;

Var 
  line: ClientLine;
  ClientIn: Client;
  i,y: Integer;
  prMinute, prMB: Real;
Begin

  For i:=0 To 2 Do
    Begin
      ReadClient(ClientIn);
      prMinute := 0;
      prMB := 0;
      For y:=1 To ClientIn.amountLine Do
        Begin
          ReadClienteLine(line, prMinute, prMB);
        End;
      WriteLn('los mintuos a pagar son: ', prMinute);
      WriteLn('los MB a pagar son: ', prMB);

    End;
End.
