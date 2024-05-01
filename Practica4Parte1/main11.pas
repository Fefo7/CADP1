
Program main11;

Const 
  tam = 200;

Type 
  publicacion = Record
    titulo : String;
    autor: String;
    cantLike: Integer;
    cantClicks: integer;
    cantComentarios: integer;
  End;
  publicaciones = array[1..tam] Of publicacion;

Procedure LeerPublicacion(Var p:publicacion);
Begin
  WriteLn('titulo: ');
  ReadLn(p.titulo);
  WriteLn('autor: ');
  ReadLn(p.autor);
  WriteLn('cantidad de likes: ');
  ReadLn(p.cantLike);
  WriteLn('cantidad de clicks: ');
  ReadLn(p.cantClicks);
  WriteLn('cantidad de comentarios: ');
  ReadLn(p.cantComentarios);
End;
Procedure CargaDatosVector( Var pv:publicaciones);

Var 
  i: Integer;
Begin
  For i:= 1 To tam Do
    Begin
      LeerPublicacion(pv[i]);
    End;
End;

Var 
  pv: publicaciones;
  i: integer;
  TituloMaximo: String;
  maximoClicks, totalLikes, totalComentarios: Integer;
Begin
  maximoClicks := -1;
  totalLikes := 0;
  totalComentarios := 0;

  CargaDatosVector(pv);
  For i:=1 To tam Do
    Begin
      If (pv[i].cantClicks>maximoClicks) Then
        Begin
          TituloMaximo := pv[i].titulo;
          maximoClicks := pv[i].cantClicks;
        End;
      If (pv[i].autor= 'art vandelay') Then
        totalLikes := totalLikes+ pv[i].cantLike;
      totalComentarios := totalComentarios + pv[i].cantComentarios;
    End;
End.
