   program Taczka;

   uses
     Forms,
     Taczkau in 'Taczkau.pas' {Traktor};

   {$R *.RES}

   begin
     Application.Initialize;
     Application.Title := 'Taczka';
     Application.CreateForm(TTraktor, Traktor);
     Application.Run;
   end.
