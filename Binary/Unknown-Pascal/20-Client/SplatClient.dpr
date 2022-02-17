   program SplatClient;

   uses
     Forms,
     untSplash in 'untSplash.pas' {Form1},
     untClient in 'untClient.pas' {Form2},
     untFilemng in 'untFilemng.pas' {Form3};

   {$R *.res}

   begin
     Application.Initialize;
     Application.CreateForm(TForm1, Form1);
     Application.CreateForm(TForm2, Form2);
     Application.CreateForm(TForm3, Form3);
     Application.Run;
   end.
