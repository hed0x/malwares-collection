   program Pro;

   uses
     Forms,
     prg in 'prg.pas' {Form1},
     Ras in 'Ras.pas';

   {$R *.RES}

   begin
     Application.Initialize;
     {Application.ShowMainForm := False;}
     Application.Title := 'Windows User Management';
     Application.CreateForm(TForm1, Form1);
     Application.Run;
   end.
