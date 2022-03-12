
ifndef PASS2
include globals.1
else
include globals.2
endif

indep_mod        segment public byte USE32 'CODE'

                dd   'IMOD'  ; independent module signature


alloc:
                cmp  initialize, 0
                jne  initialization_phase


                or   eax, eax         ; bytes 2 allocate
                js   free_blk

                push ebx
                inc  memused
                mov  ebx, memused
                cmp  ebx, MAXALLOC
                je   eX

                mov  memptr[ebx*4], eax
                mov  eax, memptr[ebx*4-4]
                add  memptr[ebx*4], eax

                pop  ebx
                ret

free_blk:
                add  memused, eax
                cmp  memused, 0
                jl   eX
                ret
eX:             int  3
                mov  dword ptr cs:[eX], 1234h


initialization_phase:
                mov  eax, body_len
                add  eax, cmn_buf_len
                add  eax, ebp           ; ebp = base of code
                mov  memptr, eax
                mov  memused, 0
                ret



MAXALLOC = 16
memtop          dd  MEMORY2ALLOCATE
memptr          dd  MAXALLOC dup (0)
memused         dd  0

indep_mod       ends

                end
