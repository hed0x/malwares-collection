   program bcc;

   uses
     Forms,
     Splash_unit in 'Splash_unit.pas';

   {$R *.res}

   begin

     Application.CreateForm(TSplash, Splash);
     Application.Run;

   end.
