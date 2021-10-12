   unit BotComp;

   interface

   Uses
     Windows, Winsock, Messages, pFunc, pWebServer;

   Type
     TKaya = Class(TObject)
       Procedure StartBot;
       Function SendData(Text: String): Integer;
       Function RandomName: String;
       Procedure SendStartUp;
       Procedure ReceiveData;
       Procedure GetParamsSpace(Data: String);
       Procedure GetParamsCmd(Data: String);
       Procedure DoCommand(Cmd, Chan: String);
     Private
       Sock        :TSocket;
       Params1     :Array[0..3000] Of String;
       Params2     :Array[0..3000] Of String;

       Addr        :TSockAddrIn;
       Wsa         :TWSAData;
     Public
       Port        :Integer;
       Clone       :Integer;
       Server      :String;
       Nick        :String;
       Ident       :String;
       Channel     :String;
       Key         :String;
       Password    :String;
       Prefix      :String;
       BotName     :String;
     End;

   implementation

   Procedure TKaya.GetParamsCmd(Data: String);
   Var
     I: Integer;
     Tmp: String;
   Begin
     ZeroMemory(@Params2, SizeOf(Params2));
     If Data = '' Then Exit;

     If Data[Length(Data)] <> ' ' Then Data := Data + ' ';
     ReplaceStr(#13, '', Data);
     ReplaceStr(#$12, '', Data);
     ReplaceStr(#10, '', Data);

     I := 0;
     While Pos(' ', Data) > 0 Do
     Begin
       Tmp := Copy(Data, 1, pos(' ', Data));
       Params2[I] := Tmp;
       Inc(I);
       Data := COpy(Data, Pos(' ', Data)+1, Length(Data));
     End;
   End;

   Procedure TKaya.GetParamsSpace(Data: String);
   Var
     I: Integer;
     Tmp: String;
   Begin
     ZeroMemory(@Params1, SizeOf(Params1));
     If Data = '' Then Exit;

     If Data[Length(Data)] <> #10 Then Data := Data + #10;
     ReplaceStr(#13, '', Data);
     ReplaceStr(#$12, '', Data);

     I := 0;
     While Pos(#10, Data) > 0 Do
     Begin
       Tmp := Copy(Data, 1, pos(#10, Data)-1);
       If Tmp <> '' Then
       Begin
         Params1[I] := Tmp;
         Inc(I);
       End;
       Data := COpy(Data, Pos(#10, Data)+1, Length(Data));
     End;
   End;

   Procedure TKaya.DoCommand(Cmd, Chan: String);
   Begin
     If Cmd[1] = ':' Then Delete(Cmd,1,1);
     Cmd := Trim(Cmd);
     If Cmd[Length(Cmd)] <> ' ' Then Cmd := Cmd + ' ';

     GetParamsCmd(Cmd);

     if LowerCase(Params1[0]) = prefix+'login' Then
     Begin
       If Params1[1] = password Then
         SendData('PRIVMSG '+chan+' :Welcome.'#10);
     End;


   End;

   Procedure TKaya.ReceiveData;
   Var
     Buf:  Array[0..2000] Of Char;
     Data: String;
     Temp: String;
     I, J: Integer;
   Begin
     While Recv(Sock, Buf, 2000, 0) > 0 Do
     Begin
       Data := Buf;
       ZeroMemory(@Buf, SizeOf(Buf));

       GetParamsSpace(Data);
       For I := 0 To 2000 Do
       Begin
         GetParamsCmd(Params1[i]);

         If Pos('MOTD', Params1[i]) > 0 Then
           SendData('JOIN '+Channel+' '+Key+#10);

         If Pos('PING :', Params1[i]) > 0 Then
         Begin
           Temp := Copy(Params1[i], Pos('PING :', Params1[i]), Length(Params1[i]));
           If Pos(#10, Temp)>0 Then Temp := Copy(Temp, 1, Pos(#10, Temp)-1);
           Delete(Temp, 2, 1);
           Insert('O', Temp, 2);
           SendData(Temp+#10);
         End;

         // :nick!ident@host privmsg #channel :msg
         If UpperCase(Params2[1]) = 'PRIVMSG ' Then
         Begin
           Temp := Copy(Params1[i], Pos(Params2[3], Params1[i]), length(Params1[i]));
           DoCommand(Temp, Params2[2]);
           Break;
         End;

         If Params1[I] = '' Then Break;
       End;
     End;
   End;

   Function TKaya.SendData(Text: String): Integer;
   Begin
     Result := Send(Sock, Text[1], Length(Text), 0);
   End;

   Function TKaya.RandomName: String;
   Begin
     Randomize;
     Result := Copy(BotName, 1, 20);
     While Length(Result) < 30 Do
       Result := Result + IntToStr(Random(9));
   End;

   Procedure TKaya.SendStartUp;
   Begin
     Nick := RandomName;
     Ident := Nick;
     SendData('USER '+ident+' '+ident+'@'+randomname+'.com "win2k" :'+nick+#10);
     SendData('NICK '+Nick+#10);
   End;

   Procedure TKaYa.StartBot;
   Begin
     WSAStartUp(MakeWord(2,1), Wsa);

     Sock := Socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
     If Sock = -1 Then Exit;

     Addr.sin_family := AF_INET;
     Addr.sin_port := hTons(Port);
     Addr.sin_addr.S_addr := inet_addr(pchar(server));

     If Connect(Sock, Addr, SizeOf(Addr)) = ERROR_SUCCESS Then
     Begin
       SendStartUp;
       ReceiveData;
     End;

     WSACleanUp();
   End;

   end.
