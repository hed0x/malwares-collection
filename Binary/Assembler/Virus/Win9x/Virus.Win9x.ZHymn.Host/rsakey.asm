   ; RSAKEY
   ; ~~~~~~
   ; - holds RSA key

   ; MULPTIPLE-PLUGIN
   ; you may add many plugins as this (*), each containing own RSA key.
   ; (*) all plugins must be event-compatible;
   ;     the only PUBLIC.INC file may be changed.
   ;
   ; ***WARNING***: PLUGMAN plugin should be fixed to support multiple pluginz


   include                 plugin.inc
                           PLUGIN_START    RSAKEY, CODE32, PERMUTABLE

   handleevent:            hookevent EV_RSAKEY_GET_PARAMS, _getparams
                           hookevent EV_RSAKEY_GET_N, _getn
                           hookevent EV_RSAKEY_GET_E, _gete

   _stc_retn:              stc
                           retn

   ; input:   EBX=key ID
   ; returns: ECX=key length (in BITs)

   _getparams:             cmp     ebx, rsa_hash
                           jne     _stc_retn

                           mov     ecx, rsa_bit
                           clc
                           retn

   ; input: EBX=key ID
   ;        EDI=offset N
   _getn:                  cmp     ebx, rsa_hash
                           jne     _stc_retn

                           call    gen_rsa_n
                           clc
                           retn

   ; input: EBX=key ID
   ;        EDI=offset E
   _gete:                  cmp     ebx, rsa_hash
                           jne     _stc_retn

                           call    gen_rsa_e
                           clc
                           retn

   include                 rsacrypt\key\plugin\public.inc     ; generated file

                           PLUGIN_END
