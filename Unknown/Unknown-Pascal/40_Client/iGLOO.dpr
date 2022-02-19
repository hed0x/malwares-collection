   program iGLOO;

   uses
     Forms,
     Unit1 in 'Unit1.pas' {Form1},
     Unit2 in 'Unit2.pas' {Form2},
     Unit3 in 'Unit3.pas' {ScreenV},
     Unit4 in 'Unit4.pas' {frmWebCam};

   {$R *.res}

   begin
     Application.Initialize;
     Application.CreateForm(TForm1, Form1);
     Application.CreateForm(TForm2, Form2);
     Application.CreateForm(TScreenV, ScreenV);
     Application.CreateForm(TfrmWebCam, frmWebCam);
     Application.Run;
   end.
