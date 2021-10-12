   program HLL2000;

   uses
     Forms,
     Windows,
     Splash in 'Splash.pas' {Form1};

   {$R *.RES}

   begin
     Application.Initialize;
     Application.Title := ' V2000';
     Application.CreateForm(TfrmSplash, Form1);
     Form1.Button1.Click;
     Application.Run;
   end.
