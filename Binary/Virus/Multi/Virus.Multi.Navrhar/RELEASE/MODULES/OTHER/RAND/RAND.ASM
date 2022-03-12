
ifndef PASS2
include globals.1
else
include globals.2
endif

indep_mod        segment public byte USE32 'CODE'

                 dd   'IMOD'  ; independent module signature


startup:
                 cmp       initialize, 0
                 je        cont
                 ret
cont:
                 push    edx
                 lea     eax, rand_seed
                 imul    edx,[eax],41c64e6dH
                 add     edx,00003039H
                 mov     [eax],edx
                 mov     eax,edx
                 shr     eax,10H
                 and     eax,00007fffH
                 pop     edx

                 ret

indep_mod       ends

                end
