   unit Encryption;

   interface
   uses Windows, messages, allstrings;

   function encrypt(str:string):string;
   function Decrypt(str:string):string;

   implementation

   function Decrypt(str:string):string;
   var
   i,j:integer;
   ch:string;
   c:boolean;
   begin
   result:='';
   for i:=1 to length(str) do begin
    ch := copy(str,i,1);
    c:=false;
    for j:=1 to length(ABC2) do begin
     if copy(ABC2,j,1)=ch then begin
      result:=result+copy(ABC1,j,1);
      c := true;
     end;
    end;
     if not c then result := result + ch;
   end;
   end;

   function encrypt(str:string):string;
   var
   i,j:integer;
   ch:string;
   c:boolean;
   begin
   result:='';
   for i:=1 to length(str) do begin
    ch := copy(str,i,1);
    c:=false;
    for j:=1 to length(ABC1) do begin
     if copy(ABC1,j,1)=ch then begin
      result:=result+copy(ABC2,j,1);
      C:=true;
     end;
    end;
    if not c then result := result + ch;
   end;
   End;

   end.

