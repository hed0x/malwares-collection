   unit Sendkeys;

   interface

   uses
     Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

   type
     TSendkeys = class(TComponent)
     private
       { Private declarations }
     protected
       { Protected declarations }
     public
       { Public declarations }
     published
       { Published declarations }
       procedure SendKeys(const text: String);
       procedure SendKeysTo(WindowTitle : string; const text: String);
       procedure Delay(n: Integer);
       procedure MakeWindowActive(whandle: hWnd);
       function GetHandleFromWindowTitle(const titletext: string): hWnd;
     end;

   const
     SK_BKSP = #8;
     SK_TAB = #9;
     SK_ENTER = #13;
     SK_ESC = #27;
     SK_F1 = #228;
     SK_F2 = #229;
     SK_F3 = #230;
     SK_F4 = #231;
     SK_F5 = #232;
     SK_F6 = #233;
     SK_F7 = #234;
     SK_F8 = #235;
     SK_F9 = #236;
     SK_F10 = #237;
     SK_F11 = #238;
     SK_F12 = #239;
     SK_HOME = #240;
     SK_END = #241;
     SK_UP = #242;
     SK_DOWN = #243;
     SK_LEFT = #244;
     SK_RIGHT = #245;
     SK_PGUP = #246;
     SK_PGDN = #247;
     SK_INS = #248;
     SK_DEL = #249;
     SK_SHIFT_DN = #250;
     SK_SHIFT_UP = #251;
     SK_CTRL_DN = #252;
     SK_CTRL_UP = #253;
     SK_ALT_DN = #254;
     SK_ALT_UP = #255;

   procedure Register;

   implementation

   procedure Register;
   begin
     RegisterComponents('Samples', [TSendkeys]);
   end;

   procedure TSendkeys.Delay(n: Integer);
   var   start: LongInt;
   begin
      start := GetTickCount;
   repeat      Application.ProcessMessages;
   until (GetTickCount - start) >= n;
   end;

   procedure TSendkeys.MakeWindowActive(whandle: hWnd);
   begin
     if IsIconic(whandle) then
      ShowWindow(whandle,SW_RESTORE)
     else
       BringWindowToTop(whandle);
   end;

   function TSendkeys.GetHandleFromWindowTitle(const titletext: string): hWnd;
   var
    strbuf: Array[0..255] of Char;
   begin
      result := FindWindow(PChar(0),
                 StrPCopy(strbuf,titletext));
   end;

   procedure TSendkeys.SendKeys(const text: String);
   var
      i: Integer;
      shift: Boolean;
      vk,scancode: Word;
      ch: Char;
      c,s: Byte;
   const
      vk_keys: Array[0..9] of Byte =
         (VK_HOME,VK_END,VK_UP,VK_DOWN,VK_LEFT,
           VK_RIGHT,VK_PRIOR,VK_NEXT,VK_INSERT,
           VK_DELETE);
      vk_shft: Array[0..2] of Byte =
        (VK_SHIFT,VK_CONTROL,VK_MENU);
      flags: Array[false..true] of Integer =
        (KEYEVENTF_KEYUP, 0);
   begin
      shift := false;
      for i := 1 to Length(text) do
      begin
         ch := text[i];
         if ch >= #250 then
         begin
            s := Ord(ch) - 250;
            shift := not Odd(s);
            c := vk_shft[s shr 1];
            scancode := MapVirtualKey(c,0);
            Keybd_Event(c,scancode,flags[shift],0);
         end
         else
         begin
            vk := 0;
            if ch >= #240 then
               c := vk_keys[Ord(ch) - 240]
            else if ch >= #228 then
               {228 (F1) => $70 (vk_F1)}
               c := Ord(ch) - 116
            else if ch < #32 then
               c := Ord(ch)
            else
            begin
               vk :=VkKeyScan(ch);
               c :=LoByte(vk);
            end;
            scancode := MapVirtualKey(c,0);
            if not shift and (Hi(vk) > 0) then
               { $2A = scancode of VK_SHIFT }
               Keybd_Event(VK_SHIFT,$2A,0,0);
            Keybd_Event(c,scancode,0,0);
            Keybd_Event(c,scancode,
                  KEYEVENTF_KEYUP,0);
            if not shift and (Hi(vk) > 0) then
               Keybd_Event(VK_SHIFT,
                  $2A,KEYEVENTF_KEYUP,0);
         end;
         Application.ProcessMessages;
      end;
   end;

   procedure TSendkeys.SendKeysTo(WindowTitle : string; const text: String);
   var   Window : hWnd;
   begin
      Window := GetHandleFromWindowTitle(WindowTitle);
      MakeWindowActive(Window);
      Sendkeys(text);
   end;

   end.
