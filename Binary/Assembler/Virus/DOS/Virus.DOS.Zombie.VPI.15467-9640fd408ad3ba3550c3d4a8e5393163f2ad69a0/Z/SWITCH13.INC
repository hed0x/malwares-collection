
                ; подпрограмка для сплайсинга INT 13

switch_13:      push    ax si di ds es

                lds     si, cs:real_13

                push    1234h
lastword        my_seg
                pop     es
                lea     di, EA

@@1:            mov     al, [si]
                xchg    al, es:[di]
                mov     [si], al

                inc     si

                inc     di
                cmp     di, offset EA + 5
                jne     @@1

                pop     es ds di si ax
                ret

