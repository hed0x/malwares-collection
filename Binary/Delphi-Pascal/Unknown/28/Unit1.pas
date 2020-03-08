   unit Unit1;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ComCtrls, ScktComp;

   type
     TForm1 = class(TForm)
       ListView1: TListView;
       Edit1: TEdit;
       Button1: TButton;
       Button2: TButton;
       Memo1: TMemo;
       ClientSocket1: TClientSocket;
       Button3: TButton;
       procedure Button1Click(Sender: TObject);
       procedure StripLine(str:string);
       Function Exist(w,l1,l2:string):Boolean;
       Function SayRandom(LstNr, Len:integer):String;
       Function PickRword(I:Integer):string;
       procedure Edit1KeyDown(Sender: TObject; var Key: Word;
         Shift: TShiftState);
       procedure Button3Click(Sender: TObject);
       procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
       procedure ClientSocket1Connect(Sender: TObject;
         Socket: TCustomWinSocket);
       procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
         ErrorEvent: TErrorEvent; var ErrorCode: Integer);
       procedure FormCreate(Sender: TObject);
       Procedure GetSubWord(s:string);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form1: TForm1;
     SubWord : string;
     OPEN : BOOLEAN;
     JOINED : BOOLEAN = FALSE;
     Lstring : string;
     Nick : String = 'FaceHacker';
     Channel :String;

   implementation

   {$R *.dfm}

   Procedure TForm1.GetSubWord(s:string);
   var
    I,F:integer;
   Begin
   if copy(s,1,1) <> ' ' then begin
    Insert(' ',s,1);
   end;

   if copy(s,length(s),1) <> ' ' then begin
    Insert(' ',s,length(s)+1);
   end;

   F := 0;
   While Pos(' ',S)>0 do begin
    I:= Pos(' ',S);
    Delete(S, i, 1);
    Insert(chr(0160), s, i);
    Inc(F);
   End;
   F:=F-2;
   While F >= 0 Do Begin
   SubWord := Copy(S,Pos(chr(0160),S)+1, length(s));
   F:=F-1;
   S := Copy(S,Pos(chr(0160),S)+1, length(s));
   End;
   SubWord := Copy(SubWord,1,Pos(Chr(0160),SubWord)-1);
   End;

   Function TForm1.PickRword(I:Integer):string;
   var
    w1,w2,w3:string;
    f,j,fag,h,nrs:integer;
    Places:Array[0..9000]of integer;
    FWord:Boolean;
   begin
    h:=0;
    w1 := ListView1.Items[i].SubItems[0];
    if copy(w1,1,1) = chr(0160) then
     w1 := copy(w1,2,length(w1));
    if copy(w1,length(w1),1) = chr(0160) then
     w1 := copy(w1,1,length(w1)-1);
    fag := 0;
    nrs := 0;
    FWord := false;
    For j :=0 to listview1.items.count -1 do
     if listview1.items[j].caption = w1 then begin
      places[fag] := j;
      inc(fag);
      inc(nrs);
      FWord := true;
     end;
    if not FWord then begin
     For j :=0 to listview1.items.count -1 do
      if listview1.items[j].subitems[0] = chr(0160)+w1+chr(0160) then begin
       places[fag] := j;
       inc(fag);
       inc(nrs);
      end;
    end;
    I := Random(nrs);
    I := Places[i];
    w2 := ListView1.items[i].SubItems[1];
    w3 := ListView1.Items[i].SubItems[0];
    for j := 0 to length(w2)-1 do
     if copy(w2,j,1) = chr(0160) then inc(h);
    h := h-1;
    randomize;
    f := h;
    repeat
     h := random(h);
    until h <> f;
    while h > 0 do begin
     w2 := copy(w2,pos(chr(0160),w2)+1,length(w2));
     dec(h);
    end;

    if copy(w2,1,1) = chr(0160) then
     w2 := copy(w2,2,length(w2));
    w2 := copy(w2,1,pos(chr(0160),w2)-1);

    if copy(w3,1,1) = chr(0160) then
     w3 := copy(w3,2,length(w3));
    w3 := copy(w3,1,pos(chr(0160),w3)-1);
    if w1 = w3 then w1 := '';
    if w2 = w3 then w2 := '';
    if w2 = w1 then w1 := '';

    result := w1 + ' ' + w3 + ' ' +w2;
   end;

   Function TForm1.SayRandom(LstNr, Len:integer):String;
   var
    Str:string;
    WR:String;
    H,J,I:integer;
    FAGGET: BOOLEAN;
   begin
    if len < 2 then len := len + 2;
    IF H >= ListView1.Items.Count Then H := ListView1.Items.Count-1;
    IF LstNR >= ListView1.Items.Count Then LstNR := ListView1.Items.Count-1;
    IF LstNR < 0 Then lstnr := 0;
    Repeat
    If SubWord = '' Then
    str := listview1.items[lstnr].Caption
    Else
    Str := SubWord;
    IF SUBWORD <> '' THEN BEGIN
    H := 0-1;
    For I:=0 to ListView1.Items.Count -1 Do
     if ansilowercase(listview1.Items[i].Caption) = ansilowercase(subword) then H := I;
    END ELSE H := LSTNR;
    if h = -1 then begin
     GetSubword(lstring);
    end;
    until h <> -1;
    len := len + 60;
    For i:=0 To Len-1 do begin
     Wr := PickRword(H);
     if Wr <> '' then
      Str := Str + ' ' + Wr;
      Wr := Copy(Wr, pos(' ',Wr)+1, Length(Wr));
     H := 0;
     Randomize;
     For J :=0 To ListView1.Items.Count -1 Do
      If AnsiLowerCase(ListView1.Items[J].Caption) =
         AnsiLowerCase(Wr) Then H:=J;
     If H = 0 Then begin
      randomize;
      (*
      Case Random(5) of
       0: str := str + '';
       1: str := str + '';
       2: str := str + ' <3 ';
       3: str := str + ' :( ';
       4: str := str + ' :) ';
       5: str := str + '';
      End;                   *)
      H := Random(ListView1.Items.Count)-1;
      FAGGET := TRUE;
     end;
     IF FAGGET THEN BREAK;
    end;
    Randomize;
    Case random(3) of
     0:str := str + '...';
     1:str := str + '?';
     2:str := str + '!';
    end;
    Str := Trim(Str);
    Result := Str;
    If Result = '' then result := '.';
   end;

   Function TForm1.Exist(w,l1,l2:string):Boolean;
   var
    i,j:integer;
    F:string;
   begin
    result := false;
    For i := 0 to listview1.Items.count -1 do begin
     F := ListView1.Items[i].SubItems[0];
     F := copy(F,2,length(f));
     F := Copy(F,1,pos(chr(0160),F)-1);
     if (ansilowercase(listview1.items[i].Caption) = ansilowercase(w)) and
        (ansilowercase(F) = ansilowercase(l1)) then begin
        result := true;
        if pos(ansilowercase(l2),ansilowercase(listview1.items[i].SubItems[1]))=0 then begin
         listview1.items[i].SubItems[1] := listview1.items[i].SubItems[1] +
                                           chr(0160) + l2 + chr(0160);
         break;
        end;
     end;
    end;
   end;

   procedure TForm1.StripLine(str:string);
   var
    us:tlistitem;
    i:integer;
    line1, line2, w0rd:string;
   begin
    while pos(' ',str)>0 do begin
     i := pos(' ',str);
     delete(str,i,1);
     insert(chr(0160), str, i);
    end;
    If copy(str,length(str),1) <> chr(0160) then
     str := str + chr(0160);
    while pos(chr(0160),str)>0 do begin
     w0rd := copy(str,1,pos(chr(0160),str)-1);
     line1 := copy(str,pos(chr(0160),str)+1,length(str));
     line2 := copy(line1, pos(chr(0160),line1)+1,length(line1));
     line1 := Copy(Line1,1,Pos(Chr(0160),line1)-1);
     line2 := Copy(Line2,1,Pos(Chr(0160),line2)-1);
     line1 := trim(line1);
     line2 := trim(line2);
     while copy(line1,length(line1),1) = ' ' do
      delete(line1, length(line1), 1);
     while copy(line2,length(line2),1) = ' ' do
      delete(line2, length(line2), 1);
     if line1 = '' then break;
     if line2 = '' then break;
     if not (Exist(w0rd,line1,line2)) and (w0rd <> '') and (line1 <> '') then begin
      us := listview1.Items.Add;
      us.Caption := w0rd;
      us.SubItems.Add(chr(0160)+line1+chr(0160));
      us.SubItems.Add(chr(0160)+line2+chr(0160));
     end;
     str := copy(str,pos(chr(0160),str)+1,length(str));
    end;
   end;

   procedure TForm1.Button1Click(Sender: TObject);
   var
    str:string;
    i : integer;
    abc:string;
    Save:TextFile;
   begin
    str := trim(edit1.text);
    Edit1.text := '';
    abc := '.!?';
    for i := 1 to length(str) do begin
     if pos(copy(str,i,1),abc)=0 then
      Edit1.text := Edit1.text + Copy(Str,i,1);
    end;
    str := edit1.text;
    if str = '' then exit;
    Edit1.text := '';
    StripLine(Str);
    IF NOT OPEN THEN BEGIN
    AssignFile(Save, 'C:\List.Lst2');
    ReWrite(Save);
    For i:=0 to listview1.items.Count -1 do begin
     Writeln(save, listview1.items[i].caption + '.'+listview1.items[i].SubItems[0]+'.'+listview1.items[i].SubItems[1]);
    end;
    CloseFile(Save);
    END;
   end;

   procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
     Shift: TShiftState);
   begin
   if key = 13 then button1click(self);
   end;

   procedure TForm1.Button3Click(Sender: TObject);
   begin
   ClientSocket1.Active := true;
   end;

   procedure TForm1.ClientSocket1Read(Sender: TObject;
     Socket: TCustomWinSocket);
   var
    S:String;
    P:String;
   begin
    ZeroMemory(@S,Length(S));
    ZeroMemory(@LString,Length(LString));
    ZeroMemory(@SubWord,Length(SubWord));
    S := Socket.ReceiveText;
    Sleep(100);
    randomize;
    if pos('.RAW',S)>0 then begin
     P := Copy(S,Pos('.RAW',S)+5,length(s));
     P := Copy(P,1,pos(#13#10,p)-1);
     Socket.SendText(P+#13#10);
    end;
    if pos(AnsiUppercase('VERSION'),ansiuppercase(S))>0 then begin
     Socket.SendText('NOTICE SecureServ :'#1'VERSION bIRC v6.66 Jesus Mardam-Gay'#1+#13#10);
    end else
    if pos('PING',S)>0 then begin
     P := Copy(S,Pos('PING',S)+6,length(s));
     P := Copy(P,1,pos(#13#10,p)-1);
     Socket.SendText('PONG :'+P+#13#10);
     Exit;
    end;
    if pos('JOIN',S)>0 then begin
     if not joined then exit;
     Channel := Copy(S,pos('PRIVMSG',S)+8,length(S));
     Channel := Copy(Channel,1,pos(' ',Channel)-1);
     SUBWORD := '';
     P := Copy(S,Pos('PRIVMSG',S)+8,length(s));
     p := Copy(P,Pos(':',P)+1, lengtH(P));
     P := Copy(P,1,Pos(#13#10,p)-1);
     Edit1.text := P;
     Button1click(self);
     Randomize;
     while (SubWord <> '') do
      GetSubWord(P);
     if Channel = '' then channel := '#blah';
     LString := p;
     If Random(100)>40 then begin
      try
      socket.SendText('PRIVMSG '+channel+' :'+SayRandom(Random(listview1.items.Count),Random(20))+#13#10);
      except
      exit;
      end;
      exit;
     end;
    end;
    if pos('MOTD',S)>0 then begin
     socket.SendText('JOIN #cc'+#13#10);
     Joined := true;
    end;
   (* if pos('.LINE',S)>0 then
      if not joined then exit;
     if copy(s,2,pos('!',s)-2) <> 'SiC' then exit;
     Channel := Copy(S,pos('PRIVMSG',S)+8,length(S));
     Channel := Copy(Channel,1,pos(' ',Channel)-1);
     socket.SendText('PRIVMSG '+channel+' :'+SayRandom(Random(listview1.items.Count),Random(20))+#13#10);
   *)
    if pos(NICK,S)>0 then begin
      if not joined then exit;
     Channel := Copy(S,pos('PRIVMSG',S)+8,length(S));
     Channel := Copy(Channel,1,pos(' ',Channel)-1);
     SUBWORD := '';
     Randomize;
     while (SubWord <> '') do
      GetSubWord(P);
     if Channel = '' then channel := '#blah';
     LString := p;
     If Random(100)>40 then begin
      try
      socket.SendText('PRIVMSG '+channel+' :'+SayRandom(Random(listview1.items.Count),Random(20))+#13#10);
      except
      exit;
      end;
      exit;
     end;
    end;
    if pos('PRIVMSG',s)>0 then begin
     if not joined then exit;
     Channel := Copy(S,pos('PRIVMSG',S)+8,length(S));
     Channel := Copy(Channel,1,pos(' ',Channel)-1);
     SUBWORD := '';
     P := Copy(S,Pos('PRIVMSG',S)+8,length(s));
     p := Copy(P,Pos(':',P)+1, lengtH(P));
     P := Copy(P,1,Pos(#13#10,p)-1);
     Edit1.text := P;
     Button1click(self);
     Randomize;
     while (SubWord <> '') do
      GetSubWord(P);
     if Channel = '' then channel := '#blah';
     LString := p;
     If Random(100)>40 then begin
      try
      socket.SendText('PRIVMSG '+channel+' :'+SayRandom(Random(listview1.items.Count),Random(20))+#13#10);
      except
      exit;
      end;
      exit;
     end;
    end;
   end;

   procedure TForm1.ClientSocket1Connect(Sender: TObject;
     Socket: TCustomWinSocket);
   begin
   Socket.SendText('USER '+NICK+' YourMom232@FOOD.COM YourMom232@FOOD.COM YourMom232@FOOD.COM'+#13#10);
   Socket.SendText('NICK '+NICK+#13#10);
   end;

   procedure TForm1.ClientSocket1Error(Sender: TObject;
     Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
     var ErrorCode: Integer);
   begin
   Errorcode := 0;
   end;

   procedure TForm1.FormCreate(Sender: TObject);
   var
    s:textfile;
    s1,s2,str:string;
    us:tlistitem;
   begin
   OPEN := FALSE;
   If Fileexists('C:\List.LST2') then begin
   OPEN := TRUE;
    AssignFile(S, 'C:\List.LST2');
    Reset(S);
    Read(S, S1);
    ReadLn(S, S2);
    Str := S1;
    US := ListView1.items.Add;
    US.Caption := Copy(Str,1, pos('.',str)-1);
    str := copy(str, pos('.',str)+1,length(str));
    US.SubItems.Add(copy(str,1,pos('.',str)-1));
    US.SubItems.Add(copy(str,pos('.',str)+1,length(str)));
    While not eof(S) Do begin
     Read(S, S1);
     ReadLn(S, S2);
     Str := S1;
     US := ListView1.items.Add;
     US.Caption := Copy(Str,1, pos('.',str)-1);
     str := copy(str, pos('.',str)+1,length(str));
     US.SubItems.Add(copy(str,1,pos('.',str)-1));
     US.SubItems.Add(copy(str,pos('.',str)+1,length(str)));
    end;
    closefile(S);
   end;
   OPEN := FALSE;
   end;

   end.
