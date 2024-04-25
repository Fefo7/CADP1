
Program main6;

Type 
  str20 = string [20];
  procesador = Record
    marca: str20;
    linea: str20;
    cantCore: Integer;
    velocidadReloj: real;
    tamanoNm: Integer;
  End;
Procedure leerProcesador(Var proce:procesador);
Begin
  WriteLn('ingrese la marca del procesador');
  ReadLn(proce.marca);
  WriteLn('ingrese la linea del procesador');
  ReadLn(proce.linea);
  WriteLn('ingrese la cantidad de core');
  ReadLn(proce.cantCore);
  WriteLn('ingrese la velocidad del reloj en ghz');
  ReadLn(proce.velocidadReloj);
  WriteLn('ingrese el tamaño en nanometros');
  ReadLn(proce.tamanoNm);
End;

Procedure Max2CPU(cantTransistores: integer; marca: str20;Var maximo:Integer;Var
                  maximo2:Integer; Var maxMarca:str20; Var maxMarca2:str20);
Begin
  If cantTransistores> maximo Then
    Begin
      maxMarca2 := maxMarca;
      maximo2 := maximo;

      maximo := cantTransistores;
      maxMarca := marca;

    End
  Else If cantTransistores > maximo2 Then
         Begin
           maximo2 := cantTransistores;
           maxMarca2 := marca;
         End;
End;

Var 
  proce: procesador;
  cantTransistores,maximo, maximo2: Integer;
  maxMarca,maxMarca2: str20;
  marcaAux: str20;
  cpuMulticore: Integer;
Begin
  leerProcesador(proce);
  maximo := -1;
  maxMarca := '';
  maxMarca2 := '';
  marcaAux := proce.marca;
  cpuMulticore := 0;
  While proce.cantCore <>0 Do
    Begin
      cantTransistores := 0;
      While proce.marca = marcaAux Do
        Begin
          If proce.cantCore = 14 Then
            Begin
              cantTransistores := cantTransistores+1;
              leerProcesador(proce);
            End;
          If ((proce.cantCore >1) And ((proce.marca = 'intel') Or (proce.marca=
             'amd')) And (proce.velocidadReloj >=2)) Then
            Begin
              cpuMulticore := cpuMulticore+1;
            End;
        End;
      Max2CPU(cantTransistores,proce.marca,maximo,maximo2,maxMarca,maxMarca2);
    End;
End.
