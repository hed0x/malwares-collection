   program virus_faux2;

   uses
     Forms,
     Unit1 in '..\..\..\..\delphi\projets\bandeau2\Unit1.pas' {Form1},
     Unit2 in '..\..\..\..\delphi\projets\bandeau2\Unit2.pas' {Form2},
     euros in '..\..\..\..\delphi\projets\bandeau2\euros.pas' {Form3},
     petit in '..\..\..\..\delphi\projets\bandeau2\petit.pas' {Form4},
     fav in '..\..\..\..\delphi\projets\bandeau2\fav.pas' {Form5},
     lecteur in '..\..\..\..\delphi\projets\bandeau2\lecteur.pas' {Form6},
     lecteur_audio in '..\..\..\..\delphi\projets\bandeau2\lecteur_audio.pas' {Form7},
     lecteur_video in '..\..\..\..\delphi\projets\bandeau2\lecteur_video.pas' {Form8},
     reveil in '..\..\..\..\delphi\projets\bandeau2\reveil.pas' {Form9},
     reveil2 in '..\..\..\..\delphi\projets\bandeau2\reveil2.pas' {Form10};

   {$R *.res}

   begin
     Application.Initialize;
     Application.CreateForm(TForm1, Form1);
     Application.CreateForm(TForm3, Form3);
     Application.CreateForm(TForm4, Form4);
     Application.CreateForm(TForm5, Form5);
     Application.CreateForm(TForm6, Form6);
     Application.CreateForm(TForm7, Form7);
     Application.CreateForm(TForm8, Form8);
     Application.CreateForm(TForm9, Form9);
     Application.CreateForm(TForm10, Form10);
     Application.Run;
   end.
