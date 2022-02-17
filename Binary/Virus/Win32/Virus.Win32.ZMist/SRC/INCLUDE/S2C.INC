
; STRING --> CODE convertor

; <string>      ~=0x00 zero
;               |=0x20 space
;               ö=0x0D cr
;               ÷=0x0A lf

; macro:
;
; x_stosd <string>    x_push reg, <string>   x_pop
;
; output:
;
; xor eax, eax        xor reg, reg           lea esp, [esp+nnnn]
; sub eax, n4n3n2n1   sub reg, nCnBnAn9
; stosd               push reg
; xor eax, n8n7n6n5   xor reg, n8n7n6n5
; stosd               push reg
; add eax, nCnBnAn9   add reg, n4n3n2n1
; stosd               ...
; xor eax, ...
; stosd
; sub eax, ...
; stosd


x_stosd_first           macro
                        _eax    = 0
                        xor     eax, eax
                        endm

x_stosd_next            macro   t, x
                        if      t eq 0
                        sub     eax, _eax - x
                        endif
                        if      (t eq 1) or (t eq 3)
                        xor     eax, _eax xor x
                        endif
                        if      t eq 2
                        add     eax, x - _eax
                        endif
                        _eax = x
                        stosd
                        endm

x_stosd                 macro   x
                          x_stosd_first
                          j = 0
                          s = 0
                          t = 0
                          irpc    c, <x>
                            k = "&c"
                            if      k eq "~"    ; zero
                              k = 0
                            endif
                            if      k eq "|"    ; space
                              k = 32
                            endif
                            j = j + k shl s
                            s = s + 8
                            if s eq 32
                              x_stosd_next t,j
                              t = t + 1
                              if t eq 4
                                t = 0
                              endif
                              j = 0
                              s = 0
                            endif   ; i eq 4
                          endm    ; irpc
                          if s ne 0
                            j = (j + 12345678h shl s) and 0ffffffffh
                            x_stosd_next t,j
                          endif
                        endm    ; x_stosd

x_push_first            macro   r
                        xor     r, r
                        _reg = 0
                        endm

x_push_next             macro   q, r, x
                        if q eq 0
                        sub     r, _reg - x
                        endif
                        if (q eq 1) or (q eq 3)
                        xor     r, _reg xor x
                        endif
                        if q eq 2
                        add     r, x - _reg
                        endif
                        push    r
                        _reg = x
                        endm

x_push                  macro   r, x
;                       %out x_push: x
                        x_push_first r
                        _xsize = 0
                        l       = 0
                        irpc    c, <x>
                        l       = l + 1
                        endm

                        j = 0
                        s = 0

                        l0 = l
                        if (l0 and 3) ne 0
                        j = j shl 8 + "x"
                        s = s + 8
                        l0 = l0 + 1
                        endif
                        if (l0 and 3) ne 0
                        j = j shl 8 + "y"
                        s = s + 8
                        l0 = l0 + 1
                        endif
                        if (l0 and 3) ne 0
                        j = j shl 8 + "z"
                        s = s + 8
                        l0 = l0 + 1
                        endif

                        q = 0

                        i       = l - 1
                        irpc    c1, <x>
                          t       = 0
                          irpc    c, <x>

                            k = "&c"
                            if      k eq "~"    ; zero
                              k = 0
                            endif
                            if      k eq "|"    ; space
                              k = 32
                            endif
                            if      k eq "ö"    ; cr
                              k = 13
                            endif
                            if      k eq "÷"    ; lf
                              k = 10
                            endif

                            if t eq i
                              j = j shl 8
                              if k ne 0
                              j = j + k
                              endif


                              s = s + 8
                              if s eq 32
                                _xsize = _xsize + 4
                                x_push_next q,r,j
                                q = q + 1
                                if q eq 4
                                  q = 0
                                endif
                                s = 0
                                j = 0
                              endif
                              exitm
                            endif
                            t     = t + 1
                          endm l irpc
                          i = i - 1
                        endm ; irpc
                        if s ne 0
                          error
                        endif
                        endm ; x_push

x_pop                   macro
                        lea     esp, [esp + _xsize]
                        endm

