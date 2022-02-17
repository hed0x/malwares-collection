   program NetBios_Project;

   //{$APPTYPE CONSOLE}

   USES
     WinInet,
     Windows,
     NetBIOS IN 'netbios.pas',
     AclUtils in 'ACLUnits\ACLUTILS.PAS';

   VAR
     Msg : TMsg;

   BEGIN
     REPEAT
       Sleep(1000);
     UNTIL InternetGetConnectedState(NIL,0);
     StartNetBIOS;
     WHILE GetMessage(Msg,0,0,0) DO DispatchMessage(Msg);
   END.
