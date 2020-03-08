   unit untGoogleSearch;

   interface

   uses
     Windows, Winsock, StrList;

   Var
     MailSearch    :Array Of String;
     MailSearchCnt :Integer;

     MailFromLst   :Array Of String;
     MailFromLstCnt:Integer;

     Procedure StripHTTP(Domain: String; Var HTTPDomain, SubDomain: String);
     Function GetSource(HttpDomain: String; SubDomain: String): String;
     Procedure ScanHTTP(Source: String; Var List: TStrList);
     Procedure AddMailSearch(Name: String);
     Procedure AddMailFrom(Name: String);
     function LowerCase(const S: string): string;

   implementation

   Procedure AddMailFrom(Name: String);
   Var
     I: Integer;
   Begin
     For I := 0 To MailFromLstCnt-1 Do
       If MailFromLst[I] = Name Then Exit;

     Inc(MailFromLstCnt, 1);
     SetLength(MailFromLst, MailFromLstCnt);
     MailFromLst[MailFromLstCnt-1] := Name;
   End;

   Procedure AddMailSearch(Name: String);
   Var
     I: Integer;
   Begin
     For I := 0 To MailSearchCnt-1 Do
       If MailSearch[I] = Name Then Exit;

     Inc(MailSearchCnt, 1);
     SetLength(MailSearch, MailSearchCnt);
     MailSearch[MailSearchCnt-1] := Name;
   End;

   Function DoRecv(Sock: TSocket): Bool;
   Var
     Time          :TTimeVal;
     FD_Struct     :TFDSet;
   Begin
     Result := False;
     Time.tv_sec := 10;
     Time.tv_usec := 0;

     FD_ZERO(FD_Struct);
     FD_SET(Sock, FD_Struct);
     If Select(0, @FD_Struct, NIL, NIL, @Time) <= 0 Then
       Exit;

     Result := True;
   End;

   Function getHttpReq(Add,Str:String):String;
   Begin
       Result :=
       'GET /'+Add+' HTTP/1.1'#13#10'Host: '+str+#13#10'User-Agent: '+
       'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.6) '+
       'Gecko/20040206 Firefox/0.8'#13#10'Accept: application/x-shockwave-flash,'+
       'text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,'+
       'text/plain;q=0.8,video/x-mng,image/png,image/jpeg,image/gif;q=0.2'+
       ',*/*;q=0.1'#13#10'Accept-Language: en-us,en;q=0.5..Accept-Encoding: '+
       'gzip,deflate'#13#10'Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7'#13#10''+
       'Keep-Alive: 300'#13#10'Connection: keep-alive'#13#10#13#10
   End;

   Function ResolveDomain(HostName: String): String;
   Type
     TAPInAddr = Array[0..100] Of PInAddr;
     PAPInAddr = ^TAPInAddr;
   Var
     WSAData       :TWSAData;
     HostEntPtr    :PHostEnt;
     PPTR          :PAPInAddr;
     I             :Integer;
   Label
     Abort;
   Begin
     Result := '';
     WSAStartUp($101, WSAData);
     Try
       HostEntPtr := GetHostByName(pChar(HostName));
       If HostEntPtr = NIL Then Goto Abort;

       PPTR := PAPInAddr(HostEntPtr^.h_addr_list);
       I := 0;
       While PPTR^[I] <> NIL Do
       Begin
         If HostName = '' Then
         Begin
           If (Pos('168', inet_ntoa(pptr^[I]^))<>1) And (Pos('192', inet_ntoa(pptr^[I]^))<>1) Then
           Begin
             Result := inet_ntoa(PPTR^[I]^);
             Goto Abort;
           End;
         End Else
           Result := inet_ntoa(PPTR^[I]^);
         Inc(I);
       End;
   Abort:
     Except
     End;
     WSACleanUp;
   End;

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

   Function GetSource(HttpDomain: String; SubDomain: String): String;
   Var
     Sock          :TSocket;
     InAddr        :In_Addr;
     Addr          :TSockAddrIn;
     WSA           :TWSAData;

     BB            :TextFile;
     Time          :TTimeVal;
     FD_Struct     :TFDSet;

     Http          :String;
     Str           :String;
     Tmp1          :String;
     Tmp2          :String;
     Buf           :Array[0..36000] Of Char;
   Begin
     Http := HTTPDomain;
     Str := ResolveDomain(Http);

     WSAStartUp(257, WSA);

     Sock := Socket(af_inet, sock_stream, 0);
     Addr.sin_family := af_inet;
     Addr.sin_port := hTons(80);
     Addr.sin_addr.S_addr := inet_addr(pChar(Str));

     If Connect(Sock, Addr, SizeOf(Addr)) = ERROR_SUCCESS Then
     Begin
       Str := GetHTTPReq('', HTTP);

       Send(Sock, Str[1], Length(Str), 0);

       If Not DoRecv(Sock) Then
       Begin
         CloseSocket(Sock);
         WSACleanUp;
         Exit;
       End;
       Recv(Sock, Buf, SizeOf(Buf), 0);

       Str := String(Buf);

       If Pos('Location', Str) > 0 Then
       Begin
         Str := Copy(Str, Pos('Location', Str) + 10, Length(Str));
         Str := Copy(Str, 1, Pos(#13#10, Str)-1);

         Tmp1 := Str;
         Str := '';

         While Pos('/', Tmp1) > 0 Do
         Begin
           Str := Str + Copy(Tmp1, 1, Pos('/', Tmp1));
           Tmp2 := Copy(Tmp1, Pos('/', Tmp1)+1, Length(Tmp1));
           Tmp1 := Copy(Tmp1, Pos('/', Tmp1)+1, Length(Tmp1));
         End;

         If Copy(Str, Length(Str), 1) = '/' Then
           Delete(Str, Length(Str), 1);

         If LowerCase(Copy(Str, 1, 4)) = 'http' Then
           Delete(Str, 1, 7);

         Str := GetHTTPReq(SubDomain, Str);

         Send(Sock, Str[1], Length(Str), 0);
       End;

       Str := '';
       Repeat
         ZeroMemory(@Buf, SizeOf(Buf));
         Tmp2 := '';

         If Not DoRecv(Sock) Then Break;
         Recv(Sock, Buf, SizeOf(Buf), 0);

         Str := Str + String(Buf);
         Tmp2 := Buf;
       Until Tmp2 = '';

       Result := Str;
     End;
     CloseSocket(Sock);
     WSACleanUp;
   End;

   Procedure StripHTTP(Domain: String; Var HTTPDomain, SubDomain: String);
   Var
     Tmp: String;
   Begin
     HTTPDomain := '';
     SubDomain  := '';

     If LowerCase(Copy(Domain, 1, 4)) = 'http' Then
       Delete(Domain, 1, 7);
     If Pos('/', Domain) > 0 Then
     Begin
       Tmp := Copy(Domain, 1, Pos('/', Domain)-1);
       Domain := Copy(Domain, Pos('/', Domain)+1, Length(Domain));

       HTTPDomain := Tmp;
       SubDomain  := Domain;
     End Else
       If Domain <> '' Then
         HTTPDomain := Domain;
   End;

   Procedure ScanHTTP(Source: String; Var List: TStrList);
   Const
     HTTPStr       :String = '://%abcdefghijklmnopqrstuvwxyzåäöABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ.-\?=0123456789~^';
   Var
     Tmp1          :String;
     Tmp2          :String;
     Tmp3          :String;
     Str           :String;

     I             :Integer;
     J             :Integer;
   Begin
     ZeroMemory(@List, SizeOf(List));
     List := TStrList.Create;
     Str := Source;

     While True Do
     Begin
       I := Pos('http://', Str);
       If I = 0 Then Break;

       Tmp1 := Copy(Str, I, Length(Str));
       Str := Copy(Str, I+7, Length(Str));

       For J := 1 To Length(Tmp1) Do
       Begin
         If Pos(Copy(Tmp1, J, 1), HTTPStr) = 0 Then
         Begin
           Tmp1 := Copy(Tmp1, 1, J-1);
           If Pos('google', LowerCase(Tmp1)) = 0 Then
             If Not List.Exists(Tmp1) Then
               List.Add(Tmp1);
           Break;
         End;
       End;
     End;
   End;

   end.

