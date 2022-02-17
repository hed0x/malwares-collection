   ; LOADER
   ; ~~~~~~
   ; - MAIN HandleEvent, calls all HandleEvent's one by one,
   ;   until event will be handled.
   ; - comes FIRST (in .PGN-format version 1)
   ; - on event call, EBP contains offset of the following HandleEvent procedure

   include                 plugin.inc
                           PLUGIN_START    LOADER, CODE32, PERMUTABLE

   handleevent:

   ; * it is possible to generate LOADER-generator
   ; * in this case, the following action looks as this:
   ;
   ;   call PLUGIN1.HandleEvent
   ;   call PLUGIN2.HandleEvent
   ;   ...
   ;   retn
                           push    ebp

   __cycle1:               xchg    eax, [esp]

   __cycle2:               add     eax, [eax-size plugin_struc].plugin_size

                           cmp     dword ptr [eax-size plugin_struc], 0  ; EOF ?
                           je      __eof

                           test    byte ptr [eax-size plugin_struc].plugin_flags, FL_PGN_DISABLED
                           jnz     __cycle2

                           push    cs
                           test    byte ptr [esp], 11b
                           lea     esp, [esp+4]
                           jz      __ring0

   __ring3:                test    byte ptr [eax-size plugin_struc].plugin_flags, FL_PGN_W32R3
                           jmp     __jz_cycle2

   __ring0:                test    byte ptr [eax-size plugin_struc].plugin_flags, FL_PGN_W9XR0

   __jz_cycle2:            jz      __cycle2

                           xchg    eax, [esp]

                           stc
                           call    dword ptr [esp]
                           jc      __cycle1

   __retn:                 lea     esp, [esp+4]
                           retn

   __eof:                  xchg    eax, [esp]
                           stc
                           jmp     __retn

                           PLUGIN_END
