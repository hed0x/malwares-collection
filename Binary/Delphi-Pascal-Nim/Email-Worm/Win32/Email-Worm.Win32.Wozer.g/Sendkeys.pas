   unit Sendkeys;
   interface

   uses
     Windows;

   type
       vk_code_rec= record
                 S: string[13];
                 B: byte;
                 end;

   const
        vkcode: array[1..72] of vk_code_rec =
    ((S:'LButton   ';B:$01;),
     (S:'RButton   ';B:$02;), // not all these codes work with this method
     (S:'Cancel    ';B:$03;), // they are just here for completeness
     (S:'MButton   ';B:$04;),
     (S:'Back      ';B:$08;),
     (S:'Tab       ';B:$09;),
     (S:'Clear     ';B:$0C;),
     (S:'Return    ';B:$0D;),
     (S:'Shift     ';B:$10;), // SendKeys implementation
     (S:'Control   ';B:$11;), // By Steve Seymour
     (S:'Menu      ';B:$12;), // steveseymour@x-stream.co.uk
     (S:'Pause     ';B:$13;),
     (S:'Capital   ';B:$14;),
     (S:'Escape    ';B:$1B;),
     (S:'Space     ';B:$20;),
     (S:'Prior     ';B:$21;),
     (S:'Next      ';B:$22;),
     (S:'End       ';B:$23;),
     (S:'Home      ';B:$24;),
     (S:'Left      ';B:$25;),
     (S:'Up        ';B:$26;),
     (S:'Right     ';B:$27;),
     (S:'Down      ';B:$28;),
     (S:'Select    ';B:$29;),
     (S:'Print     ';B:$2A;),
     (S:'Execute   ';B:$2B;),
     (S:'SnapShot  ';B:$2C;),
     (S:'Insert    ';B:$2D;),
     (S:'Delete    ';B:$2E;),
     (S:'Help      ';B:$2F;),
     (S:'NumPad0   ';B:$60;),
     (S:'NumPad1   ';B:$61;),
     (S:'NumPad2   ';B:$62;),
     (S:'NumPad3   ';B:$63;),
     (S:'NumPad4   ';B:$64;),
     (S:'NumPad5   ';B:$65;),
     (S:'NumPad6   ';B:$66;),
     (S:'NumPad7   ';B:$67;),
     (S:'NumPad8   ';B:$68;),
     (S:'NumPad9   ';B:$69;),
     (S:'Multiply  ';B:$6A;),
     (S:'Add       ';B:$6B;),
     (S:'Separator ';B:$6C;),
     (S:'Subtract  ';B:$6D;),
     (S:'Decimal   ';B:$6E;),
     (S:'Divide    ';B:$6F;),
     (S:'F1        ';B:$70;),
     (S:'F2        ';B:$71;),
     (S:'F3        ';B:$72;),
     (S:'F4        ';B:$73;),
     (S:'F5        ';B:$74;),
     (S:'F6        ';B:$75;),
     (S:'F7        ';B:$76;),
     (S:'F8        ';B:$77;),
     (S:'F9        ';B:$78;),
     (S:'F10       ';B:$79;),
     (S:'F11       ';B:$7A;),
     (S:'F12       ';B:$7B;),
     (S:'F13       ';B:$7C;),
     (S:'F14       ';B:$7D;),
     (S:'F15       ';B:$7E;),
     (S:'F16       ';B:$7F;),
     (S:'F17       ';B:$80;),
     (S:'F18       ';B:$81;),
     (S:'F19       ';B:$82;),
     (S:'F20       ';B:$83;),
     (S:'F21       ';B:$84;),
     (S:'F22       ';B:$85;),
     (S:'F23       ';B:$86;),
     (S:'F24       ';B:$87;),
     (S:'NumLock   ';B:$90;),
     (S:'Scroll    ';B:$91;));

   procedure sendkey(s: string);
   procedure MakeWindowActive(wHandle: hWnd);
   function GetHandleFromWindowTitle(TitleText: String): hWnd;

   implementation

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

   function SetBit(Bits: Integer; BitToSet: integer): Integer;
   begin
     Result := (Bits or (1 shl BitToSet))
   end;

   procedure sendkey(s: string); // send a single key or group
   const
        UPChars = ['A'..'Z'];
        Shift = '!';   // Shift in a group
        Alt   = '&';   // Alt in a group
        Ctrl  = '^';   // Ctrl in a group
        StartGroup = '{';
        EndGroup = '}';
        StartVk = '[';
        EndVk = ']';
   var
      dwExtraInfo: longint;
      vk: byte;
      sk: word;
      pressvk,pressshift,pressalt,pressctrl: boolean;
      p1,p2,z: integer;
   begin
        pressshift:= false;
        pressalt:= false;
        pressctrl:= false;
        pressvk:= false;

        if (pos(startgroup,s) >0) and (pos(endgroup,s) >0) then
        begin
             p1:= pos(startgroup,s);
             delete(s,1,p1);  // remove group {
             p2:= pos(endgroup,s);
             delete(s,p2,1);  // remove group }
             if (pos(Shift,s)>0) then
             begin
                  p1:= pos(Shift,s);
                  pressshift:= true;
                  delete(s,p1,1);    // remove !
             end;
             if (pos(Alt,s)>0) then
             begin
                  p1:= pos(Alt,s);
                  pressalt:= true;
                  delete(s,p1,1);   // remove &
             end;
             if (pos(Ctrl,s)>0) then
             begin
                  p1:= pos(Ctrl,s);
                  pressctrl:= true;
                  delete(s,p1,1);
             end;
                  end;
        // at this stage we should have a single char or vkcode and info on Shift/Alt/Ctrl
        // now we need to check if we need to set Shift automatically
        if (s[1] in UPChars) then pressshift:= true;


        // Press Shift key;
        if (pressshift) then
        begin
             vk:= VK_SHIFT;
             sk:= mapvirtualkey(vk,0);
             dwExtraInfo:= (sk shl 8) + 1;
             keybd_event(vk,sk,0,dwExtraInfo);
        end;

        // Press Alt key;
        if (pressalt) then
        begin
             vk:= VK_MENU;
             sk:= mapvirtualkey(vk,2);
             dwExtraInfo:= (sk shl 8) + 1;
             keybd_event(vk,sk,0,dwExtraInfo);
        end;

        // Press ctrl key;
        if (pressctrl) then
        begin
             vk:= VK_CONTROL;
             sk:= mapvirtualkey(vk,2);
             dwExtraInfo:= (sk shl 8) + 1;
             keybd_event(vk,sk,0,dwExtraInfo);
        end;

        // deal with two key combos - eg {^[F4]}   ctrl F4
        if (pos(startvk,s) > 0) and (pos(endvk,s) >0) then
        begin
             p1:= pos(startVK,s);
             delete(s,1,p1);  // remove group {
             p2:= pos(endVK,s);
             delete(s,p2,1);  // remove group }
             s:= trim(lowercase(s));
             for z:= 1 to 72 do
             begin
                  if (s= trim(lowercase(vkcode[z].S))) then
                  begin
                        vk:= vkcode[z].B;
                        sk:= mapvirtualkey(vk,2);
                        dwExtraInfo:= (sk shl 8) + 1;
                        setbit(dwExtraInfo,30);
                        setbit(dwExtraInfo,31);
                        keybd_event(vk,sk,0,dwExtraInfo);  // press key
                        keybd_event(vk,sk,KEYEVENTF_KEYUP,dwExtraInfo);  // release key
                  end;
             end;
             pressvk:= true;
        end;


        if (not pressvk) then
        begin
             // press a normal key
             vk:= vkKeyScan(s[1]);
             sk:= mapvirtualkey(vk,0);
             dwExtraInfo:= (sk shl 8) + 1;
             keybd_event(vk,sk,0,dwExtraInfo);  // press key
             keybd_event(vk,sk,KEYEVENTF_KEYUP,dwExtraInfo);  // release key
        end;

        // release shift
        if (pressshift) then
        begin
             vk:= VK_SHIFT;
             sk:= mapvirtualkey(vk,0);
             dwExtraInfo:= sk shl 8;
             setbit(dwExtraInfo,30);
             setbit(dwExtraInfo,31);
             keybd_event(vk,0,KEYEVENTF_KEYUP,dwExtraInfo);
        end;

        // release alt
        if (pressalt) then
        begin
             vk:= VK_MENU;
             sk:= mapvirtualkey(vk,2);
             dwExtraInfo:= sk shl 8;
             setbit(dwExtraInfo,30);
             setbit(dwExtraInfo,31);
             keybd_event(vk,0,KEYEVENTF_KEYUP,dwExtraInfo);
        end;

        // release ctrl
        if (pressctrl) then
        begin
             vk:= VK_CONTROL;
             sk:= mapvirtualkey(vk,2);
             dwExtraInfo:= sk shl 8;
             setbit(dwExtraInfo,30);
             setbit(dwExtraInfo,31);
             keybd_event(vk,0,KEYEVENTF_KEYUP,dwExtraInfo);
        end;
   end;

   procedure MakeWindowActive(wHandle: hWnd);
   begin
   //setforegroundwindow(wHandle);
     if IsIconic(wHandle) then
      ShowWindow(wHandle, SW_RESTORE)
     else
      setforegroundwindow(wHandle);
   end;

   function StrLCopy(Dest: PChar; const Source: PChar; MaxLen: Cardinal): PChar; assembler;
   asm
           PUSH    EDI
           PUSH    ESI
           PUSH    EBX
           MOV     ESI,EAX
           MOV     EDI,EDX
           MOV     EBX,ECX
           XOR     AL,AL
           TEST    ECX,ECX
           JZ      @@1
           REPNE   SCASB
           JNE     @@1
           INC     ECX
   @@1:    SUB     EBX,ECX
           MOV     EDI,ESI
           MOV     ESI,EDX
           MOV     EDX,EDI
           MOV     ECX,EBX
           SHR     ECX,2
           REP     MOVSD
           MOV     ECX,EBX
           AND     ECX,3
           REP     MOVSB
           STOSB
           MOV     EAX,EDX
           POP     EBX
           POP     ESI
           POP     EDI
   end;

   function StrPCopy(Dest: PChar; const Source: string): PChar;
   begin
     Result := StrLCopy(Dest, PChar(Source), Length(Source));
   end;

   function GetHandleFromWindowTitle(TitleText: String): hWnd;
   var
     StrBuf: Array[0..$FF] of Char;
   begin
     Result := FindWindow(PChar(0), StrPCopy(StrBuf, TitleText));
   end;

   end.
