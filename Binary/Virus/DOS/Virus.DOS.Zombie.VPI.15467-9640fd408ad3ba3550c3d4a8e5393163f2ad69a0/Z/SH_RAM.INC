
                ; shadow ram manager

                ; save shadowram state

save_sh_state:  push    cx

                mov     cl, 59h
                call    cf8_read
                mov     CS:state_F000, ch
                
                inc     cx
                call    cf8_read
                mov     CS:state_C000, ch

                inc     cx
                call    cf8_read
                mov     CS:state_C800, ch
                
                pop     cx
                ret

                ; restore shadowram state

rest_sh_state:  nop             ; nop/ret

                push    cx

                mov     cx, 0059h
lastbyte        state_F000
                call    cf8_write

                inc     cx
                mov     ch, 12h
lastbyte        state_C000
                call    cf8_write

                inc     cx
                mov     ch, 12h
lastbyte        state_C800
                call    cf8_write

                pop     cx
                ret

                ; enable shadowram write

disable_sh:     push    cx

                mov     cl, 59h
                mov     ch, CS:state_F000
                and     ch, 10001111b
                or      ch, 00110000b
                call    cf8_write

                inc     cx
                mov     ch, 00110011b
                call    cf8_write

                inc     cx
                mov     ch, 00110011b
                call    cf8_write

                pop     cx
                ret

                ; read PCI register

cf8_read:       push    eax dx

                call    cf8_main

                in      al, dx
                mov     ch, al

                pop     dx eax
                ret

                ; write PCI register

cf8_write:      push    eax dx

                call    cf8_main

                mov     al, ch
                out     dx, al

                pop     dx eax
                ret

cf8_main:       mov     eax, 80000000h
                mov     al, cl
                and     al, 11111100b

                mov     dx, 0CF8h
                out     dx, eax

                add     dl, 4
                mov     al, cl
                and     al, 11b
                add     dl, al

                ret

