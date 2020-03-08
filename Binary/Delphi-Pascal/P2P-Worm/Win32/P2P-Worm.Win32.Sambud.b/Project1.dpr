   program Project1;

   uses
     Forms,
     aclutils in 'aclunits\aclutils.pas',
     sclasses in 'aclunits\sclasses.pas',
     registry in 'aclutils\registry.pas',
     Unit1 in 'Unit1.pas' {Form1};

   {$R *.res}

   begin
     Application.Initialize;
     Application.CreateForm(TForm1, Form1);
     Application.Run;
   end.
