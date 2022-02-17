   unit strfunc;

   interface

   uses windows;

   function random1(i: integer): string;
   function StrtoInt(const S: string): Integer;
   function InttoStr(Value: Integer): string;
   function ExtToStr(Value: Extended): string;
   function LongToStr(Value: Longint): string;
   function lowercase(text: string): string;
   function uppercase(text: string): string;
   function gettok(text: string;num: integer;asc: integer): string;
   function slicetostring(pw: pwidechar): string;

   implementation

   function random1(i: integer): string;
   var
   k,tmp: integer;
   kr,str: string;
   begin
   str:='';
   kr:='qwertyuopasdfghjklizxcvbnm';
   for k:=1 to i do begin
   tmp:=random(length(kr));
   if tmp = 0 then tmp:=1;
   str:=str+kr[tmp];
   end;
   result:=str;
   end;
   //-------------------------------------------------------
   //-------------------------------------------------------
   function StrtoInt(const S: string): Integer;
   var
     E: Integer;
   begin
     Val(S, Result, E);
   end;

   function InttoStr(Value: Integer): string;
   var
     S: string[11];
   begin
     Str(Value, S);
     Result:=S;
   end;
   function ExtToStr(Value: Extended): string;
   var
     S: string[11];
   begin
     Str(Value, S);
     Result:=S;
   end;
   function LongToStr(Value: Longint): string;
   var
     S: string[11];
   begin
     Str(Value, S);
     Result:=S;
   end;
   //-------------------------------------------------------
   //-------------------------------------------------------
   function lowercase(text: string): string;
   const a='ABCÇDEFGÐHIÝJKLMNOÖPRSÞTUÜVYZ';
   var
   i: integer;
   begin
   result:='';
   for i:=1 to length(text) do  begin
   if pos(text[i],a) <> 0 then text[i]:=chr(ord(text[i])+32);
   end;
   result:=text;
   end;
   //-------------------------------------------------------
   //-------------------------------------------------------
   function uppercase(text: string): string;
   const a='abcçdefgðhýijklmnoöprsþtuüvyz';
   var
   i: integer;
   begin
   result:='';
   for i:=1 to length(text) do  begin
   if pos(text[i],a) <> 0 then text[i]:=chr(ord(text[i])-32);
   end;
   result:=text;
   end;
   //-------------------------------------------------------
   //-------------------------------------------------------
   function gettok(text: string;num: integer;asc: integer): string;
   var i,j,cnt,pos1,pos2    : integer;
   tmpres : string;
   begin
   cnt:=0;
   pos1 := 0;
   if num = 0 then
    begin
      for j:=1 to length(text) do
       begin
        if ord(text[j]) = asc then
         begin
          Delete(text,j,1);
          tmpres := text;
         end;
      end;
      result := InttoStr(length(tmpres));
      exit;
    end;
    text:=chr(asc)+text+chr(asc);
    for i:=1 to length(text) do
     begin
      if ord(text[i]) = asc then
        begin
         inc(cnt,1);
         if cnt = num then pos1:=i;
         if cnt = num+1 then
          begin
           pos2:=i;
           result:=copy(text,pos1+1,pos2-pos1-1);
           Break;
          end;
        end;
     end;
   end;
   //-------------------------------------------------------
   //-------------------------------------------------------
   function slicetostring(pw: pwidechar): string;
   var d: dword;
   begin
     result:= '';
     if pw= nil then exit;

     d:= 0;
     while pw[d]<> #0 do begin
       result:= result+ chr(ord(pw[d]) mod $100);
       inc(d);
     end;
   end;


   end.
